public class ContactAndLeadSearch {
    public static List<List<Object>> searchContactsAndLeads  (String str)
    { 
        List<List<Object>> obj = [FIND :str IN ALL FIELDS 
                                  RETURNING Contact(FirstName,LastName),
                                  Lead(FirstName,LastName)];
        return obj;    }   
}