public class JSON_Class_Generator_parser {
    static integer t = 0;
    public static void JSON_Class(){
        
        //JSON
        //Serialize
        //JSON.serialize(o); --> return string
        //JSON.serialize(o, true); --> return string with suppressed Null
        //JSON.serializePretty(o); --> return formatted string
        //JSON.serializePretty(o, true);
        account acc = [select id, name from account limit 1];
        string s = JSON.serializePretty(acc);
        system.debug(s);
        //Deserialize
        //JSON.deserialize(str, <class>); --> return class type without proper info
        //JSON.deserializeStrict(string, <class>); --> return class type with proper info
        //JSON.deserializeUntyped(str); --> return object and cast to map<string,object>
        string nm = '{"name": "Test","Age": 22}';
        //.deserializeUntyped(jsonString)
        map<string,object> o = (map<string,object>) JSON.deserializeUntyped(nm);
        for(string ob : o.keyset()){
            system.debug(ob+'-->'+o.get(ob));
        }
        
        string js_name = '{"name":"Test_Des","phone":"99988899","Rating__c":"Less","age":33}';
        account name_des = (account)JSON.deserialize(js_name, account.class);
        system.debug(name_des);
        //insert name_des;
    } 
    public static string JSON_Generator(){
        system.JSONGenerator json_gen = JSON.createGenerator(false);
        json_gen.writeStartObject();
        list<account> accList = [select name, phone, rating from account limit 5];
        for(account acc: accList){           
            json_gen.writeStringField('Name', acc.name);            
            json_gen.writeStringField('Phone', acc.phone != null ? acc.Phone : '');            
            json_gen.writeStringField('Rating', acc.Rating != null ? acc.Rating : '');
            json_gen.writeNumberField('Success', 200);
        }
        json_gen.writeEndObject();
        string gen = json_gen.getAsString();
        //system.debug(gen);
        return gen;        
    }
    public static void JSON_Parser(){
        //string s = '{"account":[{"name":"Test", "Rating":"Hot", "Phone":"999889","contacts":{"firstName":"first", "lastName":"last", "email":"test@mail.co"}}],{"name":"Test2", "rating":"Warm","phone":"9988999","contacts":[{"firstName":"first_2_1", "lastName":"last_2_1","email":"test_2@mail.co"}]}]}';
        string s = '{"account":[{"name":"Test", "Rating":"Hot", "Phone":"999889","contacts":{"firstName":"first", "lastName":"last", "email":"test@mail.co"}},{"name":"Test2", "rating":"Warm","phone":"9988999","contacts":{"firstName":"first_2_1", "lastName":"last_2_1","email":"test_2@mail.co"}}]}';
        system.JSONParser json_par = JSON.createParser(s);
        list<contact> conList = new list<contact>();
        while(json_par.nextToken() != null){
            //system.debug('token-->'+json_par.getCurrentToken());
            //system.debug('value-->'+json_par.getText());
            //system.debug('current value-->'+json_par.hasCurrentToken());
            //system.debug('Value-->'+json_par.readValueAs(System.apexType))
            
            if(json_par.getCurrentToken()==JSONToken.FIELD_NAME && json_par.getCurrentName() == 'Name'){
                json_par.nextToken();
                system.debug('Name ==>'+json_par.getText());
            }
            if(json_par.getCurrentToken()==JSONToken.FIELD_NAME && json_par.getCurrentName() == 'Rating'){
                json_par.nextToken();
                system.debug('Rating ==>'+json_par.getText());
            }
            if(json_par.getCurrentToken()==JSONToken.FIELD_NAME && json_par.getCurrentName() == 'Phone'){
                json_par.nextToken();
                system.debug('Phone ==>'+json_par.getText());
            }
            if(json_par.getCurrentToken()==JSONToken.FIELD_NAME && json_par.getCurrentName() == 'Success'){
                json_par.nextToken();
                system.debug('Success ==>'+json_par.getIntegerValue());                
            }
            if(json_par.getCurrentToken()==JSONToken.FIELD_NAME && json_par.getCurrentName() == 'contacts'){
                json_par.nextToken();
                //json_par.nextToken();
                conList.add((contact)json_par.readValueAs(contact.class));
                
                system.debug('Contact ==> '+conList);
                
            }
        }
    }
    //t = 1;
    public static void json_parser_pin(){
        string res = '[{"Message":"Number of pincode(s) found:5","Status":"Success","PostOffice":[{"Name":"Chinchpur BK","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Gogalgaon","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Hasanapur","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Lohare Mirpur","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Loni Bk","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"}]}]';
        system.JSONParser jp = JSON.createParser(res);
        string status;
        while(jp.nextToken() != null){
            if(jp.getText() == 'Status'){
                jp.nextToken();
                system.debug('Status ==>'+jp.getText());
                status = jp.getText();  
            }
            if(jp.getCurrentName() == 'Name'){
                jp.nextToken();
                system.debug('name ==>'+jp.getText());
            }
            /*
            if(status == 'Success'){
                if(jp.getText() == 'PostOffice'){
                    jp.nextToken();
                    
                    //jp.nextToken();
                    //jp.nextToken();
                    system.debug('token ==>'+jp.getText());
                    //pin_Wrapper pin = (pin_Wrapper)jp.readValueAs(pin_Wrapper.class);
                    list<pin_Wrapper> pins = (list<pin_Wrapper>)jp.readValueAs(list<pin_Wrapper>.class);
                    //pins.add(pin);
                    system.debug('pin ==> '+pins.size());
                    for(pin_Wrapper p : pins){
                        system.debug(p);
                    }
                    t++;
                     
                }
}
*/
            
        }
        system.Debug(t);
    }
    public class pin_Wrapper{
        string Name;
        string Description;
        string BranchType;
        string DeliveryStatus;
        string Circle;
        string District;
        string Division;
        string Region;
        string Block;
        string State;
        string Country;
        string Pincode;    
    }
    
}