@isTest
private class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(Name='Test Name', BillingState = 'CA'));
        }
        insert accounts;
    }

    @isTest static void test() {
        Contact con = new Contact(LastName='Test Last Name');
        insert con;
        AddPrimaryContact addPrimCon = new AddPrimaryContact(con, 'CA');
        Test.startTest();
        System.enqueueJob(addPrimCon);
        Test.stopTest();
    }
}