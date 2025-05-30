public with sharing class TestGoogleCalendarParamLink{

    public Student__c student{get;set;}
    public String calLink{get;set;}

    public TestGoogleCalendarParamLink(){
        student = new Student__c();
        calLink = '';
    }

    public Pagereference addEventCalendar(){
        // String title = EncodingUtil.urlEncode('text=Test Event Calendar', 'UTF-8');
        String description = '<a href="https://www.google.com"> click here to open Google </a> <br/><br/> Welcome to Our Event <br/> Thanks & Regards <br/> Muthu';
        // String googleCalLink = ''+ EncodingUtil.urlEncode(title, 'UTF-8') + EncodingUtil.urlEncode(description, 'UTF-8');
        Pagereference pg = new Pagereference('https://calendar.google.com/calendar/u/0/r/eventedit');
        // pg.getParameters().put('text', title);
        pg.getParameters().put('details', description);
        calLink = 'https://calendar.google.com/calendar/u/0/r/eventedit' + description;
        return pg;
    }

}