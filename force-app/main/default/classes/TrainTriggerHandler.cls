public class TrainTriggerHandler {
    public static void statusToNew(List<Train__c>newList){
        for(Train__c trains :newList){
            trains.Status__c='New';
        }
        
    }
}