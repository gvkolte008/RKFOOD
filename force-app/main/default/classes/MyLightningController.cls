public class MyLightningController {
    @AuraEnabled
    public static void mycontrollerMehod(String firstName,String lastName){
        
        system.debug('In apex method');
        system.debug('First Name:'+firstName);
        system.debug('Last Name:'+lastName);
        Account acc=new Account();
        acc.name=firstName;
 
        insert acc;
    }
}