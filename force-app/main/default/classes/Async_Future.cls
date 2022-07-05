public class Async_Future implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        string ac = 'select id, name from account';
        system.debug('start run querylocator ==> '+database.getQueryLocator(ac));
        system.debug('start bc ==> '+bc);
        
        return database.getQueryLocator(ac);
        //ac.isEmpty()
    }   
    public void execute(Database.batchableContext bc, list<SObject> ls){
        system.debug('execute called ==> '+ls.size());
        system.debug('execute bc ==> '+bc);
        for(sObject a: ls){
            account b = (account) a;
            b.billingCountry = 'IND';
            //update b;
            //blob.t
        }
    }
    public void finish(database.BatchableContext bc){
        system.debug('finish called ==> '+bc.getJobId());
        asyncapexjob batchStatus = [select id, jobitemsProcessed, totalJobItems, status from asyncapexjob where id =: bc.getJobId()];
        system.debug('finish ==> '+batchStatus);
        /*
        Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        string[] toAddresses = new string[]{'katoresfdc@gmail.com'};
        msg.setToAddresses(toAddresses);
        string subject = 'Account Batch Is Completed';
        msg.setSubject(subject);
        String replayTo = 'Sfdc@mail.com';
        msg.setReplyTo(replayTo);
        string body = '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://as1.ftcdn.net/v2/jpg/04/12/07/02/1000_F_412070229_fS1aTpPDw2Ey1El4AsmjBTyYjAGzNngt.jpg" alt="" width="200" height="200" /></p><p>Hi Dear,&nbsp;<br />&nbsp;<br />This is with reference to the PMS support desk available on&nbsp; shared link between 10am -12pm&nbsp; and 4pm-6pm.&nbsp;<br />&nbsp;<br />Kindly take a note this desk will not be available today 6<sup>th</sup>&nbsp;May 2022. Please refer PMS guide on ESS for any queries that you have . For technical issues if any faced the desk will be available on Mon at regular schedule.<br />&nbsp;</p><p>&nbsp;</p><table style="border-collapse: collapse; width: 84.6813%; height: 62px;" border="1"><tbody><tr><td style="width: 50%; text-align: center;">Batch Info</td><td style="width: 50.4783%; text-align: center;">'+bc.getJobId()+'</td></tr><tr><td style="width: 50%; text-align: center;">Job ID</td><td style="width: 50.4783%; text-align: center;">' +bc.getChildJobId()+'</td></tr><tr><td style="width: 50%; text-align: center;">'+batchStatus.TotalJobItems+'</td><td style="width: 50.4783%; text-align: center;">'+batchStatus.Status+'</td></tr></tbody></table><p><br />&nbsp;<br /><strong>Regards</strong><br /><strong>HR Communication.</strong></p>';
        msg.htmlbody = body;
        string pdf_body = '<p><apex:image id="Logo" value="{!Resource.logo}" />.</p><p>Hi Dear,&nbsp;<br />&nbsp;<br />This is with reference to the PMS support desk available on&nbsp; shared link between 10am -12pm&nbsp; and 4pm-6pm.&nbsp;<br />&nbsp;<br />Kindly take a note this desk will not be available today 6<sup>th</sup>&nbsp;May 2022. Please refer PMS guide on ESS for any queries that you have . For technical issues if any faced the desk will be available on Mon at regular schedule.<br />&nbsp;</p><p>&nbsp;</p><table style="border-collapse: collapse; width: 84.6813%; height: 62px;" border="1"><tbody><tr><td style="width: 50%; text-align: center;">Batch Info</td><td style="width: 50.4783%; text-align: center;">+bc.getJobId()+</td></tr><tr><td style="width: 50%; text-align: center;">Job ID</td><td style="width: 50.4783%; text-align: center;"></td></tr><tr><td style="width: 50%; text-align: center;">+batchStatus.TotalJobItems+</td><td style="width: 50.4783%; text-align: center;">+batchStatus.Status+</td></tr></tbody></table><p><br />&nbsp;<br /><strong>Regards</strong><br /><strong>HR Communication.</strong></p>';

        string pdfBody = '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://as1.ftcdn.net/v2/jpg/04/12/07/02/1000_F_412070229_fS1aTpPDw2Ey1El4AsmjBTyYjAGzNngt.jpg" alt="" width="200" height="200" /></p>'
                            +'<p>Hi Dear,&nbsp;<br />&nbsp;<br />This is with reference to the PMS support desk available on&nbsp; shared link between 10am -12pm&nbsp; and 4pm-6pm.&nbsp;<br />&nbsp;<br />Kindly take a note this desk will not be available today 6<sup>th</sup>&nbsp;May 2022. Please refer PMS guide on ESS for any queries that you have . For technical issues if any faced the desk will be available on Mon at regular schedule.<br />&nbsp;</p>'
                            +'<p>&nbsp;</p>'
                            +'<table style="border-collapse: collapse; width: 84.6813%; height: 62px;" border="1">'
                            +'<tbody>'
                            +'<tr>'
                            +'<td style="width: 50%; text-align: center;">Test</td>'
                            +'<td style="width: 50.4783%; text-align: center;">Mail</td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td style="width: 50%; text-align: center;">Job ID</td>'
                            +'<td style="width: 50.4783%; text-align: center;">Records</td>'
                            +'</tr>'
                            +'<tr>'
                            +'<td style="width: 50%; text-align: center;">Rec</td>'
                            +'<td style="width: 50.4783%; text-align: center;">Pass</td>'
                            +'</tr>'
                            +'</tbody>'
                            +'</table>'
                            +'<p><br />&nbsp;<br /><strong>Regards</strong><br /><strong>HR Communication.</strong></p>';
        
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setFileName(bc.getJobId()+'.pdf');
        attach.setContentType('Application/pdf');
        attach.setBody(blob.toPdf(pdf_body));
        
       	list<Messaging.EmailFileAttachment> lstAttach = new list<Messaging.EmailFileAttachment>();
        lstAttach.add(attach);
        
        msg.setFileAttachments(lstAttach);
        
        list<Messaging.SingleEmailMessage> lstMsg = new list<Messaging.SingleEmailMessage>();
        lstMsg.add(msg);
        Messaging.SendEmailResult[] rs =  Messaging.sendEmail(lstMsg);
        system.debug('email result ==> '+rs);
         */   
            
            
    }
}