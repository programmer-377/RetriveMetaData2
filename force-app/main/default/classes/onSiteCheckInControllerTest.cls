@isTest(seeAllData=true)

public class onSiteCheckInControllerTest {

    static TestMethod void onSiteCheckInTest(){
        Event__c evt = new Event__c(Name = 'TestEventName');
        ApexPages.StandardController sc = new ApexPages.standardController(evt);
        OnSiteCheckInController onSiteController = new OnSiteCheckInController(sc);
        onSiteController.con = new Contact();
        onSiteController.reg = new Registration__c();
        onSiteController.event = new Event__c();
        onSiteController.note = new note();
        onSiteController.isRecordsAvailable = true;
        onSiteController.isContactInformation = false;
        onSiteController.checkInSuccessMessage = false;
        onSiteController.noDataFound = false;
        onSiteController.eventId = 'TestEventId';
        onSiteController.selectContactId = 'TestConId';
        onSiteController.regId = 'TestRegId';
        onSiteController.searchByNameandEmail = 'test@gmail.com';
        onSiteController.registrationRecords = new List<Registration__c>();
        onSiteController.registratDetails = new List<Registration__c>();
        onSiteController.noteList = new List<Note>();

        onSiteController.searchByContact();
        onSiteController.searchByRegistrationName();
        onSiteController.checkIn();
        onSiteController.getNoteList('TestRegId');
    }
}