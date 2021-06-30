public class ContactSearch {

    public static list<contact> searchForContacts(string s1, string s2){
        
        list<contact> cons = [select id,firstName,lastName,MailingPostalCode from contact where lastName=:s1 and 
                     MailingPostalCode=:s2];
         return cons;
        
    }
}