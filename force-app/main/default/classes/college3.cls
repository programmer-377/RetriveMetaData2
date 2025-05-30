public class college3 {
    public List<Student__c> studentList;

    public void getStudents(String collegeName1, String collegeName2, String departmentName, String studentName){
        studentList = [SELECT Name, Class__r.Name, College__r.Name FROM Student__c WHERE (College__r.Name = :collegeName1 OR College__r.Name = :collegeName2) AND (Class__r.Name = :departmentName AND Name = :studentName)];
    }
}

/* college3 t = new college3();

t.getStudents('CPA College', 'Kammavar College', 'CS-1', 'Muthu');

if(t.studentList.size() > 0){
    System.debug(' The Student Name is Exist ');
}else{
    System.debug(' The Student Name is Not Exist ');
} */