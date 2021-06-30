global class EmailServiceToCreateBlastCase implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope){
    Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        String emailsubject = '';
        String subject='',casenumber='';
        Case caseRecord;
        emailsubject = email.subject.toLowerCase();
       // System.debug('emailBody--->'+emailBody);
        System.Debug(emailsubject); 
        casenumber=emailsubject.substring(emailsubject.indexof(':'),emailsubject.indexof(':_')).trim().replaceAll('\\D+',''); //emailsubject.replaceAll('\\D+','');
        System.Debug(emailsubject.indexOf('ref: #'));
        System.Debug(emailsubject.indexOf(': part'));
        System.Debug(casenumber);
              try{
                  if(!string.isempty(casenumber)){
                      caseRecord = [Select Id,Status,RecordTypeId,RecordType.Name from Case where CaseNumber = :casenumber];
                  }   
              } 
              catch(exception e){
              }
              if(caseRecord !=null ){
                 if(caseRecord.RecordType.Name=='GSD BLAST SUPPORT CASE'){
                        if(caseRecord.status=='closed'){
                         Case cocase = new Case();
                        cocase.subject = email.subject;
                        cocase.description = email.plainTextBody;
                        cocase.Status  = 'New';
                        cocase.reason ='other';
                        Insert cocase;
                        return null;
                        }
                        else{
                        caseRecord.status='Escalated to rams';
                        update caseRecord;
                        return null;
                        }
                    }
                    else{
                        Case cocase1 = new Case();
                        cocase1.subject = email.subject;
                        cocase1.description = email.plainTextBody;
                        cocase1.Status  = 'New';
                        Insert cocase1;
                        return null;}
                                       
                }
                else{
                    Case cocase2 = new Case();
                    cocase2.subject = email.subject;
                    cocase2.description = email.plainTextBody;
                    cocase2.Status  = 'New';
                    Insert cocase2;
                    return null;
                
                
                }
                 
            }
    
}