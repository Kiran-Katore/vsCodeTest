@RestResource(urlmapping ='/test/class')
global class RestResorce_Ex {
    @httpGet
    global static string getAccount(){
        string ids = restContext.request.params.get('id');
        system.debug(ids);
        //req.params.get('id');
        list<account> acc = [select id, name, rating from account limit 2];
        string jsonstring = JSON.serializePretty(acc);
        return jsonString;
    }
}