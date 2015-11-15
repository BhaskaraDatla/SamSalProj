public class VatApiController {

   // VatApi key
  public String apiKey = 'bcbc4de70d413271a67880ee21a4c4ba'; 
     // VatApi endpoint
  public String endPoint = 'https://vatapi.com/v1/vat-rates';

   public String getVatRates() {
     String json;
       HttpRequest req = new HttpRequest();
       Http http = new Http();
       // set the method
       req.setMethod('GET');
       // add the endpoint to the request
       req.setEndpoint(endPoint);
       //set 
       req.setHeader('Apikey', apiKey );
       // create the response object
       HTTPResponse resp = http.send(req);
       // the geocoding service is returning a line feed so parse it out
       json = resp.getBody().replace('\n', '');
    
    System.debug('json : '+ json);
       
    return json ;
  }
  
  /*  Test code to check values :
  
  VatApiController avpi = new VatApiController();
  system.debug('Vat API : ' + avpi.getVatRates());
  
  
  */
   public class Countries{
        public Country con {get; set;}
        public Map<String,List<Code>> codeMap {get; set;}

        public Countries(Country cont) {
            con = cont;
        }
    }
   public class Code{
        public string Name {get; set;}
        public string Rates {get; set;}
   }
   public class Country{
        public string Standard {get; set;}
        public string values {get; set;}
   }    
  
  
  
  }