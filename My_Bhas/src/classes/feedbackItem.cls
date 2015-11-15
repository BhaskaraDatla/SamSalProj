@RestResource(urlMapping='/feedbackItems/*')
global with sharing class feedbackItem{

 @HttpPost
    global static PostResponseWrapper doPost(RequestWrapper rqs) {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        PostResponseWrapper response = new PostResponseWrapper();
        List<Course__c> cList = new List<Course__c>();
        List<Participation__c> pList = new List<Participation__c>();
        try {
          //  for(RequestWrapper fbw: rqstList) {
                for(FeedbackWrapper fbr: rqs.feedbackWrapperList) {
                      cList.add(fbr.crs);
                      for(Participation__c par :fbr.pList){
                              Course__c cReference = new Course__c(
                                                            External_ID__c=fbr.crs.External_ID__c);  
                              par.Courses__c  = cReference.Id;
                              pList.add(par);
                      }
                }
            // }    
            insert cList;
            insert pList;
           // response.pList = rqst.pList;
            response.status = 'Success';
            response.message = 'Feedback have been created successfully';
        }
        catch(Exception exc) {
            res.StatusCode = 500;
            //response.crs= null;
           // response.pList= null;
            response.status = 'Error';
            response.message = 'Your request failed with the following error: ' + exc.getMessage();
        }
        
        return response;
    }
    
    
     global class RequestWrapper {
        List<FeedbackWrapper> feedbackWrapperList;
     }
    global class FeedbackWrapper {
        Course__c crs;
        List<Participation__c> pList;
 
    }
    global class PostResponseWrapper {
        List<FeedbackWrapper> feedbackWrapperList;
        String status;
        String message;
        
        public PostResponseWrapper(){
            
        }
    }
    
  }