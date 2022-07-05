public class BatchApex implements database.Batchable<sObject>, database.stateful  {
    public Database.QueryLocator start(database.BatchableContext bc){
        string q = 'select id from account limit 10';
        return database.getQueryLocator(q);
    }
    public void execute(database.BatchableContext bc, list<sObject> accList){
        list<account> accUpList = new list<account>();
        if(!accList.isEmpty()){
            for(account acc: (list<account>)accList){
                acc.billingCountry = 'IN';
                accUpList.add(acc);
            }
        }
        if(!accUpList.isEmpty()){
            try{
                database.SaveResult[] rs = database.update(accUpList);
            }catch(exception e){
                system.debug('Error' +e);
            }
        }
    }
    public void finish(database.BatchableContext bc){
        system.debug(bc.getJobId());
    }
}