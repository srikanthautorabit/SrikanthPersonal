public class AccountHandler {
     //test commit
    public static account insertNewAccount(string s){
        try{
            account acc = new account();
            acc.Name = s;
            insert acc;
            return acc;
            //test commit 3
        }
        catch(exception e){
            return null;
        }        
    }
    
    //Test commit -2 
}