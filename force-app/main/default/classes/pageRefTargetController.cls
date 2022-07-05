public with sharing class pageRefTargetController {
    public pageReference preCall(){
        PageReference pef = new pageReference('/apex/pageReferancePage');
        pef.setRedirect(true);
        return pef;
    }

}