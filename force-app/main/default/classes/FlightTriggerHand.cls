public class FlightTriggerHand {
    public static void afterupdate(List<Flight__c>Fltnew , Map<Id,Flight__c>fltMapNew){
        List<LeadPassenger__c>ldplist= new List<LeadPassenger__c>();
        Map<Id,Flight__c>fltMapOfCancelled= new Map<Id,Flight__c>();
        
        for(Flight__c flt : Fltnew){
            
            if(flt.Status__c =='Cancelled'){
                
                fltMapOfCancelled.put(flt.id,flt);         
            System.debug('Condition is checked');   
        }
       }
        for(LeadPassenger__c ldpas :[SELECT Id,Name,FlightStatus__c FROM LeadPassenger__c WHERE Id IN :fltMapOfCancelled.KeySet()]){
            LeadPassenger__c ldp=new LeadPassenger__c(); 
            if(fltMapOfCancelled.containsKey(ldpas.Flight__c)){
               
                ldp.Id=ldpas.Id;
                ldp.FlightStatus__c='Cancelled';
                
                ldplist.add(ldp);
                System.debug('Condition is checked for id'); 
            }
           }
        if(!ldplist.isEmpty()){
            
            update ldplist;
        }
        
}
}