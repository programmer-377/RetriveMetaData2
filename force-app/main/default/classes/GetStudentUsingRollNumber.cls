public class GetStudentUsingRollNumber{
    
    public Student__c getStudent(String rollNumber){
        Student__c studentDetails = [SELECT  Name, Roll_Number__c, Blood_Group__c, Address__c, College__r.Name, Class__r.Name, Age__c,  Gender__c FROM Student__c WHERE Roll_Number__c = :rollNumber ORDER BY Name ASC];
        return studentDetails;
    }
    
    public Boolean palindrome(List<String> wordList){
        String word;
        String reverseWord;
        
        for(String wordLt : wordList){
            word = word+wordLt;
        }
        for(Integer i=wordList.size()-1; i>=0; i--){
            reverseWord = reverseWord+wordList.get(i);
        }
        if(word == reverseword){
            return true;
        }else{
            return false;
        }
    }
    
    public List<Contact> assignValue(){
        List<Contact> ContactDetails =[SELECT Name, FirstName, LastName, Title, AccountId FROM Contact];
        List<Contact> nullRecord = new List<Contact>();
        List<Contact> limitRecord = new List<Contact>();
        List<Contact> updatedRecord = new List<Contact>();
        
        for(Contact con : contactDetails){
            if(con.Title == null){
                nullRecord.add(con);
            }
        }
        for(Integer i=0;i<5;i++){
            limitRecord.add(nullRecord.get(i));
        }
        for(Contact updatefield : limitRecord){
            Contact conRec = new Contact();
            conRec.FirstName = updateField.FirstName;
            conRec.LastName = updateField.LastName;
            conRec.Id = updateField.Id;
            conRec.Title = 'Staff';
            updatedRecord.add(conRec);
            update conRec;
        }
        return updatedRecord;
    }
    
    public List<Student__c> getStudentDetails(String collegeName, String studentName){
        List <Student__c> studentDetails = [SELECT  Name, Roll_Number__c, Blood_Group__c, Address__c, College__r.Name, Class__r.Name, Age__c,  Gender__c FROM Student__c WHERE college__r.Name = :collegeName AND Name = :studentName ORDER BY Name ASC];
        return studentDetails;
    }
}

/* GetStudentUsingRollNumber t = new GetStudentUsingRollNumber();
Student__c studentDetails = t.getStudent('19700');
if(studentDetails != null){
System.debug(studentDetails.Name);
System.debug(studentDetails.Roll_Number__c);
System.debug(studentDetails.Class__r.Name);
System.debug(studentDetails.College__r.Name);
}else{
System.debug(' Enter the Valid Roll Number ');
} */

/* GetStudentUsingRollNumber t = new GetStudentUsingRollNumber();
List<String> tempList = new List<String>{'M','O','M'};

Boolean b1 = t.Palindrome(tempList);
if(b1==true){
System.debug(' This is Palindrome ');
}else if(b1==false){
System.debug(' This is Not Palindrome ');
} */

/* GetStudentUsingRollNumber t = new GetStudentUsingRollNumber(); 
for(Contact tempCon : t.assignValue()){
System.debug(tempCon.FirstName+' '+tempCon.LastName+' - '+ tempCon.Title);
} */

/* GetStudentUsingRollNumber t = new GetStudentUsingRollNumber();
List<Student__c> stuList = t.getStudentDetails('CPA College', 'Saran raj');

if(stuList.size()>0){
for(Student__c stuDetails : stuList){
System.debug('Student Name - '+stuDetails.Name);
System.debug('Roll Number - '+stuDetails.Roll_Number__c);
System.debug('Department - '+stuDetails.Class__r.Name);
System.debug('College - '+stuDetails.College__r.Name);
}
}
else{
System.debug('Enter the Valid College or Student Name');
} */