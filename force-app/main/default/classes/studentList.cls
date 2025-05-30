public class studentList{
    public static List<List< SObject>> searchContactsAndLeads(string smith){    
          List<List<sObject>> searchList = [FIND 'Smith' IN ALL FIELDS 
                                            RETURNING Lead(LastName WHERE LastName = :'smith'),Contact(LastName Where LastName = :'smith')];
return (searchList);
        
   }
}