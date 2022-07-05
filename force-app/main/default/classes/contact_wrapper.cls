public class contact_wrapper{
    public list<results> results{get;set;}
    public info info{get;set;}
    public class timezone{
        public String offset{get;set;}
        public String description{get;set;}
    }
    public class street{
        public String name{get;set;}
        public Integer numbers{get;set;}
    }
    public class results{
        public dob dob{get;set;}
        public registered registered{get;set;}
        public String phone{get;set;}
        public login login{get;set;}
        public String cell{get;set;}
        public String email{get;set;}
        public id id{get;set;}
        public location location{get;set;}
        public picture picture{get;set;}
        public name name{get;set;}
        public String nat{get;set;}
        public String gender{get;set;}
    }
    public class registered{
        public Integer age{get;set;}
        public String dates{get;set;}
    }
    public class picture{
        public String large{get;set;}
        public String thumbnail{get;set;}
        public String medium{get;set;}
    }
    public class name{
        public String last{get;set;}
        public String first{get;set;}
        public String title{get;set;}
    }
    public class login{
        public String sha1{get;set;}
        public String salt{get;set;}
        public String md5{get;set;}
        public String password{get;set;}
        public String sha256{get;set;}
        public String username{get;set;}
        public String uuid{get;set;}
    }
    public class location{
        public timezone timezone{get;set;}
        public String country{get;set;}
        public String state{get;set;}
        public Integer postcode{get;set;}
        public String city{get;set;}
        public coordinates coordinates{get;set;}
        public street street{get;set;}
    }
    public class info{
        public Integer page{get;set;}
        public Integer results{get;set;}
        public String version{get;set;}
        public String seed{get;set;}
    }
    public class id{
        public String name{get;set;}
        public String value{get;set;}
    }
    public class dob{
        public String dates{get;set;}
        public Integer age{get;set;}
    }
    public class coordinates{
        public String longitude{get;set;}
        public String latitude{get;set;}
    }
}