public class Currency_Wrapper {
    //public String date{get;set;}
    public String base{get;set;}
    public Integer timestamp{get;set;}
    public rates rates{get;set;}
    public Boolean success{get;set;}
    public class rates{
        public Decimal GBP{get;set;}
        public Decimal INR{get;set;}
        public Decimal EUR{get;set;}
        public Decimal JPY{get;set;}
        public Decimal CNY{get;set;}
        public Decimal RUB{get;set;}
        public Decimal USD{get;set;}
        public Decimal SGD{get;set;}
    }
}