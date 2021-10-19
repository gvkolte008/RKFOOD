({
	onCheck: function(cmp, evt) {
		 var checkCmp = cmp.find("checkbox");
		 var resultCmp = cmp.find("checkResult");
		 resultCmp.set("v.value", "" +checkCmp.get("v.value"));

	 },
    flightMethod: function(Component,Event,helper){
        
        alert('In Flight Method to call apex class methods ');
        
        var action = Component.get('c.getFlightList'); 
        
        action.setParams({
            
            "Source":Component.get('v.Source'),
            "Destination":Component.get('v.Destination')
            
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                alert('Flight list returned');
                Component.set('v.Flist', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
        
        
    },
    
    onChecking: function(cmp, evt) {
		 var checkCmp = cmp.find("checkbox");
		var resultCmp = cmp.find("checkResult");
		 resultCmp.set("v.value", ""+checkCmp.get("v.value"));

	 },
    flightBooking: function(Component,Event,helper){
        
        alert('In flight Booking method');
         var action = Component.get('c.getFlightList'); 
        
        action.setParams({
            
            "Source":Component.get('v.Source'),
            "Destination":Component.get('v.Destination')
            
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                alert('Flight list returned');
                Component.set('v.Flist', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
        
        
    
        
    }
    
   
})