/*
 * Block comments with details of changes
 */
public class DG_SelectTemplateController
{
    public list<TemplateWrapper> wrapList{get;set;}
    public list<DOC_Doc_Record__c> docRecordList{get;set;}
    public String objId{get;set;}
    public String objName {get;set;}

    public DG_SelectTemplateController()
    {
        //initializing variables
        objId = '';
        objName = '';
        wrapList = new list<TemplateWrapper>();
        docRecordList = new list<DOC_Doc_Record__c>();

        if(ApexPages.currentPage().getParameters().containsKey('id')){
            objId = ApexPages.currentPage().getParameters().get('id');
        }
        if(ApexPages.currentPage().getParameters().containsKey('objName')){
            objName = ApexPages.currentPage().getParameters().get('objName');
        }

        for(DOC_Template__c temp : [SELECT id, Name, Description__c FROM DOC_Template__c WHERE Object_Type__c= :objName]){
            wrapList.add(new TemplateWrapper(temp));
        }
    }

    // wrapper class
    public class TemplateWrapper{
        public boolean selected{get;set;}
        public DOC_Template__c template{get;set;}

        public TemplateWrapper(DOC_Template__c template ){
            this.template = template;
            selected = false;
        }

    }

    // method to save/create the Doc Record
    public PageReference saveDocRecord(){
        set<Id> insertedIds = new set<Id>();

        if(!wrapList.isEmpty()){
            for(Integer i=0;i<wrapList.size();i++){
                if(wrapList[i].selected){
                    docRecordList.add(new DOC_Doc_Record__c(Template__c = wrapList[i].template.Id,Object_Type__c=objName,
                                                            SObjectId15__c= objId,SObjectID18__c=objId));
                }
            }
        }
        if(!docRecordList.isEmpty()){
            insert docRecordList;
        }

        docRecordList = [SELECT id,Name,
                         Attachment_Name__c,Doc_Link__c,
                         Object_Type__c,SObjectId15__c,SObjectID18__c,
                         Template__r.Name,Template__c 
                         FROM DOC_Doc_Record__c WHERE Id IN:docRecordList];
        system.debug('****docRecordList******' + docRecordList);
        for(Integer i=0;i<docRecordList.size();i++){
            docRecordList[i].Attachment_Name__c = docRecordList[i].Template__r.Name+'_'+docRecordList[i].Name;
            docRecordList[i].Doc_Link__c = '/apex/DG_GeneratePDF?id='+docRecordList[i].Id;
        }
        
        update docRecordList;

        PageReference pg = new PageReference('/apex/ViewDocuments');
        pg.setRedirect(false);
        return pg;

    }
}