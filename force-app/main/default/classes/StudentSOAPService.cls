global class StudentSOAPService
{
    webservice static List<Student__c> getStudentRecordWithID(Id stdId)
    {
        return new List<Student__c>([SELECT Salutation__c, Name, Gender__c, Contact_Number__c, D_O_B__c, Blood_Group__c, Sudent_Active_Status__c, TotalMark__c, Class__r.Name, College__r.Name FROM Student__c WHERE Id =: stdId]);
    }
}