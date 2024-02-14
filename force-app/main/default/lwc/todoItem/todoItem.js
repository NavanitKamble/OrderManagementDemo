// todoItem.js
import { LightningElement, api } from "lwc";
export default class TodoItem extends LightningElement {
  @api itemName = "New Item";
}