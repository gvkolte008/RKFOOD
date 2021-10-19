public class YatriTriggerHandler {
    public static void createSahyatri(List<Yatri__c>newListYatri){
        for(Yatri__c y :newListYatri){
            if(y.Age__c == Null){
                
                y.Age__c.addError('Age can not be empty');
            } 
        }
 }
    public static void createSahyatrii(List<Yatri__c>newListYatri){
       List<Sah_Yartri__c> sahYatriList = new  List<Sah_Yartri__c>(); 
        for(Yatri__c y :newListYatri){
            Sah_Yartri__c sahyatr = new Sah_Yartri__c();
            sahyatr.Yatri__c=y.Id;
            sahyatr.Name='TestPassenger';
            sahYatriList.add(sahyatr);
         }
        insert sahYatriList;
    }
}