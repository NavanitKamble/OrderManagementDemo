public with sharing class QuoteSelector {

    public List<Object> selectByAccountId(Id accountId, String sortColumn, Integer pageSize, Integer offset) {
        
        String queryString = 'SELECT Id, Name, Status, (SELECT OrderNumber FROM Orders) FROM Quote ORDER BY '; 
        queryString += sortColumn;
        queryString += ' LIMIT : pageSize OFFSET : offset';
        System.debug('**** queryString' + queryString);
        return Database.query(queryString);
    }

    public List<Object> selectByIds(Set<Id> quoteIds){
        return Database.query('SELECT Id, AccountId, Status FROM Quote Where Id IN : quoteIds');
    }
}