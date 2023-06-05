import { LightningElement, api, wire, track } from 'lwc';
import getQuoteSummary from '@salesforce/apex/QuoteSummaryController.getQuoteData';

const orderColumns = [
    { label: 'Order Number', fieldName: 'orderNumber', type: 'text', sortable: false },    
];

const pageSize = 5;
const initialPageNumber = 1;

const actions = [
    { label: 'Show orders', name: 'showOrders' }
];

const quoteColumns = [
    { label: 'Quote Number', fieldName: 'name', type: 'text', sortable: true },
    { label: 'Status', fieldName: 'status', type: 'text', sortable: true},
    { type: 'action', typeAttributes: { rowActions: actions, menuAlignment: 'right' } }
];

export default class QuoteSummaryBase extends LightningElement {
    
    pageNumber = initialPageNumber;
    pageSize = pageSize;
    totalRecords;
    sortBy;
    quoteColumns = quoteColumns;
    orderColumns = orderColumns;
    @api recordId;

    summary;
    error;

    @track quoteData = []; 
    @track orderData = [];

    connectedCallback(){
        this.totalRecords = 100;
        this.sortBy = 'Status';
    }

    @wire(getQuoteSummary, { 
                            accountId : '$recordId',
                            sortColumn : '$sortBy',
                            pageSize : '$pageSize',
                            pageNumber : '$pageNumber'
                         })
                         processQuoteData({ error, data }) {
                            console.log('*** data ' + JSON.stringify(data));
                            console.log('*** error ' + JSON.stringify(error));
                            if (data) {
                                this.summary = data;                                
                                this.error = undefined;
                                this.processResult();
                            } else if (error) {
                                this.error = error;
                                this.summary = undefined;
                            }
                        }                     

    handleOnNext(){
        console.log('Clicked Next');
        if(this.pageNumber < 3){
            this.pageNumber = this.pageNumber + 1;
        }else {
            alert('Cant go Forwards - Admin has limited to 3 pages only');
        }
    }

    handleOnPrevious(){
        console.log('Clicked Previous');
        if(this.pageNumber > 1){
            this.pageNumber = this.pageNumber - 1;
        }else {
            alert('Cant go Back');
        }
        
    }

    handleQuoteSort(event){
        console.log('Clicked Sort' + JSON.stringify(event.detail));
       
        let sortBy = event.detail.fieldname;
        if(sortBy !== this.sortBy){
            this.sortBy = sortBy;
            this.pageNumber = 1;
        }
    }        

    processResult(){
        
        this.quoteData = [];
        var quoteSummary = [];
        if(this.summary == undefined){
            return;
        }
        this.summary.forEach(function (quoteRow) {
            var quoteItem  = { id : quoteRow.Id, name : quoteRow.Name, status : quoteRow.Status };
            console.log('*****' + JSON.stringify(quoteItem));
            quoteSummary.push(quoteItem);
        }); 
        console.log('*****' + JSON.stringify(quoteSummary));
        this.quoteData = quoteSummary;
    }

    handleShowOrders(event){
        console.log('Clicked show orders' + JSON.stringify(event.detail));
        this.orderData = [];
        var orders = [];
        
        var selectedQuoteId = event.detail.quoteId;
        console.log('selectedQuoteId' + selectedQuoteId + JSON.stringify(this.summary));
        this.summary.forEach(function (quoteRow) {
            if(selectedQuoteId == quoteRow.Id){
                console.log('Matched' + JSON.stringify(quoteRow.Orders));
                if(quoteRow.Orders == undefined){
                    alert("No Orders found for this Quote, please select Quote Named : Quote 1");
                }
                quoteRow.Orders.forEach(function (orderRow){
                   var order = { id : orderRow.Id, orderNumber : orderRow.OrderNumber};
                   orders.push(order);                  
                });                     
            }            
        }); 
        
        this.orderData = orders;       

    }
}
