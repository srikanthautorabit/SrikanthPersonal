({
    packItem: function(component, event, helper) {
        var a = component.get("v.Item");
        a.Packed__c = true;
        component.set("v.Item",a);
        var btnClicked = event.getSource();
        btnClicked.set("v.disabled",true);
    }
})