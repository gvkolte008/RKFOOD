public class TrainHandler {
@AuraEnabled
public static List<Train__c> searchTrain(String Source,String Destination,Date DepartureDate){  
 String query;
query='SELECT Id,Name,Train_No__c,Start_Station__c,Destination__c,DeparatureDate__c,Scheduled_Departure_Time__c FROM Train__c WHERE Start_Station__c=:Source AND Destination__c=:Destination AND DeparatureDate__c=:DepartureDate';
        List<Train__c>trainList=Database.query(query);
    System.debug(Source);
        return trainList;   
    }
@AuraEnabled    
    public static List<	Yatri__c> createPassenger(String TraId,String pName){
        List<Yatri__c>passList=new  List<Yatri__c>();
        System.debug('TraId');
        try {
            Yatri__c y=new Yatri__c();
        y.Train__c=TraId;
       y.Name=pName;
        passList.add(y);
        insert y;
       }catch (Exception E) {
       System.debug('An exception occurred: ' + e.getMessage());
    }
         return passList;
     }
    
}