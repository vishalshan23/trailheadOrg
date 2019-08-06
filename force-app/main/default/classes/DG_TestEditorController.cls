global class DG_TestEditorController {
    
    public DOC_Template__c docTemplate{get;set;}
    public String htmldata{get;set;}
    public DG_TestEditorController(ApexPages.StandardController controller) {
        this.docTemplate = (DOC_Template__c)controller.getRecord();
        htmldata = docTemplate.Template_HTML_encode__c;
        //htmldata = EncodingUtil.urlDecode(htmldata,'UTF-8');
        
    }
    
    @RemoteAction
    global static void saveHtmldata(String data, String templateId){
        DOC_Template__c remotedocTemplate = new DOC_Template__c();
        remotedocTemplate.Template_HTML__c = data;
        remotedocTemplate.Id = templateId;
        remotedocTemplate.Template_HTML_encode__c = EncodingUtil.urlEncode(data,'UTF-8').replace('+','%20');
        upsert remotedocTemplate;
        
    }
    
    @RemoteAction
    global static String decodeXMLdata(String data){
        String decodedData = '';
        if(String.isNotBlank(data)){
            decodedData = EncodingUtil.urlDecode(data,'UTF-8');
            decodedData = decodedData.replace('+','%20');
            
        }
            
        
        return decodedData;
    }

}