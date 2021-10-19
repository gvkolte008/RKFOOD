trigger TrainTrigger on Train__c (before insert) {
    if(Trigger.isbefore && Trigger.isinsert){
        
        TrainTriggerHandler.statusToNew(Trigger.New);
    }
}