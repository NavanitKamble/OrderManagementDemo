public class Domain {

    public static void triggerHanlder(Type domainClassHandler){
        
        //triggerHanlder(getDomainImplementation(Trigger.New), );
    }

    private static ITriggerHandler getDomainImplementation(List<sObject> records){
        String objectType = getSobjectType(records);
    }

    private static Schema.SObjectType getSobjectType(List<sObject> records){
        records.getSobjectType();
    }

    private static void triggerHanlder(
        ITriggerHandler triggerHandler, 
        Boolean isInsert, 
        Boolean isUpdate, 
        Boolean isBefore, 
        Boolean isAfter,
        List<sObject> records,
        Map<Id,sObject> oldRecords){

            if(Trigger.isBefore){
                

            } else {
                if(isInsert){
                    triggerHandler.onAfterInsert(records);
                }
                if(isUpdate){
                    triggerHandler.onAfterUpdate(records, oldRecords);
                }
            }

    }
}