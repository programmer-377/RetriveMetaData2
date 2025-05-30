public class College1 {
    public List<String> departmentName(String nameOfTheCollege){
        
        List<Class__c> departmentDetails = [SELECT Name, College__r.Name FROM Class__c WHERE College__r.Name = :nameOfTheCollege];
        List<String> departmentList = new List<String>();
        for(Class__c deptList : departmentDetails){
            departmentList.add(deptList.Name);
        }
        return departmentList;  
    }
    public List<String> studentName(String collegeName, String departmentName){        
        
        List<Student__c> studentDetails = [SELECT Name, Class__r.Name, College__r.Name FROM Student__c WHERE College__r.Name = :collegeName AND Class__r.Name = :departmentName];
        List<String> studentList = new List<String>();
        for(Student__c studList : studentDetails){
            studentList.add(studList.Name);
        }
        return studentList;                
    }
}