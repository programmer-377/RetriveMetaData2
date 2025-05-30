@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    /*@HttpGet
    global static accountWrapper getAccount(){
        RestRequest request = RestContext.request;
        String accId = request.requestURI.split('/').get(request.requestURI.split('/').size()-2);
        List<Account> lstOfAccounts = new List<Account>();
        accountWrapper accountRecord;
        if(String.isNotBlank(accId)){
            lstOfAccounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: accId];
        }

        if(lstOfAccounts != null && lstOfAccounts.size() > 0){
            accountRecord = new accountWrapper(lstOfAccounts[0]);
        }

        return accountRecord;
    }*/

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accId = request.requestURI.split('/').get(request.requestURI.split('/').size()-2);
        List<Account> lstOfAccounts = new List<Account>();
        Account acc = new Account();
        if(String.isNotBlank(accId)){
            lstOfAccounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: accId LIMIT 1];
        }

        if(lstOfAccounts != null && lstOfAccounts.size() > 0){
            acc =  lstOfAccounts[0];
        }

        return acc;
    }

    /*global class accountWrapper{
        global String ID;
        global String Name;
        global List<contactsWrapper> associatedcontacts;

        global accountWrapper(Account acc){
            this.ID = acc.Id;
            this.Name = acc.Name;
            associatedcontacts = new List<contactsWrapper>();

            if(acc.Contacts != null && acc.Contacts.size() > 0){
               for (Contact con : acc.Contacts) {
                contactsWrapper tempCon = new contactsWrapper(con);
                this.associatedcontacts.add(tempCon);
               }
            }
        }
    }

    global class contactsWrapper{
        global String ID;
        global String Name;

        global contactsWrapper(Contact con){
            this.Id = con.Id;
            this.Name = con.Name;
        }
    }*/
}