({
	findTrain :function(component, event, helper) {
		alert('Method called');
        var action = component.get('c.searchTrain');
         action.setParams({
           "Source" : component.get('v.Source'),
           "Destination" : component.get('v.Destination'),
             "DepartureDate":component.get('v.DepartureDate')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS') {
                alert('Data Retrived');
                component.set('v.TrainList',response.getReturnValue());
                var list=response.getReturnValue();
                component.set('v.TrainsAvailable',list.length);
            }
        });
        $A.enqueueAction(action);
	},
    bookTrain :function(component, event, helper){
		alert('Method2 called');
        var btn = event.getSource();
        var tid=btn.get('v.name');
        
       component.set('v.book',true);
        var childComponent = component.find("trainCmp");
        childComponent.createPas(tid);
	}
})