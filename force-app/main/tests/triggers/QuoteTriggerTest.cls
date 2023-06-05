@IsTest(IsParallel=true)
private class QuoteTriggerTest {

    private static String ACCOUNT_NAME = 'Test Account';
    @TestSetup
    static void makeData(){
        
        String OPPORTUNITY_NAME = 'Test Opportunity';
        Account account =  new AccountDataFactory().getAccount(ACCOUNT_NAME, true);
        Opportunity newOpportunity = new OpportunityDataFactory().getOpportunity(OPPORTUNITY_NAME,account.Id, true);        
    }

    @IsTest 
    private static void testAfterInsert_NoArgs_totalAcceptedQuotesUpdatedOnAccount() {
        Id opportunityId = [SELECT Id FROM Opportunity Limit 1].Id;
        String QUOTE_NAME = 'Test Quote';
        String QUOTE_STATUS_ACCEPTED = 'Accepted';        
        
        Test.startTest();
        List<Quote> quotes = new QuoteDataFactory().getQuotes(opportunityId, QUOTE_NAME, QUOTE_STATUS_ACCEPTED, 10, true); 
        Test.stopTest();

        Integer totalCount = Integer.valueOf([SELECT id, TotalQuotesAccepted__c FROM Account WHERE Name = :ACCOUNT_NAME ].TotalQuotesAccepted__c);
        
        System.assertEquals(10,totalCount);
    }

    @IsTest 
    private static void testAfterUpdate_NoArgs_totalAcceptedQuotesUpdatedOnAccount() {
        Id opportunityId = [SELECT Id FROM Opportunity Limit 1].Id;
        String QUOTE_NAME = 'Test Quote';
        String QUOTE_STATUS_DRAFT = 'Draft';        
        String QUOTE_STATUS_ACCEPTED = 'Accepted';       

        Test.startTest();
        List<Quote> quotes = new QuoteDataFactory().getQuotes(opportunityId, QUOTE_NAME, QUOTE_STATUS_DRAFT, 1, true); 
        Test.stopTest();

        Integer totalCount = Integer.valueOf([SELECT id, TotalQuotesAccepted__c FROM Account WHERE Name = :ACCOUNT_NAME ].TotalQuotesAccepted__c);
        
        System.assertEquals(0,totalCount); //since no Quote is in Draft Status

        //Lets update this Quote
        quotes[0].Status = QUOTE_STATUS_ACCEPTED;
        update quotes[0];

        totalCount = Integer.valueOf([SELECT id, TotalQuotesAccepted__c FROM Account WHERE Name = :ACCOUNT_NAME ].TotalQuotesAccepted__c);
        System.assertEquals(1,totalCount);//since 1 Quote is in Accept Status Now
    }
}