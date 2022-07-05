public class visualforceExtensionController {
    public account acc {get;set;}
    public visualforceExtensionController(ApexPages.StandardController sc){
        acc = (account)sc.getRecord();
    }
    public PageReference insertRecord(){
        if(!string.isBlank(acc.phone)){
            list<account> accList = new list<account>();
            accList.add(acc);
            Database.SaveResult[] rs = Database.insert(accList);
            PageReference pr = new PageReference('/'+acc.id);
            return pr;
        }else{
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Failed To insert');
            //ApexPages.addMessage(msg);
            acc.Phone.addError('Missing');
        }
        return null;
    }
}