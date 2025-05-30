public class RegMain {
    public Registration__C reg{get;set;}
    public Lodging__c lod{get;set;}
    public Boolean isGuestAttending{get; set;}
    public String regId;
    Public String testVar{get;set;}
    
    public RegMain(){
        reg = new Registration__C();
        lod = new Lodging__c();
        isGuestAttending = false;

        if(regId != null){
            List<Registration__C> regs = [SELECT You_will_Bring_a_Guest__c, You_Will_Need_Special_Accomodations__c, You_Will_Need_Air_Travel__c FROM Registration__c WHERE Id =: regId];
            if(regs.size() > 0) reg = regs.get(0);
        }
    }
    
    public PageReference SaveAndGoToPageTwo(){
        if(reg != null){
            reg.Name = 'Test Event Registration (pg)';
            if(regId != null) reg.id = regId;
            upsert reg;
            regId = reg.id;
        }

        PageReference pg = Page.registrationactivitypage;
        if(reg.You_will_Bring_a_Guest__c != null && reg.You_will_Bring_a_Guest__c == 'Yes'){
            pg = Page.registrationguestpage;
        } else if(reg.You_Will_Need_Special_Accomodations__c != null && reg.You_Will_Need_Special_Accomodations__c == 'Yes'){
            pg = Page.registrationhotelpage;
        } else if(reg.You_Will_Need_Air_Travel__c != null && reg.You_Will_Need_Air_Travel__c == 'Yes'){
            pg = Page.registrationairppage;
        }
        return pg;
    }
    
    public PageReference SaveAndGoToPageThree(){
        PageReference pg = Page.registrationactivitypage;
        if(reg.You_Will_Need_Special_Accomodations__c == 'Yes'){
            pg = Page.registrationhotelpage;
        } else if(reg.You_Will_Need_Air_Travel__c == 'Yes'){
            pg = Page.registrationairppage;
        }
        return pg;
    }
    
    public PageReference SaveAndGoToPageFour(){
        PageReference pg = Page.registrationactivitypage;
        if(reg.You_Will_Need_Air_Travel__c == 'Yes'){
            pg = Page.registrationairppage;
        }
        return pg;
    }
    
    public PageReference SaveAndGoToPageFive(){
        PageReference pg =  Page.registrationactivitypage;
        return pg;
    }
    
    public PageReference SaveAndGoToConfirmPage(){
        PageReference pg =  Page.registrationconfirmpage;
        return pg;
    }
}