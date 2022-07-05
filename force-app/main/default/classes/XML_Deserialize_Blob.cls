public class XML_Deserialize_Blob {
    public blob xmlFile {get;set;}
    public void parseData(){
        blob file = blob.valueOf('<?xml version="1.0" encoding="UTF-8"?><Accounts><Account><Name>Edge Communications</Name><Phone>(512) 757-6000</Phone><Rating>Hot</Rating><Contacts><Contact><FirstName>Sean</FirstName><LastName>Forbessean@edge.com</LastName><Email /></Contact><Contact><FirstName>Seans</FirstName><LastName>Forbessean@edge.com</LastName><Email /></Contact><Contact><FirstName>Frans</FirstName><LastName>Fordssean@edge.com</LastName><Email /></Contact></Contacts></Account><Account><Name>Burlington Textiles Corp of America</Name><Phone>(336) 222-7000</Phone><Rating>Warm</Rating><Contacts><Contact><FirstName>Jack</FirstName><LastName>Rogersjrogers@burlington.com</LastName><Email /></Contact></Contacts></Account><Account><Name>Grand Hotels &amp; Resorts Ltd</Name><Phone>(312) 596-1000</Phone><Rating>Warm</Rating><Contacts><Contact><FirstName>Tim</FirstName><LastName>Barrbarr_tim@grandhotels.com</LastName><Email /></Contact><Contact><FirstName>John</FirstName><LastName>Bondbond_john@grandhotels.com</LastName><Email /></Contact></Contacts></Account><Account><Name>United Oil &amp; Gas Corp.</Name><Phone>(212) 842-5500</Phone><Rating>Hot</Rating><Contacts><Contact><FirstName>Stella</FirstName><LastName>Pavlovaspavlova@uog.com</LastName><Email /></Contact><Contact><FirstName>Avi</FirstName><LastName>Greenagreen@uog.com</LastName><Email /></Contact><Contact><FirstName>Arthur</FirstName><LastName>Songasong@uog.com</LastName><Email /></Contact><Contact><FirstName>Lauren</FirstName><LastName>Boylelboyle@uog.com</LastName><Email /></Contact></Contacts></Account><Account><Name>Express Logistics and Transport</Name><Phone>(503) 421-7800</Phone><Rating>Cold</Rating><Contacts><Contact><FirstName>Josh</FirstName><LastName>Davisj.davis@expressl&amp;t.net</LastName><Email /></Contact><Contact><FirstName>Babara</FirstName><LastName>Levyb.levy@expressl&amp;t.net</LastName><Email /></Contact></Contacts></Account><Account><Name>University of Arizona</Name><Phone>(520) 773-9050</Phone><Rating>Warm</Rating><Contacts><Contact><FirstName>Jane</FirstName><LastName>Greyjane_gray@uoa.edu</LastName><Email /></Contact></Contacts></Account><Account><Name>GenePoint</Name><Phone>(650) 867-3450</Phone><Rating>Cold</Rating><Contacts><Contact><FirstName>Edna</FirstName><LastName>Frankefrank@genepoint.com</LastName><Email /></Contact></Contacts></Account><Account><Name>TCS</Name><Phone>99556622</Phone><Rating>Warm</Rating></Account><Account><Name>PageReference001</Name><Phone>99556622</Phone><Rating>Warm</Rating></Account><Account><Name>TestExtension</Name><Phone>99889988</Phone><Rating>Warm</Rating></Account><Account><Name>Test</Name><Phone>9955566</Phone><Rating>Hot</Rating></Account><Account><Name>Google</Name><Phone>(995) 522-1144</Phone><Rating>Hot</Rating></Account><Account><Name>MangoDB</Name><Phone>99556622</Phone><Rating>Hot</Rating></Account><Account><Name>Nokia</Name><Phone>5566221</Phone><Rating>Hot</Rating></Account><Account><Name>Samsung</Name><Phone>22001144</Phone><Rating>Cold</Rating></Account><Account><Name>Amul</Name><Phone>99556621</Phone><Rating>Hot</Rating></Account><Account><Name>ZOHO</Name><Phone>55662211</Phone><Rating>Warm</Rating></Account><Account><Name>Test_Des</Name><Phone>99988899</Phone><Rating>Cold</Rating></Account></Accounts>');
        string xmlString = xmlFile.toString();
        xmlFile = null;
        list<account> accList = new list<account>();
        list<contact> conList = new list<contact>();
        DOM.Document doc = new DOM.Document();
        doc.load(xmlString);
        DOM.XmlNode root = doc.getRootElement();
        list<DOM.XmlNode> parent_nodes = root.getChildElements();
        for(DOM.XmlNode nodes : parent_nodes){
            account ac = new account();
            contact cn = new contact();
            if(nodes.getName() == 'Account'){
                list<DOM.XmlNode> inner_nodes = nodes.getChildElements();
                for(DOM.XmlNode in_node : inner_nodes){
                    if(in_node.getName() == 'Name'){
                        ac.name = in_node.getText();
                    }
                    if(in_node.getName() == 'Phone'){
                        ac.phone = in_node.getText();
                    }
                    if(in_node.getName() == 'Rating'){
                        ac.Rating = in_node.getText();
                    }                   
                    system.debug('Kay ==> '+in_node.getName());
                    system.debug('Value ==> '+in_node.getText());
                    if(in_node.getName() == 'Contacts'){
                        list<DOM.XmlNode> inner_contact = in_node.getChildElements();
                        for(DOM.XmlNode cons : inner_contact){
                            //system.debug('Contact_Key ==> '+cons.getName());
                            //system.debug('Contact Value ==> '+cons.getText());
                            if(cons.getName() == 'Contact'){
                                list<DOM.XmlNode> contacts = cons.getChildElements();
                                for(DOM.XmlNode con : contacts){
                                    if(con.getName() == 'firstName'){
                                        cn.firstName = con.getText();
                                    }
                                    if(con.getName() == 'lastName'){
                                        cn.lastName = con.getText();
                                    }
                                    if(con.getName() == 'email'){
                                        cn.email = con.getText();
                                    }
                                    system.debug('Key ==> '+con.getName());
                                    system.debug('Value ==> '+con.getText());
                                }
                            }
                        }
                    }
                    
                }
            }
            accList.add(ac);
            conList.add(cn);
            //system.debug('key ==>'+nodes.getName());
            //system.debug('Value ==>'+nodes.getText());
            //system.debug('Value ==>'+nodes.getChildElements());
            system.debug('===========================');
        }
        if(!accList.isEmpty()){
            insert accList;
            apexPages.addMessage(new apexPages.Message(apexpages.Severity.CONFIRM, 'Success'));
        }
        integer cin = 0;
        if(!conList.isEmpty()){
            for(contact con: conList){
                for(integer i = 0; i<conList.size(); i++){                    
                    con.accountid = accList[cin].id;
                    cin++;
                    break;
                }
            }
            database.insert(conList,false);
        }
    }
}