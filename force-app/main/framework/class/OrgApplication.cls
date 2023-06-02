public class OrgApplication {
    
    public class Service{
        public Object newInstance(Type serviceType) {
             if(serviceType == IQuoteService.class) {
                return QuoteServiceFactory.getService();
             } else if(serviceType == AccountService.class) {
                return new AccountService();
             } else {
                return null;
             }
        }
    }
    
    public class Selector{
        public Object newInstance(Type selectorType){
            if(selectorType == QuoteSelector.class){
                return new QuoteSelector();
            } else 
            if(selectorType == AccountSelector.class){
                return new AccountSelector();
            } else {
                return null;
            }
        }
    }
}