public class ContTriggerHandler {
    /*Created by:Ganesh Kolte
     *Created on:25/08/2021 
     * Description:This trigger is written to create Account if account is not selected while creating contact
     */
   public static void updateName(List<Contact>conNewlist){
   List<Contact>cListtoUpdate= new List<Contact>();
   for(Contact con:conNewlist){
   con.Description='This is new contact';
   cListtoUpdate.add(con);
        }     
    }
    public static void insertAccount(List<Contact>conNewlist){
    List<Contact>cListtoUpdate= new List<Contact>();
    List<Account>aListtoUpdate= new List<Account>();
    for(Contact con:conNewlist){
             if(con.AccountId==null){
             Account acc=new Account();
             acc.Name=con.LastName;
             acc.Description='This account created post contact creation by Trigger';
             aListtoUpdate.add(acc);
            }   
        }
        if(aListtoUpdate.Size()>0){
            
            insert aListtoUpdate;
        }
    }
    public static void updateAccount(List<Contact>conNewlist,Map<Id,Contact>conIdOldMap){                      
        for(Contact con:conNewlist){
            if(con.MobilePhone != conIdOldMap.get(con.Id).MobilePhone){  
                con.addError('You can not change your mobile number');
            }
            
        }
        
    }
    
    public static void changeAccount(List<Contact>conNewlist,Map<Id,Contact>conIdOldMap){ 
        Map<Id,Contact> ConIdMap =new  Map<Id,Contact>();
        List<Case>accList= new List<Case>();
       // Set<Id>accId=new Set<Id>();
       // 
        for(Contact con:conNewlist){
            if(conIdOldMap!=null){  
                
            ConIdMap.put(con.Id, con);  
            }
        }
        for(Case cse:[SELECT Id,Status,Priority FROM Case WHERE ContactId IN :ConIdMap.keySet()]){
            Case cs=new Case();
            cs.Id=cse.Id;
            cs.Status='Working';
            cs.Priority='High';
            accList.add(cs);
        }
        
        if(accList.Size()>0){
            
            update accList;
        }
            }
            
        

}