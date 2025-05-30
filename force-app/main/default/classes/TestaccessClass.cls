public with sharing class TestaccessClass {
    public List<Student__c> testmethods(){
        return [SELECT Name, Address__c, Age__c FROM Student__c LIMIT 1];
    }
}