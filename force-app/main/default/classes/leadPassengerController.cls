public class leadPassengerController {
@AuraEnabled
    public static List<Flight__c>getFlightList(){
        List<Flight__c>fltList=new List<Flight__c>();
        String query='Select Id, Name, Status__c from Flight__c';
           
            fltList=Database.query(query);
        
        return(fltList);
    }
}