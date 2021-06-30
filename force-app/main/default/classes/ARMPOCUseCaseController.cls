public class ARMPOCUseCaseController {

    
 
    @AuraEnabled
    public static List <POC_Use_Cases__mdt> fetchUsecase() {
        return [ SELECT Problem_Statement__c, Use_Cases_in_AutoRABIT__c FROM POC_Use_Cases__mdt ];
    }

}