trigger FlightTrigger on Flight__c (After update,After delete) {

    if(Trigger.isAfter && Trigger.isupdate){
        
        FlightTriggerHand.afterupdate(Trigger.new,Trigger.newMap);
        
    }
    
}