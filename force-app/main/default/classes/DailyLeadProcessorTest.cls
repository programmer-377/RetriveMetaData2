@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    @IsTest
    static void test() {
        Lead con = new Lead(LastName='Test',Company='Test Last Name');
        insert con;
        DailyLeadProcessor dailyLeadProcess = new DailyLeadProcessor();
        Test.startTest();
        System.schedule('ScheduledApexTest', CRON_EXP, dailyLeadProcess);
        Test.stopTest();
    }
}