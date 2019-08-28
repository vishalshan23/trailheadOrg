({
  doInit: function(component, event, helper) {
    var action = component.get("c.getItems");

    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        component.set("v.items", response.getReturnValue());
      } else {
        console.log("Failed with state" + state);
      }
    });
    // Send action off to be executed
    $A.enqueueAction(action);
  },
  handleAdditem : function(component, event, helper){
    var item = event.getParam("item");
    // helper.createCampingItem(component,newItem);
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
});