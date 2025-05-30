public class sortByPassMarkNewMethod {
    public void getStudent(String collegeName){
        
        List<Student__c> studentDetails = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE TotalMark__c != 0 AND College__r.Name = :collegeName ORDER BY TotalMark__c DESC];               
        Map<String, List<String>> collegeMap = new Map<String, List<String>>();
        
        for(Student__c stList : studentDetails){            
            List<Decimal> countList = new List<Decimal>{stList.Mark_1__c, stList.Mark_2__c, stList.Mark_3__c, stList.Mark_4__c, stList.Mark_5__c};
                List<String> addStudentName = new List<String>();
            for(Decimal checkPass : countList){
                if(checkPass>=35){
                    addStudentName.add(stList.Name);
                }
            }
        }
    }
}