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
		console.log('Clickback');
        component.set("v.showSpinner", false);
         component.set("v.disabled", true);
         component.set("v.disabledMain", false);
         
	},
    
    Cancel : function(component, event, helper) {
       window.location.reload();
    },
    
     handleChange : function(component, event, helper) {   
         var selectValue=component.find("selectItem").get("v.value");
		console.log('selectValue'+selectValue);
        },
    
    onCheck: function(cmp, evt) {
		 var checkCmp = cmp.find("VC").get("v.value");
		console.log('checkCmp'+checkCmp);

	 }
})