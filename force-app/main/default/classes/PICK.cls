public class PICK
{
    public Boolean CHECK{set;get;}
    
    public String Country {get;set;}
    public String State {get;set;}
    public String Comments {get;set;}
    public String DESCRIPTION {get;set;}

    public List<SelectOption> getCountries()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));       
        options.add(new SelectOption('IN','INDIA'));
        options.add(new SelectOption('USA','USA'));
        options.add(new SelectOption('NZ','NEWZEALAND'));
        options.add(new SelectOption('AU','AUSTRALIA'));
       
        return options;
    }
   
    public List<SelectOption> getstates()
    {
        List<SelectOption> options = new List<SelectOption>();
        if(Country == 'IN')
        {      
            options.add(new SelectOption('AP','ANDHRA PRADESH'));
            options.add(new SelectOption('TS','TELANGANA'));
            options.add(new SelectOption('KA','KARNATAKA'));
        }
        else if(Country == 'USA')
        {      
            options.add(new SelectOption('TX','TEXAS'));
            options.add(new SelectOption('CA','CALIFORNIA'));
            options.add(new SelectOption('NY','NEW YORK'));
        }
        else if(Country == 'NZ')
        {      
            options.add(new SelectOption('AK','AUCKLAND'));
            options.add(new SelectOption('WE','WELLINGTON'));
            
        }
        else if(Country == 'AU')
        {      
            options.add(new SelectOption('SY','SYDNEY'));
            options.add(new SelectOption('PE','PERTH'));
            options.add(new SelectOption('BE','BREISBANE'));
        }
        else
        {
            options.add(new SelectOption('None','--- None ---'));
        }     
        return options;
    }      
     public PageReference save() {
  
     getshowSAstring();
        
        return null;
       
        
    }
    
    public String getshowSAstring() { 
    
    if(CHECK== true){
    
    DESCRIPTION=  DESCRIPTION +' ' +COUNTRY +' ' + state + ' ' +comments ;
    return DESCRIPTION;
    }
    else{DESCRIPTION= DESCRIPTION +' ' + COUNTRY +' ' + state  ;
    return DESCRIPTION;}
    
}
}