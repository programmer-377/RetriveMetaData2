public class CollegeExceptionHandling{
    
    public String nameOfTheCollege;
    public college__c collegeInfo(){
        Try{college__c collegeDetails = [SELECT Name, Address__c, Contact__c, CGPA__c, Website__c, E_Mail__c, NAAC_Grade__c, Pin_code__c, Total_Students__c FROM College__c WHERE Name = :nameOfTheCollege];        
            return collegeDetails;
           }
        catch(QueryException e){
            System.debug(' Enter the Valid College Name ');
        }
        return null;
    }
    public List<String> getDepartmentList(){
        List<class__c> departmentDetails = [SELECT Name, College__r.Name FROM class__c WHERE College__r.Name = :nameoftheCollege ORDER BY Name ASC];
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