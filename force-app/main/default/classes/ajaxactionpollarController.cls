public with sharing class ajaxactionpollarController {
    public string time_value {get;set;}
    public static integer value {get;set;}
    public integer interval = 5;
    public static boolean start_counter {get;set;}
    
    public void featchTime(){
        
            value = (Integer.valueof(time_value)*60)-interval;
            interval=interval + 5;
            start_counter = true;
        
    }
    public void changeStart(){
        
        start_counter = true;
        //featchTime();
    }
}