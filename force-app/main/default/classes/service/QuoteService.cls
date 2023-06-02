public class QuoteService implements IQuoteService {
    
    public Integer  getTotalAcceptedQuotes(List<Quote> records){
        system.debug('getTotalAcceptedQuotes here we are incrementing shit!!');
        QuoteSelector selector = (QuoteSelector) new OrgApplication.selector().newInstance(QuoteSelector.class);
        Map<Id,Quote> accountIdToQuotes = new Map<Id,Quote>();

        for(Quote currentQuote : records){
            if(accountIdToQuotes.containsKey(currentQuote.accountId)){
                accountIdToQuotes.get(currentQuote.accountId).add(currentQuote);
            }
        }
        return 1;
    }

    private 
}