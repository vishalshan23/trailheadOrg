trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        List<BatchLeadConvertErrors__c> batchConvertLeadList = new List<BatchLeadConvertErrors__c>();
        for(BatchApexErrorEvent btch :Trigger.new){
            batchConvertLeadList.add(new BatchLeadConvertErrors__c(
                                     AsyncApexJobId__c=btch.AsyncApexJobId,
                                     Records__c=btch.JobScope,
                                     StackTrace__c=btch.StackTrace));
        }
        insert batchConvertLeadList;
    }

}