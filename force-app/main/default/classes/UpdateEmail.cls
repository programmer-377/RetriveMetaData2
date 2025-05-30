public class UpdateEmail {
    /*public static void emailmethod(){
        List <Student__c> templist = [SELECT Name, Register_Number__c, E_Mail__c FROM  Student__c];
        
        If(templist != null && templist.size() > 0){
            System.debug('Record is Found');
        }Else{
            System.debug('No Records Found');
        }
        For(Student__c tempStudent : templist){
            tempstudent.E_Mail__c = tempstudent.Name + tempstudent.Register_Number__c + '@gmail.com';
        }update templist;
    }*/

		/*Public Static void tempmethod(){
        List <Student__c> templist1 = [SELECT Name, TotalMark__c FROM Student__c ORDER BY TotalMark__c DESC];
        List<String> mylist = new list<String>();
        For(Student__c tempstudent1 : templist1){
            String st = tempstudent1.Name;
            mylist.add('\n'+st);
           
        }
        System.debug(mylist);
    }*/ 
    public static void tempmethod2(){
        List<Student__c> templist1 = [SELECT Name, Mark_1__c, Mark_2__c, Mark_3__c, Mark_4__c, Mark_5__c, TotalMark__c FROM Student__c WHERE College__r.Name = 'CPA College'];      
		List<Integer> mark1 = new List<Integer>();
        
               For(Student__c tempvar : templist1){
                 Integer m1 = Integer.valueOf(tempvar.Mark_1__c);
                 Integer m2 = Integer.valueOf(tempvar.Mark_2__c);
                 Integer m3 = Integer.valueOf(tempvar.Mark_3__c);
                 Integer m4 = Integer.valueof(tempvar.Mark_4__c);
                 Integer m5 = Integer.valueOf(tempvar.Mark_5__c);
                  
                       System.debug(tempvar.Name);
                                       
                   
  }
 }
}