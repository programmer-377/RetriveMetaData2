public class TestMethod1 {
    /* public static void TestClassMehod(){
List <Student__c> tempList = [SELECT Name, Gender__c, Class__r.Name, Salutation__c FROM Student__c ORDER BY Gender__c, Name ASC];

Map<String, List<String>> tempMap = new Map<String, List<String>>();

For(Student__c tempList1 : tempList){
If(tempMap.ContainsKey(tempList1.Class__r.Name)){
List<String> lt1 = tempMap.get(tempList1.Class__r.Name);
lt1.add(tempList1.Name);
tempMap.put(tempList1.Class__r.Name, lt1);
}Else{
List<String> lt1 = new List<String>();
lt1.add(tempList1.Name);
tempMap.put(tempList1.Class__r.Name, lt1);
}
}System.debug(tempMap);
}*/
    Public static void tempmethod1(){
        List<Student__c> stuList = [SELECT Name, Class__r.Name, College__r.Name, TotalMark__c FROM Student__c];
        
        Map <String, List<String>> tempMap = new Map <String, List<String>>();
        
        Map<String, List<List<String>>> myMap = new Map<String, List<List<String>>>();
        
        
        For(Student__c stuList1 : stuList){ 
            If(tempMap.ContainsKey(stuList1.Class__r.Name)){
                List <String> templist = tempMap.get(stuList1.class__r.Name);
                templist.add(stuList1.Name);
                tempMap.put(stuList1.Class__r.Name, templist);
                
            }Else{
                /*List <String> templist = new List <String>();*/
                List<String> templist = null;
                templist.add(stuList1.Name);
                tempMap.put(stuList1.Class__r.Name, templist);                   
            }
            
            If(myMap.ContainsKey(stuList1.College__r.Name)){
                List<string> myList2 = tempMap.get(stuList1.Class__r.Name);
                List<List<String>> myList3 = new List<List<String>>();
                myList3.add(myList2);                
                myMap.put(stuList1.College__r.Name, myList3);
                
            }Else{
                List<String> myList2 = new List<String>();
                List<List<String>> myList3 = new List<List<String>>();
                myList3.add(myList2);
                myMap.put(stuList1.College__r.Name, myList3);
            }
            
        }System.debug(myMap);
    }
    public static void method11(){
        List<Integer> mark1 = new List<Integer>{70, 56, 34, 56, 40};
            List<Integer> mark2 = new List<Integer>{60, 26, 34, 56, 70};
                List<Integer> mark3 = new List<Integer>{70, 56, 74, 56, 40};
                    List<Integer> mark4 = new List<Integer>{20, 26, 34, 56, 10};
                        List<Integer> mark5 = new List<Integer>{30, 56, 34, 26, 20};
                            
                            List<List<Integer>> marks = new List<List<Integer>>();
        marks.add(mark1);
        marks.add(mark2);
        marks.add(mark3);
        marks.add(mark4);
        marks.add(mark5);
        marks.sort();
        System.debug('==================> ' + marks);
    }
}