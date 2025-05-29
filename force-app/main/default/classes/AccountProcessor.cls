public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> lstOfIds){
        if(lstOfIds != null && lstOfIds.size() > 0){
            List<Account> listOfAccounts = [SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id IN: lstOfIds];
            if(listOfAccounts != null && listOfAccounts.size() > 0){
                for (Account acc : listOfAccounts) {
                    if(acc.contacts != null && acc.contacts.size() > 0){
                        acc.Number_Of_Contacts__c = acc.contacts.size();
                    }
                }

                update listOfAccounts;
                // test 123
            }
        }
    }
}