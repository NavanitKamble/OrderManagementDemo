public interface IQuoteService{
    List<Quote> getQuotesWithStatusChange(List<Quote> records, Map<Id, Quote> oldRecords);
    void processAcceptedQuotesOnUpdate(List<Quote> records);    
    void processAcceptedQuotesOnInsert(List<Quote> records);    
    List<Quote> getAcceptedQuotes(List<Quote> records);
}