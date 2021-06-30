({
    Search: function(component, event, helper) {
        
        var searchField = component.find('searchField');
        var phone = component.find('phone');
        var street = component.find('street');
        var city = component.find('city');
        var isValueMissing = searchField.get('v.validity').valueMissing;
        // if value is missing show error message and focus on field
        if(isValueMissing) {
            searchField.showHelpMessageIfInvalid();
            searchField.focus();
        }else{
          // else call helper function 
            helper.SearchHelper(component, event);
        }
        // $A.get('e.force:refreshView').fire();
    },
     closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
    // component.set("v.isOpen", false);
          var closebox = component.set("v.isOpen", false);
        	//helper.handleClick(component, event);
        // document.location.reload(true);
        var url = window.location.href; 
            var value = url.substr(0,url.lastIndexOf('/') + 1);
            window.history.back();
            return false;
   },
    
    Newaccount: function(component, event, helper) {
        
        var closebox = component.set("v.isOpen", false);
         var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({ 
            "entityApiName": "Account",
             'defaultFieldValues': {
                    'Name' : component.get('v.searchKeyword'),
                 'Phone' : component.get('v.phone'),
                 'BillingStreet' : component.get('v.street'),
                 'BillingCity' : component.get('v.City'),
                 'BillingState' : component.get('v.State'),
                 'BillingPostalCode' : component.get('v.Postalcode'),
                 'BillingCountry' : component.get('v.Country')
                 
                }
        });
        
       
             var url = window.location.href; 
            var value = url.substr(0,url.lastIndexOf('/') + 1);
            window.history.back();
        createRecordEvent.fire();
    }
      
          
        
})