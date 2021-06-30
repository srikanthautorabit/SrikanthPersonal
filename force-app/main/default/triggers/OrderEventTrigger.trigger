trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> Ts1=new List<task>();

        User myUser = [SELECT Id FROM User WHERE name='srikanth ganji' LIMIT 1];

        for(Order_Event__e event : trigger.new){

        if (event.Has_Shipped__c == true){

            Task ts=new task();

             ts.Priority='Medium';

                                    ts.Subject='Follow up on shipped order ' + event.Order_Number__c;

                                    ts.OwnerId=myUser.Id;

            ts1.add(ts);

          }

    }

    Insert ts1;

}