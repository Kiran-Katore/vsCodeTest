public class XML_deserialize {
    public string xmlString {get;set;}
    public string parsedString {get;set;}
    
    public void parseString(){
        if(!string.isBlank(xmlString)){
            Map<string,string> xmlMap = new map<string, string>();
            try{
                DOM.Document doc = new DOM.Document();
                doc.load(xmlString);
                DOM.XmlNode root = doc.getRootElement();
                //parsedString = root.getName();
                list<DOM.XmlNode> inner_root = root.getChildElements();
                
                list<DOM.XmlNode> nodes = inner_root[0].getChildElements();
                for(DOM.XmlNode nd : nodes){
                    parsedString += '\n'+nd.getName();
                    parsedString += ': '+nd.getText();
                    xmlMap.put(nd.getName(), nd.getText());
                    
                }
            }catch(exception e){
                system.debug(e);
                clearText();
            }
            for(string xml : xmlMap.keyset()){
                system.debug(xml+' ==> '+xmlMap.get(xml));
            }
            
        }
        
    }
    public void clearText(){
        xmlString = '';
        parsedString = '';
    }
}