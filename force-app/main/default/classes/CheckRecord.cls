public class CheckRecord{
    public List<Student__c> studentList;
    
    public void getStudent(String collegeName, String departmentName, String studentName){
        studentList = [SELECT College__r.Name, Class__r.Name, Name FROM Student__c WHERE (College__r.Name = :collegeName AND Class__r.Name = :departmentName AND Name=:studentName)];
        if(studentList.size() > 0){
        }
        else{
            College__c getCollege = [SELECT Name, id FROM College__c WHERE Name = :collegeName];
            Class__c getDepartment = [SELECT Name, id FROM Class__c WHERE Name = :departmentName];
            Student__c studentRecord = new Student__c();
            studentRecord.Name = studentName;
            studentRecord.College__c = getCollege.id;
            studentRecord.Class__c = getDepartment.id;
            insert studentRecord;
        }
    }
}

/* College4 t = new College4();
t.getStudent('Kammavar College', 'CS-1', 'TestName2');

if(t.studentList.size() > 0){
System.debug(' The Student Name is Exist ');
}else{
System.debug(' New Student Record is Created ');
} */