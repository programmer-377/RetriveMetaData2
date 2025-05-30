public without sharing class DiscussionsViewInTheContactRecord {
    public List<Discussion__c> lstOfDiscussion {get;set;}
    public Discussion__c discusstion {get;set;}

    public DiscussionsViewInTheContactRecord(ApexPages.StandardController stdControllder){
        String conId = stdControllder.getId();
        if(String.isNotBlank(conId)){
            lstOfDiscussion = [SELECT Id, Name, Account_SFDC_ID__c, Contact__c, Description__c, Discussed_Person_Name__c, Discussion_Title__c, Discussion_Type__c FROM Discussion__c WHERE Contact__c =: conId];
        }

        // Integer inte = Integer.valueOf('asdf');
    }
}