public class GetStudentRecord{
    public static void studentRecord(){
        
        List<Student__c> studentDetail = [SELECT Name, College__r.Name, Class__r.Name FROM Student__c ORDER BY Name ASC];
        
        Map<String,Map<String, List<String>>> college = New Map<String,Map<String, List<String>>>();
        
        For(Student__c studentList : studentDetail){
            
            If(college.ContainsKey(studentList.College__r.Name) ){
                Map<String, List<String>> tempMap = college.get(studentList.College__r.Name);
                
                If(tempMap.ContainsKey(studentList.Class__r.Name)){
                    Map<String, List<String>> tempMap1 = college.get(studentList.College__r.Name);
                    List<String> tempList = tempMap1.get(studentList.Class__r.Name);
                    tempList.add(studentList.Name);
                    tempMap1.Put(studentList.Class__r.Name, tempList);    
                    college.put(studentList.College__r.Name, tempMap1);                  
                }
                Else{
                    Map<String, List<String>> tempMap1 = college.get(studentList.College__r.Name);
                    List<String> tempList = new List<String>();
                    tempList.add(studentList.Name);
                    tempMap1.put(studentList.Class__r.Name, tempList);
                    college.put(studentList.College__r.Name, tempMap1);                                
                }                  
            }
            Else{
                Map<String, List<String>> tempMap2 = new Map<String, List<String>>();
                List<String> mylist = new List<String>();
                mylist.add(studentList.Name);
                tempMap2.put(studentList.Class__r.Name, mylist);
                college.put(studentList.College__r.Name, tempMap2);
            }            
        }
        For(String getMap : College.keyset()){
            For(String getMap1 : college.get(getMap).Keyset()){                
                    System.debug( '   College Name  - ' + getMap + '   Class Name  - ' + getMap1 + '   Total Number Of Students  - ' + college.get(getMap).get(getMap1).size());               
                
            }
        }
    }  
}