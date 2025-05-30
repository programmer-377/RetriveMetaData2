public class TempStudent {
    /*public static void Tempmethod() {
List<Student__c> stuList = [SELECT Name, Class__r.Name, TotalMark__c FROM Student__c  ORDER BY TotalMark__c  DESC];

List<String> list1 = new List<String>();

List<String> list2 = new List<String>();

List<String> list3 = new List<String>();

List<String> list4 = new List<String>();

List<String> list5 = new List<String>();

List<String> list6 = new List<String>();

List<String> list7 = new List<String>();

For(Student__c stuList1 : stuList){
If(stuList1.Class__r.Name == 'CS-1'){
list1.add(stuList1.Name);

}If(stuList1.Class__r.Name == 'BBA-1'){
List2.add(stuList1.Name);

}If(stuList1.Class__r.Name == 'BBA-2'){
List3.add(stuList1.Name);

}If(stuList1.Class__r.Name == 'BBA-3'){
List4.add(stuList1.Name);

}If(stuList1.Class__r.Name == 'BCA-1'){
List5.add(stuList1.Name);

}If(stuList1.Class__r.Name == 'IT-1'){
List6.add(stuList1.Name); 

}If(stuList1.Class__r.Name == 'Chemistry-3'){
List7.add(stuList1.Name);
}

}       
System.debug('CS-1 Students ----------------->' + list1);
System.debug('BBA-1 Students ----------------->' + list2);
System.debug('BBA-2 Students ----------------->' + list3);
System.debug('BBA-3 Students ----------------->' + list4);
System.debug('BCA-1 Students ----------------->' + list5);
System.debug('IT-1 Students ----------------->' + list6);
System.debug('Chemistry-3 Students ----------------->' + list7);

}*/
  /*Public static void tempmethod1(){
        List<Student__c> stuList = [SELECT Name, Class__r.Name, TotalMark__c FROM Student__c];
        
        Map <String, List<String>> tempMap = new Map <String, List<String>>();
                     
        For(Student__c stuList1 : stuList){        
                If(tempMap.ContainsKey(stuList1.Class__r.Name)){
                List <String> templist = tempMap.get(stuList1.class__r.Name);
                templist.add(stuList1.Name);
                tempMap.put(stuList1.Class__r.Name, templist);
                          
                }Else{
                    List <String> templist = new List <String>();
                    templist.add(stuList1.Name);
                    tempMap.put(stuList1.Class__r.Name, templist);
                    
                }                
            }System.debug(tempMap);
            }*/       
    }