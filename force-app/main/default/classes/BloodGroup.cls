public class BloodGroup{
    public List<Student__c> studentList(String collegeName, Integer topStudents){
        List<Student__c> studentRecords = [SELECT Name, TotalMark__c FROM Student__c WHERE College__r.Name = :collegeName ORDER BY TotalMark__c DESC];
        List<Student__c> top3students = new List<Student__c>();
        try{
            for(Integer i=0; i<topStudents;i++){
                top3students.add(studentRecords.get(i));
            }
            return top3students;
        }
        catch(Exception e ){
          //  System.debug(' Enter The Valid College Name ');
        }
        return null;
    }
    public List<Student__c> studentListAge(String collegeName, Integer aboveAge){
        List<Student__c> studentDetails = [SELECT Name, Age__c FROM Student__c WHERE College__r.Name =: collegeName AND Age__c >= :aboveAge];
        return studentDetails;
    }
    public List<Student__c> studentBloodGroup(String CollegeName, String enterBloodGroup){
        List<Student__c> studentBloodGrp = [SELECT Name, TotalMark__c, Age__c, Blood_Group__c FROM Student__c WHERE College__r.Name =:CollegeName AND Blood_Group__c = :enterBloodGroup AND Blood_Group__c != null];
        return studentBloodGrp;
    }
}

/* FIRST METHOD 
  BloodGroup t = new BloodGroup();
List<Student__c> topStudentList = t.studentList('CPA College', 10);

try{
    for(Student__c students : topStudentList){
        System.debug(students.Name + ' - ' + students.TotalMark__c);
    }
}
catch(Exception e){
    System.debug(e.getMessage());
} */

/* SECOND METHOD
 List<Student__c> getStudentsAge = t.studentListAge('CPA College', 18);

if(getStudentsAge.size() > 0){
    for(Student__c stList : getStudentsAge){
        System.debug('Name - '+stList.Name);
        System.debug('Age - '+stList.Age__c);
    }
}else{
    System.debug(' Enter the Valid College Name ');
} */

/* THIRD METHOD
 List<Student__c> bloodGroup = t.studentBloodGroup('CPA College', 'B+');

if(bloodGroup.size() > 0){
    for(Student__c getData : bloodGroup){
        System.debug('Name - '+getData.Name);
        System.debug('BloodGroup - '+getData.Blood_Group__c);
    }
}else{
    System.debug(' Enter the Valid College Name OR Valid Blood Group');
} */