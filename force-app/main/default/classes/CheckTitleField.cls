public class CheckTitleField {
    public List<Contact> List1 = new List<Contact>();
    public List<Contact> list2 = new List<Contact>();
    public List<Contact> list3 = new List<Contact>();
    
    public void checkContactField(){        
        List<Contact> contactRecords = [SELECT Name, Title, Title_2__c FROM Contact];
        for(Contact conRec : contactRecords){
            if(conRec.Title == 'Staff' && conRec.Title_2__c != null){
                list1.add(conRec);
            }
            else if(conRec.Title == 'Staff' && conRec.Title_2__c == null){
                list2.add(conRec);
            }
            else if(conRec.Title != null && conRec.Title.Contains('Staff-')){
                list3.add(conRec);
            }
        }
    }
}
/* CheckTitleField t = new CheckTitleField();
t.checkContactField();
System.debug(t.list1);
System.debug(t.list2); */