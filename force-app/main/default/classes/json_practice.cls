public class json_practice {
    public static void json_class(){
        //serialize
        map<string, string> maptoSerialize = new map<string, string>{'Name'=>'JSON Class', 'Namespace'=>'System', 'method'=>'JSON.Serialize', 'suppressNull'=>''};
            string jsonMapSer = System.JSON.serialize(maptoSerialize);
        system.debug('JSON.serialize ==>'+jsonMapSer);
        //serializePretty
        string jsonMapSerPretty = JSON.serializePretty(maptoSerialize);
        system.debug('JSON.serializePretty ==>'+jsonMapSerPretty);
        //serializeSuppressNull
        wrapper_serialize wp = new wrapper_serialize();
        wp.name = 'JSON serialize';
        wp.Namespace = 'SYSTEM';
        wp.method = 'JSON.serialize(obj, SuppressNull)';
        string jsonMapSuppress = JSON.serialize(wp, true);
        system.debug('JSON.serialize suppressNull ==> '+jsonMapSuppress);
        //serializePretty
        string jsonMapSuppressPretty = JSON.serializePretty(wp, true);
        system.debug('JSON suppress Pretty ==> '+jsonMapSuppressPretty);
        
        //deserialize
        wrapper_serialize wp_des = new wrapper_serialize();
        wp_des = (wrapper_serialize) JSON.deserialize(jsonMapSuppressPretty, wrapper_serialize.class);
        system.debug('deserialize ==> '+wp_des);
        //deserializeStrict
        //jsonMapSuppressPretty += '';
        string n_jsonMapSuppressPretty = jsonMapSuppressPretty.replace('}',',"StrictType":"true"}' );
        
        system.debug('strict string ==>'+n_jsonMapSuppressPretty);
        wp_des = (wrapper_serialize) JSON.deserializestrict(jsonMapSuppressPretty, wrapper_serialize.class);
        system.debug('deserialize strict ==>'+wp_des);
        //deserializeUntyped
        map<string,object> des_untyped = (map<string, object>) JSON.deserializeUntyped(n_jsonMapSuppressPretty);
        //wp_des = (wrapper_serialize) JSON.deserializeUntyped(n_jsonMapSuppressPretty);
        system.debug('deserialize Untyped ==> '+des_untyped);
        
        string jsonString = '[{"Message":"Number of pincode(s) found:5","Status":"Success","PostOffice":[{"Name":"Chinchpur BK","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Gogalgaon","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Hasanapur","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Lohare Mirpur","Description":null,"BranchType":"Branch Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"},{"Name":"Loni Bk","Description":null,"BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Circle":"Maharashtra","District":"Ahmed Nagar","Division":"Shrirampur","Region":"Pune","Block":"Rahata","State":"Maharashtra","Country":"India","Pincode":"413736"}]}]';
        pin_code_wrapper_class pin = (pin_code_wrapper_class) JSON.deserialize(jsonString, pin_code_wrapper_class.class);
        system.debug('pincode '+pin);
        
        
        
    }
    public static void JSON_Generator(){
        system.JSONGenerator json_gen= JSON.createGenerator(true);
        wrapper_serialize wp = new wrapper_serialize();
        wp.name = 'JSON Generator';
        wp.method = 'JSON.creategenerator';
        wp.namespace = 'System.JSONGenerator';
        wp.suppress = 'false';
        
        json_gen.writeStartObject();   
        json_gen.writeStringField('JSON_Name', wp.name);
        json_gen.writeStringField('JSON_Method', wp.method);
        json_gen.writeStringField('JSON_Namespace', wp.namespace);
        json_gen.writeEndObject();
        string jsonGen = json_gen.getAsString();
        system.debug('json generator ==> '+jsonGen);  
    }
    
    public static void json_parser(){
        wrapper_serialize wp = new wrapper_serialize();
        wp.name = 'JSON Parser';
        wp.Namespace = 'SYSTEM';
        wp.method = 'JSON.createParser()';
        wp.suppress = 'False';
        string json_wp = JSON.serializePretty(wp);
        string json_ser = '{"name":"JSON Parser", "Method":"JSON.createParser()", "Namespace":"System", "syntax":{"create":"System.JSONParser <jp> = JSON.createParser(<jsonString>);","while_loop": "while(jp.nextToken() != null){...}","if_block":"if(jp.getText() == <key>)","nextToken" : "if(..){jp.nextToken();...}","readValueAs" : "jp.readValueAs(<className.class>)"}}';
        system.JSONParser jp = JSON.createParser(json_ser);
        wrapper_serialize wrapper_string;
        wrapper_serialize wrapper_str;
        wrapper_serialize wp_parser = new wrapper_serialize();
        while(jp.nextToken() != null){
            //jp.nextToken();
            //jp.nextToken();
            wrapper_string = (wrapper_serialize)jp.readValueAs(wrapper_serialize.class);
            //wrapper_str = wrapper_string;
            
            
            
            
            if(jp.getText() == 'Name'){
                jp.nextToken();
                wp_parser.name = jp.getText();
            }
            if(jp.getText() == 'Method'){
                jp.nextToken();
                wp_parser.method = jp.getText();
            }
            if(jp.getText() == 'Namespace'){
                jp.nextToken();
                wp_parser.Namespace = jp.getText();
            }
            if(jp.getText() == 'syntax'){
                jp.nextToken();
                
                //jp.nextToken();
                wrapper_str = (wrapper_serialize)jp.readValueAs(wrapper_serialize.class);
                
            }
            if(jp.getText() == 'create'){
                jp.nextToken();
                wp_parser.create = jp.getText();
            }
            if(jp.getText() == 'nextToken'){
                jp.nextToken();
                wp_parser.nextToken = jp.getText();
            }
            if(jp.getText() == 'readValueAs'){
                jp.nextToken();
                wp_parser.readValueAs = jp.getText();
            }
            if(jp.getText() == 'while_loop'){
                jp.nextToken();
                wp_parser.while_loop = jp.getText();
            }
            if(jp.getText() == 'if_block'){
                jp.nextToken();
                wp_parser.if_block = jp.getText();
            }
            
        }
        string wp_parser_json = JSON.serializePretty(wp_parser, true);
        //system.debug('json pretty ==>'+wp_parser_json);
        //system.debug('json wrapper ==>'+wrapper_string);
        system.debug('json wrapper ==>'+wrapper_str);
        
    }
    
    public class wrapper_serialize{
        //string name;
        //string Namespace;
        //string method;
        string suppress;
        public String name;
        public String Method;
        public String Namespace;       
        public String create;
        public String nextToken;
        public String readValueAs;
        public String while_loop;
        public String if_block;
        
        
        
    }
}