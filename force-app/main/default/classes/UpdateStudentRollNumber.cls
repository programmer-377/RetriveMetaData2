public class UpdateStudentRollNumber {
    public void updateRollNo(){
        List<Student__c> studentDetails = [SELECT Name, Roll_Number__c, College__c, Class__c FROM Student__c WHERE College__r.Name = 'Government College of Engineering(GCE)'];
        College__c clg = [SELECT Name FROM College__c WHERE Name = 'Government College of Engineering(GCE)'];
        for(Integer i=20001; i<20001+studentDetails.size(); i++){            
            for(Student__c stRec : studentDetails){
                Student__c stu = new Student__c();
                stu.College__c = clg.Id;
                stu.Name = stRec.Name;                
                stu.Roll_Number__c = String.valueOf(i); 
                update stu;
            }
            
        }
    }
}