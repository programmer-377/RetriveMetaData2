public class College{
    
    public String nameOfTheCollege;
    public college__c collegeInfo(){
        List<college__c> collegeDetails = [SELECT Name, Address__c, Contact__c, CGPA__c, Website__c, E_Mail__c, NAAC_Grade__c, Pin_code__c, Total_Students__c FROM College__c WHERE Name = :nameOfTheCollege];
        if(collegeDetails.size() > 0){
            return collegeDetails.get(0);
        }else{
            System.debug(' Enter The Valid College Name ');
            return null;
        }
    }
    public List<String> getDepartmentList(){
        List<class__c> departmentDetails = [SELECT Name FROM class__c WHERE College__r.Name = :nameoftheCollege ORDER BY Name ASC];
        List<String> departmentName = new List<String>();
        for(class__c departmentList : departmentDetails){
            departmentName.add(departmentList.Name);
        }
        return departmentName;
    }
    public List<String> getStudentList(){
        List<Student__c> studentDetails = [SELECT Name, College__r.Name FROM Student__c WHERE College__r.Name = :nameOfTheCollege ORDER BY Name ASC];
        List<String> studentName = new List<String>();
        for(Student__c studentList : studentDetails){
            studentName.add(studentList.Name);
        }
        return studentName;
    }
}

/* College t = new College();
t.nameOfTheCollege = 'CPA College';

College__c test1 = new College__c();
test1 = t.collegeInfo();
if(test1 != null){
    System.debug(test1);
} */





/* college t = new college();
t.nameofTheCollege = 'CPA College';
College__c collegeRecord = t.collegeInfo();
System.debug('College Name - '+collegeRecord.get('Name'));
System.debug('NAAC Grade - '+collegeRecord.get('NAAC_Grade__c'));
System.debug('CGPA - '+collegeRecord.get('CGPA__C'));
System.debug('Address - '+collegeRecord.get('Address__c'));
System.debug('Pincode - '+collegeRecord.get('Pin_code__c'));
System.debug('Contact - '+collegeRecord.get('Contact__c'));
System.debug('Email - '+collegeRecord.get('E_Mail__c'));
System.debug('Website - '+collegeRecord.get('Website__c'));
System.debug('Total Number of Students - '+collegeRecord.get('Total_Students__c'));


System.debug(t.getDepartmentList());
System.debug(t.getStudentList()); */

/*for(class__c departmentList : t.getDepartmentList()){
System.debug(departmentList.Name);
}

for(Student__c studentList : t.getStudentList()){
System.debug(studentList.Name);
} */