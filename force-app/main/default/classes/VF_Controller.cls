public class VF_Controller {
    Public list<account> accList {get;set;}
    public boolean flag {get;set;}
    public void callMeth(){
        flag = true;
        accList = [select id, name from account limit 10];
    }
}