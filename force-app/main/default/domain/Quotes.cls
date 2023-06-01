public class Quotes implements ITriggerHandler {
    public Quotes(){
        System.System.debug('Quote Instanciated');
    }
    public void onAfterInsert(List<sObject> records){

    }

    public void onAfterUpdate(List<sObject> records, Map<Id, sObject> oldRecords){

    }
}