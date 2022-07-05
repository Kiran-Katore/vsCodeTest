public class postal_wrapper{
    public String Status{get;set;}
    public list<PostOffice> PostOffice{get;set;}
    public String Message{get;set;}
    public class PostOffice{
        public String District{get;set;}
        public String Division{get;set;}
        public String Circle{get;set;}
        public String Region{get;set;}
        public String DeliveryStatus{get;set;}
        public String Block{get;set;}
        public String BranchType{get;set;}
        public String State{get;set;}
        public String Description{get;set;}
        public String Country{get;set;}
        public String Name{get;set;}
        public String Pincode{get;set;}
    }
}