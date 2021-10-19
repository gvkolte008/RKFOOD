({
	callControllerMethod : function(component, event, helper) {
		alert('Controller Method called');
        
         var action = component.get('c.getFlightList'); 
        // method name i.e. getEntity should be same as defined in apex class
        // params name i.e. entityType should be same as defined in getEntity method
        action.setParams({
            //"Source" : component.get('v.Source'),
            //"Destination" : component.get('v.Destination')
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.Flist', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})