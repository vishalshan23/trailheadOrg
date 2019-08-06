({
	getAccountInformation : function(component,event) {
        var action = component.get("c.getAccountInfo");
        var accRecId = component.get("v.recordId");
        action.setParams({"recId":accRecId}
        );
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var accname = response.getReturnValue();
                if(accname.indexOf("Grand") !=-1){
                    component.set("v.ErrorMessage","Not a valid Scenario");
                }
                else{
                    var createRecordEvent = $A.get("e.force:createRecord");
                    createRecordEvent.setParams({
                    "entityApiName": "Opportunity",
                    "defaultFieldValues": {
                            'Name' : accname,
                            'Account' : accRecId
                    }
                    });
                    
                    console.log(createRecordEvent);
                    createRecordEvent.fire();
                    
                    $A.get("e.force:closeQuickAction").fire();
                }
            } 
        });

		$A.enqueueAction(action);
        
	}
})