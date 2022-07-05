public class Test_VF_Controller {
    public list<contact> records {set;get;}
    public void save(){
        records = [select id, lastName, firstName, email, phone from contact limit 10];
    }
}