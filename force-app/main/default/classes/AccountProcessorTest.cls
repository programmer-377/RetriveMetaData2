@IsTest
private class AccountProcessorTest {
    @isTest static void AccountProcessorTestMethod() {
        Account acc = new Account(Name = 'TestName');
        insert acc;

        Contact con = new Contact(LastName='Test Account', AccountId = acc.Id);
        insert con;

        List<Id> accIds = new List<Id>();
        accIds.add(con.AccountId);

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
    }
}