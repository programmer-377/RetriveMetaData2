public class TestClass {
    public static void tempmethod2(){
        List<Student__c> templist = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE College__r.Name = 'CPA College' ORDER BY TotalMark__c DESC];      
        
        List<String> tempList1 = new List<String>();
        List<String> tempList2 = new List<String>();
        List<String> tempList3 = new List<String>();
        List<String> tempList4 = new List<String>();
        List<String> tempList5 = new List<String>();
        List<String> tempList6 = new List<String>();
        
        For(Student__c tempvar : templist){
            List<Decimal> mark1 = new List<Decimal>{tempvar.Mark_1__c, tempvar.Mark_2__c, tempvar.Mark_3__c, tempvar.Mark_4__c, tempvar.Mark_5__c};
                mark1.sort();            
            if(mark1.get(0) >= 35 && mark1.get(1)>=35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){ 
                tempList1.add(tempVar.Name);                
            }else if(mark1.get(0)<35 && mark1.get(1)>=35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){
                tempList2.add(tempvar.Name);
                // System.debug(tempvar.Name + ' - (' +mark1.get(0) + ' ' + mark1.get(1) + ' ' + mark1.get(2) + ' ' + mark1.get(3) + ' ' + mark1.get(4) + ')'); 
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){
                tempList3.add(tempVar.Name);
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)<35 && mark1.get(3)>35 && mark1.get(4)>=35){
                tempList4.add(tempVar.Name);                
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)<35 && mark1.get(3)<35 && mark1.get(4)>=35){
                tempList5.add(tempVar.Name);               
            }else{
                tempList6.add(tempVar.Name);
            }                      
        }for(String st1: tempList1){
            System.debug(st1);
        }for(String st2 : tempList2){
            System.debug(st2);
        }for(String st3 : tempList3){
            System.debug(st3);
        }for(String st4 : tempList4){
            System.debug(st4);
        }for(String st5 : tempList5){
            System.debug(st5);
        }for(String st6 : tempList6){
            System.debug(st6); 
        }
    }
    
    /* public class TestClass {
     public static void tempmethod2(){
        List<Student__c> templist = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE College__r.Name = 'CPA College' ORDER BY TotalMark__c DESC];      
        
        List<String> tempList1 = new List<String>();
        List<String> tempList2 = new List<String>();
        List<String> tempList3 = new List<String>();
        List<String> tempList4 = new List<String>();
        List<String> tempList5 = new List<String>();
        List<String> tempList6 = new List<String>();
        
        For(Student__c tempvar : templist){
            List<Decimal> mark1 = new List<Decimal>{tempvar.Mark_1__c, tempvar.Mark_2__c, tempvar.Mark_3__c, tempvar.Mark_4__c, tempvar.Mark_5__c};
                mark1.sort();            
            if(mark1.get(0) >= 35 && mark1.get(1)>=35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){ 
                tempList1.add(tempVar.Name);                
            }else if(mark1.get(0)<35 && mark1.get(1)>=35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){
                tempList2.add(tempvar.Name);
                // System.debug(tempvar.Name + ' - (' +mark1.get(0) + ' ' + mark1.get(1) + ' ' + mark1.get(2) + ' ' + mark1.get(3) + ' ' + mark1.get(4) + ')'); 
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)>=35 && mark1.get(3)>=35 && mark1.get(4)>=35){
                tempList3.add(tempVar.Name);
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)<35 && mark1.get(3)>35 && mark1.get(4)>=35){
                tempList4.add(tempVar.Name);                
            }else if(mark1.get(0)<35 && mark1.get(1)<35 && mark1.get(2)<35 && mark1.get(3)<35 && mark1.get(4)>=35){
                tempList5.add(tempVar.Name);               
            }else{
                tempList6.add(tempVar.Name);
            }                      
        }for(String st1: tempList1){
            System.debug(st1);
        }for(String st2 : tempList2){
            System.debug(st2);
        }for(String st3 : tempList3){
            System.debug(st3);
        }for(String st4 : tempList4){
            System.debug(st4);
        }for(String st5 : tempList5){
            System.debug(st5);
        }for(String st6 : tempList6){
            System.debug(st6); 
        }
    } */

	Public Static Void parentToChildQuery(){
        List<College__c> clgList = [SELECT Name, (SELECT Name FROM Students__r) FROM College__c];
        for(College__c clg : clgList){
           System.debug(clg.Students__r);
        }
    }
}