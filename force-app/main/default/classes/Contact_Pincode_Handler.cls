public class Contact_Pincode_Handler {
    public static boolean flag = true;
    
    public static void filterAccount(list<contact> conList){
        list<contact> filteredConList = new list<contact>();
        if(!conList.isEmpty()){
            for(contact con: conList){
                if(!string.isBlank(con.zip_code__c) ){
                    filteredConList.add(con);
                }
            }
        }
        if(!filteredConList.isEmpty()){
            string jsonString = JSON.serialize(filteredConList, true);
            if(flag){
                featchPinInfo(jsonString);
            }
        } 
    }
    
    @future(callout = true)
    public static void featchPinInfo(string json_con){
        system.debug('Future Called '+flag);
        list<contact> conListUpdate = new list<contact>();
        list<contact> conList = (list<contact>)JSON.deserialize(json_con, list<contact>.class);
        for(contact con: conList){
            http http = new http();
            httpRequest req = new httpRequest();
            req.setEndpoint(system.label.postalCode_Endpoint+con.zip_code__c);
            req.setMethod('GET');
            httpResponse res = http.send(req);
            if(res.getStatusCode() == 200){
                list<postal_wrapper> post_data = (list<postal_wrapper>) JSON.deserialize(res.getBody(), list<postal_wrapper>.class);
                postal_wrapper post = post_data[0];
                con.City__c = post.PostOffice[post.PostOffice.size()-1].division;
                con.District__c = post.PostOffice[post.PostOffice.size()-1].District;
                con.State__c = post.PostOffice[post.PostOffice.size()-1].State;
                con.Country__c = post.PostOffice[post.PostOffice.size()-1].country;
                con.RecordTypeId = '012Iw000000JGzkIAG';
                conListUpdate.add(con);
                system.debug(con);
            }                                  
        }
        if(!conListUpdate.isEmpty()){
            flag = false;
            update conListUpdate;
        }      
    }
}