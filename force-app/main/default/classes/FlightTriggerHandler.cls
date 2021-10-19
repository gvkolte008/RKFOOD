public class FlightTriggerHandler {
    public static void beforeInsert(List<Flight__c>FlightNewList){
     List<Flight__c>FltList=  new List<Flight__c>();
        for(Flight__c flt :FlightNewList)  {
            
            if(flt.Name !=null){
                flt.Status__c='New';
                
                FltList.add(flt);
                
            }
            
        }
 
        
    }
    
    public static void beforeUpdate(List<Flight__c>FlightNewList, Map<Id,Flight__c> FltOldMap){
       
        
        for(Flight__c flt :FlightNewList)  {
    
            if(flt.Status__c!='Pending for Approval' && FltOldMap.get(flt.Id).Status__c =='New'){
     
                flt.addError('Error');
            }
                
                
                
                
                
                
            }
        
    
    
        }
    }