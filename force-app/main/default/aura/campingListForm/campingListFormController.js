({
    clickCreateItem: function(component, event, helper) {
        var validCampingItem = component
          .find("campingItem")
          .reduce(function(validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get("v.validity").valid;
          }, true);
    
        if (validCampingItem) {
          var newItem = component.get("v.newItem");
        //Call helper method to create a new camping record in server
        helper.createItem(component,newItem);
          
          
        }
      }
})