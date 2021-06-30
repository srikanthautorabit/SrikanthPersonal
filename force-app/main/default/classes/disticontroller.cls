public class disticontroller {

    public String email { get; set; }

    public String Rate { get; set; }

    public String Impression { get; set; }

    public String Quantity { get; set; }

    public String Address { get; set; }

    public disticontroller (){
    
   
    
    }
        public pagereference Submit(){
        
    
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info, 'Mail Sent');
        ApexPages.addMessage(myMsg); 
        
        
        // Reference the attachment page and pass in the  ID
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
        
        mail.plainTextBody = 'Your Form as been Submited';
        
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
        yes2.add(new selectoption('prefo','prefo'));
        
        return yes2;
    }


    public String Yes2 { get; set; }

    public String Addonfield2 { get; set; }

    public list<selectoption> getYes1values() {
        list<selectoption> yes1=new list<selectoption>();
        yes1.add(new selectoption('None','None'));
        yes1.add(new selectoption('Scartch','Scartch'));
        
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
         Format.add(new selectoption('Big 4','Big 4'));
          Format.add(new selectoption('Basic','Basic'));
           Format.add(new selectoption('Image','Image'));
         
       
        return Format;
        
    } 
    
  
}