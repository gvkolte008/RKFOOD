public class FlightController1 {
@AuraEnabled
    public static List<Flight1__c>getFlightList(String Source,String Destination){
    // Date dt = DeparatureDate;
//Date dateStr = DateTime.newInstance(dt.year(),dt.month(),dt.day()).format('yyyy-MM-dd');
        
        
  List<Flight1__c>fltList= new List<Flight1__c>();
      String query='SELECT Id,Name,Source__c,Destination__c,Status__c FROM Flight1__c WHERE Source__c=:Source AND Destination__c=:Destination';
                           
      fltList=Database.query(query); 
        System.debug(fltList);
return(fltList);
        
}
    
    @AuraEnabled
    public static List<LeaadPassenger__c>leadPassenger(String Name,String FlightID){
        List<LeaadPassenger__c>passengerList=new  List<LeaadPassenger__c>();
         LeaadPassenger__c ldp=new LeaadPassenger__c();
        ldp.Flight1__c='FlightID';
        ldp.Name='Name';
        passengerList.add(ldp);
        
        
        if(passengerList!=null){
            insert(passengerList); }
            
     return(passengerList);
       
    
    
  }
    
}