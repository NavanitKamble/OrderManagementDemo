public with sharing class QuoteSelector {

    public List<QuoteSelector> selectByFieldsAndParentIds(Set<Id> accountIds) {
        return null;
        /*
        return Database.query('
            SELECT id 
                FROM Quote
                Where accountid : accountIds');
                */
    }
}