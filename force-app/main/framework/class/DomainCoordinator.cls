public class DomainCoordinator {
    public static ITriggerHandler getDomainClassHandler(String objectName){
        DomianConfiguration__mdt domainConfig = DomianConfiguration__mdt.getInstance(objectName);
        if(domainConfig.isActive__c){
            return (ITriggerHandler) Type.forName(domainConfig.DomainClassName__c).newInstance();
        }
        return null;
    }
}