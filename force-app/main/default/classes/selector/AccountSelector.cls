public with sharing class AccountSelector {

    public List<Account> selectByFieldsAndParentIds(Set<Id> accountIds) {
        return Database.query(' SELECT id, TotalQuotesAccepted__c ' +
                ' FROM Account ' + 
                ' Where Id in : accountIds');
    }
}