public with sharing class AccountWeatherController {
    
    public String city {get;set;}
    public String temp {get;set;}
    public String pressure {get;set;}
    public String humidity {get;set;}
    public String temp_min {get;set;}
    public String temp_max {get;set;}
    
    
    public AccountWeatherController(ApexPages.StandardController controller) {
        Account account = (Account)controller.getRecord();
        account = [Select id,shippingcity From Account where Id =: account.Id];
        Http http = new Http();
        httpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        httpresponse response = http.send(request);
        
        //response is succesful
        
        if(response.getStatusCode()== 200){
            Map<string,object> result = (Map<string,object>) JSON.deserializeUntyped(response.getbody()) ;
            List<string> Mainresult = (List<string>)(result.get('animals'));
            system.debug(Mainresult);
            //temp = string.valueof(Mainresult.get('temp'));
            //Pressure = string.valueof(Mainresult.get('Pressure'));
            //Humidity  = string.valueof(Mainresult.get('humidity'));
            //temp_min = string.valueof(Mainresult.get(temp));
            //temp = string.valueof(Mainresult.get(temp));
        }
    }
    
}