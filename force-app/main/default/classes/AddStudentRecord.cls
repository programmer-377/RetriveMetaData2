public class AddStudentRecord {
    public Student__c student{get;set;}
    public List<Student__c> studentList{get;set;}
    
    public AddStudentRecord(){
        student = new Student__c();
        studentList = [SELECT Salutation__c, Name, Gender__c, Contact_Number__c, D_O_B__c, Blood_Group__c, Sudent_Active_Status__c, TotalMark__c, Class__r.Name, College__r.Name FROM Student__c ORDER BY College__r.Name, Name, Class__r.Name, Gender__c];
        System.debug('----->' + studentList);
    }
    
    public void Save(){
        insert student;
	}
}