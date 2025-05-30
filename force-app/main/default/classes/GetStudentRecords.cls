public class GetStudentRecords{
    
    public void studentRecords(){
        List<Student__c> studentDetail = [SELECT Name, College__r.Name, Class__r.Name, Gender__c FROM Student__c ORDER BY  Gender__c , College__r.Name, Class__r.Name, Name ASC];
        Map<String,Map<String, List<Student__c>>> college = New Map<String,Map<String, List<Student__c>>>();
        Map<String, Integer> studentCount = new Map<String, Integer>();
        
        for(Student__c studentList : studentDetail){
            
            if(college.ContainsKey(studentList.College__r.Name) ){   
                Map<String, List<Student__c>> tempMap = college.get(studentList.College__r.Name);
                studentCount.put(studentList.College__r.Name, studentCount.get(studentList.college__r.Name)+1);
                
                if(tempMap.ContainsKey(studentList.Class__r.Name)){
                    Map<String, List<Student__c>> tempMap1 = college.get(studentList.College__r.Name);
                    List<Student__c> tempList = tempMap1.get(studentList.Class__r.Name);
                    tempList.add(studentList);
                    tempMap1.Put(studentList.Class__r.Name, tempList);
                    college.put(studentList.College__r.Name, tempMap1);
                }
                else{
                    Map<String, List<Student__c>> tempMap1 = new Map<String, List<Student__c>>();
                    List<Student__c> tempList = new List<Student__c>();
                    tempList.add(studentList);
                    tempMap1.put(studentList.Class__r.Name, tempList);
                    college.put(studentList.College__r.Name, tempMap1);
                }                  
            }
            else{
                Map<String, List<Student__c>> tempMap2 = new Map<String, List<Student__c>>();
                List<Student__c> mylist = new List<Student__c>();
                mylist.add(studentList);
                tempMap2.put(studentList.Class__r.Name, mylist);
                college.put(studentList.College__r.Name, tempMap2);
                studentCount.put(studentList.College__r.Name, 1);
            }            
        }        
        for(String collegeKey : college.keyset()){  
            System.debug(collegeKey + ' - Total Number Of Students -> ' + studentCount.get(collegeKey));
            
            for(String departmentKey : college.get(collegeKey).Keyset()){ 
                System.debug(departmentKey + ' - Total Number of Students -> ' + college.get(collegeKey).get(departmentKey).size());     
                List<String> maleStudentsList = new List<String>();
                List<String> femaleStudentsList = new List<String>();
                
                for(Student__c  addStudent : college.get(collegeKey).get(departmentKey)){
                    
                    if(addStudent.Gender__c.equals('Male')){
                        maleStudentsList.add(addStudent.Name);
                    }
                    Else if(addStudent.Gender__c.equals('Female')){
                        femaleStudentsList.add(addStudent.Name);
                    }
                }
                if(maleStudentsList.size() != 0){
                    System.debug('Total Number of Male Students -> ' + maleStudentsList.size());
                }
                if(femaleStudentsList.size() != 0){
                    System.debug('Total Number of Female Stuents -> ' + femaleStudentsList.size());
                }
                for(student__c studentList : college.get(collegeKey).get(departmentKey)){
                    System.debug(studentList.Name);
                }
            }
        }
    }
}