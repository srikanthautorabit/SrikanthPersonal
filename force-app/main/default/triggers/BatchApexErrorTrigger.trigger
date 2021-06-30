trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    list<BatchLeadConvertErrors__c> newlist = new list<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent be:trigger.new){
        BatchLeadConvertErrors__c blc= new BatchLeadConvertErrors__c ();
        blc.AsyncApexJobId__c=be.AsyncApexJobId;
        blc.Records__c = be.JobScope;
        blc.StackTrace__c = be.StackTrace;
        newlist.add(blc);
        
    }
    insert newlist;

}