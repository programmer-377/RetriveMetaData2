public class DMLCustomerDetails {
    public void insertCustomerRec(){
        Contact con = new contact();
        con.FirstName = 'Muthu';
        con.LastName = 'Thottappan';
        insert con;
        
        Customer_Detail__c cusDetails = new Customer_Detail__c();
        cusDetails.Name = 'CustomerRecord1';
        cusDetails.Customer_ID__c = 'AB8925195588';
        cusDetails.Gender__c = 'Male';
        cusDetails.Contact__c = con.id;
        insert cusDetails;
    }
    
    public void updateCustomerRec(){
        List<Customer_Detail__c> cusList = [SELECT Name, Customer_ID__c, Gender__c, Contact__c FROM Customer_Detail__c LIMIT 1];
        String customerContactId = cusList[0].Contact__c;
        
        Contact con = new Contact();
        con.id = customerContactId;
        con.FirstName = 'Aathi';
        update con;
    }
}