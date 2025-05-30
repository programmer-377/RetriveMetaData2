public class Collectionset {
    public static void collection(){
        List<Student__c> studentDetail = [SELECT Name, College__r.Name, Class__r.Name, Salutation__c, Maritial_Status__c, Gender__c FROM Student__c];  
        
        For(student__c stList : studentDetail){
           if(stList.Salutation__c == 'Mrs'){
                stList.Maritial_Status__c = 'Yes';
               update stList;
            }
        }
    }
}