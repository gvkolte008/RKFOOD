public class MyBatchClass implements Database.Batchable<sObject> {
    
    public string query;
    public MyBatchClass(){
        
        query ='SELECT Id,Paitent_Name__c,Status__c FROM Paitent__c ';
        
    }
    public database.QueryLocator start(database.BatchableContext BC){
       return Database.getQueryLocator(query) ;
        
    }
    public void execute(Database.BatchableContext BC , List<Paitent__c> paitentList){
        
        for(Paitent__c pat :paitentList){
            if(String.isBlank(pat.Status__c)==True){
                
               pat.Status__c='Active';
            }
        }
        update paitentList;
    }
    
    public void finish(Database.BatchableContext BC){
        
        
    }
    
}