@isTest
public class AccountManagerTest {

    @TestSetup
    static void makeData(){
        Account acc = new Account (Name = 'test account');
        insert acc;

        List<Contact> conList = new list<Contact>();
        conlist.add(new Contact(AccountId= acc.id, FirstName= 'FN', LastName= 'LN'));
        insert conList;
        
    }
    @isTest
    static void AccountManagerTest() {
        Account acc = [SELECT ID FROM Account limit 1];
        system.debug(acc);
        RestRequest req = new RestRequest();
        req.requestURI = 'https://vishalshan23trailhead-dev-ed.lightning.force.com/apexrest/Accounts/'+acc.id+'/contacts';
        req.httpMethod = 'GET';
        RestContext.request = req;

        Account thisAcc = AccountManager.getAccount();
        System.assertEquals( 'test account', thisAcc.name);
    }
}