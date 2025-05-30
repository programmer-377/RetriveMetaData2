public class ExceptionTesting {
    public static void dmlException(){
        List<Student__c> getStudentRecords = [SELECT Name, Sudent_Active_Status__c FROM Student__c WHERE Name = 'Muthu'];
        
        Try{
            For(Student__c stuentRecords : getStudentRecords){    
                If(stuentRecords.Sudent_Active_Status__c == null){
                    throw new dmlException('Null pointer Exception Occured');
                }
                If(stuentRecords.Sudent_Active_Status__c.Equals('Active')){
                    System.debug('No DML Exception');
                }
            }
        }
        Catch(Exception e){
            System.debug(e);
        }
        Finally{
            System.debug('Finally');
        }
    }
}