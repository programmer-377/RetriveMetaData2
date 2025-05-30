public class collegeList{
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
            if(collegeMap.ContainsKey('Pass in 5 Subjects')){
                if(addStudentName.size() == 5){
                    List<String> tempList = collegeMap.get('Pass in 5 Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Pass in 5 Subjects', tempList);
                }                                    
            }else{
                List<String> tempList = new List<String>();
                tempList.add(stList.Name);
                collegeMap.put('Pass in 5 Subjects', tempList);
            }
            if(collegeMap.ContainsKey('Pass in 4 Subjects')){
                if(addStudentName.size() == 4){
                    List<String> tempList = collegeMap.get('Pass in 4 Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Pass in 4 Subjects', tempList);
                }                                
            }else{
                List<String> tempList = new List<String>();
                collegeMap.put('Pass in 4 Subjects', tempList);
            }
            if(collegeMap.ContainsKey('Pass in 3 Subjects')){
                if(addStudentName.size() == 3){
                    List<String> tempList = collegeMap.get('Pass in 3 Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Pass in 3 Subjects', tempList);
                }                                    
            }else{
                List<String> tempList = new List<String>();
                collegeMap.put('Pass in 3 Subjects', tempList);
            }
            if(collegeMap.ContainsKey('Pass in 2 Subjects')){
                if(addStudentName.size() == 2){
                    List<String> tempList = collegeMap.get('Pass in 2 Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Pass in 2 Subjects', tempList);
                }                                    
            }else{
                List<String> tempList = new List<String>();
                collegeMap.put('Pass in 2 Subjects', tempList);
            }
            if(collegeMap.ContainsKey('Pass in 1 Subjects')){
                if(addStudentName.size() == 1){
                    List<String> tempList = collegeMap.get('Pass in 1 Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Pass in 1 Subjects', tempList);
                }                                    
            }else{
                List<String> tempList = new List<String>();
                collegeMap.put('Pass in 1 Subjects', tempList);
            }
            if(collegeMap.ContainsKey('Fail in All Subjects')){
                if(addStudentName.size() == 0){
                    List<String> tempList = collegeMap.get('Fail in All Subjects');
                    tempList.add(stList.Name);
                    collegeMap.put('Fail in All Subjects', tempList);
                }                                    
            }else{
                List<String> tempList = new List<String>();
                collegeMap.put('Fail in All Subjects', tempList);
            }            
        }       
        for(String getKey : collegeMap.Keyset()){
            System.debug(getKey + '--------->');
            for(String getValue : collegeMap.get(getKey)){
                System.debug(getValue);
            }
        }
    } 
}