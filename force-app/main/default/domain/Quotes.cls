public class Quotes implements ITriggerHandler {
    public Quotes(){
        System.System.debug('Quote Instantiated');
    }
    public void onAfterInsert(List<sObject> records){
        System.debug('After insert called');
        IQuoteService quoteService = (IQuoteService) new OrgApplication.service().newInstance(IQuoteService.class);
        quoteService.getTotalAcceptedQuotes(records);
    }

    public void onAfterUpdate(List<sObject> records, Map<Id, sObject> oldRecords){
        System.debug('After Update called');
        IQuoteService quoteService = (IQuoteService) new OrgApplication.service().newInstance(IQuoteService.class);
        quoteService.getTotalAcceptedQuotes(records);
    }
}