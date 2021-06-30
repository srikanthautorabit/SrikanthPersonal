({
    printCombination : function(cmp,arr,n,r,helper) {
        var data=[];
       // var data=["Saab", "Volvo", "BMW"];
        helper.combinationUtil(cmp,arr,data, 0, n-1, 0, r,helper); 
    },
    combinationUtil : function(cmp,arr,data,start,end,index,r,helper) {
     
        if (index == r) 
        { 
            var sd = cmp.get("v.allCombinations");
            console.log('sd'+sd);
          sd.push(JSON.parse( JSON.stringify( data ) ));
            console.log('sd1'+sd);
            cmp.set("v.allCombinations",sd);
            
            return; 
        } 
        for (var i=start; i<=end && end-i+1 >= r-index; i++) 
        { 
            data[index] = arr[i]; 
            console.log('sd3'+data[index]+arr[i]);
            var rtc = helper.combinationUtil(cmp,arr, data, i+1, end, index+1, r,helper); 
        } 
    }
})