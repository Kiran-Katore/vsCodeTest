public class Contact_api {
    
    public static void contact_insert(){
        list<contact> conList = new list<contact>();
        string endpoint = system.label.randomuser;
        httpRequest req = new httpRequest();
        req.setEndpoint('https://randomuser.me/api/?inc=name,location,email,phone,cell,dob&results=1000&nat=us');
        req.setMethod('GET');
        http http = new http();
        httpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            //contact con = new contact();
            system.JSONParser jp = JSON.createParser(res.getBody());
            string jsonString = res.getBody().replaceAll('"date":','"dates":');
            system.debug(jsonString);
            contact_wrapper con_wrap = (contact_wrapper) JSON.deserialize(jsonString, contact_wrapper.class);
            system.debug(con_wrap);
            for(contact_wrapper.results rs : con_wrap.results){
                contact con = new contact();
                con.lastName = rs.name.last;
                con.FirstName = rs.name.first;
                con.MailingCity = rs.location.city;
                con.MailingCountry = rs.location.country;
                con.MailingState = rs.location.state;
                con.MailingPostalCode = string.valueOf(rs.location.postcode);
                con.MailingStreet = rs.location.street.name;
                con.Birthdate = date.valueOf(rs.dob.dates);
                con.Email = rs.email;
                con.Phone = rs.phone;
                con.HomePhone = rs.cell;
                conList.add(con);
                
            }
            
            
            /*
            while(jp.nextToken() != null){
                
                if(jp.getText() == 'first' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.firstName = jp.getText();
                    system.debug('first ==>'+jp.getText());  
                }
                if(jp.getText() == 'last' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.LastName = jp.getText();
                    system.debug('last ==>'+jp.getText());
                }
                if(jp.getText() == 'dob' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    jp.nextToken();
                    if(jp.getText() == 'date'){
                        jp.nextToken();
                        con.Birthdate = date.valueof(jp.getText());
                        system.debug('date ==>'+jp.getText());
                    }    
                }
                if(jp.getText() == 'phone' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.Phone = jp.getText();
                    system.debug('phone ==>'+jp.getText());
                }
                if(jp.getText() == 'cell' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.HomePhone = jp.getText();
                    system.debug('cell ==>'+jp.getText());
                }
                if(jp.getText() == 'email' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.Email = jp.getText();
                    system.debug('email ==>'+jp.getText());
                }
                if(jp.getText() == 'street' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    jp.nextToken();
                    jp.nextToken();
                    jp.nextToken();
                    if(jp.getText() == 'name'){
                        jp.nextToken();
                        con.MailingStreet = jp.getText();
                        system.debug('street ==>'+jp.getText());
                    }
                    //system.debug('street ==>'+jp.getText());
                }
                if(jp.getText() == 'city' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.MailingCity = jp.getText();
                    system.debug('city ==>'+jp.getText());
                }
                if(jp.getText() == 'state' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.MailingState = jp.getText();
                    system.debug('state ==>'+jp.getText());
                }
                if(jp.getText() == 'country' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.MailingState = jp.getText();
                    system.debug('country ==>'+jp.getText());
                }
                if(jp.getText() == 'postcode' && system.JSONToken.FIELD_NAME == jp.getCurrentToken()){
                    jp.nextToken();
                    con.MailingPostalCode = jp.getText();
                    system.debug('postcode ==>'+jp.getText());
                }
                if(con.FirstName != null && con.LastName != null && con.Birthdate != null && con.Phone != null
                   && con.HomePhone != null && con.Email != null && con.MailingCity != null){
                       conList.add(con);
                       con.firstName = null;
                       con.lastName = null;
                       con.Birthdate = null;
                       con.Phone = null;
                       con.HomePhone = null;
                       con.Email = null;
                       con.MailingCity = null;
                       
                   }
                

            }
*/

            //system.debug('contact ==> '+conList);
            //system.debug('contact ==> '+conList.size());
            database.SaveResult[] ress = database.insert(conList, false);
            for(database.saveResult rs: ress){
                system.debug(rs);
            }
            system.debug('error ==> '+ress);
            
        }
    }
}