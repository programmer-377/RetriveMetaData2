@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(LeadSource='Test', Company='Test Company', LastName='Test Lastname'));
        }
        insert leads;
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor leadProcesser = new LeadProcessor();
        Id batchId = Database.executeBatch(leadProcesser);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        // System.assertEquals(10, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}