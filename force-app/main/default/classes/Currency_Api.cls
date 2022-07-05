public class Currency_Api {
    public void currency_featch(){
        Map<string,decimal> currency_rate = new map<string,decimal>();
        httpRequest req = new httpRequest();
        string symbols = '&symbols=CNY,EUR,GBP,INR,JPY,RUB,SGD,USD';
        req.setEndpoint(system.label.apilayer+symbols);
        req.setMethod('GET');
        req.setHeader('apikey', 'RbDcMvtDveqGkXEl8eTcvcdck697MdPw');
        http http = new http();
        httpResponse res = http.send(req);
        system.debug(res.getBody());
        if(res.getStatusCode() == 200){   
            System.JSONParser jp = JSON.createParser(res.getBody());
            while(jp.nextToken() != null){
                if(jp.getText() == 'CNY'){
                    jp.nextToken();
                    currency_rate.put('CNY', jp.getDecimalValue());                    
                }
                if(jp.getText() == 'EUR'){
                    jp.nextToken();
                    currency_rate.put('EUR', jp.getDecimalValue());
                }
                if(jp.getText() == 'GBP'){
                    jp.nextToken();
                    currency_rate.put('GBP', jp.getDecimalValue());
                }
                if(jp.getText() == 'INR' && jp.getCurrentToken() == JSONToken.FIELD_NAME ){
                    jp.nextToken();
                    currency_rate.put('INR', jp.getDecimalValue());
                }
                if(jp.getText() == 'JPY'){
                    jp.nextToken();
                    currency_rate.put('JPY', jp.getDecimalValue());
                }
                if(jp.getText() == 'RUB'){
                    jp.nextToken();
                    currency_rate.put('RUB', jp.getDecimalValue());
                }
                if(jp.getText() == 'SGD'){
                    jp.nextToken();
                    currency_rate.put('SGD', jp.getDecimalValue());
                }
                if(jp.getText() == 'USD'){
                    jp.nextToken();
                    currency_rate.put('USD', jp.getDecimalValue());
                } 

            }
            list<Currencies__c> curs = new list<Currencies__c>();
            for(string rt: currency_rate.keyset()){
                Currencies__c c = Currencies__c.getInstance(rt);
                c.Rate__c = currency_rate.get(rt);
                curs.add(c);
            }
            update curs;     
        }
        
    }
}