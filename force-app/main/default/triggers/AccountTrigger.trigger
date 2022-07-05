/**
 * @description       : 
 * @author            : Kiran Katore
 * @group             : 
 * @last modified on  : 04-30-2022
 * @last modified by  : Kiran Katore
**/
trigger AccountTrigger on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        //AccountTriggerHandler.CreateAccounts(trigger.new); 
        //system.debug('trigger chunk size ==> '+trigger.new.size());
        //
        AccountTriggerHandler ac = new AccountTriggerHandler();
        ac.run();
    }
    
}