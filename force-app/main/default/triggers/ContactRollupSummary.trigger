/**
* @description       : 
* @author            : Kiran Katore
* @group             : 
* @last modified on  : 04-25-2022
* @last modified by  : Kiran Katore
**/
trigger ContactRollupSummary on Contact (before insert, after insert, after update) {
    
    if(trigger.isAfter && trigger.isInsert){
        if(checkRecursive.runOnce()){
            Contact_Pincode_Handler.filterAccount(trigger.new);  
        }
        
    }
    if(trigger.isUpdate && checkRecursive.runOnce()){
            
                Contact_Pincode_Handler.filterAccount(trigger.new);
            
            
        }
    
    
    
}