trigger LeadPassengerTrigger on LeadPassenger__c (before insert,before update,after insert,after update) {

    
    if(trigger.isbefore && trigger.isinsert) {
        
        LeadPassengerTriggerHandler.isbeforeinsert(Trigger.New);
        
    } 
    if(trigger.isbefore && trigger.isupdate){
        LeadPassengerTriggerHandler.isbeforeUpdate(Trigger.new , trigger.oldMap, Trigger.Old);
    }
    
}