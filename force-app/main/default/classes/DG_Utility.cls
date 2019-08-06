/*
 * Block comments with details of changes
 */
public class DG_Utility
{
    public DG_Utility()
    {
        
    }
    
    public static String buildQuery(String objName){
        String queryStr ='';
        set<String> result = new Set<String>();
        map<String,Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
        for(String fieldName : fieldMap.keySet()) {
            if(fieldMap.get(fieldName).getDescribe().isUpdateable()) {
                result.add(fieldName);
            }
        queryStr = 'SELECT '+String.join(new list<String>(fieldMap.keySet()),',') + ' FROM '+ objName;
       }
         return queryStr;
    }
    
     public static sObject createObject(String typeName) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(typeName);
        if (targetType == null) {
            // throw an exception
        }
        
        // Instantiate an sObject with the type passed in as an argument
        //  at run time.
        return targetType.newSObject(); 
    }
    
    private static Set<String> fields(Schema.sObjectType t) {
        Set<String> result = new Set<String>();
        Map<String, Schema.SObjectField> fields = t.getDescribe().fields.getMap();
        return fields.keySet();
    }
    
    public static String renderTemplate(sObject sobj, String template, String ObjName) {
        for (String fieldName : fields(sobj.getSObjectType())) {
            String key = '{{!' + ObjName+'.'+fieldName + '}}';
            while (template.containsIgnoreCase(key)) {
                try {
                    Integer foundPosition = template.indexOfIgnoreCase(key, 0);
                    template = template.left(foundPosition) +
                        String.valueOf(sobj.get(fieldName)) +
                        template.substring(foundPosition + key.length());
                } catch (Exception e) {
                   system.debug('**exception in renderTemplate' + e.getMessage());
                }
            }
        }
        return template;
    }
}