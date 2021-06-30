trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
   /* list<task> tasks1= new list<task>();
    if(trigger.isafter && trigger.isinsert){
        list<opportunity> opts1 = trigger.new;
        
        for(opportunity op: opts1){
            
            if(op.StageName == 'closedwon'){
                task t1 = new task();
                t1.subject= 'FollowUpTestTask';
                t1.WhatId = op.Id;
                tasks1.add(t1);
            }  
        }
        }
    if(trigger.isafter && trigger.isupdate){
        list<opportunity> opts2 = trigger.new;
        
        for(opportunity op: opts2){
            
            if(op.StageName == 'closedwon'){
                task t1 = new task();
                t1.subject= 'FollowUpTestTask';
                t1.WhatId = op.Id;
                tasks1.add(t1);
            }  
        }
        
        }
    if(tasks1.size()<200 && tasks1.size()>0)
        insert tasks1;*/
        
        List<Task> taskListToInsert = new List<Task>();
     for(opportunity opp : Trigger.New)
{
    if(opp.StageName == 'Closed Won' )
     {
            Task newtask = new Task();
            newtask.subject = 'Follow Up Test Task';
            newtask.Whatid = opp.Id;
            taskListToInsert.add(newtask);
      }
    }
    if(taskListToInsert.size()>0){
        insert taskListToInsert;
    }

}