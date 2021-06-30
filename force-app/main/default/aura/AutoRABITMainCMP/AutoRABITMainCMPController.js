({
	handleLoad : function(component, event, helper) {
		console.log('handle handleLoad');
        
	},
    handleSubmit : function(component, event, helper) {
        console.log('handle handleLoad');
         var fields = event.getParam("fields");
        
        component.find('accForm').submit(fields); // Submit form
		console.log('handle handleSubmit');
       
	},
	handleSuccess : function(component, event, helper) {
		console.log('record updated successfully');
        
        
      
	},
})