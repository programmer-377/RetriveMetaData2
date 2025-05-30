@IsTest
private class AccountManagerTest {
    @isTest static void testGetAcoountById() {
        Account account = new Account(Name='Test Account');
        insert account;

        Contact con = new Contact(AccountId = account.Id, LastName = 'Test Last Name');
        insert con;

        RestRequest request = new RestRequest();
        request.requestUri = 'https://kurinjitechnologies-d-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+account.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        // Call the method to test
        AccountManager.getAccount();
    }
}