public with sharing class QuoteSelector

    public List<QuoteSelector> selectByFieldsAndParentIds(Set<Id> accountIds) {
        return Database.query('
            SELECT id 
                FROM Quote
                Where accountid : accountIds');
    }
}