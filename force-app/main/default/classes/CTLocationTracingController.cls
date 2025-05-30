public with sharing class CTLocationTracingController
{
    public CTLocationTracingController()
    {

    }

    public List<Location_Tracing__c> getVisitors(String locationId)
    {
        List<Location_Tracing__c> templstOfLocatTracing = new List<Location_Tracing__c>();
        if(String.isNotBlank(locationId))
        {
            templstOfLocatTracing = [SELECT Name, Location__c, Person__c, Visit_Date__c FROM Location_Tracing__c WHERE id =: locationId ORDER BY Visit_Date__c DESC NULLS LAST];
        }

        return templstOfLocatTracing;
    }

    public List<Location_Tracing__c> getLocationByPersonIds(Set<Id> personIds)
    {
        List<Location_Tracing__c> templstOfLocatTracing = new List<Location_Tracing__c>();
        if(personIds != null && !personIds.isEmpty())
        {
            templstOfLocatTracing = [SELECT Name, Location__c, Person__c, Visit_Date__c FROM Location_Tracing__c
            WHERE Person__c IN : personIds
            AND Visit_Date__c = LAST_N_DAYS:10];
        }

        return templstOfLocatTracing;
    }

    public List<Location_Tracing__c> getLocationByLocationIds(Set<Id> locationIds)
    {
        List<Location_Tracing__c> templstOfLocatTracing = new List<Location_Tracing__c>();
        if(locationIds != null && !locationIds.isEmpty())
        {
            templstOfLocatTracing = [SELECT Name, Location__c, Person__c, Visit_Date__c FROM Location_Tracing__c
            WHERE Location__c IN : locationIds
            AND Person__r.Health_Status__c = 'Green'
            AND Visit_Date__c = LAST_N_DAYS:10];
        }

        return templstOfLocatTracing;
    }

    public List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTracesLst)
    {
        List<Location_Tracing__c> lstOfDuplicateRecords = new List<Location_Tracing__c>();
        if(locationTracesLst != null && !locationTracesLst.isEmpty())
        {
            List<Location_Tracing__c> templstOfLocatTracing = [SELECT Name, Location__c, Person__c, Visit_Date__c FROM Location_Tracing__c];

            for (Location_Tracing__c ltExist : templstOfLocatTracing)
            {
                for (Location_Tracing__c lt : locationTracesLst)
                {
                   if(ltExist.Location__c == lt.Location__c)
                   {
                        lstOfDuplicateRecords.add(ltExist);
                   }
                }
            }
        }

        return lstOfDuplicateRecords;
    }
}