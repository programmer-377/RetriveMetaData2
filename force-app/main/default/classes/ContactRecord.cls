public class ContactRecord {
    
    public List<Contact> contactList(Integer recordsLimit){
        List<Contact> contactDetails = [SELECT FirstName, LastName, Father_Name__c,Salutation FROM Contact ORDER BY Name ASC];
        List<Contact> getLimitRecords = new List<Contact>();
        List<Contact> updatedRecords = new List<Contact>();
        For(Integer i=0;i<recordsLimit; i++){
            getLimitRecords.add(contactDetails.get(i));
        }
        for(Contact updateRec : getLimitRecords){
            if(updateRec.FirstName == null){
                if(updateRec.Father_Name__c != null){
                    Contact addCon = new Contact();
                    addCon.FirstName = updateRec.Father_Name__c;
                    addCon.LastName = updateRec.LastName;
                    addCon.Id = updateRec.Id;
                    updatedRecords.add(addCon);
                    update addCon;
                }else{
                    Contact addCon = new Contact();
                    addCon.FirstName = updateRec.Salutation;
                    addCon.LastName = updateRec.LastName;
                    addCon.Id = updateRec.Id;
                    updatedRecords.add(addCon);
                    update addCon;
                }
            }
        }
        return updatedRecords;
    }
}
/* ContactRecord t = new ContactRecord();
List<Contact> tempList1 = t.contactList(1);

for(Contact tempList : tempList1){
    System.debug(tempList.FirstName);
    System.debug(tempList.LastName);
} */