global with sharing class remoteActionController {
    public string searchKey {get;set;}
    public static account accs {get;set;}
    public list<account> recs {get;set;}
    
    @RemoteAction
    Global static account getaccs(string searchKey){
        account ac = new account();
        ac = [select id, name from account where name =:searchKey];
        return ac;
    }
    public void records(){
        system.debug('function Method Called');
        recs = [select id, name from account where name like :searchKey];
        
    }
}