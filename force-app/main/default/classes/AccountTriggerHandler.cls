/**
* @description       : 
* @author            : Kiran Katore
* @group             : 
* @last modified on  : 04-30-2022
* @last modified by  : Kiran Katore
**/
public with sharing class AccountTriggerHandler {
    public static boolean flag = true;
    public void run(){
        if(flag){
            system.debug('flag ');
            if(trigger.isInsert && trigger.isAfter){
                AccountRelatedContact(trigger.new);
                
            }
        }
        
    }
    //Test Data Check Gearset
    public static void CreateAccounts(List<account> accList){
        if(!accList.isEmpty()){
            for(account acc : accList){
                acc.ShippingState = acc.BillingState;
            }
        }
    }
    /*
* Whenever a record is inserted to the account automatically inserted to the contact 
*/
    public void AccountRelatedContact(list<account> accList){
        flag = false;
        list<contact> conList = new list<contact>();
        
        if(!accList.isEmpty()){
            for(account acc : accList){
                contact con = new contact();
                con.lastName = acc.Name;
                con.AccountId = acc.id;
                con.MailingCity = acc.BillingCity;
                con.MailingCountry = acc.BillingCountry;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            try{
                Database.SaveResult[] rs = Database.insert(conList);
                system.debug('result ==> '+rs);
            }catch(exception e){
                system.debug(e.getMessage());
            }
        }
    }
    
    
    
}
