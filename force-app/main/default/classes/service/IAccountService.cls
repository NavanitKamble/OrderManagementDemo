public interface IAccountService{
    
    void setTotalAcceptedQuotes(Map<Id,List<Quote>> accIdToIncrementalQuoteCount);
    boolean hasEditAccess();
}