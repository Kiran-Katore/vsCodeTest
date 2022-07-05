trigger Opportunity_Trigger on Opportunity (before insert, before update, after insert, after update, after delete) {
    Opportunity_Handler opHandle = new Opportunity_Handler();
    opHandle.run();
}