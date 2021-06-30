({
    SearchHelper: function(component, event) {
        console.log('startABS==>>');
        // show spinner message
         component.find("Id_spinner").set("v.class" , 'slds-show');
        var action = component.get("c.fetchAccount");
        action.setParams({
            'searchKeyWord': component.get("v.searchKeyword"),
            'phone': component.get("v.phone"),
            'street': component.get("v.street"),
            'city': component.get("v.city"),
            'state': component.get("v.state"),
            'postal': component.get("v.postal"),
            'country': component.get("v.country")
            
           
        });
        action.setCallback(this, function(response) {
           // hide spinner when response coming from server 
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = response.getState();
            console.log('State==>>',response.getState());
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                 
                // if storeResponse size is 0 ,display no record found message on screen.
                if (storeResponse.length == 0) {
                    component.set("v.Message", true);
                    
                } else {
                    component.set("v.Message", false);
                    component.set("v.isTableOpen", true);
                }
               
                // set numberOfRecord attribute value with length of return value from server
                component.set("v.TotalNumberOfRecord", storeResponse.length);
                
                // set searchResult list with return value from server.
                component.set("v.searchResult", storeResponse); 
               // $A.get('e.force:refreshView').fire();  
            }else if (state === "INCOMPLETE") {
                alert('Response is Incompleted');
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                                    errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    
    handleClick : function(component, event) {
        var saveLeadAction = component.get("c.fetchAccount");
        saveLeadAction.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                $A.get("e.force:closeQuickAction").fire();
                $A.get('e.force:refreshView').fire();

            }
        }); 
        $A.enqueueAction(saveLeadAction);
    }

})