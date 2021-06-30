@istest
public class TestRestrictContactByName {
    static testmethod void method2(){
       list<contact> cons= new list<contact>();
        contact c1= new contact(firstname='thomas',lastname='green',email='thomas@gg.com');
        contact c2= new contact(firstname='myral',lastname='INVALIDNAME',email='myral@gg.com');
        cons.add(c1);
        cons.add(c2);
        test.startTest();
        try{
            insert cons;
        }
        catch(exception e){
            
        }
        test.stopTest();
           
    }
    
}