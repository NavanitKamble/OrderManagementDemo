public class QuoteDataFactory{

    public List<Quote> getQuotes(Id opportunityId, String Name, String status, Integer count, Boolean doInsert ){
        List<Quote> quotes = new List<Quote>();
        Quote newQuote;
        for(integer i = 0; i < count ; i ++){
            newQuote = new Quote(OpportunityId = opportunityId , Status = status, 
            Name = (Name + ' ' + String.valueOf(i)));
            quotes.add(newQuote);    
        }
        if(doInsert){
            insert quotes;
        }
        return quotes; 
    }
}