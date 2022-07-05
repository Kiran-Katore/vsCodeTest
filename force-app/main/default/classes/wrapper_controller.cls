public with sharing class wrapper_controller {
    public list<account> acs {get;set;}
    public list<contact> cos {get;set;}
    public wrapper_recs recs {get;set;}
    public string searchKey {set;get;}
    
    
    public wrapper_controller(){
        recs = new wrapper_recs();
        //recs.accs = new list<account>();
        
        
    }
    public void searchRecs(){
        recs.accs = [select id, name, phone, billingCity from account where name like : searchKey+'%' limit 10];
        recs.cons = [select id, lastName, FirstName,phone from contact where firstName like : searchKey+'%' limit 10];  
    }
    
    public class wrapper_recs{
        public list<account>accs {get;set;}
        public list<contact>cons {get;set;}
    }

}