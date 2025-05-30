trigger DiscussionTrigger on Discussion__c (after insert, before delete)
{
    String operationType = String.valueOf(Trigger.operationType);

    if(Trigger.isAfter && Trigger.size > 0)
    {
        if(Trigger.isInsert && Trigger.new != null)
        {
            DiscussionTriggerHandler.updateAccountFields(Trigger.new[0], operationType);
        }
    }

    if(Trigger.isBefore && Trigger.isDelete && Trigger.old != null)
    {
        DiscussionTriggerHandler.updateAccountFields(Trigger.old[0], operationType);
    }
}