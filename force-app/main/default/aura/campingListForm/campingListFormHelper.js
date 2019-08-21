({
    createItem: function(component, item) {
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({"item":item});
        createEvent.fire();

        component.set("v.newItem","{'sObjectType':'Camping_Item__c','Quantity__c':0,'Price__c':0}");
        // var action = component.get("c.saveItem");
        // action.setParams({
        //     "campingItem": item
        // });
        // action.setCallback(this, function(response){
        //     var state = response.getState();
        //     if (state === "SUCCESS") {
        //         var itemList = component.get("v.items");
        //         itemList.push(response.getReturnValue());
        //         component.set("v.items", itemList);
        //     }
        // });
        // $A.enqueueAction(action);
    }
})
