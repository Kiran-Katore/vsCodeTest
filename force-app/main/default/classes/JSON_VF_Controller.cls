public class JSON_VF_Controller {
    public string input_value {set;get;}
    public string input_object {set;get;}
    public integer input_num {set;get;}
    public string out_value {set;get;}
    public string out_obj {set;get;}
    public string out_num {set;get;}
    public boolean render_Result {set;get;}
    
    public void convert_data(){
        account acc;
        out_value = JSON.serialize(input_value);
        out_num = JSON.serialize(input_num);
        if(!string.isBlank(input_object)){
            input_object = '%'+input_object+'%';
            acc = [select id, name, rating from account where name like :input_object limit 1];
        }
        out_obj = JSON.serialize(acc);
        render_Result = true;
        input_value = null;
        input_num = null;
        input_object = null;
    }
}