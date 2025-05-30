public class College5 {
    public List<Student__c> studentList(String collegeName, Integer topStudents){
        List<Student__c> studentRecords = [SELECT Name, TotalMark__c FROM Student__c WHERE College__r.Name = :collegeName ORDER BY TotalMark__c DESC];
        List<Student__c> top3students = new List<Student__c>();
        List<Decimal> addTotalMark = new List<Decimal>();
        List<Decimal> finalList = new List<Decimal>();
        List<Decimal> limitList = new List<Decimal>();
        for(Student__c addRec : studentRecords){
            addTotalMark.add(addRec.TotalMark__c);
            addTotalMark.sort();
        }
        for(Integer i=addTotalMark.size()-1; i>=0; i++){
            finalList.add(addTotalMark.get(i));
        }
        for(Integer i=0; i<=topStudents; i++){
            limitList.add(finalList.get(i));
        }
        for(Student__c str : studentRecords){
            for(Decimal dt : limitList){
                if(str.TotalMark__c == dt){
                    top3students.add(str);
                }
            }
        }
        return top3Students;
    }
}