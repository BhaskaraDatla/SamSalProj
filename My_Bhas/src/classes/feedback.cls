@RestResource(urlMapping='/feedbacks/*')
global with sharing class feedback{

 @HttpPost
    global static PostResponseWrapper doPost(RequestWrapper rqst) {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        PostResponseWrapper response = new PostResponseWrapper();
        
        try {
            insert rqst.crs;
            response.crs= rqst.crs;

            for(Participation__c par: rqst.pList) {
                  par.Courses__c  = rqst.crs.Id;
            }
            
            insert rqst.pList;
            response.pList = rqst.pList;
            
            response.status = 'Success';
            response.message = 'Feedback have been created successfully';
        }
        catch(Exception exc) {
            res.StatusCode = 500;
            response.crs= null;
            response.pList= null;
            response.status = 'Error';
            response.message = 'Your request failed with the following error: ' + exc.getMessage();
        }
        
        return response;
    }
    
    
     global class RequestWrapper {
        Course__c crs;
        List<Participation__c> pList;
 
    }
    
    global class PostResponseWrapper {
        Course__c crs;
        List<Participation__c> pList;
        String status;
        String message;
        
        public PostResponseWrapper(){
            
        }
    }
    
  }