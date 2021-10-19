trigger contacttrigger on Contact (before insert,after insert,before update) {
if(Trigger.isBefore && Trigger.isInsert){
 ContTriggerHandler.updateName(Trigger.New);    
 }
if(Trigger.isAfter && Trigger.isInsert){
    ContTriggerHandler.insertAccount(Trigger.New);
 }
    if(Trigger.isbefore && Trigger.isUpdate){ 
    ContTriggerHandler.updateAccount(Trigger.New,Trigger.oldMap);
  }
    if(Trigger.isafter && Trigger.isUpdate){ 
    ContTriggerHandler.changeAccount(Trigger.New,Trigger.oldMap);
  }
  }