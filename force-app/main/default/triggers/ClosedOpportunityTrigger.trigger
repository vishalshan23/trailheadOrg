trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> newTaskList = new list<Task>();
    
    //iterate over the new opportunities with stage is closed Won
    for(Opportunity opp : [SELECT id FROM Opportunity WHERE id IN :Trigger.new AND 
                                                            Stagename = 'Closed Won'] ){
        Task tk = new Task(Whatid = opp.id,
                           Subject='Follow Up Test Task');
        newTaskList.add(tk);

    }

    if(!newTaskList.isEmpty())
        insert newTaskList;
}