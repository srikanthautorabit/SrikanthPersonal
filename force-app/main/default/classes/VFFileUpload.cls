public class VFFileUpload
{
    public Id recId
    {    get;set;    }
    
    public Financial_Account__c fa { set; get; }
    
    public VFFileUpload(ApexPages.StandardController ctlr)
    { fa = new Financial_Account__c();
       recId = System.currentPageReference().getParameters().get('id');     
    }
    
    public string fileName 
    {    get;set;    }
    
    public Blob fileBody 
    {    get;set;    }
  
    public PageReference UploadFile()
    {
        
        insert fa;
        PageReference pr;
        if(fileBody != null && fileName != null)
        {
          Attachment myAttachment  = new Attachment();
          myAttachment.Body = fileBody;
          myAttachment.Name = fileName;
          myAttachment.ParentId = fa.id;
          insert myAttachment;
           pr = new PageReference('/' + myAttachment.Id);
           pr.setRedirect(true);
           return pr;
        }
        return null;
    }    
}