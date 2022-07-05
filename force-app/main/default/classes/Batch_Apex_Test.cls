@isTest()
public class Batch_Apex_Test {
    public static testMethod void batchTest(){
        list<account> acc = new list<account>();
        for(integer i = 1; i<250; i++){
            account a = new account(name = 'test'+i);
            acc.add(a);
            if(Math.mod(acc.size(), 10000) == 0){
                
            } 
        }
        Database.SaveResult[] rs = Database.insert(acc, false);
        
        test.startTest();
            Async_Future bt = new Async_Future();
            Database.executeBatch(bt);
        test.stopTest();
    }
    static list<account> testSetup(){
        
        return null;
    }
}