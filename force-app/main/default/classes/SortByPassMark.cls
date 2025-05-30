public class SortByPassMark{
    public void getStudent(String collegeName){
        
        List<Student__c> studentDetails = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE TotalMark__c != 0 AND College__r.Name = :collegeName ORDER BY TotalMark__c DESC];               
        Map<String, List<String>> collegeMap = new Map<String, List<String>>();
        for(Student__c stList : studentDetails){
            List<Decimal> countList = new List<Decimal>{stList.Mark_1__c, stList.Mark_2__c, stList.Mark_3__c, stList.Mark_4__c, stList.Mark_5__c};
                Integer countVar = 0;             
            for(Decimal checkPass : countList){
                if(checkPass>=35){
                    countVar++;
                }
            }
            for(Integer i=5 ; i>=0; i--){
                if(collegeMap.ContainsKey('Pass in ' + i +' Subjects')){
                    if(countVar == i){          
                        List<String> tempList = collegeMap.get('Pass in ' + i +' Subjects');
                        tempList.add(stList.Name);
                    }
                }else{
                    collegeMap.put('Pass in ' + i +' Subjects', new List<String>());
                    if(countVar == 5){
                        collegeMap.put('Pass in 5 Subjects', new List<String>{stList.Name});
                    }else if(countVar == 4){
                        collegeMap.put('Pass in 4 Subjects', new List<String>{stList.Name});
                    }else if(countVar == 3){
                        collegeMap.put('Pass in 3 Subjects', new List<String>{stList.Name});
                    }else if(countVar == 2){
                        collegeMap.put('Pass in 2 Subjects', new List<String>{stList.Name});
                    }else if(countVar == 1){
                        collegeMap.put('Pass in 1 Subjects', new List<String>{stList.Name});
                    }else if(countVar == 0){
                        collegeMap.put('Pass in 0 Subjects', new List<String>{stList.Name});
                    }
                }
            }
        }
        List<String> insertNewKey = collegeMap.get('Pass in 0 Subjects');
        collegeMap.put('Fail in All Subjects', insertNewKey);
        List<String> removeKey = collegeMap.remove('Pass in 0 Subjects');
        for(String getKey : collegeMap.Keyset()){
            if(!collegeMap.get(getKey).isEmpty()){
                System.debug(getKey+'--------->');
            }
            for(String getValue : collegeMap.get(getKey)){
                System.debug(getValue);
            }
        } 
    }
}