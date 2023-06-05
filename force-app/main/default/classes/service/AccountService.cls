public class AccountService implements IAccountService {
    public static final String NO_EDIT_ON_ACCOUNT = 'You cannot edit account';
    public void setTotalAcceptedQuotes(Map<Id,List<Quote>> accountIdToAcceptedQuotes){
        if(!hasEditAccess()){
            throw new ApplicationException(NO_EDIT_ON_ACCOUNT);
        }
        Map<Id,Account> localAccounts = getLocalAcceptedQuoteCount(accountIdToAcceptedQuotes.keyset());
        system.debug('localAccounts' + localAccounts);
        for(Id accountId : accountIdToAcceptedQuotes.keyset()){
            localAccounts.get(accountId).TotalQuotesAccepted__c = localAccounts.get(accountId).TotalQuotesAccepted__c + accountIdToAcceptedQuotes.get(accountId).size();
        }
        update localAccounts.values();
    }

    private Map<Id, Account> getLocalAcceptedQuoteCount(Set<Id> accountIds){
        List<Account> accountsToUpdate = ((AccountSelector) new OrgApplication.selector().newInstance(AccountSelector.class)).selectByAccountIds(accountIds);
        return new Map<Id, Account>(accountsToUpdate) ;
    }

    public boolean hasEditAccess(){
        
        return Schema.sObjectType.Account.isUpdateable();
    }

    public class ApplicationException extends Exception {}

}