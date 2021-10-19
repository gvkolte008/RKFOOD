({
	callMymethod: function(component, event, helper) {
		
       //alert('call my method') 
  
  var action = component.get('c.mycontrollerMehod');
        action.setParams({
            
            "firstName":component.get('v.firstName'),
            "lastName":component.get('v.lastName')
            
        });
        action.setCallback(this,function(a) {
                           
           var state= a.getState();
        if(state=='SUCCESS'){
            alert('Method success');           
        }else
            alert('method fail')
                           
        });
        $A.enqueueAction(action);
	}
})