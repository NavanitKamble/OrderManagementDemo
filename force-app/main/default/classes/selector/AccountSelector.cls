public with sharing class AccountSelector {

    public List<Account> selectByAccountIds(Set<Id> accountIds) {
        return Database.query(' SELECT id, TotalQuotesAccepted__c ' +
                ' FROM Account ' + 
                ' Where Id in : accountIds');
    }
}