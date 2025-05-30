//Dynamic SOQL Example
public class dynamicSoql {
    public void testquery(String str){
        String query1 = '';
        if(str == null){
            query1 = 'SELECT Count() FROM Student__c';
        }
        else{
            query1 = 'SELECT Name FROM Student__c ' + 'WHERE Name = \''+ str + '\' '; 
        }
        System.debug(query1);
        String str2 = 'SELECT Count() FROM Student__c WHERE Name = \''+ str + '\' ';
        Integer i = Database.CountQuery(str2);
        System.debug(i);
    }
}