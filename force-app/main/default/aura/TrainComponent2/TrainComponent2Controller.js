({
	createPasen : function(component, event, helper) {
		var params = event.getParam('arguments');
        var tid= params.tid;
         component.set('v.TraId',tid);
        var action = component.get('c.createPassenger');
         action.setParams({
           "TraId" : component.get('v.TraId'),
           "pName" : component.get('v.PassengerName'),
             
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS') {
                alert('Ticket is booked');
                component.set('v.Passlist',response.getReturnValue());
                
            }
        });
        $A.enqueueAction(action);
    
	}
})