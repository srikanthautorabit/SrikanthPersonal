trigger orderemail on VSC_Order__c (After insert) {
 

for(VSC_Order__c SHA : trigger.new){
    if (SHA.Format__c!= null) {
       //Retrieve Email template
 EmailTemplate et=[Select id from EmailTemplate where name=:'VSC ORDER'];


//Create email list
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

   //Create attachment list
   List<Messaging.EmailFileAttachment> attachmentList = new List<Messaging.EmailFileAttachment>();

   //Create message

   Messaging.SingleEmailMessage singlemail = new Messaging.SingleEmailMessage();
    //add template
   singleMail.setTemplateId(et.Id);              
    //set target object for merge fields
    singleMail.setTargetObjectId(SHA.OwnerId);

    
    //add address's that you are sending the email to
    String []ToAddress= new string[] {'srikanthgs.249@gmail.com'}; 

    //set addresses
    singlemail.setToAddresses(toAddress);
        //add mail
            emails.add(singleMail);

    {



        // fetch attachments for Object
 Attachment att = [SELECT id, Name, body, ContentType FROM Attachment WHERE ParentId = : SHA.id];
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
} }