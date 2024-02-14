import { LightningElement, api, wire, track } from 'lwc';

export default class TodoApp extends LightningElement {
    
    myItem = this.template.querySelector("c-todo-item").itemName;
    
}