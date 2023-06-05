public class OpportunityDataFactory{

    public Opportunity getOpportunity(String opportunityName, Id accountId, Boolean doInsert){
        Opportunity newOpportunity = new Opportunity(AccountId = accountId, Name = opportunityName, 
        CloseDate = Date.today(), StageName = 'Discovery');
        if(doInsert){
            insert newOpportunity;
        }
        return newOpportunity; 
    }
}