public class OrgApplication {
    
    public class Service{
        public Object newInstance(Type serviceType){
             if(serviceType == IQuoteService.Class){
                return QuoteServiceFactory.getService();
             }else {
                return null;
             }
        
        }
    }
    
    public class Selector{
        public Object newInstance(Type selectorType){
            if(serviceType == QuoteSelector.Class){
                return new QuoteSelector();
            }
        }
    }
}