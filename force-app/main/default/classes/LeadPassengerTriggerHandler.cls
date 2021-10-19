public class LeadPassengerTriggerHandler {

    public static void isbeforeinsert(List<LeadPassenger__c>leadPassNewList){
        
        for(LeadPassenger__c ldpas :leadPassNewList)   {      
            if(ldpas.Name !='Null'){
            ldpas.LeadPassengerStatus__c='Active';
             }
            if(ldpas.Want_to_add_Guest__c == true  && ldpas.GuestPassgenerCount__c == Null ) {
             ldpas.GuestPassgenerCount__c.addError('Enter Number of Guest Passenger to book') ;
            }
            if(ldpas.GuestPassgenerCount__c == 6 )  {
             ldpas.GuestPassgenerCount__c.addError('You can not add Guest Passenger more than 5') ;  
                
            }
            if(ldpas.GstPassCount__c >5){
                
                ldpas.addError('You can not add more than 5 guest Passenger');
            }
            
            
        }
        
        }
    public static void isbeforeUpdate(List<LeadPassenger__c>leadPassNewList,  Map<Id,LeadPassenger__c>LdpMapOld, List<LeadPassenger__c>leadPassOldList){
       // List <LeadPassenger__c> ldpcancelled = new List <LeadPassenger__c>();
        for(LeadPassenger__c ldpas :leadPassNewList) {
           // LeadPassenger__c ldp=new LeadPassenger__c();
            if(ldpas.LeadPassengerStatus__c =='Cancelled'  && LdpMapOld.get(ldpas.id).LeadPassengerStatus__c =='Active' ){
                
               ldpas.GuestPassgenerCount__c = 0; 
            
           
                
            
        }
      //  if(ldpas.LeadPassengerStatus__c =='Active'  && LdpMapOld.get(ldpas.id).LeadPassengerStatus__c == 'Cancelled' ){
                
             //  ldpas.GuestPassgenerCount__c = LdpMapOld.get(ldpas.id).GuestPassgenerCount__c;
             //   }
         if(ldpas.GstPassCount__c >5){
                
                ldpas.addError('You can not add more than 5 guest Passenger');
            }   
    }   
}
    
    public static void afterInsert(){
        
        
        
    }
    
}