public class Contact_Handler {
    public static void del_contact(list<contact> conList){
        list<string> conNames = new list<string>();
        list<contact> conAvl = new list<contact>();
        if(!conList.isEmpty()){
            for(contact con: conList){
                if(!string.isBlank(con.AccountId)){
                    connames.add(con.lastName);
                }
                
            }
        }
        if(!conNames.isEmpty()){
            conAvl = [select id, lastName from contact where lastName in:conNames];
            if(!conAvl.isEmpty()){
                for(contact con: conList){
                    con.lastName.addError('record Exist');
                }
            }
        }
    }
}