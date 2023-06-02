public class AccountService implements IAccountService {
    
    public void setTotalAcceptedQuotes(Map<Id,List<Quote>> accountIdToAcceptedQuotes){
        Map<Id,Account> localAccounts = getLocalAcceptedQuoteCount(accountIdToAcceptedQuotes.keyset());
        
        for(Id accountId : accountIdToAcceptedQuotes.keyset()){
            localAccounts.get(accountId).TotalQuotesAccepted__c = localAccounts.get(accountId).TotalQuotesAccepted__c + accountIdToAcceptedQuotes.get(accountId).size();
        }
        update localAccounts.values();
    }

    private Map<Id, Account> getLocalAcceptedQuoteCount(Set<Id> accountIds){
        List<Account> accountsToUpdate = ((AccountSelector) new OrgApplication.selector().newInstance(AccountSelector.class)).selectByFieldsAndParentIds(accountIds);
        return new Map<Id, Account>(accountsToUpdate) ;
    }

}