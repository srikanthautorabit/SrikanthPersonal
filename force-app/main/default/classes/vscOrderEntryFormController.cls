public class vscOrderEntryFormController{

    public Opportunity Opportunity{ get; set; }
    
    Public String usr { get; set;} 
    

    public List<Financial_Account__c> finAccountList1 { get; set; }

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
  

public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }

    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

    // returns the page number of the current page set
    public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }

    // returns the first page of records
     public void first() {
         con.first();
     }

     // returns the last page of records
     public void last() {
         con.last();
     }

     // returns the previous page of records
     public void previous() {
         con.previous();
     }

     // returns the next page of records
     public void next() {
         con.next();
     }




    public PageReference cancel() {
      
        return null;
    }


    public String email { get; set; }

    public String Rate { get; set; }

    public String Impression { get; set; }

    public String Quantity { get; set; }

    public String Address { get; set; }
      

    public PageReference submit() {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info, 'Mail Sent');
        ApexPages.addMessage(myMsg); 
        
        
        // Reference the attachment page and pass in the ID
        PageReference pdf =  Page.testpage;
     
        pdf.getParameters().put('email',email);
        
        pdf.getParameters().put('DIsti',DIsti);
        pdf.getParameters().put('Formatfield',Formatfield);
        pdf.getParameters().put('Addonfield',Addonfield);
        pdf.getParameters().put('Yes1',Yes1);
        pdf.getParameters().put('Addonfield2',Addonfield2);
        pdf.getParameters().put('Yes2',Yes2);
        pdf.getParameters().put('RDPM ',RDPM );
        pdf.getParameters().put('Impression',Impression);
        pdf.getParameters().put('Rate',Rate);
        pdf.getParameters().put('Store',Store);
        pdf.getParameters().put('Address',Address);
        pdf.getParameters().put('Quantity',Quantity);
     
      // pdf.getParameters().put('id',conval<b>.Id</b>);


        // Take the PDF content
        Blob b = pdf.getContentAsPDF();
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setContentType('application/pdf');
        efa.setFileName('attachment.pdf');
        efa.setInline(false);
        efa.setBody(b);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {Email};
        mail.setToAddresses(toAddresses);
        mail.setSubject('New form is created'); 
        
        mail.plainTextBody = 'Order Entry Form for VSC';
        
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
        return null;
    }



    public list<selectoption> getStorevalues() {
        list<selectoption> Store=new list<selectoption>();
        Store.add(new selectoption('None','None'));
        Store.add(new selectoption('Yes','Yes'));
        Store.add(new selectoption('No','No'));
        return Store;
    }


    public String Store { get; set; }

    public list<selectoption> getRDPMvalues() {
        list<selectoption> Rdpm=new list<selectoption>();
        Rdpm.add(new selectoption('None','None'));
        Rdpm.add(new selectoption('Yes','Yes'));
        Rdpm.add(new selectoption('No','No'));
        return Rdpm;
    }


    public String RDPM { get; set; }

    public list<selectoption> getYes2values() {
        list<selectoption> yes2=new list<selectoption>();
        yes2.add(new selectoption('None','None'));
        yes2.add(new selectoption('Scratch Off','Scratch Off'));
        yes2.add(new selectoption('Perforations','Perforations'));
        yes2.add(new selectoption('Loyalty Card','Loyalty Card'));
        yes2.add(new selectoption('UV coating','UV coating'));
        yes2.add(new selectoption('Standard Diecut','Standard Diecut'));

        
        return yes2;
    }


    public String Yes2 { get; set; }

    public String Addonfield2 { get; set; }

    public list<selectoption> getYes1values() {
        list<selectoption> yes1=new list<selectoption>();
        yes1.add(new selectoption('None','None'));
        yes1.add(new selectoption('Scratch Off','Scratch Off'));
        yes1.add(new selectoption('Perforations','Perforations'));
        yes1.add(new selectoption('Loyalty Card','Loyalty Card'));
        yes1.add(new selectoption('UV coating','UV coating'));
        yes1.add(new selectoption('Standard Diecut','Standard Diecut'));



        
        return yes1;
    }


    public list<selectoption> getYesvalue1() {
        list<selectoption> yes1=new list<selectoption>();
        yes1.add(new selectoption('None','None'));
        yes1.add(new selectoption('Yes','Yes'));
        yes1.add(new selectoption('No','No'));
        return yes1;
    }


    public String Yes1 { set; get; }

 public string Formatfield {set;get;}
 public string Addonfield {set;get;}
 
  public list<selectoption> getAddon1values() {
        list<selectoption> Addon1=new list<selectoption>();
        Addon1.add(new selectoption('None','None'));
        Addon1.add(new selectoption('Yes','Yes'));
        Addon1.add(new selectoption('No','No'));
        return Addon1;
    } 


 public string DIsti {set;get;}
    public  list<selectoption> getDistribution() {
    
            list<selectoption> Distri=new list<selectoption>();
        Distri.add(new selectoption('None','None'));
         Distri.add(new selectoption('Shared Mail','Shared Mail'));
         Distri.add(new selectoption('Solo','Solo'));
         Distri.add(new selectoption('Shared mail + Solo','Shared mail + Solo'));
         Distri.add(new selectoption('NewsPaper','NewsPaper'));
          return Distri;
   
    }

        public list<selectoption> getcategory(){
       list<selectoption> Category=new list<selectoption>();
        Category.add(new selectoption('None','None'));
         Category.add(new selectoption('Shared Mail','Shared Mail'));
         Category.add(new selectoption('Solo','Solo'));
         Category.add(new selectoption('Shared mail + Solo','Shared mail + Solo'));
         Category.add(new selectoption('NewsPaper','NewsPaper'));
       
        return Category;
        
    }   
    
    
     public list<selectoption> getformat(){
       list<selectoption> Format=new list<selectoption>();
        Format.add(new selectoption('None','None'));
        Format.add(new selectoption('1/2 sheet','1/2 sheet'));
        Format.add(new selectoption('Value sheet','Value sheet'));
        Format.add(new selectoption('Value 60','Value 60'));
        Format.add(new selectoption('Standard Postcard','Standard Postcard'));
        Format.add(new selectoption('Premium Postcard','Premium Postcard'));
        Format.add(new selectoption('Premium Sheet','Premium Sheet'));
        Format.add(new selectoption('Big Sheet','Big Sheet'));
        Format.add(new selectoption('Mega Sheet','Mega Sheet'));
         Format.add(new selectoption('Big 4','Big 4'));
          Format.add(new selectoption('Basic','Basic'));
           Format.add(new selectoption('Image','Image'));
           Format.add(new selectoption('Message','Message'));
           Format.add(new selectoption('Image','Image'));
           Format.add(new selectoption('Basic+','Basic+'));
           Format.add(new selectoption('Image+','Image+'));
           Format.add(new selectoption('Message+','Message+'));
           Format.add(new selectoption('Basic Mini','Basic Mini'));
           Format.add(new selectoption('Image Mini','Image Mini'));
           Format.add(new selectoption('Message Mini','Message Mini'));
           Format.add(new selectoption('Perf Basic','Perf Basic'));
           Format.add(new selectoption('Jumbo Image','Jumbo Image'));
          
        return Format;
        
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
    public List<Financial_Account__c> FinAccountList{get;set;}
    
    
    public void getFinAccountList () {
    FinAccountList = new list<Financial_Account__c>();
    system.debug('>>>>>getrecords'+ con.getRecords());
  FinAccountList  = (List<Financial_Account__c>)con.getRecords();
   // return FinAccountList ;
    
    }
   
    
    
    public Account account {get; set;}
   
    public boolean showpage {get;set;}
   
    public vscOrderEntryFormController() {
    showpage = true;
        oppId = ApexPages.currentPage().getParameters().get('id');
        // Get the Opportunity
        opp= [SELECT ID, NAME,Opportunity_num__c,Account.name,Account.id,Account.Store__c FROM Opportunity where id  ='00628000006IJtQ'];
        System.debug('****opp:'+opp);
        //Get the Opportunity Primary contact role
        try{
        oppRole = [SELECT ID,isPrimary,Contact.Name,Contact.Phone,Contact.Email, Contact.MailingCity,Contact.MailingState,Contact.MailingCountry,Contact.MailingStreet FROM opportunitycontactrole where opportunityid ='00628000006IJtQ'  limit 1];
       } catch(Exception e){
               showpage = false;
               ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Selected Opportunity Does not have any Oppoetunity contact roles'));
                system.debug('The Following exception as occured'+ e.getmessage());}
       // Get the Account
       account =[select id,name from Account where id=:opp.account.id];
       System.debug('account: ' + account);
       //Get the active Financial accounts
       
             
    /*   
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
        */
        
        System.debug('*****finAccountList:'+finAccountList); 
        
    }
    
    public string searchText
{
get
{
if (searchText==null) searchText = '';
return searchText;
}
set;
}

public list<Financial_Account__c> FAlist{set;get;}

public PageReference search() {
    
      if(FAlist == null)
{
FAlist = new List<Financial_Account__c>();
}
else
{
FAlist.Clear();
}
    String qry = 'Select Id,Name,Client_Account_Number__c,Product_Type__c,Owner.Name,Owner.Username,Account_Status__c from Financial_Account__c where Client_Account_Number__c  = '+searchText+' Order By Name';
    FAlist = Database.query(qry);
    system.debug('>>>>>>FAlist'+FAlist);
    return null;
    }
     
}