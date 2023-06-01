trigger QuoteTrigger on Quote (after insert, after update) {
    DomainCoordinator.triggerHandler();
}