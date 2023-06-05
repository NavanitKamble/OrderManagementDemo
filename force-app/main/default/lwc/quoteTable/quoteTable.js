import { LightningElement, api } from 'lwc';

export default class OrderTable extends LightningElement {
    @api quoteColumns; 
    @api quoteData;
    @api sortedBy;

    defaultSortDirection = 'asc';
    sortDirection = 'asc';

    connectedCallback(){
        console.log('*** quoteData' + JSON.stringify(this.quoteData));
        console.log('*** quoteColumns' +  JSON.stringify(this.quoteColumns));
    }

    onHandleSort(event){
        //if same column do nothing 
        //else fire event 
        console.log('onHandleSort' + JSON.stringify(event.detail));
        this.dispatchEvent(new CustomEvent('sort',{
            detail : {
                sortdirection : event.detail.sortDirection,
                fieldname : event.detail.fieldName
            }
        }));
    }

    showOrders(event){
        console.log('***'+JSON.stringify(event.detail));
        this.dispatchEvent(new CustomEvent('showorders',{
            detail : {
                quoteId : event.detail.row.id
            }
        }));
    }

}