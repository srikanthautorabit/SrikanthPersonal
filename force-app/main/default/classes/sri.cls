public class sri{
    
    public list<account> psearch(string sstring){
    
	// My deployment
	string soql='select id,name from account';  
    if(sstring != '' && sstring!=null)
        soql=soql+'where name like \'%'+sstring+'%\' and isconverted=false';
   			
        soql=soql;
    system.debug(soql);
    return database.query(soql);
   
}

}