public class OnSiteCheckInController {
    public Contact con{get;set;}
    public Registration__c reg{get;set;}
    public Event__c event{get;set;}
    Public Note note{get;set;}
    public Boolean isRecordsAvailable{get;set;}
    public Boolean isContactInformation{get;set;}
    public Boolean checkInSuccessMessage{get;set;}
    public Boolean noDataFound{get;set;}
    public String eventId;
    public String selectContactId{get;set;}
    public String regId;
    public String searchByNameandEmail{get;set;}
    public List<Registration__c> registrationRecords{get;set;}
    public List<Registration__c> registratDetails{get;set;}
    public List<Note> noteList{get;set;}
    
    public OnSiteCheckInController(ApexPages.StandardController stdControllder){
        eventId = stdControllder.getId();
        con = new Contact();
        reg = new Registration__c();
        note = new note();
        registrationRecords = new List<Registration__c>();
        registratDetails = new List<Registration__c>();
        noteList = new List<Note>();
        isRecordsAvailable = false;
        isContactInformation = false;
        checkInSuccessMessage = false;
        noDataFound = false;
    }
    
    public pageReference searchByContact(){
        con = new Contact();
        reg = new Registration__c();
        registrationRecords = new List<Registration__c>();
        isContactInformation = false;
        
        if(searchByNameandEmail != null && searchByNameandEmail != ''){
            for(Registration__c registration : [SELECT Registrant_Details__r.FirstName, Registrant_Details__r.LastName, Event__r.Name, Event__r.id, Registrant_Details__r.Email, Status__c, Registrant_Details__r.id FROM Registration__c WHERE Event__r.id =: eventId AND ((Registrant_Details__r.FirstName LIKE : '%'+searchByNameandEmail+'%') OR (Registrant_Details__r.LastName LIKE : '%'+searchByNameandEmail+'%') OR (Registrant_Details__r.Email LIKE : '%'+searchByNameandEmail+'%')) AND ((Status__c = 'Registered') OR Status__c = 'Attended')]){
                
                registrationRecords.add(registration);
            }
        }
        
        if(registrationRecords != null && registrationRecords.Size() != 0){
            isRecordsAvailable = true;
            noDataFound = false;
        }else {
            noDataFound = true;
            isRecordsAvailable = false;
        }            

        return null;
    }
    
    public pageReference searchByRegistrationName(){
        isRecordsAvailable = false;
        isContactInformation = true;
        checkInSuccessMessage = false;
        con = new Contact();
        reg = new Registration__c();
        event = new Event__c();
        noteList = new List <Note>();
        
        if(selectContactId != null && selectContactId != ''){
            List <Registration__c> regs = [SELECT Name, Attending_Event__c, You_will_Bring_a_Guest__c, You_Will_Need_Special_Accomodations__c, Status__c, Event__r.Id, Event__r.Name FROM Registration__c WHERE Event__r.id =: eventId AND Registrant_Details__r.id =: selectContactId];
            if(regs != null && regs.size() > 0) reg = regs[0];

            List <Contact> cons = [SELECT Name, Email, FirstName, LastName, Phone FROM Contact WHERE id =: selectContactId];
            if(cons != null && cons.size() > 0) con = cons[0];
        }

        regId = reg.id;
        noteList = getNoteList(regId);
        
        return null;
    }
    
    public pageReference checkIn(){
        reg.Status__c = 'Attended';
        checkInSuccessMessage = true;

        if(note.Body != null){
            Note tempNote = new Note();
            tempNote.Title = 'OnSite Event Note Test';
            tempNote.ParentId = regId;
            tempNote.body = note.body;
            insert tempNote;
        }
        if(reg != null && reg.id != null)
            upsert reg;
        
        noteList = getNoteList(regId);

        return null;
    }

    public List<Note> getNoteList(String regId){
        List <Note> tempList = new List <Note>();

        if(regId != null && regId != ''){
            for(Note notes: [SELECT title, Body, ParentId, CreatedDate, Parent.Name FROM Note WHERE ParentId =: regId ORDER BY CreatedDate ASC]){
                tempList.add(notes);
            }
        }
        if(templist != null && tempList.size() >0 )
            return tempList;
        
        return null;
    }
}