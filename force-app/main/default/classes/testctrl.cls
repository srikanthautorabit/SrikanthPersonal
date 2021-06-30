public class testctrl {

   // public String oppRole { get; set; }

    public string Email{get;set;}
    
    public String Rate { get; set; }

    public String Impression { get; set; }

    public String Quantity { get; set; }

    public String Address { get; set; }
    
     public String RDPM { get; set; }
     
      public String Yes2 { get; set; }

    public String Addonfield2 { get; set; }
    
    public String Yes1 { set; get; }
    
    public String Store { get; set; }

 public string Formatfield {set;get;}
 public string Addonfield {set;get;}
 
  public string DIsti {set;get;}
    
    public testctrl (){
    
     if(null!=apexpages.currentpage().getparameters().get('email')){
    
            email = apexpages.currentpage().getparameters().get('email');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('Rate')){
    
            Rate= apexpages.currentpage().getparameters().get('Rate');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('Impression')){
    
            Impression= apexpages.currentpage().getparameters().get('Impression');
    }
    
   if(null!=apexpages.currentpage().getparameters().get('Quantity')){
    
            Quantity= apexpages.currentpage().getparameters().get('Quantity');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('Address')){
    
            Address= apexpages.currentpage().getparameters().get('Address');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('RDPM')){
    
            RDPM = apexpages.currentpage().getparameters().get('RDPM');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('Yes2')){
    
            Yes2 = apexpages.currentpage().getparameters().get('Yes2');
    }
    
     if(null!=apexpages.currentpage().getparameters().get('Yes1')){
    
            Yes1 = apexpages.currentpage().getparameters().get('Yes1');
    }
     if(null!=apexpages.currentpage().getparameters().get('Addonfield2')){
    
            Addonfield2 = apexpages.currentpage().getparameters().get('Addonfield2');
    }
     if(null!=apexpages.currentpage().getparameters().get('Formatfield')){
    
            Formatfield  = apexpages.currentpage().getparameters().get('Formatfield');
    }
     if(null!=apexpages.currentpage().getparameters().get('Addonfield')){
    
            Addonfield  = apexpages.currentpage().getparameters().get('Addonfield');
    }
     if(null!=apexpages.currentpage().getparameters().get('DIsti')){
    
            DIsti= apexpages.currentpage().getparameters().get('DIsti');
    }
    
    if(null!=apexpages.currentpage().getparameters().get('Store')){
    
            DIsti= apexpages.currentpage().getparameters().get('Store');
    }
    
  
        oppId = ApexPages.currentPage().getParameters().get('id');
        // Get the Opportunity
        opp= [SELECT ID, NAME,Opportunity_num__c,Account.name,Account.id,Account.Store__c FROM Opportunity where id  ='00628000006IJtQ'];
        System.debug('****opp:'+opp);
        //Get the Opportunity Primary contact role
        oppRole = [SELECT ID,isPrimary,Contact.Name,Contact.Phone,Contact.Email, Contact.MailingCity,Contact.MailingState,Contact.MailingCountry,Contact.MailingStreet FROM opportunitycontactrole where opportunityid ='00628000006IJtQ' limit 1];
       // Get the Account
       account =[select id,name from Account where id=:opp.account.id];
       System.debug('account: ' + account);
       //Get the active Financial accounts
       finAccountList = [Select Id, Name,
                Client_Account_Number__c,
                Product_Type__c,
                Owner.Name,
                Owner.Username,
                Account_Status__c
        from Financial_Account__c
        where Client_Account__c = :account.Id
        and Account_Status__c = 'Active'
        ];
        System.debug('*****finAccountList:'+finAccountList); 
        
   
    }
    
    public OpportunityContactRole getOppRole() {
        return oppRole ;
    }


    public opportunity getOpp() {
        return opp;
    }

    Id oppId;
    opportunity opp {get;set;}
    opportunitycontactrole oppRole {get;set;}
    public List<Financial_Account__c> finAccountList {get; set;}
    public Account account {get; set;}

public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,
                Client_Account_Number__c,
                Product_Type__c,
                Owner.Name,
                Owner.Username,
                Account_Status__c
        from Financial_Account__c
        where Client_Account1__c = '0010I00001s6KQt'
        ]));
                // sets the number of records in each page set
                con.setPageSize(5);
            }
            return con;
        }
        set;
    }

   public void getFinAccountList () {
    FinAccountList = new list<Financial_Account__c>();
    system.debug('>>>>>getrecords'+ con.getRecords());
  FinAccountList  = (List<Financial_Account__c>)con.getRecords();
   // return FinAccountList ;
    
    }
   
   
}