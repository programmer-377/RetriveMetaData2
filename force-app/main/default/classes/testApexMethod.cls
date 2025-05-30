public class testApexMethod{
    public void idEqualsString(){
        List<Id> tempId = new List<Id>();
        List<Student__c> tempStudentList = [SELECT Name, Id FROM Student__c];
        for(Student__c stRec : tempStudentList){
            tempId.add(stRec.Id);
        }
        Boolean strEqualsId = tempId.contains('a0K5i000000rn4YEAQ');
        System.debug('strEqualsId '+strEqualsId);
    }
}