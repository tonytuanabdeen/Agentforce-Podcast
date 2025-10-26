public class CurrencyConvertionService {
    
    private static final String API_KEY = '3e8f5386df8af2c8f20518ed';

    /**
     * Service Request DAO
	 */
    public class ServiceRequest {
        @InvocableVariable(required=true description='Base Currency')
        public String baseCurrency;
        
        @InvocableVariable(required=true description='Target Currency')
        public String targetCurrency;
        
        @InvocableVariable(required=true description='Amount for conversion')
        public Decimal amount;
    }       
    
    /**
     * Currency Convert Function
     * @param List<ServiceRequest> request
     * @response List<Decimal> 
	 */
    @InvocableMethod(label='Convert Currency' callout=true)
    public static List<Decimal> convert (List<ServiceRequest> requests) {
        ServiceRequest request = (requests != null) ? requests[0] : new ServiceRequest();
        
        String endpoint = 'https://v6.exchangerate-api.com/v6/'+ API_KEY +'/pair/'+ request.baseCurrency +'/'+ request.targetCurrency +'/'+ request.amount +'';
        
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        
        List<Decimal> responses = new List<Decimal>();
        
        try {
            Http http = new Http();
            HttpResponse res = http.send(req);
            
            if(res.getStatusCode() == 200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                              
                Decimal conversionResult = (Decimal)results.get('conversion_result');                                
                responses.add(conversionResult);
            }
            
        } catch (Exception e) {
            system.debug('*** Exception = ' + e.getMessage());
        }
        
        system.debug('*** responses = ' + responses);
        return responses;
    }
}