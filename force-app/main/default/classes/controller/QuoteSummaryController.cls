public class QuoteSummaryController{
   
    @AuraEnabled(Cacheable=true)
    public static Object getQuoteData(String accountId, String sortColumn, Integer pageSize, Integer pageNumber){
        try {
            Integer offset = (pageNumber - 1) * pageSize;
            QuoteSelector selector = (QuoteSelector) new OrgApplication.selector().newInstance(QuoteSelector.class);
            Object result = selector.selectByAccountId(accountId, sortColumn, pageSize, offset);
            System.debug('**** result' + result);
            return result;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}