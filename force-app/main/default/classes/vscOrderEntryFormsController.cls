public class vscOrderEntryFormsController {

    public PageReference rendertest() {
        testyes =true;
        return null;
    }


    public Boolean testyes { get; set; }
    public string finaccount;
    
    public PageReference resubmit() {
       // vsorder.Fin_Account__c=vsorder.Fin_Account__c;
        update vsorder;
        PageReference pr;
         if(fileBody != null && fileName != null){
    Attachment myAttachment = new Attachment();
    myAttachment.Body = fileBody;
    myAttachment.Name = fileName;
    myAttachment.ParentId = vsorder.id;
    insert myAttachment;
   
}
        VSC_Order__c vs = [select id,ownerid,MDT_Resource__r.email,Opportunity__r.owner.email from VSC_Order__c where id=:vsorder.id]; 
       system.debug('>>>vsc'+vs);
        
        if (vs.id != null) {
       //Retrieve Email template
 EmailTemplate et=[Select id from EmailTemplate where name=:'VSC ORDER'];


//Create email list
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

   //Create attachment list
   List<Messaging.EmailFileAttachment> attachmentList = new List<Messaging.EmailFileAttachment>();

   //Create message

   Messaging.SingleEmailMessage singlemail = new Messaging.SingleEmailMessage();
    //add template
     singlemail.setWhatId(vs.id);
   singleMail.setTemplateId(et.Id);              
    //set target object for merge fields
    singleMail.setTargetObjectId(vs.ownerid);

    
    //add address's that you are sending the email to
    String []ToAddress= new string[] {vs.MDT_Resource__r.email}; 
    String []ccAddress= new string[] {vs.Opportunity__r.owner.email}; 
   // string[]ccAddress= new string[] {'s_ganji@dell.com','srikanthgs.249@gmail.com'};

    //set addresses
    singlemail.setToAddresses(toAddress);
    singlemail.setCcAddresses(ccAddress);
        //add mail
        singlemail.setSaveAsActivity(false);
            emails.add(singleMail);

    {



        // fetch attachments for Object
list<Attachment> att = [SELECT id, Name, body, ContentType FROM Attachment WHERE ParentId = : vsorder.id];
 
 for(Attachment  at: att){
 
 {
Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
 // Create the email attachment
 efa.setFileName(at.Name);
 efa.setBody(at.body);
 efa.setContentType(at.ContentType);
 efa.setInline(false);

    attachmentList.add(efa);
}
}


// Attach files to email instance
singlemail.setFileAttachments(attachmentList); 
//send the message
 Messaging.sendEmail(emails);
      }
}
       pr = new PageReference('/' + vsorder.Id);
        pr.setRedirect(true);
        return Pr;
    }
    
   

    public PageReference SaveData1() {
        saveselected1();
         vsorder.Fin_Account__c=finaccount+','+allstrings;
       update vsorder;
       if(fileBody != null && fileName != null){
    Attachment myAttachment = new Attachment();
    myAttachment.Body = fileBody;
    myAttachment.Name = fileName;
    myAttachment.ParentId = vsorder.id;
    insert myAttachment;
   
}
        PageReference pr;
        pr = new PageReference('/' + vsorder.Id);
        pr.setRedirect(true);

        return pr;
    }


    public PageReference Back() {
        PageReference pr;
        pr = new PageReference('/' + oppId);
        return pr;
    }

    private Boolean hasErrors = false;
     public Boolean getHasErrors() {
        return hasErrors;

    }
    
    
    public PageReference cancel() {
        return null;
    }
    
   Public list<Attachment> Att1{get;set;}
    
    
 public void getFinAccountList () {
 // string sr =  FinAccountList.id;
   FinAccountList = new list<Financial_Account__c>();
   

   // system.debug('>>>>>getrecords'+ con.getRecords());

  FinAccountList  = (List<Financial_Account__c>)con.getRecords(); 
  
  
        
        
        totalRecords = FinAccountList.size();
        system.debug('>>>>>>>>>>>>FinAccountList'+FinAccountList.size());
        system.debug('>>>>>>>>>>>>pagesize'+pageSize);
        if(totalRecords > pageSize)
            //system.debug('>>>>>>>>>>>> phphh');
            {showNext = true;
            system.debug('>>>>>>>>>>>> shownext'+showNext);
            }
        else
            showNext = false;
            system.debug('>>>>>>>>>>>> shownext'+showNext);
        currentPageInfo = 'Showing Page ' + pageNumber +   ' of ' + (Math.mod(totalRecords, pageSize) == 0 ? totalRecords/pageSize : (totalRecords/pageSize) + 1); 
       /*
  
  List<Financial_Account__c> FinAccountList  = [Select Id, Name,
                Client_Account_Number__c,
                Product_Type__c,
                Owner.Name,
                Owner.Username,
                Account_Status__c,checkId__c
        from Financial_Account__c ];

   // return FinAccountList ; */

 }
 
 public string allstrings;
 
    public pagereference saveselected(){
        system.debug('>>>>>> FinAccountList '+FinAccountList.size());
        List<String> strList = new List<String>();
for(Financial_Account__c fin:FinAccountList ){
system.debug('fin>>>>>> '+fin);

  if(fin.checkId__c== true && fin.id != null){
          
  
  strList.add(String.valueOf(fin.id));
   system.debug('strlist'+strList);
 
  //strList.remove(null);
   
  //String StrID = strList;
  system.debug('str'+allstrings);
  system.debug('test'+fin.checkId__c);
  }
  }
  allstrings = string.join(strList,',');
  return null;
    }
    
    public pagereference saveselected1(){
        system.debug('>>>>>> FinAccountList '+FinAccountList.size());
        List<String> strList = new List<String>();
for(Financial_Account__c fin:FinAccountList ){
system.debug('fin>>>>>> '+fin);

  if(fin.checkId__c== true && fin.id != null){
          
  
  strList.add(String.valueOf(fin.id));
   system.debug('strlist'+strList);
 
  //strList.remove(null);
   
  //String StrID = strList;
  system.debug('str'+allstrings);
  system.debug('test'+fin.checkId__c);
  }
  }
  allstrings = string.join(strList,',');
  return null;
    }

public PageReference SaveData() {
    saveselected();

    vscorder.Fin_Account__c=allstrings;
    vscorder.Opportunity__c=oppid;
    vscorder.Primary_Contact_Name__c=oppRole.contact.name;
    vscorder.Primary_Contact_Location__c=oppRole.contact.MailingCity;
    vscorder.Email__c=oppRole.Contact.Email;
    vscorder.Opportunity_c__c=opp.Opportunity_num__c;
    vscorder.Phone_No__c=oppRole.Contact.Phone;
    vscorder.Opportunity_c__c=opp.Opportunity_num__c;
   // vscorder.Status__c='Not Submitted';
    vscorder.Account__c=account.id ;
    insert vscorder;
    
    PageReference pr;
    if(fileBody != null && fileName != null){
    Attachment myAttachment = new Attachment();
    myAttachment.Body = fileBody;
    myAttachment.Name = fileName;
    myAttachment.ParentId = vscorder.id;
    insert myAttachment;
    pr = new PageReference('/' + vscorder.Id);
    pr.setRedirect(true);
}

       return pr;
    }
    
     public PageReference save() {
    /* vscorder.Opportunity__c=oppid;
     vscorder.Primary_Contact_Name__c=oppRole.contact.name;
     vscorder.Primary_Contact_Location__c=oppRole.contact.MailingCity;
     vscorder.Email__c=oppRole.Contact.Email;
     vscorder.Opportunity_c__c=opp.Opportunity_num__c;
     vscorder.Phone_No__c=oppRole.Contact.Phone;


     vscorder.Opportunity_c__c=opp.Opportunity_num__c;
     vscorder.Account__c=account.id ;
        insert vscorder;
        
        PageReference pr;
        
        
      
        if(fileBody != null && fileName != null)
        {
          Attachment myAttachment  = new Attachment();
          myAttachment.Body = fileBody;
          myAttachment.Name = fileName;
          myAttachment.ParentId = vscorder.id;
          insert myAttachment;
           pr = new PageReference('/' + vscorder.Id);
           pr.setRedirect(true);
           
        
        }*/
        savedata();
        PageReference pr;
        pr = new PageReference('/' + vscorder.Id);
    pr.setRedirect(true);
        system.debug('>>>owner1'+vscorder.id);
         
         system.debug('>>>owner3'+vscorder.ownerid);
       
       VSC_Order__c vs = [select id,ownerid,MDT_Resource__r.email,Opportunity__r.owner.email from VSC_Order__c where id=:vscorder.id]; 
       system.debug('>>>vsc'+vs);
        
        if (vs.id != null) {
       //Retrieve Email template
 EmailTemplate et=[Select id from EmailTemplate where name=:'VSC ORDER'];


//Create email list
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

   //Create attachment list
   List<Messaging.EmailFileAttachment> attachmentList = new List<Messaging.EmailFileAttachment>();

   //Create message

   Messaging.SingleEmailMessage singlemail = new Messaging.SingleEmailMessage();
    //add template
     singlemail.setWhatId(vs.id);
   singleMail.setTemplateId(et.Id);              
    //set target object for merge fields
    singleMail.setTargetObjectId(vs.ownerid);

    
    //add address's that you are sending the email to
    String []ToAddress= new string[] {vs.MDT_Resource__r.email}; 
    String []ccAddress= new string[] {vs.Opportunity__r.owner.email}; 
   // string[]ccAddress= new string[] {'s_ganji@dell.com','srikanthgs.249@gmail.com'};

    //set addresses
    singlemail.setToAddresses(toAddress);
    singlemail.setCcAddresses(ccAddress);
        //add mail
        singlemail.setSaveAsActivity(false);
            emails.add(singleMail);

    {



        // fetch attachments for Object
 Attachment att = [SELECT id, Name, body, ContentType FROM Attachment WHERE ParentId = : vscorder.id];
 
 
 Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
 {

 // Create the email attachment
 efa.setFileName(att.Name);
 efa.setBody(att.body);
 efa.setContentType(att.ContentType);
 efa.setInline(false);

    attachmentList.add(efa);
}


// Attach files to email instance
singlemail.setFileAttachments(attachmentList); 
//send the message
 Messaging.sendEmail(emails);
      }
}
       
        return Pr;
    }
    

public VSC_Order__c vscorder{set;get;}
public string fileName{get;set;}
public blob fileBody{get;set;}
public OpportunityContactRole getOppRole() {
        return oppRole ;  
}

    public opportunity getOpp() {
        return opp;
    }
    
    public VSC_Order__c getVsorder() {
        return Vsorder ;  
}

    Id oppId;
    Id orderid;
    opportunity opp {get;set;}
    opportunitycontactrole oppRole {get;set;}
    public List<Financial_Account__c> finAccountList {set;get;}
    
    
    public Account account {get; set;}
     public VSC_Order__c Vsorder {get;set;}

   
    public vscOrderEntryFormsController() {
    testyes = false;
   
    Id myId = ApexPages.currentPage().getParameters().get('recordId');
       showpage=true;
       showBack = false;
       showtable = true;
       showtable1 = false;
      
        vscorder=new VSC_Order__c();
        oppId = ApexPages.currentPage().getParameters().get('id');
        orderid=ApexPages.currentPage().getParameters().get('OppName');
        // Get the Opportunity
        opp= [SELECT ID, NAME,Opportunity_num__c,Account.name,Account.id,Account.Store__c,owner.email FROM Opportunity where id  =:oppId];
        System.debug('****opp:'+opp);
        try{
           oppRole = [SELECT ID,isPrimary,Contact.Name,Contact.Phone,Contact.Email, Contact.MailingCity,Contact.MailingState,Contact.MailingCountry,Contact.MailingStreet FROM opportunitycontactrole where opportunityid =:oppId limit 1];
           } catch(Exception e){
             showpage = false;
             showBack = true;
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Opportunity does not have any contact roles.'));
             system.debug('The Following exception as occured'+ e.getmessage());}
        //Get the Opportunity Primary contact role
        //oppRole = [SELECT ID,isPrimary,Contact.Name,Contact.Phone,Contact.Email, Contact.MailingCity,Contact.MailingState,Contact.MailingCountry,Contact.MailingStreet FROM opportunitycontactrole where opportunityid =:oppId and isPrimary=True];
       if(orderid != null){
       Vsorder = [select ID,Rate__c ,MDT_Resource__c,Quantity__c ,Address__c,Impression__c,Addon_2__c,DSG_Services_Required__c,Email__c,Is_RPDM_included_in_this_Order__c,Is_storecopy_included_in_this_Order__c,Opportunity_c__c,Name,Format__c,Phone__c,Primary_Contact_Location__c,Distribution_Method__c,primary_Contact_Name__c,Account__c,Addon_1_yes__c,Addon_1__c,Fin_Account__c,(select id,name from attachments) from VSC_Order__c where id =: orderid];}
       // Get the Account
       account =[select id,name,Store__c from Account where id=:opp.account.id];
     att1 = [SELECT id, Name, body, ContentType FROM Attachment WHERE Parentid=:orderid];
       System.debug('account: ' + account);
       if(Vsorder != null){
       finaccount = vsorder.Fin_Account__c;}
       
     
       
       
       
}

  
 public boolean showpage {get;set;}
  public boolean showBack {get;set;}
  public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,
                Client_Account_Number__c,
                Product_Type__c,
                Owner.Name,
                Owner.Username,
                Account_Status__c,checkId__c
        from Financial_Account__c 
        
        ]));
        
        currentPage = 0;
        pageSize = 5;
        pageNumber = 0;
                // sets the number of records in each page set
      /*    totalRecords=con.setPageSize(5);
                currentPage = 0;
        pageSize = 5;
        pageNumber = 0;
        
       // totalRecords = enquiry.size();
        if(totalRecords > pageSize)
            {showNext = true;
            }
        else
            showNext = false;
        currentPageInfo = 'Showing Page ' + pageNumber +   ' of ' + (Math.mod(totalRecords, pageSize) == 0 ? totalRecords/pageSize : (totalRecords/pageSize) + 1); 
                System.debug('****con:'+con); */

            }
            return con;
        }
        set;
        
        
        
        
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
    if(searchText != null &&searchText !=''  ){
    String qry = 'Select Id,Name,Client_Account_Number__c,Product_Type__c,Owner.Name,Owner.Username,Account_Status__c,checkId__c  from Financial_Account__c where Account_Status__c like \'%'+searchText+'%\' Order By Name';
    showtable = false;
    showtable1 = true;
    FAlist = Database.query(qry);
    
    } else{
    showtable = true;
    }
    
    return null;
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
 /*   public Integer pageNumber {
        get {
            return con.getPageNumber();
        }
        set;
    }*/

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

public boolean showtable {set;get;}
public boolean showtable1 {set;get;}
// for pagination
    public Integer pageSize {get;set;}
    public Integer currentPage  {get;set;}
    public String currentPageInfo   {get;set;}
    
    // for disabling pagination links
    public Boolean showPrevious {get;set;}
    public Boolean showNext {get;set;}
    
    private Integer totalRecords;
    private Integer pageNumber;
    
    public void showPrevious()
    {
       
      currentpage=currentpage-pagesize;
      pagenumber--;
        enableDisablePaginationLinks();     
    }
    
    public void showNext()
    {
        currentPage = currentPage + pageSize;
        pageNumber++;
        enableDisablePaginationLinks();
    }
    
    public void showFirst()
    {
        currentPage = 0;
        pageNumber = 1;
        enableDisablePaginationLinks();
    }
    
    public void showLast()
    {
        currentPage = (Math.mod(totalRecords, pageSize) == 0) ? totalRecords - pageSize : (totalRecords / pageSize) * pageSize;
        pageNumber = (Math.mod(totalRecords, pageSize) == 0 ? totalRecords/pageSize : (totalRecords/pageSize) + 1);
        enableDisablePaginationLinks();
    }
    
    private void enableDisablePaginationLinks()
    {
        if(currentPage == 0)
            showPrevious = false;
        else
            showPrevious = true;
        
        if((totalRecords - pageSize) <= currentPage)
            showNext = false;
        else
            showNext = true;
        
        currentPageInfo = 'Showing Page ' + pageNumber +   ' of ' + (Math.mod(totalRecords, pageSize) == 0 ? totalRecords/pageSize : (totalRecords/pageSize) + 1);
    }


}