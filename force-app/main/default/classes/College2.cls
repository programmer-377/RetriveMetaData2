public class College2{
    
    public String nameOfTheCollege;
    public List<Class__c> departmentName(){
        List<Class__c> departmentDetails = [SELECT Name, Departments__c, Year__c, College__r.Name  FROM Class__c WHERE College__r.Name = :nameOfTheCollege ORDER BY Name ASC];
        return departmentDetails;        
    }
    public List<Student__c> studentName(){
        List<Student__c> studentDetails = [SELECT Name, Address__c, Age__c, Class__r.Name, College__r.Name, Contact_Number__c, D_O_B__c, E_Mail__c, Gender__c, Roll_Number__c FROM Student__c WHERE College__r.Name = :nameOfTheCollege ORDER BY Name ASC];       
        return studentDetails;
    }
}

/* College2 t = new College2();
t.nameOfTheCollege = 'CPA College';

List<Class__c> stList = t.departmentName();
for(Class__c dept : stList){
    System.debug(dept.Name);
}

List<Student__c> deptList = t.studentName();
for(Student__c stud : deptList){
    System.debug(stud.Name);
} */

/*College t = new College();
t.nameOfTheCollege = 'CPA College';

College__c test1 = new College__c();
test1 = t.collegeInfo();
if(test1 != null){
    System.debug(test1);
}


for(class__c departmentList : t.getDepartmentList()){
System.debug(departmentList.Name);
}

for(Student__c studentList : t.getStudentList()){
System.debug(studentList.Name);
}*/