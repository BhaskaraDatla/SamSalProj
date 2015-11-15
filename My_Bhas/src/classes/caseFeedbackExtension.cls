public with sharing class caseFeedbackExtension{

    public Case theCase {get; set;}
    public String caseIdValue {get; set;}
    public Contact cont {get;set;}
    public String isInserted {get;set;}


    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public caseFeedbackExtension(ApexPages.StandardController stdController) {

       Id caseId = ((Case)stdController.getRecord()).Id;
        system.debug('caseId...'+caseId);
        
        cont = new Contact();
        isInserted = 'false';
            
        //check if it is new Case 
        if(caseId != null) {
            this.theCase = [SELECT ID
                                  ,SuppliedEmail
                                  ,Account.Name
                                  ,Account.Phone
                                  ,AccountId
                                  ,Account.ShippingCountry
                                  ,Account.ShippingCity
                                  ,Account.ShippingState
                                  ,Account.ShippingStreet
                                  ,Account.ShippingPostalCode
                                  ,Contact.FirstName
                                  ,Contact.LastName
                                  ,Contact.Email
                                  ,Contact.Phone
                            FROM Case 
                            WHERE Id = :caseId];
        }
            
    }

            
    public void CaseDetails() {
    
    //check if it is new Case 
        if(caseIdValue != null) {
            this.theCase = [SELECT ID
                                  ,CaseNumber
                                  ,SuppliedEmail
                                  ,Account.Name
                                  ,Account.Phone
                                  ,AccountId
                                  ,Account.ShippingCountry
                                  ,Account.ShippingCity
                                  ,Account.ShippingState
                                  ,Account.ShippingStreet
                                  ,Account.ShippingPostalCode
                                  ,Contact.FirstName
                                  ,Contact.LastName
                                  ,Contact.Email
                                  ,Contact.Phone
                            FROM Case 
                            WHERE Id = :caseIdValue];
        }
    }
}