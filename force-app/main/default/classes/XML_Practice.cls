public class XML_Practice {
    public string out_xml {set;get;}
    public XML_Practice(){
        DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('root', 'https://www.google.com', 'SDL');
        DOM.XmlNode status = root.addChildElement('Status', null, null);
        status.addTextNode('Success');
        DOM.XmlNode code = root.addChildElement('Code', null, null);
        code.addTextNode('200');
        DOM.XmlNode account = root.addChildElement('Account', null, null);
        DOM.XmlNode account_2 = root.addChildElement('Account', null, null);
        DOM.XmlNode name = account.addChildElement('Name',null,null);
        name.addTextNode('XML');
        DOM.XmlNode rating = account.addChildElement('Rating',null, null);
        rating.addTextNode('Hot');
        Dom.XmlNode name_2 = account_2.addChildElement('Name',null,null);
        name_2.addTextNode('DOM');
        DOM.XmlNode rating_2 = account_2.addChildElement('Rating',null,null);
        rating_2.addTextNode('Warm');
        
        out_xml = doc.toXmlString();
    }
    public void xml_prc_1(){
        DOM.Document doc = new DOM.document();
        DOM.XmlNode root = doc.createRootElement('page',null,null);
        DOM.XmlNode block = root.addChildElement('block',null,null);
        DOM.XmlNode sec_1 = block.addChildElement('section',null,null);
        sec_1.addTextNode('Kiran');
        DOM.XmlNode sec_2 = block.addChildElement('section',null,null);
        sec_2.addTextNode('Katore');
        DOM.XmlNode sec_3 = block.addChildElement('section',null,null);
        DOM.XmlNode item = sec_3.addChildElement('Item',null,null);
        item.addTextNode('XML');
        
        string xmtString = doc.toXmlString();
        out_xml = doc.toXmlString();
        system.debug(xmtString);
        
    }
    public void accountXML(){
        list<account> accounts = [select id, name, phone, rating, (select firstName, lastName,email from contacts where email <> null and firstName <> null) from account where phone <> null and rating <> null];
        DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Accounts', null, null);
        for(account acc: accounts){
            DOM.XmlNode account = root.addChildElement('Account', null, null);
            DOM.xmlNode detail_1 = account.addChildElement('Name', null, null);
            DOM.XmlNode detail_2 = account.addChildElement('Phone', null, null);
            DOM.XmlNode detail_3 = account.addChildElement('Rating',null, null);
            detail_1.addTextNode(acc.name);
            detail_2.addTextNode(acc.Phone);
            detail_3.addTextNode(acc.Rating);
            if(!acc.contacts.isEmpty()){
                DOM.XmlNode conts = account.addChildElement('Contacts',null, null);
                for(contact con : acc.contacts){
                    DOM.XmlNode cn = conts.addChildElement('Contact',null, null);
                    DOM.XmlNode c_det_1 = cn.addChildElement('FirstName',null, null);
                    DOM.XmlNode c_det_2 = cn.addChildElement('LastName',null, null);
                    DOM.XmlNode c_det_3 = cn.addChildElement('Email',null, null);
                    c_det_1.addTextNode(con.FirstName);
                    c_det_2.addTextNode(con.LastName);
                    c_det_2.addTextNode(con.Email);
                }
            }
        }
        out_xml = doc.toXmlString();
        
    }
    
}