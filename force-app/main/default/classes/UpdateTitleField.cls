public class UpdateTitleField {
    public List<Contact> updateField(){
        List<Contact> contactRecords = [SELECT LastName,Title,Title_2__c FROM Contact LIMIT 5];
        List<Contact> updatedRecords = new List<Contact>();
        for(Contact conRec : contactRecords){
            if(conRec.Title == 'Staff'&&conRec.Title_2__c == null || conRec.Title != null&&conRec.Title.Contains('Staff-')){
                Contact con = new Contact();
                con.LastName = conRec.LastName;
                con.Id = conRec.id;
                con.Title = conRec.Title;
                con.Title_2__c = 'Updated';
                updatedRecords.add(con);
            }
        }
        update updatedRecords;
        return updatedRecords;
    }
}
/* UpdateTitleField t = new UpdateTitleField();
System.debug(t.updateField()); */