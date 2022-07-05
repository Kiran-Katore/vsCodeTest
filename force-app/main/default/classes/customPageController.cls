public class customPageController {
    public customPageController(){
        Emp_code = 'A3122';
        contact ac = [select firstname, lastName, account.name, email,mailingCity, phone from contact limit 1];
        Emp_name = ac.firstName +' '+ac.lastName;
        Emp_company = ac.account.name;
        Emp_phone = ac.phone;
        Emp_city = ac.mailingCity;
        //createAcc();
    }
    
    public string Emp_code {get;set;}
    public string Emp_name {get;set;}
    public string Emp_company {get;set;}
    public string Emp_phone {get;set;}
    public string Emp_City {get;set;}
    
    public void createAcc(){
        account acc = new account(name = 'Test');
        insert acc;
    } 
        

}