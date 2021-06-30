public class ContactAndLeadSearch {

    public static list<list<sobject>> searchContactsAndLeads(string s){
        
        list<list<sobject>> searchlist =  [FIND :s IN NAME FIELDS 
                   RETURNING Contact(Name,FirstName),Lead(FirstName,LastName)];
        return searchlist;
        
    }
}