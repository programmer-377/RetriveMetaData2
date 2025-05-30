public with sharing class DiscussionTriggerHandler
{
    public static void updateAccountFields(Discussion__c discussion, String operationType)
    {
        if(discussion != null && discussion.Id != null && String.isNotBlank(operationType))
        {
            List<Account> lstOfAcc = [SELECT Id, Name, Last_Discussed_Contact__c, Communication_Type__c, Last_Discussion__c FROM Account WHERE Id =: discussion.Account_SFDC_ID__c];

            if(lstOfAcc != null && lstOfAcc.size() > 0)
            {
                Account acc = lstOfAcc[0];

                if(acc != null && acc.Id != null)
                {
                    if(operationType.equalsIgnoreCase('AFTER_INSERT'))
                    {
                        acc.Last_Discussed_Contact__c = discussion.Contact__c;
                        acc.Last_Discussion__c = discussion.Id;
                        acc.Communication_Type__c = discussion.Discussion_Type__c;

                        upsert acc;
                    }
                    else if(operationType.equalsIgnoreCase('BEFORE_DELETE') && acc.Last_Discussion__c != null && acc.Last_Discussion__c == discussion.Id)
                    {
                        Set<Id> setOfConIds = new Set<Id>();
                        List<Contact> lstOfContacts = [SELECT Id, Name FROM Contact WHERE Account.Id =: acc.Id];

                        for(Contact con : lstOfContacts)
                        {
                            setOfConIds.add(con.Id);
                        }

                        String deletedDiscussionId = discussion.Id;

                        List<Discussion__c> lstOfDiscussion = [SELECT Id, Name, Contact__c, Discussion_Type__c FROM Discussion__c WHERE Id != :deletedDiscussionId AND Contact__c IN :setOfConIds ORDER BY createdDate DESC LIMIT 1];

                        if(lstOfDiscussion != null && lstOfDiscussion.size() > 0)
                        {
                            Discussion__c latestDiscussionRec = lstOfDiscussion[0];

                            acc.Last_Discussed_Contact__c = latestDiscussionRec.Contact__c;
                            acc.Last_Discussion__c = latestDiscussionRec.Id;
                            acc.Communication_Type__c = latestDiscussionRec.Discussion_Type__c;
                            upsert acc;
                        }
                        else
                        {
                            acc.Last_Discussed_Contact__c = null;
                            acc.Last_Discussion__c = null;
                            acc.Communication_Type__c = null;
                            upsert acc;
                        }
                    }
                }
            }
        }
    }
}