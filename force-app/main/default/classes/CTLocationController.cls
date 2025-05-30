public with sharing class CTLocationController
{
    public CTLocationController()
    {

    }

    public List<Location__c> getRecentStatusChanges()
    {
        List<Location__c> tempLocationList = [SELECT Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];

        return tempLocationList;
    }

    public List<Location__c> searchPeople(String searchTerm)
    {
        List<Location__c> tempLocationList = new List<Location__c>();

        if(String.isNotBlank(searchTerm))
        {
            searchTerm = '%'+searchTerm+'%';
            tempLocationList = [SELECT Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c
            WHERE (Name LIKE: searchTerm)
            OR (Pincode__c LIKE: searchTerm)
            OR (Address__c LIKE: searchTerm)
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
        }

        return tempLocationList;
    }

    public Location__c getPersonById(String locationId)
    {
        Location__c tempLocation = new Location__c();

        if(String.isNotBlank(locationId))
        {
            List<Location__c> tempLocationList = [SELECT Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c WHERE Id =: locationId LIMIT 1];

            if(tempLocationList != null && !tempLocationList.isEmpty())
            {
                tempLocation = tempLocationList[0];
            }
        }

        return tempLocation;
    }
}