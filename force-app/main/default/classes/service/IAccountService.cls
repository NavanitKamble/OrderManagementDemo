public interface IAccountService{
    
    void setTotalAcceptedQuotes(Map<Id,List<Quote>> accIdToIncrementalQuoteCount);
}