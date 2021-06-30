public class LastSeenTime {

    public PageReference lastseen() {
        System.debug('Current Year is ' + Date.Today().Year());   
        System.debug('Current Month is ' + Date.Today().Month());
        System.debug('Current Day is ' + Date.Today().Day());
        System.debug('Yesterday Date is ' + Date.Today().addDays(-1));        
        System.debug('Tomorrow Date is ' + Date.Today().addDays(1)); 
        System.debug('Today Date and time is ' + DateTime.Now());
        return null;
    }

	
    
    public LastSeenTime(){
   
        System.debug('Current Year is ' + Date.Today().Year());   
        System.debug('Current Month is ' + Date.Today().Month());
        System.debug('Current Day is ' + Date.Today().Day());
        System.debug('Yesterday Date is ' + Date.Today().addDays(-1));        
        System.debug('Tomorrow Date is ' + Date.Today().addDays(1)); 
        System.debug('Today Date and time is ' + DateTime.Now());
        
    }
    
}