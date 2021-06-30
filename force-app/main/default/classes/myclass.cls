public class myclass {
  
    public PageReference Save() {
    
       IF(PC.CHECK__C == true){
       
           PC.DESCRIPTION__c = PC.COUNTRY__C +' ' + PC.STATES__C + '  ' + PC.COMMENTS__c;
       
       }
       ELSE{
           PC.DESCRIPTION__c = PC.COMMENTS__c;
       
       }
    
    
        UPSERT PC;
       // Pagereference pg = new pagereference('https://c.ap2.visual.force.com/apex/PV1');
        return null;

        
    }

    public PICKLIST__c pc {set; get;}
    public myclass(){
    pc= new PICKLIST__c();
    }
}