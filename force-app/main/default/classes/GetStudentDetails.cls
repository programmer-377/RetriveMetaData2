public class GetStudentDetails {
    public List<Student__c> getStudent(String collegeName, String studentName){
        List<Student__c> studentRecords = [SELECT Name, College__r.Name, Class__r.Name FROM Student__c WHERE College__r.Name=:collegeName AND Name=:StudentName];
        return studentRecords;
    }
    public List<Student__c> getCollege(String studentName){
        List<Student__c> collegeRecords = [SELECT Name,College__r.Name, College__r.CGPA__C, College__r.NAAC_Grade__c,College__r.Address__c FROM Student__c WHERE Name = :studentName];
        Return collegeRecords;
    }
}
/* GetStudentDetails t = new GetStudentDetails();
List<Student__c> tempStudentList = t.getStudent('CPA College', 'Muthu');
if(tempStudentList!= null && tempStudentList.size()>0){
    for(Student__c studentRec:tempStudentList){
        System.debug(studentRec.Name);
        System.debug(studentRec.Class__r.Name);
        System.debug(studentRec.College__r.Name);
    }
}else{
    System.debug('The Student Record is Invalid');
} */

/* GetStudentDetails t = new GetStudentDetails();
String name = 'A';
List<Student__c> tempStudentList = t.getCollege(name);
Set<College__c> tempSet = new Set<College__c>();
if(tempStudentList != null){
    for(Student__c stList : tempStudentList){
        College__c clg = new College__c();
        clg.Name = stList.College__r.Name;
        clg.CGPA__C = stList.College__r.CGPA__C;
        clg.NAAC_Grade__c = stList.College__r.NAAC_Grade__c;
        clg.Address__c = stList.College__r.Address__c;
        tempSet.add(clg);
    }
    for(College__c tempStu : tempSet){
        System.debug(tempStu.Name);
        System.debug(tempStu.CGPA__C);
        System.debug(tempStu.NAAC_Grade__c);
        System.debug(tempStu.Address__c);
    }
}else{
    System.debug('The Record is Invalid');
} */