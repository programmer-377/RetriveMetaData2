public with sharing class ViewContactCtrl
{
    public Account acc{get;set;}
    public List<Contact> lstOfContacts {get;set;}
    public Contact con {get;set;}
    public List<Discussion__c> lstOfDiscussions {get;set;}
    public Discussion__c discuss {get;set;}
    public Id accId{get;set;}
    public Id conId{get;set;}
    public Id disId{get;set;}
    public Boolean closeModal{get;set;}
    public Boolean isAddOrEdit{get;set;}
    public String actionType{get;set;}

    public ViewContactCtrl()
    {
        acc = new Account();
        lstOfContacts = new List<Contact>();
        con = new Contact();
        lstOfDiscussions = new List<Discussion__c>();
        discuss = new Discussion__c();
        closeModal = false;
        isAddOrEdit = false;

        if(ApexPages.currentPage() != null && ApexPages.currentPage().getParameters() != null)
        {
            if(ApexPages.currentPage().getParameters().get('accId') != null)
            {
                accId = ApexPages.currentPage().getParameters().get('accId');
            }

            if(ApexPages.currentPage().getParameters().get('conId') != null)
            {
                conId = ApexPages.currentPage().getParameters().get('conId');
            }

            if(ApexPages.currentPage().getParameters().get('disId') != null)
            {
                disId = ApexPages.currentPage().getParameters().get('disId');
            }

            if(ApexPages.currentPage().getParameters().get('action') != null)
            {
                actionType = ApexPages.currentPage().getParameters().get('action');
            }
        }

        isAddOrEdit = (String.isNotBlank(actionType) && (actionType.equalsIgnoreCase('Add') || actionType.equalsIgnoreCase('Edit')));

        if(String.isNotBlank(accId))
        {
            getAccountAndContacts(accId);
        }

        if(String.isNotBlank(conId))
        {
            getContactAndDiscussions(conId);
        }

        if(String.isNotBlank(disId))
        {
            discuss = getDiscussion(disId);
        }
    }

    void getAccountAndContacts(Id accId)
    {
        List<Account> tempAcc = [SELECT Name, Id, Last_Discussion__c FROM Account WHERE Id =: accId LIMIT 1];
        if(tempAcc != null && tempAcc.size() > 0)
        {
            acc = tempAcc[0];

            lstOfContacts = [SELECT Name, Id, Account.Id, Account.Name, Birthdate, Email, Phone, Fax, MailingAddress, Title FROM Contact WHERE Account.Id =: accId ORDER BY Name];
        }
    }

    void getContactAndDiscussions(Id conId)
    {
        List<Contact> tempCon = [SELECT Name, Id, Account.Id FROM Contact WHERE Id =: conId LIMIT 1];
        if(tempCon != null && tempCon.size() > 0)
        {
            con = tempCon[0];

            lstOfDiscussions = [SELECT Name, Id, Contact__c, Discussion_Title__c, Discussion_Type__c, Description__c, Discussed_Person_Name__c, Contact__r.Account.Id FROM Discussion__c WHERE Contact__c =: conId ORDER BY CreatedDate ASC];
        }
    }

    Discussion__c getDiscussion(Id discussRecId)
    {
        List<Discussion__c> tempDiscussion = [SELECT Name, Id, Contact__c, Discussion_Title__c, Discussion_Type__c, Description__c, Discussed_Person_Name__c, Contact__r.Account.Id FROM Discussion__c WHERE Id =: disId LIMIT 1];
        if(tempDiscussion != null && tempDiscussion.size() > 0)
        {
            discuss = tempDiscussion[0];
            return discuss;
        }

        return null;
    }

    public void addOrEditDiscussion()
    {
        closeModal = false;
        if(String.isNotBlank(actionType))
        {
            if(String.isNotBlank(conId) && actionType.equalsIgnoreCase('add'))
            {
                discuss.Contact__c = conId;
                insert discuss;
                closeModal = true;
            }
            else if(String.isNotBlank(disId) && actionType.equalsIgnoreCase('edit'))
            {
                upsert discuss;
                closeModal = true;
            }
        }
    }

    public void deleteDiscussion()
    {
        closeModal = false;
        if(String.isNotBlank(disId) && actionType.equalsIgnoreCase('delete'))
        {
            delete discuss;
            closeModal = true;
        }
    }
}