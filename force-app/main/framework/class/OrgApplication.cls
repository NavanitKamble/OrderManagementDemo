public class OrgApplication {
    
    public class Service(){
        public static Object newInstance(Type serviceType){
             if(serviceType == IQuoteService.Class){
                return QuoteServiceFactory.getService();
             }
        }
    }    
}