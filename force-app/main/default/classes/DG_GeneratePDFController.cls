/*
 * Block comments with details of changes
 */
public class DG_GeneratePDFController
{
    public String docRecordId{get;set;}
    public String sobjId = '';
    //initializing getter and setter of doc record variable
    public DOC_Doc_Record__c docrec{get;set;}
    public String template {get;set;}


    //sObject variable for dynamic instance of objects
    sobject sob{get;set;}

    public DG_GeneratePDFController(){

        if(ApexPages.currentPage().getParameters().containsKey('id')){
            docRecordId = ApexPages.currentPage().getParameters().get('id');
        }
        
        if(String.isNotBlank(docRecordId)){
            docrec = new DOC_Doc_Record__c();
            docrec = [SELECT id,Name,Doc_Link__c,
                      SObjectId15__c,SObjectID18__c,Template__c,
                      Object_Type__c,Template__r.Template_HTML__c FROM DOC_Doc_Record__c WHERE id=:docRecordId];
            sobjId = docrec.SObjectId15__c;

        }
        //return docrec;

        // create the instance of the object dynamically
        sob = DG_Utility.createObject(docrec.Object_Type__c);
        //building dynamic query
        String quer = DG_Utility.buildQuery(docrec.Object_Type__c);
        //quer = quer+ ' WHERE id =:'+ '\''+docrec.SObjectId15__c + '\'';
        quer = quer+ ' WHERE id =:sobjId';

        sob = Database.query(quer);
        template = docrec.Template__r.Template_HTML__c;
        template = DG_Utility.renderTemplate(sob,template,docrec.Object_Type__c);
        system.debug('template***********' + template);


    }
}