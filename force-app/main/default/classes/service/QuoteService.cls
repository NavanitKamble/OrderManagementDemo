public class QuoteService implements IQuoteService {
    private static final String QUOTE_STATUS_ACCEPTED = 'Accepted';

    public List<Quote> getQuotesWithStatusChange(List<Quote> records, Map<Id, Quote> oldRecords){
        //Ideally this would be a generic function inside org Frameworks, providing the records that have specific fields changed. 
        //For now I am making it specific to the Quote Records and Status field.
        List<Quote> recordsWithStatusUpdate = new List<Quote>();
        for(Quote currentQuote : records){
            if(currentQuote.status != oldRecords.get(currentQuote.Id).status){
                recordsWithStatusUpdate.add(currentQuote);
            }
        }
        return recordsWithStatusUpdate;
    }

    public void processAcceptedQuotes(List<Quote> records){
        system.debug('getTotalAcceptedQuotes here we are incrementing shit!!');
        QuoteSelector selector = (QuoteSelector) new OrgApplication.selector().newInstance(QuoteSelector.class);
        AccountService accService = (AccountService) new OrgApplication.service().newInstance(AccountService.class);
        
        Map<Id, List<Quote>> accountIdToAcceptedQuotes = getAccountsWithAcceptedQuotes(records);
        accService.setTotalAcceptedQuotes(accountIdToAcceptedQuotes);
    }

    private Map<Id, List<Quote>> getAccountsWithAcceptedQuotes(List<Quote> records){
        Map<Id, List<Quote>> accountIdToQuotes = new Map<Id, List<Quote>>();

        for(Quote currentQuote : records){
            if(currentQuote.status == QUOTE_STATUS_ACCEPTED){
                if(accountIdToQuotes.containsKey(currentQuote.accountId)){
                    accountIdToQuotes.get(currentQuote.accountId).add(currentQuote);
                }else{
                    accountIdToQuotes.put(currentQuote.accountId, new List<Quote> {currentQuote});
                }
            }
        }
        return accountIdToQuotes;        
    }
}