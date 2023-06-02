public interface IQuoteService{
    List<Quote> getQuotesWithStatusChange(List<Quote> records, Map<Id, Quote> oldRecords);
    void processAcceptedQuotes(List<Quote> records);    
}