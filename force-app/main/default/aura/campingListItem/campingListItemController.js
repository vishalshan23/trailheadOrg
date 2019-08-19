({
	packItem : function(component, event, helper) {
        var packedBtn = event.getSource();
        //var itemRec = component.get("v.item");
        
        component.set("v.item.Packed__c",true);
        packedBtn.set("v.disabled",true);
		
	}
})