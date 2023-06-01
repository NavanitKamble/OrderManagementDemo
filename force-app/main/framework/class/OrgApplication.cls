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
}