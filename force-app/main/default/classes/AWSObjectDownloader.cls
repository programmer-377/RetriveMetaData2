public without sharing class AWSObjectDownloader
{
    public AWS_Configuration__c awsCredentials;
    public String AccId {get;set;}
    public AWSObjectDownloader()
    {
        awsCredentials = [SELECT Access_Key__c, Secret_Key__c, Bucket_Name__c FROM AWS_Configuration__c WHERE Bucket_Name__c = 'muthu-dev' LIMIT 1];
        AccId = ApexPages.currentPage().getParameters().get('Id');
    }
}