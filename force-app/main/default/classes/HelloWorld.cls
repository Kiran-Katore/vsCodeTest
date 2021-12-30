/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class HelloWorld {
    public HelloWorld() {
        System.debug('Hello World');
    }
    public static void setProfile(){
        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('url');
        request.setMethod('GET');
        HttpResponse response = httpObject.send(request);
        String responseBody = response.getBody();
        List<msg> msg = 
    }
    
}
