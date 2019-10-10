@RestResource(urlMapping='/Accounts/<Account_ID>/contacts/*')
global  class AccountManager {
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // get account id from the URI
        string accId = request.requestURI.substringAfter('Accounts/').substringBefore('/contacts');

        Account acc = [SELECT id,Name,(SELECT ID, name from Contacts) FROM Account WHERE Id = :accId];

        return acc;

    }
}