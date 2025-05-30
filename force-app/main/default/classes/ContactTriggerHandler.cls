public class ContactTriggerHandler
{
    public static void calcNumberOfActiveContacts(List<Contact> newConList)
    {
        Integer activeContactRecords = 0;
        if(newConList != null && newConList.size() > 0 && String.isNotBlank(newConList[0].AccountId))
        {
            Id accId = newConList[0].AccountId;
            activeContactRecords = [SELECT count() FROM Contact WHERE AccountId =: accId AND Active__c =: true];

            if(activeContactRecords > 0)
            {
                List<Account> tempAccount = [SELECT Active_Contacts__c FROM Account WHERE Id =: accId LIMIT 1];
                if(tempAccount != null && tempAccount.size() > 0)
                {
                    tempAccount[0].Active_Contacts__c = activeContactRecords;
                    upsert tempAccount;
                }
            }
        }
    }
}