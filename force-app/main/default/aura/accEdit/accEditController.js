({
    handleSaveRecord: function (component, event, helper) {
        component.find("recordEdit").saveRecord($A.getCallback(function (saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving record, error: ' +
                    JSON.stringify(saveResult.error));
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));

    },
    handleRecordUpdate: function (component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType == "CHANGED"){
            //get the fields changed in the record
            var changedFields = eventParams.changedFields;

            console.log('Fields that are changed: ' + JSON.stringify(changedFields));
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Saved",
                "message": "The record was updated."
            });
            resultsToast.fire();
        }
        if(eventParams.changeType == "ERROR"){
            component.set("v.recordSaveError","Error Occurd")
        }
    }
})