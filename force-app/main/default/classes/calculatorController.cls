public class calculatorController {
    public string valueA {get;set;}
    public string valueB {get;set;}
    public integer result {set;get;}
    public boolean visible {set;get;}
    
    public void add(){
        result = Integer.valueof(ValueA) + Integer.valueof(ValueB);
        visible = true;
    }
    public void sub(){
        result = Integer.valueof(ValueA) - Integer.valueof(ValueB);
        visible = true;
    }
    public void mul(){
        result = Integer.valueof(ValueA) * Integer.valueof(ValueB);
        visible = true;
    }
    public void div(){
        result = Integer.valueof(ValueA) / Integer.valueof(ValueB);
        visible = true;
    }
    public void reset(){
        result = null;
        ValueA = null;
        ValueB = null;
        visible = false;
    }
}