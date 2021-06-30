({
    handlePOC : function(component, event, helper) {
        component.find("pocForm").submit();
        

    },
    
    handleLoad : function(component, event, helper) {
		console.log('handle handleLoad');
        component.set("v.showSpinner", false);
         component.set("v.disabled", false);
         component.set("v.disabledMain", true);
         
	},
    
     
	handleSuccess : function(component, event, helper) {
		console.log('record updated successfully');
        component.set("v.saved", true);
        component.set("v.showSpinner", false);
        component.set("v.enableSuccess", true);
	},
    
     ClickNext : function(component, event, helper) {
		console.log('ClickNext');
        component.set("v.showSpinner", true);
         component.set("v.disabled", false);
         component.set("v.disabledMain", true);
         
	},
    Clear : function(component, event, helper) {
		console.log('ClickNext');
        component.set("v.showSpinner", false);
         component.set("v.disabled", true);
         component.set("v.disabledMain", false);
         
	},
    
      Cancel : function(component, event, helper) {
        window.location.reload();
    },
    
     handleChange : function(component, event, helper) {  
         component.set("v.firstQuestion1", false);
         component.set("v.firstQuestion2", false);
         component.set("v.firstQuestion3", false);
         component.set("v.firstQuestion4", false);
           component.set("v.secondQuestion1", false);
         component.set("v.secondQuestion2", false);
         component.set("v.secondQuestion3", false);
         component.set("v.secondQuestion4", false);
         component.set("v.ThirdQuestion1", false);
         component.set("v.ThirdQuestion2", false);
         component.set("v.ThirdQuestion3", false);
         component.set("v.ThirdQuestion4", false);
         var selectValue=component.find("selectItem1").get("v.value");
         var selectValue2=component.find("selectItem2").get("v.value");
         var selectValue3=component.find("selectItem3").get("v.value");
		console.log('selectValue'+selectValue);
         if(selectValue == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.firstQuestion1", true);
         }
         if(selectValue == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.firstQuestion2", true);
         }
         if(selectValue == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.firstQuestion3", true);
         }
         if(selectValue == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.firstQuestion4", true);
         }
          if(selectValue2 == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.secondQuestion1", true);
         }
         if(selectValue2 == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.secondQuestion2", true);
         }
         if(selectValue2 == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.secondQuestion3", true);
         }
         if(selectValue2 == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.secondQuestion4", true);
         }
         
         if(selectValue3 == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.ThirdQuestion1", true);
         }
         if(selectValue3 == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.ThirdQuestion2", true);
         }
         if(selectValue3 == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.ThirdQuestion3", true);
         }
         if(selectValue3 == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.ThirdQuestion4", true);
         }
        },
})