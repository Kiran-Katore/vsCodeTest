public with sharing class pageBlockController {
    public list<account> lst {get;set;}
    public string searchKey {get;set;}
    public void featchAccounts(){
        lst = [select name, Industry from account];
    }
    public void searchRecord(){
        if(!String.isBlank(searchKey)){
            lst = [select name, Industry from account where name like :'%'+searchKey+'%'];
            if(lst.size() == 0){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.WARNING, 'No Record Found!'));
            }
        }else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, 'Enter Name To Search'));
        }
    }
    
}