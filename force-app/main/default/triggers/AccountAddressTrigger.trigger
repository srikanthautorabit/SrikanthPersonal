trigger AccountAddressTrigger on Account (before insert,before update) {

    
    if(trigger.isinsert && trigger.isbefore){
        list<account> acts= trigger.new;
    for(account a:acts){
        if(a.Match_Billing_Address__c == true)
        {
         a.ShippingPostalCode =a.BillingPostalCode;   
        }
    }
        
}
    if(trigger.isupdate && trigger.isbefore){
        list<account> acts1=trigger.new;
    for(account a:acts1){
        if(a.Match_Billing_Address__c == true)
        {
         a.ShippingPostalCode =a.BillingPostalCode;   
        }
    }
       
}
   
}