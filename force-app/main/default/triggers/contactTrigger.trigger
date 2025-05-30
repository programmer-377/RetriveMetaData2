trigger contactTrigger on Contact (before insert, after insert, after update) {
    if((Trigger.isDelete && Trigger.isBefore) || ((Trigger.isInsert || Trigger.isUndelete) && trigger.isAfter))
    {
        // ContactTriggerHandler.calcNumberOfActiveContacts(trigger.new);
        list<Id> accountIds = new List<Id>();
        if((Trigger.isInsert || Trigger.isUndelete) && Trigger.new != null){
            accountIds.add(Trigger.new[0].AccountId);
        }
        else if((Trigger.isDelete && Trigger.old != null)){
            accountIds.add(Trigger.old[0].AccountId);
        }

        if(accountIds != null && accountIds.size() > 0){
            AccountProcessor.countContacts(accountIds);
        }
    }
}