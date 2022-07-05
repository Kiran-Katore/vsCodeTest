public class Opportunity_Handler {
    public static boolean flag = true;
    public void run(){
        if(trigger.isInsert || trigger.isUpdate){
            //opportunityUpdateAccount(trigger.new);
        }
        if( trigger.isBefore){
            if(trigger.isInsert){
                Opportunity_amount(trigger.new);
            }
            if(trigger.isUpdate){
                Opportunity_amount(trigger.new);
            }
            
        }
        if(trigger.isDelete){
            //opportunityUpdateAccount(trigger.old);
        }
        
        if(trigger.isInsert && trigger.isAfter){
            //opportunityAccount(trigger.new);
        }
        if(trigger.isInsert && trigger.isDelete){
            //opportunityAccount(trigger.old);
        }
        
    }
    public void opportunityUpdateAccount(list<opportunity> oppList){
        list<account> accUpList = new list<account> ();
        set<id> ids = new set<id>();
        if(!oppList.isEmpty()){
            decimal amt = 0;
            for(opportunity opp : oppList){
                ids.add(opp.accountid);                
            }
            list<account> accList = [select id, (select id, amount from opportunities) from account where id in:ids];
            for(account acc : accList){
                amt = 0;
                for(opportunity opp : acc.opportunities){
                    amt += opp.amount;                   
                }
                account ac = new account();
                ac.id = acc.id;
                ac.Total_Opportunities__c = acc.opportunities.size();
                ac.Total_Opportunity_Amount__c = amt;
                accUpList.add(ac);
                //oppAmount.put(acc.id, amt);
            }
        }
        if(!accUpList.isEmpty()){
            try{
                Database.SaveResult [] rs = database.update(accUpList);
                system.debug(rs);
            }catch(exception e){
                system.debug(e);
            }
        }
        
    }
    
    
    
    public void opportunityAccount(list<opportunity> oppList){
        set<id> ids = new set<id>();
        list<account> accUpList = new list<account>();
        if(!oppList.isEmpty()){
            for(opportunity opp: oppList){
                ids.add(opp.accountid);
            }
            list<account> accList = [select id, (select id, amount from opportunities where CreatedDate >= This_Year) from account where id in:ids ];
            decimal amt = 0;
            for(account acc : accList){
                amt = 0;
                for(opportunity opp : acc.opportunities){
                    amt += opp.Amount;
                }
                account ac = new account();
                decimal avg = (amt/acc.opportunities.size());
                if(avg > 10000){
                    ac.AssignmentValues__c = 'Key account';
                }else if(avg < 10000 && avg > 5000){
                    ac.AssignmentValues__c = 'Engage Account';
                }else {
                    ac.AssignmentValues__c = 'Low Engagement Account';
                }
                accUpList.add(ac);
                
            }
        }
        if(!accUpList.isEmpty()){
            try{
                database.SaveResult [] rs = database.update(accUpList);
                system.debug('result==>'+rs);
            }catch(exception e){
                system.debug(e.getMessage());
            }
        }
    }
    
    
    public void Opportunity_amount(list<opportunity> oppList){
        if(!oppList.isEmpty()){
            for(opportunity opp: oppList){
                Currencies__c c = Currencies__c.getInstance(opp.Currency__c);
                system.debug(c);
                opp.Amount_in_INR__c = 'Rs. '+ ((decimal)(opp.Amount / c.Rate__c)).setScale(2,roundingMode.CEILING);
                system.debug(opp.Amount_in_INR__c);
            }
        }
    }
    
    
    
}