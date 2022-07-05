public with sharing class pageRefController {
    
    public pageReference callPage(){
        PageReference pf = new PageReference('/apex/pageRefTargetPage');
        pf.setRedirect(true);
        return pf;
    }
}