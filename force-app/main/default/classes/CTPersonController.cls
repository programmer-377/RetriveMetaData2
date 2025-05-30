public with sharing class CTPersonController
{
    public CTPersonController()
    {

    }

    public String getToken(String mobileNo)
    {
        if(String.isNotBlank(mobileNo))
        {
            Blob mobileNoBlob = Blob.valueOf(mobileNo);
            Blob uniqueToken = Crypto.generateDigest('MD5', mobileNoBlob);

            mobileNo = EncodingUtil.base64Encode(uniqueToken);
        }

        return mobileNo;
    }

    public List<Person__c> getRecentHealthChanges()
    {
        List<Person__c> tempPersonList = [SELECT Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST LIMIT 100];

        return tempPersonList;
    }

    public List<Person__c> searchPeople(String searchTerm)
    {
        List<Person__c> tempPersonList = new List<Person__c>();

        if(String.isNotBlank(searchTerm))
        {
            searchTerm = '%'+searchTerm+'%';
            tempPersonList = [SELECT Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c
            WHERE (Name LIKE: searchTerm)
            OR (Mobile__c LIKE: searchTerm)
            OR (Token__c LIKE: searchTerm)
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
        }

        return tempPersonList;
    }

    public Person__c getPersonById(String personId)
    {
        Person__c tempPerson = new Person__c();

        if(String.isNotBlank(personId))
        {
            List<Person__c> tempPersonList = [SELECT Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c FROM Person__c WHERE Id =: personId LIMIT 1];

            if(tempPersonList != null && !tempPersonList.isEmpty())
            {
                tempPerson = tempPersonList[0];
            }
        }

        return tempPerson;
    }
}