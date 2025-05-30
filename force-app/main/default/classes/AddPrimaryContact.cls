public with sharing class AddPrimaryContact implements Queueable {
    Contact con;
    String state;
    public AddPrimaryContact(Contact con, String state) {
        this.con = con;
        this.state = state;
    }

    public void execute(QueueableContext context){
        List<Account> lstOfAccounts = [SELECT Id, Name FROM Account WHERE BillingState =: state LIMIT 200];
        List<Contact> lstOfConts = new List<Contact>();
        for (Account acc : lstOfAccounts) {
            Contact cont = con.clone();
            cont.AccountId = acc.Id;
            lstOfConts.add(cont);
        }
        update lstOfConts;
    }
}