import { LightningElement, api, wire, track } from 'lwc';

export default class OrderTable extends LightningElement {
    @api orderColumns; 
    @api orderData;
}