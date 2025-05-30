public class Colorclass {   
    public static void orderByPassMark(){       
        List<Student__c> studentDetail = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE College__r.Name = 'CPA College' ORDER BY TotalMark__c DESC];
        List<String> tempList1 = new List<String>();
        List<String> tempList2 = new List<String>();
        List<String> tempList3 = new List<String>();
        List<String> tempList4 = new List<String>();
        List<String> tempList5 = new List<String>();
        List<String> tempList6 = new List<String>();
        
        For(Student__c studentList : studentDetail){
            List<Decimal> stList1 = new List<Decimal>{studentList.Mark_1__c, studentList.Mark_2__c, studentList.Mark_3__c, studentList.Mark_4__c, studentList.Mark_5__c};
                List<String> studentName = new List<String>();
            For(Decimal d1 : stList1){
                If(d1>=35){
                    StudentName.add(studentList.Name);
                }
            }
            if(studentName.size() == 5){
                tempList1.add(studentList.Name);
            }else if(studentName.size() == 4){
                tempList2.add(studentList.Name);
            }else if(studentName.size() == 3){
                tempList3.add(studentList.Name);
            }else if(studentName.size() == 2){
                tempList4.add(studentList.Name);
            }else if(studentName.size() == 1){
                tempList5.add(studentList.Name);
            }else{
                tempList6.add(studentList.Name);
            }            
        }
        for(String st1 : tempList1){
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
}