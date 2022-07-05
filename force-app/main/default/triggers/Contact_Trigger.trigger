trigger Contact_Trigger on Contact (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        Contact_Handler.del_contact(trigger.new);
    }
}