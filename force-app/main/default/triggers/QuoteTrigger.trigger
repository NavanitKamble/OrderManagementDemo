trigger QuoteTrigger on Quote (after insert, after update) {
    fflib_SObjectDomain.triggerHandler(DomainCoordinator.class);
}