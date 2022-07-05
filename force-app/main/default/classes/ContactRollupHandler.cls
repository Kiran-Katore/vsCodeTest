/**
 * @description       : 
 * @author            : Kiran Katore
 * @group             : 
 * @last modified on  : 04-25-2022
 * @last modified by  : Kiran Katore
**/

public class ContactRollupHandler {
    public static boolean flag = true;
    public void run(){
        // No_of_Contacts__c
        if(flag){
            if(trigger.isAfter || trigger.isInsert){
                contactAccountInsert(trigger.new);
                
            } 
        }
        
        
        if(trigger.isInsert || trigger.isUpdate){
            //update_no_of_Records(trigger.new);
        }
        if(trigger.isDelete){
            //deleted_no_of_contact(trigger.old);
            
        }
    }
    public void update_no_of_Records(list<contact> conList){
        System.debug(Trigger.new);
        set<id> accIds = new set<id>();
        for(contact con : conList){
            if(con.accountId != null)
                accIds.add(con.accountId);
        } 
        rollup(accIds);
    }
    public void deleted_no_of_contact(list<contact> conList){
        set<id> acs = new set<id>();
            for(contact con : conList){
                if(con.accountid != null)
                    acs.add(con.accountid);
            }
        rollup(acs);
    }
    public void rollup(set<id> accIds){
        list<account> accs = new list<account>();
        list<AggregateResult> res = [select count(id) con_count, accountId from contact where accountid in:accIds group by accountId];
        for(aggregateResult agr : res){
            account acc = new account(id = (id)agr.get('accountId'));
            acc.No_of_Contacts__c = (Integer)agr.get('con_count');
            accs.add(acc);
        }
        update accs;
    }
    
    /*
     * 2.when ever a record is inserted to the contact automatically inserted to the account 
     * 
     */
    public void contactAccountInsert(list<contact> conList){
        flag = false;
        list<account> accList = new list<account>();
        list<contact> conClone = conList.clone();
        list<contact> cons = new list<contact>();
        if(!conList.isEmpty()){
            for(contact con : conList){
                account acc = new account();
                acc.name = con.lastName;
                acc.Rating = 'Hot';
                acc.BillingCity = con.MailingCity;
                acc.BillingCountry = con.MailingCountry;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            try{
                Database.SaveResult[] rs = Database.insert(accList);
                for(database.SaveResult result : rs){
                    if(result.isSuccess()){
                        system.debug('result id ==> '+result.getId());
                        for(contact con: conClone){
                            
                            //con.AccountId = result.getId();
                            //cons.add(con);
                            //system.debug('contact '+con);
                        }
                    }
                }
                //Database.SaveResult[] resCon = Database.insert(cons);
            }catch(exception e){
                system.debug('Error ==>'+e.getMessage());
            }
        }
    }
}