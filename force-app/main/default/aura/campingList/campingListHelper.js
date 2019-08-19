({
    createItem: function(component, item) {
        var action = component.get("c.saveItem");
        action.setParams({
            "campingItem": item
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var itemList = component.get("v.items");
                itemList.push(response.getReturnValue());
                component.set("v.items", itemList);
            }
        });
        $A.enqueueAction(action);
    }
})