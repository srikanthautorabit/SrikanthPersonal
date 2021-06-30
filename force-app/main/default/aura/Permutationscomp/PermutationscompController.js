({
	getCombinations : function(component, event, helper) {
        console.log('testing',component.find("Name").get("v.value"));
        
        var arr=component.find("Name").get("v.value").split(',');
        console.log('testing',arr);
        component.set("v.allCombinations",arr);
       // var num = component.find("num").get("v.value");
		//for(var i=1;i<=num;i++)
          //  arr.push(i);
        var r = 4; 
        var n = arr.length;
        //if(! $A.util.isUndefinedOrNull(num) && ! $A.util.isEmpty(num))
        helper.printCombination(component,arr, n, r,helper); 
	}
})