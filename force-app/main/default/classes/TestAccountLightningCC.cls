public class TestAccountLightningCC {
    
    @AuraEnabled
    public static String getAccountInfo(String recId){
        Account acc = [SELECT Name,id FROM Account WHERE id =:recId];
        
        return acc.Name;
    }

}