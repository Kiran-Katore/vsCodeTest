public class XML_utrace {
    public static string ip_address {get;set;}
    public string out_xml {get;set;}
    public map<string, string> out_table {get;set;}
    public void utrace(){
        out_table = new map<string,string>();
        //ip_address = '106.210.248.39'; 
        httpRequest req = new httpRequest();
        req.setEndpoint(system.label.utrace_endpoint+ip_address);
        req.setMethod('GET');
        req.setHeader('Accept', 'Application/xml');
        http http = new http();
        httpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            DOM.Document doc = new DOM.Document();
            doc.load(res.getBody());
            DOM.XmlNode root = doc.getRootElement();
            list<DOM.XmlNode> result = root.getChildElements();
            list<DOM.XmlNode> inner_data = result[0].getChildElements();
            for(DOM.XmlNode data : inner_data){
                out_xml += '<br/>'+data.getName();
                out_xml += ': '+data.getText();
                out_table.put(data.getName(), data.getText());
            }
        }else{
            out_xml = 'ERROR :'+res.getStatusCode();
        }
    }
    public void clear(){
        ip_address = '';
        out_xml = '';
    }
}