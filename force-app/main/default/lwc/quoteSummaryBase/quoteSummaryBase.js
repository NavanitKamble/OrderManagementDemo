import { LightningElement, api } from 'lwc';

export default class QuoteSummaryBase extends LightningElement {
    
    pageNumber;
    pageSize;
    totalRecords;

    connectedCallback(){
        this.pageNumber = 1;
        this.pageSize = 10;
        this.totalRecords = 100;
    }

    handleOnNext(){
        console.log('Clicked Next');
    }

    handleOnPrevious(){
        console.log('Clicked Previous');
    }
    
    
}
