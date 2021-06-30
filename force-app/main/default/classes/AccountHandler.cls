public class AccountHandler {
     
    public static account insertNewAccount(string s){
        try{
            account acc = new account();
            acc.Name = s;
            insert acc;
            return acc;
        }
        catch(exception e){
            return null;
        }        
    }
}