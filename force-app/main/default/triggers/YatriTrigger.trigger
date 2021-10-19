trigger YatriTrigger on Yatri__c (before insert,after insert) {
    if(trigger.isinsert){
        if(trigger.isbefore){
          YatriTriggerHandler.createSahyatri(Trigger.New);                     
        }else{          
            YatriTriggerHandler.createSahyatrii(Trigger.New);  
        }   
    }
}