global class FlightApexBatch implements Database.Batchable<sObject>, Schedulable {
    String query='';
    
    global FlightApexBatch(){
        query='SELECT Id,Name,Source__c,Destination__c,Status__C FROM Flight__c';
        
    }
  global  Database.QueryLocator start(Database.BatchableContext BC){
        
        return(Database.getQueryLocator(query));  
    }
    global void execute(Database.BatchableContext BC, List<Flight__c>Fltlist){
       
        List<Flight__c>Flist=new List<Flight__c>();
        
        for(Flight__c fl:Fltlist){
            Flight__c flt=new Flight__c();
            if(fl.FlightActive__c==True){
                flt.Id=fl.Id;
                flt.Name='Updated by ApexBatch';
                Flist.add(flt);
            }
            
        }
        if(Flist.Size()!=Null){
            update Flist;
        }
        
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
    global void execute(SchedulableContext sc){

      FlightApexBatch b=new FlightApexBatch();

       database.executeBatch(b);

     }
    }