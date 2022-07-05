public class Rest_Access_Token {
    public string endpoint {set;get;} //https://login.salesforce.com/services/oauth2/token
    public string grant_type {get;set;} //password
    public string client_id {set;get;}
    public string client_secret {get;set;}
    public string username {get;set;}
    public string password {get;set;}
    public string token {get;set;}
    
    public void getToken(){
        grant_type = 'password';
        string body = 'grant_type='+grant_type+
                      '&client_id='+client_id+
                      '&client_secret='+client_secret+
                      '&username='+username+
                      '&password='+password;
        httpRequest req = new httpRequest();
        req.setEndpoint(endpoint);
        req.setBody(body);
        req.setMethod('POST');
        
        http http = new http();
        httpResponse res = http.send(req);
        system.debug(res.getBody());
        system.JSONParser jp = JSON.createParser(res.getBody());
        while(jp.nextToken() != null){
            if(jp.getText() == 'access_token'){
                jp.nextToken();
                token = jp.getText();
            }
        }
    }
}