trigger Execution_Cycle on Account (before insert) {
    for(account a : trigger.new){
        if(a.BillingCity == 'Rahuri')
        	a.BillingCity = 'Kolhar';
        else
            system.debug('Failed');
    }
}