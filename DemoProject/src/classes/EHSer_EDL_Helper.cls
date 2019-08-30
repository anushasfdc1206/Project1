/**
* This class contains wrappers and methods for performing making callout
* and handling received response.
*
* A wrapper or container class is a class, a data structure,
* or an abstract data type which contains different objects
* or collection of objects as its members.
* 
* An Apex callout enables you to tightly integrate your Apex
* with an external service by making a call to an external Web service
* or sending a HTTP request from Apex code and then receiving the response.
* Apex provides integration with Web services that utilize
* SOAP, WSDL, or HTTP services (RESTful services).
* 
* Apex provides several built-in class to work with
* HTTP services and create HTTP requests like
* GET, POST, PUT, and DELETE.
*
* See the Apex Language Reference for more information about Callouts.
*/


public without sharing class EHSer_EDL_Helper {
    //
    
    // detail card wrapper
    public class detailPageCardMainWrapper{
        @AuraEnabled public list<detailPageCardWrapper> detailPageWrap;
        @AuraEnabled public string objectName;
        @AuraEnabled public string iconName;
        @AuraEnabled public string objectSecondHeader;
        
        public detailPageCardMainWrapper(){
            this.detailPageWrap = new list<detailPageCardWrapper>();
            this.objectName = '';
            this.iconName = EHSer_Constants.CONS_ICON_NAME;
            this.objectSecondHeader = '';
        }
    }
    
    // detail page card wrapper
    public class detailPageCardWrapper{
        @AuraEnabled public boolean isLink;
        @AuraEnabled public boolean isCurrency;
        @AuraEnabled public string label;
        @AuraEnabled public object value;
        @AuraEnabled public string detailId;
        @AuraEnabled public string detailLinkDefaultValues;
        @AuraEnabled public boolean isPercentage;
        
        public detailPageCardWrapper(){
            this.isCurrency = false;
            this.isLink = false;
            this.label = '';
            this.value = null;
            this.detailId = '';
            this.detailLinkDefaultValues = '';
            this.isPercentage=false;
        }
    }
    
    // table wrapper
    public class TablePageWrapper{
        @AuraEnabled public List<DataTableColumns> lstDataTableColumns;
        @AuraEnabled public List<Object> lstDataTableData;
        @AuraEnabled public string iconName;
        @AuraEnabled public string objectHeader;
        @AuraEnabled public string objectSecondHeader;
        @AuraEnabled public string subTabName;
        @AuraEnabled public boolean errorFlag;
        @AuraEnabled public string errorMessage;
        @AuraEnabled public integer totalCnt;
        
        public TablePageWrapper(){
            this.lstDataTableColumns = new List<DataTableColumns>();
            this.lstDataTableData = new List<Object>();
            this.iconName = EHSer_Constants.CONS_ICON_NAME;
            this.objectHeader = '';
            this.objectSecondHeader = '';
            this.subTabName = '';
            this.errorFlag = false;
            this.errorMessage = '';
            this.totalCnt=0;
        }
    }
    
    // table columns wrapper
    public class DataTableColumns{
        @AuraEnabled public String label;
        @AuraEnabled public String fieldName;
        @AuraEnabled public String type;
        @AuraEnabled public Boolean sortable;
        @AuraEnabled public object typeAttributes;
        @AuraEnabled public object cellAttributes;
        //@AuraEnabled public integer initialWidth;
        @AuraEnabled public boolean isWrapTextDisabled;
        
        public DataTableColumns(String label, String fieldName, String type, Boolean sortable, object cellAttributes, object typeAttributes, boolean isWrapTextDisabled){
            this.label = label;
            this.fieldName = fieldName;
            this.type = type; 
            this.sortable = sortable;
            this.cellAttributes = cellAttributes;
            this.typeAttributes = typeAttributes;
            //this.initialWidth = initialWidth;
            this.isWrapTextDisabled = isWrapTextDisabled;
        }
    }
    
    // typeAttributes definition wrapper for date
    public class typeDateWrapper{
        @AuraEnabled public labelWrapper label;
        @AuraEnabled public string year;
        @AuraEnabled public string month;
        @AuraEnabled public string day;        
        public typeDateWrapper(){
            this.label = null;
            this.year = EHSer_Constants.CONS_YEAR;
            this.month = EHSer_Constants.CONS_2_DIGIT;
            this.day = EHSer_Constants.CONS_2_DIGIT;
        }
    }
    
    // type Attributes definition wrapper for currency
    public class typeCurrencyWrapper{
        @AuraEnabled public string currencyCode;
        
        public typeCurrencyWrapper(){
            this.currencyCode = EHSer_Constants.CONS_CURRENCY_CODE;
        }
    }
    
    // typeAttributes definition wrapper for button or url
    public class typeWrapper{
        @AuraEnabled public labelWrapper label;
        @AuraEnabled public string name;
        @AuraEnabled public string variant;
        @AuraEnabled public labelWrapper disabled; 
        @AuraEnabled public labelWrapper title;
        public typeWrapper(){
            this.label = null;
            this.name = '';
            this.variant = EHSer_Constants.CONS_TABLE_BUTTONVARIANT;
            this.disabled = null;
            this.title = null;
        }
    }
    
    // labelWrapper used in typeAttributes definition
    public class labelWrapper{
        @AuraEnabled public string fieldName;
        public labelWrapper(){
            this.fieldName = '';
        }
    }
    
    // cellAttributes wrapper
    public class cellWrapper{
        @AuraEnabled public string alignment;
        
        public cellWrapper(){
            this.alignment = '';
        }
    }
    
    
    // doInit wrapper.. must be updated as per latest UI changes
    public class initialWrapper{
        @AuraEnabled public string uiType;
        @AuraEnabled public List<EDL_Request_Attributes__mdt> filterList;
        @AuraEnabled public EDL_Master_Attributes__mdt edlMasterAttribute;
        @AuraEnabled public TablePageWrapper tableContent;
        @AuraEnabled public Object CardParameters;
        @AuraEnabled public Object cardContent;
        @AuraEnabled public string iconName;
        @AuraEnabled public string errorMessage;
        @AuraEnabled public boolean errorFlag;
        //swathi
        @AuraEnabled public  map<integer,map<string,object>> mapResponse;
        
        public initialWrapper(){
            this.uiType = '';
            this.filterList = new List<EDL_Request_Attributes__mdt>();
            this.edlMasterAttribute = new EDL_Master_Attributes__mdt();
            this.tableContent = new TablePageWrapper();
            this.CardParameters = null;
            this.cardContent = null;
            this.iconName = EHSer_Constants.CONS_ICON_NAME;
            this.errorMessage = '';
            this.errorFlag = false;
            //swathi
            this.mapResponse = new map<integer,map<string,object>>();
        }
    }
    // button wrapper for detial page button Options
    public class buttonOptions{
        @AuraEnabled public string buttonLabel;
        @AuraEnabled public string softheonServiceName;
        @AuraEnabled public string actionName;
        @AuraEnabled public string valueSet;
        @AuraEnabled public string entityName;
        @AuraEnabled public boolean disabled;
        //SER-4761 on clicking button open as sub tab
       // @AuraEnabled public boolean isSubtab;
       // @AuraEnabled public string subtabTitle;
        public buttonOptions(string buttonLabel, string softheonServiceName, string actionName, string valueSet,string entityName, boolean disabled){
            this.buttonLabel = buttonLabel;
            this.softheonServiceName = softheonServiceName;
            this.actionName = actionName;
            this.valueSet = valueSet;
            this.entityName = entityName;
            this.disabled = disabled;
            //this.isSubtab=isSubtab;
            //this.subtabTitle=subtabTitle;
        }
    }
    
    // line items
    public class lineDetailsWrapper{
        @AuraEnabled public boolean isDetail;
        @AuraEnabled public boolean isTable;
        @AuraEnabled public boolean isCard;
        @AuraEnabled public boolean enableFooterAction;
        @AuraEnabled public boolean enableSearchBox;
        @AuraEnabled public boolean hideFilter;
        @AuraEnabled public boolean showOnlyDate;
        @AuraEnabled public boolean showOnlySearchBox;
        @AuraEnabled public boolean noDateRestriction;
        @AuraEnabled public boolean showRowNumber;
        @AuraEnabled public integer dataSize;
        @AuraEnabled public integer columnSize;
        @AuraEnabled public string defaultSortAttribute;
        @AuraEnabled public string defaultValues;
        @AuraEnabled public string parentValue;
        @AuraEnabled public string lineServiceName;
        @AuraEnabled public string sectionHeader;
        @AuraEnabled public string excludeFromFilter;
        @AuraEnabled public string sortedDirection;
        @AuraEnabled public string keyVal;
        @AuraEnabled public boolean isleftColumn;
        
        
        public lineDetailsWrapper(){
            this.isDetail = false;
            this.isTable = false;
            this.isCard = false;
            this.enableFooterAction = false;
            this.enableSearchBox = false;
            this.hideFilter = false;
            this.showOnlyDate = false;
            this.showOnlySearchBox = false;
            this.noDateRestriction = false;
            this.showRowNumber = false;
            this.dataSize = 1;
            this.columnSize = 2;
            this.defaultSortAttribute = '';
            this.defaultValues = '';
            this.parentValue = '';
            this.lineServiceName = '';
            this.sectionHeader = '';
            this.excludeFromFilter = '';
            this.sortedDirection='';
            this.keyVal='';
            this.isleftColumn=false;
        }
    }
    
    // detail page wrapper
    public class detailData{
        @AuraEnabled public string keyId;
        @AuraEnabled public string iconName;
        @AuraEnabled public string detailHeaderName;
        @AuraEnabled public list<detailPageCardWrapper> detailWrapper;
        @AuraEnabled public map<string,object> detailContent;
        @AuraEnabled public string objectHeader;
        @AuraEnabled public string objectSecondHeader;
        @AuraEnabled public string subTabName;
        @AuraEnabled public map<string, list<detailPageCardWrapper>> detailSection;
        @AuraEnabled public list<buttonOptions> softheonButtons;
        @AuraEnabled public list<buttonOptions> otherButtons;
        @AuraEnabled public list<lineDetailsWrapper> lineItems;
        @AuraEnabled public string brandMapping;
        @AuraEnabled public boolean errorFlag;
        @AuraEnabled public string errorMessage;
        
        public detailData(){
            this.keyId = '';
            this.iconName = '';
            this.detailHeaderName = '';
            this.detailWrapper = new list<detailPageCardWrapper>();
            this.detailContent = new map<string,object>();
            this.objectHeader = '';
            this.objectSecondHeader = '';
            this.subTabName = '';
            this.detailSection = new map<string,list<detailPageCardWrapper>>();
            this.softheonButtons = new list<buttonOptions>();
            this.otherButtons = new list<buttonOptions>();
            this.lineItems = new list<lineDetailsWrapper>();
            this.brandMapping = '';
            this.errorFlag = false;
            this.errorMessage = '';
        }
    }
    public static integer totalCount;
    /* Name : getInitialDataSet
* Purpose : retreives EDL data to display in snapshot
*/ 
    @AuraEnabled
    public static initialWrapper getInitialDataSet(string serviceName, String  attributes, String keyValue, integer dataSize, string filterType){
        
        // fetch request attributes
        List<EDL_Request_Attributes__mdt> dataList = [Select id,
                                                      EDL_Master_Attributes__c,
                                                      Order__c,
                                                      EDL_Master_Attributes__r.developerName,
                                                      Field_Data_Type__c,
                                                      Field_Values__c,
                                                      Is_Select_Field__c,
                                                      SFDC_Label__c,
                                                      Request_Paramters__c  from EDL_Request_Attributes__mdt
                                                      where EDL_Master_Attributes__r.developerName = :serviceName
                                                      ORDER BY Order__c LIMIT 20];
        system.debug('dataList::'+dataList);
        // initialize wrapper class
        EHSer_EDL_RequestBodyWrapper reqBody = new EHSer_EDL_RequestBodyWrapper();
        
        // set wrapper attributes
        reqBody.serviceName = serviceName;
        reqBody.dataSize = dataSize;
        
        // format input request attributes
        map<string,object> mapCond = (map<string,object>)JSON.deserializeUntyped(attributes);
        map<string,object> reqParamMap = (map<string,object>)mapCond.get(EHSer_Constants.CONS_MUST);
        
        // if data range present, set data parameters
        if(mapCond.keySet().contains(EHSer_Constants.CONS_DATERANGE)){
            map<string,object> dateRange = (map<string,object>)mapCond.get(EHSer_Constants.CONS_DATERANGE);
            reqBody.dateParameters = dateRange;
        }
        
        reqBody.requestMustParameters = reqParamMap;
        // get primary key
        reqBody.keyValue = keyValue;
        
        // set filter type
        reqBody.filterType = filterType;
        string reqQuery = reqBody.getRequestBody();
        String primaryKey = String.valueOf(reqParamMap.get(reqBody.masterAttribute.Response_Key_Id__c));
        reqBody.primaryKey = primaryKey;
        
        // using request body prepared by request attributes, service name
        // and master attribute, perform callout.
        // Store received structured response in list
        map<integer,map<string,object>> mapResponse =  makeCallout(reqQuery,reqBody);
        system.debug('mapResponse------------------>'+mapResponse);
        
        // initialize init wrapper
        initialWrapper initWrap = new initialWrapper();
        
        initWrap.filterList = dataList;  // filter options
        initWrap.iconName = reqBody.masterAttribute.IconName__c; // icon name
        initWrap.edlMasterAttribute = reqBody.masterAttribute; // input search place holder
        //swathi
        initWrap.mapResponse = mapResponse;
        // based on request type set response
        if(reqBody.masterAttribute.UI_Type__c == EHSer_Constants.CONS_CARD){
            // if card set card attributes
            EDL_Card_Attributes__mdt cardAttributes = [Select id,
                                                       EDL_Master_Attributes__c,
                                                       Action_Button_Name__c,
                                                       EDL_Master_Attributes__r.developerName,
                                                       Card_Title_Name__c, IsVertical__c,Column_Size__c,
                                                       Footer_Label_Name__c,
                                                       Icon_Name__c from EDL_Card_Attributes__mdt
                                                       where EDL_Master_Attributes__r.developerName = :serviceName LIMIT 50];
            // set ui type and card attributes
            initWrap.uiType = EHSer_Constants.CONS_CARD;
            initWrap.CardParameters=cardAttributes;
        }
        
        // set ui type for table
        if(reqBody.masterAttribute.UI_Type__c ==EHSer_Constants.CONS_DATATABLE){
            initWrap.uiType = EHSer_Constants.CONS_DATATABLE;
        }
        
        // if actual response is not empty set the wrappers
        if(filterType != EHSer_Constants.CONS_VIEWALL){
            if(!mapResponse.isEmpty()){
                // set card wrapper
                try{
                    initWrap.cardContent = getCardWrapper(mapResponse,reqBody);
                    initWrap.errorMessage = '';
                    initWrap.errorFlag = false;
                } catch(Exception e){
                    System.debug('Exception message: '+e.getMessage());
                    initWrap.cardContent = null;
                    initWrap.errorFlag = true;
                    initWrap.errorMessage = serviceName == EHSer_Constants.CONS_INACTIVEMEMBER ? System.Label.EHSer_EDL_No_Records_Available: System.Label.EHSer_EDL_No_Active_Records;
                    logErrors(true,e,null);
                }
            } else{
                // if response is empty set error flag and message
                initWrap.cardContent = null;
                initWrap.errorMessage = serviceName == EHSer_Constants.CONS_INACTIVEMEMBER ? System.Label.EHSer_EDL_No_Records_Available: System.Label.EHSer_EDL_No_Active_Records;
                initWrap.errorFlag = true;
            }
        }
        //setting the boolean value to differentiate the snapshot, view all and reset
        boolean isSnapshot = true;
        isSnapshot = (filterType == EHSer_Constants.CONS_VIEWALL || dataSize > 10)? false : true;
        
        // set table wrapper
        initWrap.tableContent = getTable(mapResponse,reqBody, isSnapshot);
        //system.debug('initWrap::'+initWrap);
        // return init wrapper
        return initWrap;
    }
    
    
    
    /* Name : getCardWrapper
* Purpose : prepares EDL content to display in card
*/
    @AuraEnabled
    public static Object getCardWrapper(map<integer,map<string,object>> mapResp, EHSer_EDL_RequestBodyWrapper reqBody){
        
        // set service name for further user
        String serviceName = reqBody.serviceName;
        map<integer,map<string,object>> responseMap = mapResp;
        // initialize wrapper
        detailPageCardMainWrapper wrapDetail = new detailPageCardMainWrapper();
        list<detailPageCardWrapper> lstDetailWrap = new list<detailPageCardWrapper>();
        
        map<string,EDL_Header_Response__mdt> mapEdlResParam = new map<string,EDL_Header_Response__mdt>([SELECT Id, API_Response__c,Field_Type__c,Card_Order__c,Link_Look_For__c,
                                                                                                        Data_Type__c,SFDC_Response_Label__c,Card_body__c,
                                                                                                        EDL_Master_Attributes__c,SFDC_Object_Name__c,SFDC_Returning_Fields__c, Field_API_Name__c 
                                                                                                        FROM EDL_Header_Response__mdt 
                                                                                                        WHERE EDL_Master_Attributes__r.DeveloperName =: serviceName AND Card_body__c=: TRUE
                                                                                                        ORDER BY Card_Order__c
                                                                                                        LIMIT 100]);
        
        list<string> fieldValue = new list<string>();
        string searchParam = '';
        list<string> lstSearchIn = new list<string>();
        // iterate over response to gather values for 'hyper link'
        for(integer respKey : responseMap.keySet()){
            map<string,object> mapInstance = responseMap.get(respKey);
            for(string respAttKey : mapEdlResParam.keySet()){
                if(mapEdlResParam.get(respAttKey).Card_body__c){
                    if(mapEdlResParam.get(respAttKey).Field_Type__c == EHSer_Constants.CONS_LINKFIELDTYPE){
                        string strLinkValue = mapEdlResParam.get(respAttKey).Link_Look_For__c;
                        strLinkValue = strLinkValue.toLowerCase();
                        searchParam = String.valueOf(mapInstance.get(strLinkValue));
                        lstSearchIn.add(mapEdlResParam.get(respAttKey).SFDC_Object_Name__c +' '+mapEdlResParam.get(respAttKey).SFDC_Returning_Fields__c);
                        
                        // if search param is not empty, remove unwanted space
                        searchParam = (!String.isBlank(searchParam) && !String.isEmpty(searchParam)) ? searchParam.trim() : '';
                        if(!String.isBlank(searchParam) && !String.isEmpty(searchParam) && searchParam <> ' - '){
                            fieldValue.add(searchParam);
                        }
                    }
                }
            }
        }
        
        // perform SOSL and store results
        List<List <sObject>> searchList = new list<list<sObject>>();
        if(!fieldValue.isEmpty()){
            searchList = returnSobjbectList(fieldValue, String.join(lstSearchIn, ','));
            // system.debug('!!!'+searchList);
        }
        // temporary variable used to validate conditions
        string sfdcValue = '';
        string apiValue = '';
        String value = '';
        String fieldName = '';
        
        // iterate over response to prepare card response
        for(integer respKey : responseMap.keySet()){
            map<string,object> mapInstance = responseMap.get(respKey);
            for(string respAttKey : mapEdlResParam.keySet()){
                if(mapEdlResParam.get(respAttKey).Card_body__c){
                    string strApiName = mapEdlResParam.get(respAttKey).API_Response__c;
                    strApiName = strApiName.toLowerCase();
                    string strLookup = '';
                    // prepare card wrapper
                    detailPageCardWrapper detailCard = new detailPageCardWrapper();
                    if(mapEdlResParam.get(respAttKey).Field_Type__c  == EHSer_Constants.CONS_LINKFIELDTYPE){
                        strLookup = mapEdlResParam.get(respAttKey).Link_Look_For__c;
                        strLookup = strLookup.toLowerCase();
                        map<string,string> objectValue = new map<string,string>();
                        
                        // use the link lookup field to match corresponding EDL attribute
                        apiValue = String.valueOf(mapInstance.get(strLookup));
                        apiValue = (!String.isBlank(apiValue) && !String.isEmpty(apiValue)) ? apiValue.trim() : '';
                        
                        // iteratve over Sobjec list from SOSL
                        // assing record Ids to hyper link fields
                        
                        for(list<sObject> sObj : searchList){
                            for(sObject obj : sObj){
                                // get the field name which is corresponding to EDL response
                                
                                fieldName = mapEdlResParam.get(respAttKey).Field_API_Name__c;
                                boolean fieldExists = obj.getSobjectType().getDescribe().fields.getMap().keySet().contains(fieldName.toLowerCase());
                                
                                // if field exists pull value from SObject
                                if(fieldExists) {
                                    sfdcValue = String.valueOf(obj.get(mapEdlResParam.get(respAttKey).Field_API_Name__c));
                                    sfdcValue = !String.isBlank(sfdcValue) && !String.isEmpty(sfdcValue) ? sfdcValue.trim() : sfdcValue;
                                    
                                    // map the actual link field with the SFDC record Id
                                    if(!string.isEmpty(apiValue) && !string.isBlank(apiValue) && !string.isEmpty(sfdcValue) && !string.isBlank(sfdcValue) && apiValue<>EHSer_Constants.CONS_HYPHEN_NO_SPACE){
                                        if(sfdcValue.equalsIgnoreCase(apiValue)){
                                            objectValue.put(String.valueOf(mapInstance.get(strApiName)),String.valueOf(obj.get('Id')));
                                            
                                        }
                                    }
                                }
                            }
                        }
                        // set card attributes
                        detailCard.label = mapEdlResParam.get(respAttKey).SFDC_Response_Label__c;
                        detailCard.value = String.valueOf(mapInstance.get(strApiName));
                        detailCard.isLink = true;
                        detailCard.detailId = objectValue.get(String.valueOf(mapInstance.get(strApiName)));
                        
                    }else if(mapEdlResParam.get(respAttKey).Data_Type__c  == EHSer_Constants.CONS_TABLE_CURRENCY){
                        detailCard.label = mapEdlResParam.get(respAttKey).SFDC_Response_Label__c;
                        string val=String.valueOf(mapInstance.get(strApiName));
                        if(!String.isEmpty(val)  && !String.isBlank(val) && val <> EHSer_Constants.CONS_HYPHEN){
                            detailCard.value = val;
                            detailCard.isCurrency=true;
                        }else{
                            detailCard.value = EHSer_Constants.CONS_HYPHEN;
                            detailCard.isCurrency=false;
                        }
                        detailCard.isLink = false;
                        detailCard.detailId = '';
                    }else if(mapEdlResParam.get(respAttKey).Data_Type__c  == EHSer_Constants.CONS_CARD_PERCENTAGE){
                        detailCard.label = mapEdlResParam.get(respAttKey).SFDC_Response_Label__c;
                        string val = string.valueOf(mapInstance.get(strApiName));
                        if(!String.isEmpty(val)  && !String.isBlank(val) && val <> EHSer_Constants.CONS_HYPHEN){
                            detailCard.value = val;
                            detailCard.isPercentage=true;
                        }else{
                            detailCard.value = EHSer_Constants.CONS_HYPHEN;
                            detailCard.isPercentage=false;
                        }
                        detailCard.isLink = false;
                        detailCard.detailId = '';
                    }else{
                        detailCard.label = mapEdlResParam.get(respAttKey).SFDC_Response_Label__c;
                        string val = string.valueOf(mapInstance.get(strApiName));
                        if(!String.isEmpty(val)  && !String.isBlank(val) && val <> EHSer_Constants.CONS_HYPHEN){
                            detailCard.value = val;
                        }else{
                            detailCard.value = EHSer_Constants.CONS_HYPHEN;
                        }
                        detailCard.isLink = false;
                        detailCard.detailId = '';
                    }
                    if(serviceName==EHSer_Constants.CONS_COVERAGE_BENEFIT_DETAIL && String.valueOf(mapInstance.get(strApiName))==EHSer_Constants.CONS_ZERO && mapEdlResParam.get(respAttKey).Data_Type__c  == EHSer_Constants.CONS_TABLE_CURRENCY){            
                        detailCard.value = EHSer_Constants.CONS_HYPHEN;
                        detailCard.isCurrency=false;
                    }
                    
                    // add card values to list
                    lstDetailWrap.add(detailCard);
                }
            }
        }
        
        // set card wrapper values
        wrapDetail.detailPageWrap = lstDetailWrap;
        wrapDetail.objectName = reqBody.masterAttribute.DetailHeaderName__c;
        wrapDetail.iconName = reqBody.masterAttribute.IconName__c;
        wrapDetail.objectSecondHeader = reqBody.masterAttribute.DetailHeaderName__c;
        
        // return card wrapper as an object
        Object obj = (Object)lstDetailWrap;
        return obj;
    }
    
    
    
    /* Name : getResponseBodyMethod
* Purpose : this method returns table and detail response
*/
    @AuraEnabled
    public static TablePageWrapper getSearchResponse(string serviceName, string conditionMap, string keyValue, integer dataSize){
        
        // gather input parameters
        system.debug('conditionMap::'+conditionMap);
        map<string,object> mapCond = (map<string,object>)JSON.deserializeUntyped(conditionMap);
        system.debug('mapCond::'+mapCond);
        map<string,object> reqParamMap = (map<string,object>)mapCond.get(EHSer_Constants.CONS_MATCHSHOULD);
        map<string,object> reqAndParamMap = (map<string,object>)mapCond.get(EHSer_Constants.CONS_MATCHMUST);
        string filterType = (string)mapCond.get(EHSer_Constants.CONS_FILTERTYPE);
        map<string,object> dateRange = (map<string,object>)mapCond.get(EHSer_Constants.CONS_DATERANGE);
        EHSer_EDL_RequestBodyWrapper reqBody = new EHSer_EDL_RequestBodyWrapper();
        reqBody.dataSize = dataSize;
        reqBody.serviceName = serviceName;
        
        reqBody.keyValue = keyValue;
        
        System.debug('reqParamMap::'+reqParamMap);
        
        // if input maps are not empty, set request body
        if(reqAndParamMap != null && !reqAndParamMap.isEmpty()){
            reqBody.requestAndParameters = reqAndParamMap;
        }
        if(reqParamMap != null && !reqParamMap.isEmpty()){
            reqBody.requestORParameters = reqParamMap;
        }
        if(dateRange!=null && !dateRange.isEmpty()){
            reqBody.dateParameters = dateRange;
        }
        reqBody.filterType = filterType;
        string reqQuery = reqBody.getRequestBody();
        reqBody.primaryKey = String.valueOf(reqAndParamMap.get(reqBody.masterAttribute.Response_Key_Id__c));
        // set type of filter
        
        map<integer,map<string,object>> mapResponse =  makeCallout(reqQuery,reqBody);
        // return table response
        return getTable(mapResponse,reqBody, false);
        
    }
    
    
    
    /* Name : getDetailResponseBodyMethod
* Purpose : this method returns table and detail response
*/
    @AuraEnabled
    public static detailData getDetailResponse(string serviceName, String  attributes){
        system.debug('attributes for clain line.......'+attributes);
        system.debug('serviceName for clain line.......'+serviceName);
        // gather input parameters
        map<string,object> reqParamMap = (map<string,object>)JSON.deserializeUntyped(attributes);
        system.debug('must paarams for claim line detail...'+reqParamMap);
        // initialize req body wrapper
        EHSer_EDL_RequestBodyWrapper reqBody = new EHSer_EDL_RequestBodyWrapper();
        
        // set req body wrapper attributes
        reqBody.serviceName = serviceName;
        reqBody.requestMustParameters = reqParamMap;
        reqBody.dataSize = 1;
        reqBody.filterType = EHSer_Constants.CONS_DETAILVIEW; // always 'DETAIL_VIEW'
        
        // perform callout
        map<integer,map<string,object>> mapResponse =  makeCallout(reqBody.getRequestBody(),reqBody);
        
        // return detail content
        return getDetail(mapResponse,reqBody);
        
    }
    
    
    /* Name : makeCallout
* Purpose : this method makes the callout
*/ 
    @AuraEnabled 
    public static map<integer,map<string,object>> makeCallout(string requestBody, EHSer_EDL_RequestBodyWrapper reqBody){
        
        // call custom settings to get timeout, username, password
        EH_Integration_Credentials__c edlCreds = EH_Integration_Credentials__c.getValues(EHSer_Constants.CONS_EDLCRED);
        
        string endpointUrl = edlCreds.Endpoint__c +reqBody.masterAttribute.End_Point_URL__c;
        
        Http h = new Http(); // to send request
        HttpRequest req = new HttpRequest(); // reqeust attribtue
        
        // set reqeust attributes
        req.setEndpoint(endpointUrl);
        req.setTimeout(Integer.valueOf(edlCreds.Timeout__c));
        req.setHeader(EHSer_Constants.CONS_CONTENT_TYPE,EHSer_Constants.CONS_APPLICATION);
        req.setHeader(EHSer_Constants.CONS_ACCEPT,EHSer_Constants.CONS_APPLICATION);
        
        // get header values
        String[] reqHeaders = reqBody.masterAttribute.EH_Header__c.split(',');
        
        // put header values to request
        for(string reqH : reqHeaders){
            string[] headerPair = reqH.split(':');
            if(headerPair[1] == EHSer_Constants.CONS_SYSTEMTIME){
                req.setHeader(headerPair[0], String.valueOf(System.now()));
            } else{
                req.setHeader(headerPair[0], headerPair[1]);
            }
        }
        
        // setup credentials
        Blob headerValue = Blob.valueOf(edlCreds.Username__c + ':' + edlCreds.Password__c);
        String authorizationHeader = EHSer_Constants.CONS_BASIC+' ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader(EHSer_Constants.CONS_AUTHORIZATION, authorizationHeader);
        req.setMethod(EHSer_Constants.CONS_POST);  // define method
        req.setBody(requestBody); // set request body
        
        // Send the request, and return a response
        list<object> lstResp = new list<object>();
        map<integer,map<string,object>> mapResponse = new map<integer,map<string,object>>();
        mapResponse.clear();
        try{ 
            // send request to endpoint
            HttpResponse res = h.send(req);
            
            // get response body
            string strResp = res.getBody();
            system.debug('direct response: '+strResp);
            
            // response body
            // if error, throw custom exception
            if(!strResp.contains(EHSer_Constants.CONS_NOHANDLER) && res.getStatusCode() == EHSer_Constants.CONS_SUCCESSSTATUS){
                // if no error, get structured response
                if(reqBody.isInnerHits  && !reqBody.isAggHits){
                    lstResp = getInnerResponseContent(strResp, reqBody);
                    
                    for(integer i=0;i<lstResp.size();i++){
                        map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstResp[i]));
                        mapResponse.put(i,mapResp);
                    }
                }
                else{
                    mapResponse = getResponseContent(strResp, reqBody);
                }
            } else{
                // if esb/edl handler error, throw exception
                
                throw new CalloutException(strResp);
            }
        }
        // handle exception
        catch(Exception e){
            // log exception in exception log
            logErrors(true,e,null);
        }
        return mapResponse; // return structured response
    }
    
    
    /* Name : getInnerResponseContent
* Purspose : this method returns list of structured response from inner hits
*/
    public static list<object> getInnerResponseContent(string jsonResponse, EHSer_EDL_RequestBodyWrapper reqBody){
        
        list<object> lstInnerResponse = new list<object>();
        EDL_Response_Handler__mdt  edlInnerResp = [SELECT Id, InnerHits__c,Response_Key__c,SecondaryLevelResponse__c,Order__c   
                                                   FROM EDL_Response_Handler__mdt 
                                                   WHERE EDL_Parent_Service__c =: reqBody.serviceName
                                                   AND InnerHits__c =: TRUE ORDER BY Order__c LIMIT 50];
        map<string,object> respMap = (map<string,Object>)JSON.deserializeUntyped(jsonResponse);

        
        try{
            // deserialize inner Hits detail response
            map<string,object> hitsMap = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(respMap.get(EHSer_Constants.CONS_FIRSTHIT)));
            list<object> lstRespForMap = (List<Object>)JSON.deserializeUntyped(JSON.serialize(hitsMap.get(EHSer_Constants.CONS_SECONDHIT)));
               //system.debug('lstRespForMap::::'+lstRespForMap);
            // complete response source
           
            for(integer m=0;m<lstRespForMap.size();m++){
                
                
                
                map<string,object> mapInstance = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstRespForMap[m]));
                map<string,object> mapSource = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInstance.get(EHSer_Constants.CONS_SOURCE)));
                map<string,object> mapHeaderResp = new map<string,object>();
                // gather header/same level response
                if(edlInnerResp.Response_Key__c != EHSer_Constants.CONS_IGNORE){
                    //System.debug( 'in If ');
                    for(string headerLevelResp : edlInnerResp.Response_Key__c.split(',')){
                        // System.debug( 'headerLevelResp If '+headerLevelResp);
                        //System.debug( 'mapSource.get(headerLevelResp) If '+mapSource.get(headerLevelResp));
                        map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(headerLevelResp)));
                        if(mapResp <> null && !mapResp.isEmpty()){
                            mapHeaderResp.putAll(formatMapKeySet(mapResp));
                        }
                    } 
                }else{
                    //system.debug('mapSource1::'+mapSource);
                    mapHeaderResp.putAll(formatMapKeySet(mapSource));
                }
                
                // deserialize inner hits source response 
                map<string,object> mapInnerHits = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInstance.get(EHSer_Constants.CONS_INNER_HITS)));
                
                map<string,object> mapMainObj = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInnerHits.get(edlInnerResp.SecondaryLevelResponse__c)));
                map<string,object> mapMainHits = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapMainObj.get(EHSer_Constants.CONS_FIRSTHIT)));
                list<object> lstRespBeforeMap = (List<Object>)JSON.deserializeUntyped(JSON.serialize(mapMainHits.get(EHSer_Constants.CONS_SECONDHIT)));
                if(!lstRespBeforeMap.isEmpty()){
                    // iterate over inner hits lists
                    for(integer n=0;n<lstRespBeforeMap.size();n++){
                        map<string,object> mapInnerInstance = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstRespBeforeMap[n]));
                        map<string,object> mapInnerSource = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInnerInstance.get(EHSer_Constants.CONS_SOURCE)));
                        // add previously collected response from previous map 
                        
                        if(mapHeaderResp <> null && !mapHeaderResp.isEmpty()){
                            mapInnerSource.putAll(formatMapKeySet(mapHeaderResp));
                        }
                        
                        // add complete repsonse to a list
                        if(lstInnerResponse.size() < reqBody.dataSize){
                            lstInnerResponse.add(formatMapKeySet(mapInnerSource));
                        }
                    }
                } else{
                    
                    lstInnerResponse.add(mapHeaderResp);
                }
            }
          
        }catch(Exception e){
            system.debug('exception line number : '+e.getLineNumber());
            system.debug('exception message : '+e.getMessage());
            lstInnerResponse.clear();
            logErrors(false,e,reqBody.serviceName); // log any exceptions
        }
        
        return lstInnerResponse;
    }
    
    /* Name : getMultiplevelResponseContent
* Purspose : this method returns list of structured response from inner hits
*/
    public static list<object> getMultiplevelResponseContent(string jsonResponse, EHSer_EDL_RequestBodyWrapper reqBody){
        
        list<object> lstMultiResponse = new list<object>();
        
        //system.debug('Multiplelevel jsonResponse in '+jsonResponse);
        //system.debug('Multiplelevel reqBody'+reqBody);
        
        EDL_Response_Handler__mdt  edlInnerResp = [SELECT Id, InnerHits__c,Response_Key__c,SecondaryLevelResponse__c,
                                                   Order__c,IsSecondResponseKey__c 
                                                   FROM EDL_Response_Handler__mdt 
                                                   WHERE EDL_Parent_Service__c =: reqBody.serviceName
                                                   AND InnerHits__c =: FALSE
                                                   ORDER BY Order__c LIMIT 50];
        
        // this is applicable for provide demographics address mapping only
        // fetch preset custom label value for formatting address
        string provDemoAddressHandler = '';
        
        provDemoAddressHandler = System.Label.ProviderDemoAddress;
        
        string[] lstProvAddrHandler = provDemoAddressHandler.split(EHSer_Constants.CONS_HYPHEN_NO_SPACE);
        
        map<string,object> respMap = (map<string,Object>)JSON.deserializeUntyped(jsonResponse);
        try{
            map<string,object> hitsMap = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(respMap.get(EHSer_Constants.CONS_FIRSTHIT)));
            list<object> lstRespForMap = (List<Object>)JSON.deserializeUntyped(JSON.serialize(hitsMap.get(EHSer_Constants.CONS_SECONDHIT)));
            
            for(integer m=0;m<lstRespForMap.size();m++){
                map<string,object> mapInstance = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstRespForMap[m]));
                map<string,object> mapSource = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInstance.get(EHSer_Constants.CONS_SOURCE)));
                map<string,object> mapHeaderResp = new map<string,object>();
                map<string,object> completeMap = new map<string,object>();
                for(string headerLevelResp : edlInnerResp.Response_Key__c.split(',')){
                    string[] lstSameLevelResp = headerLevelResp.split(':');
                    // if response is not list, deserialize accordingly
                    if(lstSameLevelResp[1] == 'false'){
                        
                        map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(lstSameLevelResp[0])));
                        mapHeaderResp.putAll(formatMapKeySet(mapResp));
                    }
                    // this is only applicable for provider address demographics only
                    if(lstProvAddrHandler[0]==reqBody.serviceName){
                        list<object> lstRespBeforeMap = (List<Object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(lstProvAddrHandler[1])));
                        for(integer n=0; n<lstRespBeforeMap.size();n++){
                            map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstRespBeforeMap[n]));
                            map<string,object> addressMap = new map<string,object>();
                            
                            string[] lstServAddRespHandler = lstProvAddrHandler[2].split('=');
                            // mapping for service address
                            if(String.valueOf(mapResp.get(EHSer_Constants.CONS_ADDRESS_TYPE_PROVIDER))==EHSer_Constants.CONS_SERVICE_ADDRESS_PROVIDER){
                                for(string serAdd : lstServAddRespHandler[1].split(',')){
                                    string[] lstSerAddr = serAdd.split(':');
                                    
                                    // this if condition to mapp address line 1,2,3 parameters
                                    // address line 1,2,3 parameter are stored by '+' separated in custom label
                                    // concatenate and map to street
                                    if(lstSerAddr[1].contains('+')){
                                        string[] addressLines = lstSerAddr[1].split('\\+');
                                        if(addressLines.size()>1){
                                            list<string> lstAddressLine = new list<string>();
                                            for(string strAddr : addressLines){
                                                string addrLineValue = String.valueOf(mapResp.get(strAddr));
                                                if(!String.isEmpty(addrLineValue) && addrLineValue <> EHSer_Constants.CONS_HYPHEN ){
                                                    lstAddressLine.add(addrLineValue);
                                                }
                                            }
                                            
                                            if(!lstAddressLine.isEmpty()){
                                                addressMap.put(lstSerAddr[0],String.join(lstAddressLine,','));
                                            }
                                        } 
                                    } else{
                                        // other attributes direct mapping with address field
                                        string addrValue = String.valueOf(mapResp.get(lstSerAddr[1]));
                                        if(!String.isEmpty(addrValue)){
                                            addressMap.put(lstSerAddr[0],addrValue);
                                        }
                                    }
                                }
                            }
                            string[] lstBillingAddRespHandler = lstProvAddrHandler[3].split('=');
                            
                            // mapping for billing/pay to address
                            if(String.valueOf(mapResp.get(EHSer_Constants.CONS_ADDRESS_TYPE_PROVIDER))== EHSer_Constants.CONS_PAYTO_ADDRESS_PROVIDER){
                                for(string serAdd : lstBillingAddRespHandler[1].split(',')){
                                    string[] lstBillAddr = serAdd.split(':');
                                    
                                    // this if condition to mapp address line 1,2,3 parameters
                                    // address line 1,2,3 parameter are stored by '+' separated in custom label
                                    // concatenate and map to street
                                    if(lstBillAddr[1].contains('+')){
                                        string[] addressLines = lstBillAddr[1].split('\\+');
                                        if(addressLines.size()>1){
                                            
                                            list<string> lstAddressLine = new list<string>();
                                            for(string strAddr : addressLines){
                                                string addrLineValue = String.valueOf(mapResp.get(strAddr));
                                                if(!String.isEmpty(addrLineValue) && addrLineValue <> EHSer_Constants.CONS_HYPHEN){
                                                    
                                                    lstAddressLine.add(addrLineValue);
                                                }
                                            }
                                            
                                            if(!lstAddressLine.isEmpty()){
                                                addressMap.put(lstBillAddr[0],String.join(lstAddressLine,','));
                                            }
                                        } 
                                    } else{
                                        // other attributes direct mapping with address field
                                        string addrValue = String.valueOf(mapResp.get(lstBillAddr[1]));
                                        if(!String.isEmpty(addrValue)){
                                            addressMap.put(lstBillAddr[0],addrValue);
                                        }
                                    }
                                }
                            }
                            
                            mapHeaderResp.putAll(addressMap);
                        }
                    }
                    string provLocDemoAddressHandler = System.Label.LocationDemgraphics;
                    //system.debug('label value: '+provLocDemoAddressHandler);
                    
                    
                    string[] lstProvLocAddrHandler = provLocDemoAddressHandler.split(EHSer_Constants.CONS_HYPHEN_NO_SPACE);
                    
                    //system.debug('label value: '+lstProvLocAddrHandler[0]);
                    //system.debug('reqBody.serviceName: '+reqBody.serviceName);
                    
                    if(reqBody.serviceName==lstProvLocAddrHandler[0]){
                        //system.debug('I am here');
                        list<object> lstRespBeforeMap = (List<Object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(lstProvLocAddrHandler[1])));
                        for(integer n=0; n<lstRespBeforeMap.size();n++){
                            map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstRespBeforeMap[n]));
                            
                            string[] lstProvSerAddRespHandler = lstProvLocAddrHandler[2].split('=');
                            //system.debug('mapresp'+mapResp);
                            // mapping for service address
                            if(String.valueOf(mapResp.get(EHSer_Constants.CONS_ADDRESS_TYPE_PROVIDER))==EHSer_Constants.CONS_SERVICE_ADDRESS_PROVIDER){
                                string[] lstSerAdd = lstProvSerAddRespHandler[1].split(':');
                                string strSerAddKey = lstSerAdd[0];
                                list<string> lstSerAddress = new list<string>();
                                
                                for(string serAdd:lstSerAdd[1].split('\\+')){
                                    if(!String.isBlank(serAdd) && !String.isBlank(serAdd) && serAdd <> EHSer_Constants.CONS_HYPHEN){
                                        lstSerAddress.add(String.valueOf(mapResp.get(serAdd)));
                                    }
                                }
                                
                                mapHeaderResp.put(strSerAddKey.toLowerCase(),String.join(lstSerAddress,','));
                            }
                            string[] lstProvBillAddRespHandler = lstProvLocAddrHandler[3].split('=');
                            
                            // mapping for billing/pay to address
                            if(String.valueOf(mapResp.get(EHSer_Constants.CONS_ADDRESS_TYPE_PROVIDER))== EHSer_Constants.CONS_PAYTO_ADDRESS_PROVIDER){
                                string[] lstBillAdd = lstProvBillAddRespHandler[1].split(':');
                                string strBillAddKey = lstBillAdd[0];
                                list<string> lstBillAddress = new list<string>();
                                for(string billAdd:lstBillAdd[1].split('\\+')){
                                    if(!String.isBlank(billAdd) && !String.isBlank(billAdd) && billAdd <> EHSer_Constants.CONS_HYPHEN){
                                        lstBillAddress.add(String.valueOf(mapResp.get(billAdd)));
                                    }
                                    
                                }
                                
                                mapHeaderResp.put(strBillAddKey.toLowerCase(),String.join(lstBillAddress,','));
                            }
                        }
                    }
                    //system.debug('address info: '+JSON.serialize(mapHeaderResp));
                    // ending provider address demographics
                    boolean mapAdded = false;
                    boolean isArray =false;
                    // if response is list, deserialize accordingly
                    if(lstSameLevelResp[1] == EHSer_Constants.CONS_TRUE){
                        isArray = true;
                        //system.debug('same level array: '+lstSameLevelResp[0]);
                        integer i = 0;
                        map<integer,map<string,object>> respMapping = new map<integer,map<string,object>>();
                        for(Object innerInstance :(List<Object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(lstSameLevelResp[0])))){
                            
                            map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(innerInstance));
                            
                            // put all values to map. including previous map
                            mapResp.putAll(formatMapKeySet(mapHeaderResp));
                            // add map into another map for further processing
                            respMapping.put(i,mapResp);
                            i++; 
                        }
                        
                        // combine all map values to single map
                        for(integer j : respMapping.keySet()){
                            map<string,object> currentMap = respMapping.get(j);
                            if(!completeMap.equals(currentMap)){
                                completeMap.putAll(currentMap);
                            }
                        }
                        
                    }
                     
                    if(!isArray)
                    {
                        completeMap.putAll(formatMapKeySet(mapHeaderResp));
                    }
                }
               
                
                lstMultiResponse.add(formatMapKeySet(completeMap));
                
                
                // this deserializing is used when response
                // is in second level of json object
                if(edlInnerResp.IsSecondResponseKey__c){
                    string[] lstMultiLevelKey = edlInnerResp.SecondaryLevelResponse__c.split(',');
                    
                    // get first level map object
                    map<string,object> mapSecondLevel = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapSource.get(lstMultiLevelKey[0])));
                    
                    // get second level list object for further formatting
                    for(Object innerInstance :(List<Object>)JSON.deserializeUntyped(JSON.serialize(mapSecondLevel.get(lstMultiLevelKey[1])))){
                        map<string,object> mapInnerInstance = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(innerInstance));
                        // add all header level repsonse
                        mapInnerInstance.putAll(formatMapKeySet(mapHeaderResp));
                        
                        if(lstMultiResponse.size() < reqBody.dataSize){
                            // include remaiing response into a list
                            lstMultiResponse.add(formatMapKeySet(mapInnerInstance));
                        }
                    }
                }
            }
        }catch(Exception e){
            system.debug('exception line number : '+e.getLineNumber());
            system.debug('exception message : '+e.getMessage());
            lstMultiResponse.clear();
            logErrors(false,e,null); // log any exception
        }
        
        return lstMultiResponse;
    }
    
    
    /* Name : getResponseContent
* Purpose : this method returns list of structured response
*/
    public static map<integer,map<string,object>> getResponseContent(string jsonResponse, EHSer_EDL_RequestBodyWrapper reqBody){
        
        String serviceName = reqBody.serviceName;
        EDL_Master_Attributes__mdt edlMasterAtt = reqBody.masterAttribute;
        
        boolean isAggr = false;
        isAggr = reqBody.isAggHits ? true : false;
        
        list<object> lstResponse = new list<object>();
        map<integer,map<string,object>> mapResponse = new map<integer,map<string,object>>();
        list<object> lstSingleResponse = new list<object>();
        // put response into map
        map<string,object> respMap = (map<string,Object>)JSON.deserializeUntyped(jsonResponse);
        try{
            
            // get hits level
            map<string,object> hitsMap = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(respMap.get(EHSer_Constants.CONS_FIRSTHIT)));
            //totalCount=Integer.valueOf(hitsMap.get('total'));
            // next hits level
            List<Object> lstBeforeMapResp = (List<Object>)JSON.deserializeUntyped(JSON.serialize(hitsMap.get(EHSer_Constants.CONS_SECONDHIT)));
            //system.debug('lstBeforeMapResp.lstBeforeMapResp inside'+lstBeforeMapResp); 
            for(integer n=0; n<lstBeforeMapResp.size();n++){
                Integer insideLoopRespTime = Limits.getCpuTime();
                if(insideLoopRespTime < (Limits.getLimitCpuTime()-5000)){
                    // get next level
                    map<string,object> mapInstance = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstBeforeMapResp[n]));
                    // get source
                    //system.debug('mapInstance:::'+JSON.serialize(mapInstance));
                    map<string,object> mapSource = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(mapInstance.get(EHSer_Constants.CONS_SOURCE))); 
                    mapSource.put('_id',mapInstance.get(EHSer_Constants.CONSID));
                    if(!mapSource.isEmpty()){
                        //  verify if first, second or third level
                        //  format accordingly 
                        if(edlMasterAtt.IsMultiResponse__c && !isAggr){ 
                            lstResponse = getMultiplevelResponseContent(jsonResponse, reqBody);
                            
                            for(integer i=0;i<lstResponse.size();i++){
                                map<string,object> mapResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(lstResponse[i]));
                                mapResponse.put(i,mapResp);
                            }
                            
                        } else if(isAggr){
                            //Added  for bug fix:SER-9807
                           if(serviceName==EHSer_Constants.CONS_PROVIDER_NETWORK_ELIGIBILITY || (serviceName==EHSer_Constants.CONS_PROVIDER_SPECIALTIES && (reqBody.filterType == 'MUST' || reqBody.filterType == 'VIEW_ALL' ) )) { 
                                mapResponse = EHSer_EDL_ES_AggregateHandler.handleAggregateResponseNtwrkEligbility(jsonResponse, serviceName);
                            }
                            //Added  for bug fix:SER-9807
                            else  if(serviceName==EHSer_Constants.CONS_PROVIDER_SPECIALTIES){
                                mapResponse = EHSer_EDL_ES_AggregateHandler.handleAggregateResponseProSpecialties(jsonResponse, serviceName);
                            }
                            else  if(serviceName==EHSer_Constants.CONS_COB){
                                mapResponse = EHSer_EDL_ES_AggregateHandler.handleAggregateResponseCOB(jsonResponse, serviceName);
                            }
                            else{ 
                                    mapResponse = EHSer_EDL_ES_AggregateHandler.handleAggregateResponse(jsonResponse, serviceName); 
                            }
                        }
                        else{
                            
                         	
                            mapResponse.put(n,formatMapKeySet(mapSource));
                           
                        }
                        
                    }
                }
            }
        } catch(Exception e){
            System.debug('Exception in response parsing: '+e.getMessage());
             System.debug('Exception in response parsing: '+e.getlineNumber());
            // handle exception on formatting the response
            map<string,object> errorMap = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(respMap.get('error')));
            if(errorMap != null || !errorMap.isEmpty()){
                System.debug('Error response: '+errorMap.get('root_cause'));
                logErrors(false,null,'EHSer_EDL_Helper:'+String.valueOf(errorMap.get('root_cause')));
            } else{
                System.debug('Exception in response parsing: '+e.getMessage());
                logErrors(true,e,null);
            }
            // if exception, clear response
            //lstResponse.clear();
            mapResponse.clear();
        }
        
        return mapResponse;
    }
    
    
    /* Name : getTable
* Purpose : this method returns table
*/
    public static TablePageWrapper getTable(map<integer,map<string,object>> mapResp,EHSer_EDL_RequestBodyWrapper reqBody, boolean isViewAll){
        
        boolean snapshotWidth = true;
        snapshotWidth = isViewAll ? true : false;
        
        string serviceName = reqBody.serviceName;
        
        TablePageWrapper tableWrap = new TablePageWrapper();
        if(mapResp.isEmpty()){
            // return error if strucuted response is empty
            tableWrap.iconName = reqBody.masterAttribute.IconName__c;
            tableWrap.objectHeader = reqBody.masterAttribute.DetailHeaderName__c;
            tableWrap.objectSecondHeader = reqBody.primaryKey;
            tableWrap.subTabName = reqBody.masterAttribute.DetailHeaderName__c;
            tableWrap.errorFlag = true;
            tableWrap.errorMessage = System.Label.EHSer_EDL_No_Records_Available;
            tableWrap.totalCnt=0;
        } else{
            try{
                // prepare response into a table
                list<DataTableColumns> lstColumns = new list<DataTableColumns>();
                List<Object> lstRows = new list<Object>();
                map<string,string> btnMapKeys = new map<string,string>();
                
                boolean isRestrictedUser = EHSer_Util.isRestrictedUser(); // used to restrict access to employee attributes
                
                map<string,EDL_Header_Response__mdt> mapEdlResParam = new map<string,EDL_Header_Response__mdt>([SELECT Id, API_Response__c,Order_Table__c,Field_Type__c,Link_Look_For__c,Field_API_Name__c,
                                                                                                                Data_Type__c,SFDC_Response_Label__c,Table_Page__c,Sortable__c,SFDC_Object_Name__c,Custom_Button_Attributes__c,
                                                                                                                IsSoftheon__c,Custom_Button_Label__c,EDLBrandKey__c,SoftheonBrandExpected__c,Column_ViewAll_Initial_Width__c,
                                                                                                                SFDC_Returning_Fields__c,IsArrayValue__c,Concatenation__c,ButtonCondition__c,
                                                                                                                Column_Initial_Width__c,TextNoWrap__c
                                                                                                                FROM EDL_Header_Response__mdt 
                                                                                                                WHERE EDL_Master_Attributes__r.DeveloperName =: serviceName
                                                                                                                AND Table_Page__c =: TRUE
                                                                                                                ORDER BY Order_Table__c
                                                                                                                LIMIT 100]);
                //system.debug('mapEdlResParam'+mapEdlResParam);
                map<string,string>  mapEdlResp = new map<string,string>();
                map<string,string>  mapEdlLinkResp = new map<string,string>();
                map<string,string> mapLinkResp = new map<string,string>();
                
                map<string,string> mapButtonLabel = new map<string,string>();
                map<string,string> mapButtonService = new map<string,string>();
                map<string,string> mapBrandValue = new map<string,string>();
                
                map<string,list<string>> mapButtonAttributes = new map<string,list<string>>();
                map<string,map<string,string>> mapButtonCondition = new map<string,map<string,string>>();
                
                map<string,string> brandMapping = getBrandMap();
                list<string> lstSearchIn = new list<string>();
                list<string> lstButnAttr = new list<string>();

                
                string keyValue = reqBody.keyValue;
                
                // added to handle wrap text dynamically based on a flag
                map<string,boolean> mapWrapText = new map<string,boolean>();
                map<string,string> mapRestKeys = new map<string,string>();
                
                map<string,object> edlLinkMap = new map<string,object>();
                keyValue = keyValue.toLowerCase();
                // prepare table columns and formats
                for(string strRespKey : mapEdlResParam.keySet()){
                    
                    string strApiName = mapEdlResParam.get(strRespKey).API_Response__c;
                    
                    //Adding the IF condition as a temporary fix 
                    if(!String.isEmpty(strApiName) && !String.isBlank(strApiName)){
                        strApiName = strApiName.toLowerCase();
                    }
                    
                    string strLookupName = '';
                    
                    // collect values for link fields
                    if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_LINKFIELDTYPE && !String.isEmpty(mapEdlResParam.get(strRespKey).Link_Look_For__c)&& !String.isBlank(mapEdlResParam.get(strRespKey).Link_Look_For__c)){
                        strLookupName = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                        
                        strLookupName = strLookupName.toLowerCase();
                        //to handle conditional sosl based Mapping to sfdc record if link has multiple response attributes separated by comma in link look for field
                        
                        List<String> linkLookValues = strLookupName.split(',');
                        for(String singleLink : linkLookValues){
                            mapEdlResp.put(singleLink,mapEdlResParam.get(strRespKey).Field_API_Name__c);
                            mapEdlResp.put(mapEdlResParam.get(strRespKey).Field_API_Name__c,mapEdlResParam.get(strRespKey).SFDC_Object_Name__c);
                            mapLinkResp.put(singleLink,strApiName);
                            mapEdlLinkResp.put(singleLink, mapEdlResParam.get(strRespKey).Link_Look_For__c);
                        }
                        lstSearchIn.add(mapEdlResParam.get(strRespKey).SFDC_Object_Name__c +' '+mapEdlResParam.get(strRespKey).SFDC_Returning_Fields__c); 
                        
                    }
                    //Building the map for the EDL_link field type response attribute.
                    if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_EDL_LINKFIELDTYPE){
                    	
                        string strEDLLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                        string[] lstEdlValues = strEDLLookup.split(',');
                        for(string edlMapVal : lstEdlValues){
                            string[] eldPair = edlMapVal.split(':');
                            edlLinkMap.put(eldPair[0],eldPair[1]);
                        }
                    }
                    if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_CUSTOMBUTTON){
                        mapButtonLabel.put(mapEdlResParam.get(strRespKey).API_Response__c,mapEdlResParam.get(strRespKey).Custom_Button_Label__c);
                        mapButtonService.put(strApiName,mapEdlResParam.get(strRespKey).API_Response__c);
                        for(String strBtnAtr: mapEdlResParam.get(strRespKey).Custom_Button_Attributes__c.split(',')){
                            lstButnAttr.add(strBtnAtr.toLowerCase());
                        }
                        if(mapEdlResParam.get(strRespKey).IsSoftheon__c && mapEdlResParam.get(strRespKey).EDLBrandKey__c!=null){
                            string strBrandAttr = mapEdlResParam.get(strRespKey).EDLBrandKey__c.toLowerCase();
                            mapBrandValue.put(strBrandAttr,mapEdlResParam.get(strRespKey).SoftheonBrandExpected__c);
                        }
                        mapButtonAttributes.put(mapEdlResParam.get(strRespKey).API_Response__c,lstButnAttr);
                    }
                    
                    
                    
                    cellWrapper cellAttWrap = new cellWrapper();
                    cellAttWrap.alignment = EHSer_Constants.CONS_CELLALIGNMENT;
                    
                    //setting the column width for snapshot,viewall and reset.
                    integer columnInitialWidth;
                    integer columnWidth;
                    if(snapshotWidth){
                        columnWidth = Integer.valueOf(mapEdlResParam.get(strRespKey).Column_Initial_Width__c);
                        columnInitialWidth = columnWidth >0 ? columnWidth : 80;
                    }else{
                        columnWidth = Integer.valueOf(mapEdlResParam.get(strRespKey).Column_ViewAll_Initial_Width__c);
                        columnInitialWidth = columnWidth >0 ? columnWidth : 100;
                    }
                    
                    // table columns are mapped here
                    if(mapEdlResParam.get(strRespKey).Table_Page__c && keyValue != strApiName){
                        string dataType= mapEdlResParam.get(strRespKey).Data_Type__c;
                        dataType=dataType.toLowerCase();
                        if(mapEdlResParam.get(strRespKey).Data_Type__c == EHSer_Constants.CONS_TABLE_BUTTON){
                            // button wrapper
                            
                            if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_CUSTOMBUTTON){
                                boolean isSoftheon = mapEdlResParam.get(strRespKey).IsSoftheon__c;
                                string buttonName = isSoftheon ? EHSer_Constants.CONS_VIEW_SOFTHEONSERVICE : EHSer_Constants.CONS_VIEW+mapEdlResParam.get(strRespKey).API_Response__c.toLowerCase();
                                typeWrapper typeButtonAttributes = new typeWrapper();
                                labelWrapper labelField = new labelWrapper();
                                labelField.fieldName = mapEdlResParam.get(strRespKey).API_Response__c;
                                
                                string strBtnCnd = mapEdlResParam.get(strRespKey).ButtonCondition__c;
                                if(!String.isBlank(strBtnCnd) && !String.isEmpty(strBtnCnd)){
                                    list<string> lstStrBtnCnd = strBtnCnd.split(':');
                                    labelWrapper disabledField = new labelWrapper();
                                    disabledField.fieldName = lstStrBtnCnd[0].toLowerCase();
                                    map<string,string> mapBtnCnd = new map<string,string>();
                                    mapBtnCnd.put(lstStrBtnCnd[1],lstStrBtnCnd[2]);
                                    mapButtonCondition.put(lstStrBtnCnd[0],mapBtnCnd);
                                    typeButtonAttributes.disabled = disabledField;
                                }
                                typeButtonAttributes.label = labelField;
                                labelWrapper titleField = new labelWrapper(); 
                                titleField.fieldName = mapEdlResParam.get(strRespKey).API_Response__c;
                                typeButtonAttributes.title = titleField;
                                typeButtonAttributes.name = buttonName;
                                typeButtonAttributes.variant  = EHSer_Constants.CONS_TABLE_BUTTONVARIANT;
                                lstColumns.add(new DataTableColumns(mapEdlResParam.get(strRespKey).SFDC_Response_Label__c,
                                                                    strApiName,dataType,
                                                                    mapEdlResParam.get(strRespKey).Sortable__c,cellAttWrap,
                                                                    typeButtonAttributes,
                                                                    mapEdlResParam.get(strRespKey).TextNoWrap__c));
                                
                            } else{
                                
                                typeWrapper typeButtonAttributes = new typeWrapper();
                                labelWrapper labelField = new labelWrapper();
                                labelField.fieldName = strApiName;
                                typeButtonAttributes.label = labelField;
                                typeButtonAttributes.name = EHSer_Constants.CONS_VIEW+strApiName;
                                typeButtonAttributes.variant  = EHSer_Constants.CONS_TABLE_BUTTONVARIANT;
                                
                                btnMapKeys.put(strApiName,'exclude');
                                // added as part of SER-3940
                                labelWrapper titleField = new labelWrapper(); 
                                string strBtnCnd = mapEdlResParam.get(strRespKey).ButtonCondition__c;
                                if(!String.isBlank(strBtnCnd) && !String.isEmpty(strBtnCnd) && isRestrictedUser){
                                    
                                    list<string> lstStrBtnCnd = strBtnCnd.split(':');
                                    labelWrapper disabledField = new labelWrapper();
                                    disabledField.fieldName = lstStrBtnCnd[0].toLowerCase();
                                    map<string,string> mapBtnCnd = new map<string,string>();
                                    mapBtnCnd.put(lstStrBtnCnd[1].toLowerCase(),lstStrBtnCnd[2]);
                                    mapButtonCondition.put(lstStrBtnCnd[0],mapBtnCnd);
                                    typeButtonAttributes.disabled = disabledField;
                                    btnMapKeys.put(lstStrBtnCnd[1].toLowerCase(),'default');
                                    
                                    titleField.fieldName = EHSer_Constants.CONS_ISRESTRICTEDACCESS; // added as part of SER-3940
                                    //system.debug('fine till here:'+JSON.serialize(btnMapKeys));
                                } else{
                                    titleField.fieldName = strApiName; // added as part of SER-3940
                                }
                                typeButtonAttributes.title = titleField;
                                lstColumns.add(new DataTableColumns(mapEdlResParam.get(strRespKey).SFDC_Response_Label__c,
                                                                    strApiName,dataType,mapEdlResParam.get(strRespKey).Sortable__c,
                                                                    cellAttWrap,typeButtonAttributes,
                                                                    mapEdlResParam.get(strRespKey).TextNoWrap__c));
                            }
                        } else if(mapEdlResParam.get(strRespKey).Data_Type__c == EHSer_Constants.CONS_TABLE_DATE){
                            // date wrapper
                            typeDateWrapper typeDateAttribute = new typeDateWrapper();
                            labelWrapper labelField = new labelWrapper();
                            labelField.fieldName = strApiName;
                            typeDateAttribute.label = labelField;
                            typeDateAttribute.year = EHSer_Constants.CONS_TABLE_YEAR;
                            typeDateAttribute.month = EHSer_Constants.CONS_TABLE_MONTH;
                            typeDateAttribute.day = EHSer_Constants.CONS_TABLE_DAY;
                            
                            lstColumns.add(new DataTableColumns(mapEdlResParam.get(strRespKey).SFDC_Response_Label__c,
                                                                strApiName,dataType,mapEdlResParam.get(strRespKey).
                                                                Sortable__c,cellAttWrap, typeDateAttribute,
                                                                mapEdlResParam.get(strRespKey).TextNoWrap__c));
                        } else if(mapEdlResParam.get(strRespKey).Data_Type__c == EHSer_Constants.CONS_TABLE_CURRENCY){
                            // currency wrapper
                            cellAttWrap.alignment = EHSer_Constants.CONS_RIGHT;
                            typeCurrencyWrapper typeCurrencyAttribute = new typeCurrencyWrapper();
                            typeCurrencyAttribute.currencyCode = EHSer_Constants.CONS_CURRENCY_CODE;
                            lstColumns.add(new DataTableColumns(mapEdlResParam.get(strRespKey).SFDC_Response_Label__c,
                                                                strApiName,dataType,mapEdlResParam.get(strRespKey).Sortable__c,
                                                                cellAttWrap, typeCurrencyAttribute,
                                                                mapEdlResParam.get(strRespKey).TextNoWrap__c));
                        }
                        else {
                            lstColumns.add(new DataTableColumns(mapEdlResParam.get(strRespKey).SFDC_Response_Label__c,
                                                                strApiName,dataType,mapEdlResParam.get(strRespKey).Sortable__c,
                                                                cellAttWrap,null,mapEdlResParam.get(strRespKey).TextNoWrap__c));
                        }
                        
                    }
                }
                
                // prepare list of strings for SOSL
                list<String> searchValue = new list<String>();
                map<integer,map<string,object>> responseMap = mapResp;
                map<integer, boolean> rowRestrictionMap = new map<integer,boolean>();
                for(integer responseMapKey : responseMap.keySet()){
                    for(String str : mapEdlResp.keySet()){
                        // if map contains the link keys
                        //system.debug('str'+str);
                        if(responseMap.get(responseMapKey).keySet().contains(str)){
                            // collect values for sosl
                            if(!searchValue.contains(String.valueOf(responseMap.get(responseMapKey).get(str))) && String.valueOf(responseMap.get(responseMapKey).get(str)) != null && String.valueOf(responseMap.get(responseMapKey).get(str)) <> ' - '){
                                String value = String.valueOf(responseMap.get(responseMapKey).get(str));
                                searchValue.add(value);
                            }
                        } 
                    }
                    for(string str : mapButtonLabel.keySet()){
                        responseMap.get(responseMapKey).put(str,mapButtonLabel.get(str));
                    }
                    //System.debug('button cndt : '+JSON.serialize(mapButtonCondition));
                    /* This logic determines if the buttons should be disabled
                     * based on the button conditions
                     */
                    for(string strBtnKeyLoop : mapButtonCondition.keySet()){
                        
                        map<string,string> mapBtnCndLoop = mapButtonCondition.get(strBtnKeyLoop);
                        boolean btnKey = false;
                        for(string strBtnKey: mapBtnCndLoop.keySet()){
                            string strBtnCndKey = strBtnKey;
                            strBtnCndKey = strBtnCndKey.toLowerCase();
                            btnKey = String.valueOf(responseMap.get(responseMapKey).get(strBtnCndKey)) == mapBtnCndLoop.get(strBtnKey) ? false : true;
                            
                            // added as part of SER-3940
                            // this logic applies to only the standard 'button' type 
                            // which is determined by marking it has 'default' above while updating columns
                            // if default, mark all other rows as restricted value
                            if(btnKey && btnMapKeys.get(strBtnCndKey) == 'default'){
                                responseMap.get(responseMapKey).put('rowRestricted',true);
                                responseMap.get(responseMapKey).put(EHSer_Constants.CONS_ISRESTRICTEDACCESS,EHSer_Constants.CONS_EMPRESTRCTMESG);
                                
                            }
                        }
                        
                        string strBtnCndLoop = strBtnKeyLoop;
                        strBtnCndLoop = strBtnCndLoop.toLowerCase();
                        responseMap.get(responseMapKey).put(strBtnCndLoop,btnKey);
                    }
                    
                    // this logic helps in EDL to softheon brand mapping
                    for(string str: mapBrandValue.keySet()){
                        string strBrand = String.valueOf(responseMap.get(responseMapKey).get(str));
                        strBrand = !String.isEmpty(strBrand) && !String.isBlank(strBrand) ? strBrand.toLowerCase() : strBrand;
                        string strToBeBrand = brandMapping.get(strBrand);
                        
                        string strPlaceHolder = mapBrandValue.get(str);
                        
                        strPlaceHolder = strPlaceHolder == EHSer_Constants.CONS_GHI? EHSer_Constants.CONS_GHI : strPlaceHolder;
                        strPlaceHolder = strPlaceHolder.replace(str,strToBeBrand);
                        
                        responseMap.get(responseMapKey).put(str,strPlaceHolder);
                    }
                    
                }
                List<List <sObject>> searchList = new List<List<sObject>>();
                if(!searchValue.isEmpty()){
                    searchList = returnSobjbectList(searchValue, String.join(lstSearchIn,',')); // perform SOSL
                }
                
                // prepare table rows
                String responseKey = reqBody.masterAttribute.Response_Key_Id__c;
                string[] lstRespKey = responseKey.split(',');
                
                for(integer responseMapKey : responseMap.keySet()){
                    
                    //boolean isEmployee = false;
                    map<string,object> mapTableValue = new map<string,object>();
                    map<string,object> mapInstance = responseMap.get(responseMapKey);
                    
                    system.debug('map before restriction:'+JSON.serialize(mapInstance));
                    if(mapInstance.keySet().contains('rowRestricted') && Boolean.valueOf(mapInstance.get('rowRestricted'))){
                        for(string mapKeySet : mapInstance.keySet()){
                            if(!btnMapKeys.keySet().contains(mapKeySet) && mapKeySet != EHSer_Constants.CONS_ISRESTRICTEDACCESS){
                                //mapInstance.remove(mapKeySet);
                                mapInstance.put(mapKeySet,EHSer_Constants.CONS_RESTRICTEDVAL);
                            }
                        }
                    }
                    
                    // SER-1600
                    // this check is kept for Medicare Part C claims, where year is coming as integer
                    // to avoid the comma separated value, fix is provided
                    if(mapInstance.keySet().contains(EHSer_Constants.CONS_REPORTYEAR)){
                        string strReportValue = String.valueOf(mapInstance.get(EHSer_Constants.CONS_REPORTYEAR));
                        mapInstance.remove(EHSer_Constants.CONS_REPORTYEAR);
                        mapInstance.put(EHSer_Constants.CONS_REPORTYEAR,strReportValue);
                    }
                    map<string,object> mapDetailKey = new map<string,object>();
                    mapInstance.putAll(getArrayAndConcatenationFormat(mapInstance,mapEdlResParam));// if any array or concatenation required
                    string detailKey = '';
                    // this for loops helps in setting up detail request parameters
                    
                    for(string strRespKey : lstRespKey){
                        
                        if(strRespKey.contains(EHSer_Constants.CONS_KEYWORD)){
                            // contains keyword remove keyword before before fetching value from response
                            string[] respKey = strRespKey.split('\\.');
                            detailKey = respKey[0].toLowerCase();
                            mapDetailKey.put(strRespKey,String.valueOf(mapInstance.get(detailKey)));
                            
                        } else if(strRespKey.contains('.') && !strRespKey.contains(EHSer_Constants.CONS_KEYWORD)){
                            // contains only '.' and no keyword split before fetching value from response
                            string[] respKey = strRespKey.split('\\.');
                            detailKey = respKey[1].toLowerCase();
                            mapDetailKey.put(strRespKey,String.valueOf(mapInstance.get(detailKey)));
                            
                        }
                        else{
                            // if no 'keyword' or '.' fetch directly
                            detailKey = strRespKey.toLowerCase();
                            mapDetailKey.put(strRespKey,String.valueOf(mapInstance.get(detailKey)));
                        }
                        detailKey = ''; // reset the key attribute
                    }
                    //this for loop is used to map the detail request attribute for edl link field type response attribute
                    string edlLinkKey = '';
                    for(string strKey : edlLinkMap.keySet()){
                    	edlLinkKey = strKey;
                    	string curKey = String.valueOf(edlLinkMap.get(strKey));
                    	string strVal = String.valueOf(mapInstance.get(curKey.toLowerCase()));
                    	
                    	
                    	if(!String.isBlank(strVal) && !String.isEmpty(strVal)){
                    		mapDetailKey.put(edlLinkKey,strVal);
                    	} else{
                    		mapDetailKey.put(edlLinkKey,curKey);
                    	}
                    }
                    map<string,object> mapButtonValuePair = new map<string,object>();
                    for(string strBtnAtr : mapButtonService.keySet()){
                        list<string> lstValue = mapButtonAttributes.get(mapButtonService.get(strBtnAtr));
                        map<string,string> buttonValues = new map<string,string>();
                        for(string strKey : lstValue){
                            buttonValues.put(strKey,String.valueOf(responseMap.get(responseMapKey).get(strKey.toLowerCase())));
                        }
                        mapButtonValuePair.put(mapButtonService.get(strBtnAtr),buttonValues);
                    }
                    mapInstance.put(EHSer_Constants.CONS_MAPBUTTONVALUEPAIR,mapButtonValuePair);
                    
                    
                    string fieldName = '';
                    string objectName = '';
                    map<string,object> mapLinks = new map<string,object>();
                    map<string,object> mapValuePair = new map<string,object>();
                    
                    for(String str : mapEdlResp.keySet()){
                        map<string,object> mapIds = new map<string,object>();
                        // place account and contact id inside map to navigate to table
                        if(mapInstance.keySet().contains(str)){
                            String value = String.valueOf(mapInstance.get(str));
                            mapDetailKey.put(mapEdlLinkResp.get(str),value);
                            fieldName = mapEdlResp.get(str);
                            objectName = mapEdlResp.get(fieldName);
                            boolean fieldExists = false;
                            if(!searchList.isEmpty()){    
                                for(list<sObject> lstObj : searchList){
                                    if(!lstObj.isEmpty()){
                                        for(sObject obj : lstObj){
                                            
                                            if(objectName == obj.getSobjectType().getDescribe().getName()){
                                                fieldExists = obj.getSobjectType().getDescribe().fields.getMap().keySet().contains(fieldName.toLowerCase());
                                                string sfRecId = String.valueOf(obj.get(EHSer_Constants.CONS_ID));
                                                if(fieldExists){
                                                    
                                                    if(obj.get(fieldName) == value){
                                                        if(!String.isBlank(sfRecId) && !String.isEmpty(sfRecId)){
                                                            mapIds.put(mapLinkResp.get(str),sfRecId);
                                                        }                                          
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    mapLinks.putAll(mapIds);
                                }
                            }
                            
                            mapValuePair.put(EHSer_Constants.CONS_VALUEPAIR,mapLinks);
                            
                        }
                        
                        // merge maps
                        
                        mapInstance.putAll(mapValuePair);
                        system.debug('mapValuePair: '+mapValuePair);
                        system.debug('mapInstance: '+mapInstance);
                        
                        mapTableValue.putAll(mapValuePair);
                        
                    }
                    // included to as part of SER-7384
                    //if(serviceName == 'Claim_Details'){
                    	mapInstance.put(EHSer_Constants.CONS_SHOWCLASS,EHSer_Constants.CONS_WRAPCLASS);
                    //}
                    mapInstance.put(EHSer_Constants.CONS_BTNCLASS,EHSer_Constants.CONS_BTNTXTALGNCLASS);
                    
                    // holds detail navigation keys
                    mapInstance.put(EHSer_Constants.CONS_MAPDETAILKEY,mapDetailKey);
                    
                    // check if cpu time is within limimts to avoid cpu time out excepton
                    Integer insideLoopRespTime = Limits.getCpuTime();
                    
                    if(insideLoopRespTime < (Limits.getLimitCpuTime() - 100)){
                        
                        lstRows.add(mapInstance);
                    }
                }
                
                tableWrap.iconName = reqBody.masterAttribute.IconName__c;
                tableWrap.objectHeader = reqBody.masterAttribute.DetailHeaderName__c;
                tableWrap.objectSecondHeader = reqBody.masterAttribute.DetailHeaderName__c;
                tableWrap.subTabName = reqBody.masterAttribute.DetailHeaderName__c;
                tableWrap.lstDataTableColumns = lstColumns;
                tableWrap.lstDataTableData = lstRows;
                tableWrap.errorFlag = false;
                tableWrap.errorMessage = '';
                tableWrap.totalCnt=totalCount;
            }
            catch(Exception e){
                system.debug('table catch: '+e.getMessage());
                system.debug('table catch: '+e.getLineNumber());
                // any exception return error flag and log error
                tableWrap.iconName = reqBody.masterAttribute.IconName__c;
                tableWrap.objectHeader = reqBody.masterAttribute.DetailHeaderName__c;
                tableWrap.objectSecondHeader = reqBody.primaryKey;
                tableWrap.subTabName = reqBody.masterAttribute.DetailHeaderName__c;
                tableWrap.errorFlag = true;
                tableWrap.errorMessage = System.Label.EHSer_EDL_No_Records_Available;
                tableWrap.totalCnt=0;
                logErrors(true,e,null);
            }
        }
        //system.debug('table wrapper: '+JSON.serialize(tableWrap));
        return tableWrap;
    }
    // this method helps in concatenating and deserailzing array response
    public static map<string,object> getArrayAndConcatenationFormat(map<string,object> mapResp, map<string,EDL_Header_Response__mdt> mapResParam){
        
        for(string strRespKey : mapResParam.keySet()){
            string strApiName = mapResParam.get(strRespKey).API_Response__c;
            strApiName = strApiName.toLowerCase();
            // if array, convert to string and convert to comma separated value
            if(mapResParam.get(strRespKey).IsArrayValue__c){
                
                string apiStringValue = String.valueOf(mapResp.get(strApiName));
                
                if(!string.isEmpty(apiStringValue) && ! string.isBlank(apiStringValue)){
                    apiStringValue = apiStringValue.replace('(', '');
                    apiStringValue = apiStringValue.replace(')', '');
                    mapResp.remove(strApiName);
                    mapResp.put(strApiName,apiStringValue);
                }
            }
            // if multiple response attributes to be concatenated pull all the values from response into single string
            if(mapResParam.get(strRespKey).Concatenation__c){
                list<string> lstConcate = new list<string>();
                for(string strCon : mapResParam.get(strRespKey).Link_Look_For__c.split(',')){
                    strCon = strCon.toLowerCase();
                    string value = String.valueOf(mapResp.get(strCon));
                    if(!String.isBlank(value) && !String.isEmpty(value)  && !value.contains(EHSer_Constants.CONS_HYPHEN)){
                        lstConcate.add(value);
                    }
                }
                
                mapResp.put(strApiName,string.join(lstConcate, ','));
            }
        }
        return mapResp;
    }
    
    
    /* Name : getDetail
* Purpose : this method returns detail
*/
    public static detailData getDetail(map<integer,map<string,object>> mapResp, EHSer_EDL_RequestBodyWrapper reqBody){
        system.debug('mapResp ;;;'+JSON.serialize(mapResp));
        system.debug('reqBody ;;;'+reqBody);
        string serviceName = reqBody.serviceName;
        boolean isRatesAndTariffs = false;
        EDL_Master_Attributes__mdt edlMasterAtt = reqBody.masterAttribute;
        // if structured response empty return error flag
        detailData detailMapping = new detailData();
        if(mapResp.isEmpty()){
            detailMapping.iconName = edlMasterAtt.IconName__c;
            detailMapping.objectHeader = edlMasterAtt.DetailHeaderName__c;
            detailMapping.errorFlag = true;
            detailMapping.errorMessage = System.Label.EHSer_EDL_No_Records_Available;
        } else{
            // map response to detail wrapper
            try{
                
                map<string,EDL_Header_Response__mdt> mapEdlResParam = new map<string,EDL_Header_Response__mdt>([SELECT Id, API_Response__c,Detail_Page__c,Field_Type__c,
                                                                                                                Data_Type__c,Order_Detail__c,SFDC_Response_Label__c,Link_Look_For__c,
                                                                                                                EDL_Master_Attributes__c,Section_Name__c,SFDC_Object_Name__c,SFDC_Returning_Fields__c,
                                                                                                                IsArrayValue__c,Concatenation__c,
                                                                                                                Field_API_Name__c, EDL_Link_Service__r.DeveloperName
                                                                                                                FROM EDL_Header_Response__mdt 
                                                                                                                WHERE EDL_Master_Attributes__r.DeveloperName =: serviceName
                                                                                                                ORDER BY Order_Detail__c LIMIT 100]);
                
                
                
                String primaryKey = '';
                
                list<detailPageCardWrapper> lstDetailWrap = new list<detailPageCardWrapper>();
                
                list<string> fieldValue = new list<string>();
                string providerFieldValue;
                list<buttonOptions> lstSoftOptions = new list<buttonOptions>();
                list<buttonOptions> lstOthertOptions = new list<buttonOptions>();
                list<lineDetailsWrapper> lstLineItems = new list<lineDetailsWrapper>();
                string sfdcValue = '';
                string apiValue = '';
                String value = '';
                string fieldName = '';
                
                string searchParam = '';
                EHSer_EDL_Retrieve_ProviderInfo.providerResultWrapper resultWrapper = new EHSer_EDL_Retrieve_ProviderInfo.providerResultWrapper();
                
                list<string> lstSearchIn = new list<string>();
                map<string,object> mapEDLLinks = new map<string,object>();
                map<integer,map<string,object>> responseMap = mapResp;
                map<string,object> mapInactiveLink =  new map<string,object>();
                map<string,string> mapHeaderInfo = new map<string,string>();
                
                // iterate over structured response
                for(integer responseMapKey : responseMap.keySet()){
                    map<string,object> mapInstance = responseMap.get(responseMapKey);
                    
                    //showing constant header name for Fee schedule Code API
                    for(string strRespKey : mapEdlResParam.keySet()){
                        if(serviceName == EHSer_Constants.CONS_RATESANDTARIFFS){
                            primaryKey = edlMasterAtt.Detail_Header_Format__c;
                            isRatesAndTariffs =true;
                        }
                        // prepare SOSL value list
                        string strApiName = mapEdlResParam.get(strRespKey).API_Response__c;
                        strApiName = strApiName.toLowerCase();
                        string strLookup = '';
                        if(mapEdlResParam.get(strRespKey).Detail_Page__c || isRatesAndTariffs){
                            string headerKey;
                            if(serviceName==EHSer_Constants.CONS_AUTH_PROCEDURE){
                                string headerKeyAuth = edlMasterAtt.Detail_Page_Header_Attribute__c;
                                string[] header=headerKeyAuth.split(',');
                                primaryKey=String.valueOf(mapInstance.get(header[0].toLowerCase()))+'('+String.valueOf(mapInstance.get(header[1].toLowerCase()))+')';
                            }else{
                                headerKey = edlMasterAtt.Detail_Page_Header_Attribute__c;
                                headerKey = headerKey.toLowerCase();
                                //SER-4761
                                if(String.valueOf(mapInstance.get(headerKey))<>null ){
                                	primaryKey = String.valueOf(mapInstance.get(headerKey));
                                }else{
                                	primaryKey =headerKey ;
                                }
                            }
                            
                            string headerFormatKey = edlMasterAtt.Detail_Header_Format_Keys__c;
                            string tempHeaderKey = headerFormatKey;
                            if(!String.isBlank(tempHeaderKey) && !String.isEmpty(tempHeaderKey)){
                                for(string strHdrKey: tempHeaderKey.split(',')){
                                    string strTempKey = strHdrKey.toLowerCase();
                                    mapHeaderInfo.put(strHdrKey,String.valueOf(mapInstance.get(strTempKey)));
                                }
                            }
                            if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_LINKFIELDTYPE){
                                lstSearchIn.add(mapEdlResParam.get(strRespKey).SFDC_Object_Name__c +' '+mapEdlResParam.get(strRespKey).SFDC_Returning_Fields__c);
                                strLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                                strLookup = strLookup.toLowerCase();
                                //location unique key is used on the claim ,claimline,authorization and auth procedure as a providerid
                                //hence to get the actual proverderid based on the provider location unique key SER-8302
                                //making an external call to fetch the providerid
                                
                                if(EHSer_Constants.PROVIDER_KEY_NAMES.contains(strLookup) && EHSer_Constants.SERVICE_NAME_BYPASS.contains(serviceName)){
                                    
                                    searchParam = String.valueOf(mapInstance.get(strLookup));
                                    searchParam = (!string.isBlank(searchParam) && !string.isEmpty(searchParam)) ? searchParam.trim() : '';
                                    if(!String.isBlank(searchParam) && !String.isEmpty(searchParam)){
                                        providerFieldValue=searchParam;
                                        
                                    }
                                    if(providerFieldValue<>null && providerFieldValue <> EHSer_Constants.CONS_HYPHEN_NO_SPACE){
                                        //fetching the accountnumber and accountid
                                        system.debug('calling formRequest body1');
                                        resultWrapper=EHSer_EDL_Retrieve_ProviderInfo.formRequestBody(providerFieldValue);
                                        system.debug('resultWrapper1....'+resultWrapper);
                                        
                                    }
                                }else{
                                    searchParam = String.valueOf(mapInstance.get(strLookup));
                                    searchParam = (!string.isBlank(searchParam) && !string.isEmpty(searchParam)) ? searchParam.trim() : '';
                                    if(!String.isBlank(searchParam) && !String.isEmpty(searchParam) && searchParam <> ' - '){
                                        fieldValue.add(searchParam);
                                    }
                                }
                            }
                            if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_EDL_LINKFIELDTYPE){
                                map<string,object> mapEDLLinksReset = new map<string,object>();
                                map<string,object> edlLinkMap = new map<string,object>();
                                string strEDLLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                                string[] lstEdlValues = strEDLLookup.split(',');
                                string strValue = String.valueOf(mapInstance.get(strApiName));
                                if(!String.isBlank(strValue) && !String.isEmpty(strValue)){
                                    for(string edlMapVal : lstEdlValues){
                                        map<string,object> edlLinkMapResest = new map<string,object>();
                                        string[] eldPair = edlMapVal.split(':');
                                        string strEDLValue = String.valueOf(mapInstance.get(eldPair[1].toLowerCase()));
                                        if(!String.isEmpty(strEDLValue) && !String.isBlank(strEDLValue)){
                                            edlLinkMapResest.put(eldPair[0],strEDLValue);
                                        } else{
                                            edlLinkMapResest.put(eldPair[0],eldPair[1]);
                                        }
                                        if(!edlLinkMapResest.isEmpty()){
                                            edlLinkMap.putAll(edlLinkMapResest);
                                        }
                                    }
                                    
                                    edlLinkMap.put(String.valueOf(mapInstance.get(strApiName)),mapEdlResParam.get(strRespKey).Link_Look_For__c);
                                    //mapEDLLinksReset.put(mapEdlResParam.get(strRespKey).EDL_Link_Service__r.DeveloperName, edlLinkMap);
                                    
                                    mapEDLLinks.put(strApiName,edlLinkMap);
                                }
                                //system.debug('strApiName : '+strApiName);
                                //system.debug('edlLinkMap : '+JSON.serialize(edlLinkMap));
                                //system.debug('edl link map: '+JSON.serialize(mapEDLLinks));
                            }
                        }
                        //if attribute is not on detail page
                        if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_LINKFIELDTYPE && !mapEdlResParam.get(strRespKey).Detail_Page__c){
                            lstSearchIn.add(mapEdlResParam.get(strRespKey).SFDC_Object_Name__c +' '+mapEdlResParam.get(strRespKey).SFDC_Returning_Fields__c);
                            
                            strLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                            strLookup = strLookup.toLowerCase();
                            //location unique key is used on the claim ,claimline,authorization and auth procedure as a providerid
                            //hence to get the actual proverderid based on the provider location unique key SER-8302
                            //making an external call to fetch the providerid
                            if(EHSer_Constants.PROVIDER_KEY_NAMES.contains(strLookup) && EHSer_Constants.SERVICE_NAME_BYPASS.contains(serviceName)){
                                searchParam = String.valueOf(mapInstance.get(strLookup));
                                searchParam = (!string.isBlank(searchParam) && !string.isEmpty(searchParam)) ? searchParam.trim() : '';
                                
                                system.debug('searchParam::'+searchParam);
                                if(!String.isBlank(searchParam) && !String.isEmpty(searchParam)){
                                    
                                    providerFieldValue=searchParam;
                                }
                                if(providerFieldValue<>null && providerFieldValue <> EHSer_Constants.CONS_HYPHEN_NO_SPACE){
                                    //fetching the accountnumber and accountid
                                    system.debug('calling formRequest body2');
                                    resultWrapper=EHSer_EDL_Retrieve_ProviderInfo.formRequestBody(providerFieldValue);
                                      system.debug('resultWrapper2....'+resultWrapper);
                                }
                            }else{
                                searchParam = String.valueOf(mapInstance.get(strLookup));
                                boolean blnSrchParam = !String.isBlank(searchParam) && !String.isEmpty(searchParam) ? true : false;
                                if(!fieldValue.contains(searchParam) && blnSrchParam && searchParam <> ' - '){
                                    fieldValue.add(searchParam);
                                }
                            }
                            
                        }
                    }
                }
                system.debug('lstSearchIn::'+lstSearchIn);
                // perform sosl
                List<List <sObject>> searchList = new list<list<sObject>>();
                if(!fieldValue.isEmpty()){
                    searchList = returnSobjbectList(fieldValue, String.join(lstSearchIn,','));
                }
                
                map<string,list<detailPageCardWrapper>> mapSectionResp = new map<string, list<detailPageCardWrapper>>();
                map<string,string> objectValue = new map<string,string>();
                map<string,object> mapTemp = new map<string,object>();
                map<string,object> mapClone = new map<string,object>();
                //map<string,string> mapPrePopulate = new map<string,string>();
                map<string,object> mapDefaultEDLLinks = new map<string,object>();
                map<string,object> mapDefaultInactiveLinks = new map<string,object>();
                
                
                // iterate over structured response 
                for(integer responseMapKey : responseMap.keySet()){
                    
                    map<string,object> mapInstance = responseMap.get(responseMapKey);
                    mapTemp.putAll(mapInstance);
                    mapClone.putAll(mapInstance);
                    
                    // map response with response parameters
                    for(string strRespKey : mapEdlResParam.keySet()){
                        
                        string strApiName = mapEdlResParam.get(strRespKey).API_Response__c;
                        strApiName = strApiName.toLowerCase();
                        string strLookup = '';
                        
                        if(mapEdlResParam.get(strRespKey).IsArrayValue__c){
                            string apiStringValue = String.valueOf(mapInstance.get(strApiName));
                            if(!string.isEmpty(apiStringValue) && ! string.isBlank(apiStringValue)){
                                apiStringValue = apiStringValue.replace('(', '');
                                apiStringValue = apiStringValue.replace(')', '');
                                mapInstance.remove(strApiName);
                                mapInstance.put(strApiName,apiStringValue);
                            }
                        }
                        if(mapEdlResParam.get(strRespKey).Concatenation__c){
                            list<string> lstConcate = new list<string>();
                            for(string strCon : mapEdlResParam.get(strRespKey).Link_Look_For__c.split(',')){
                                strCon = strCon.toLowerCase();
                                string conValue = String.valueOf(mapInstance.get(strCon));
                                if(!String.isBlank(conValue) && !String.isEmpty(conValue) && conValue <> EHSer_Constants.CONS_HYPHEN ){
                                    lstConcate.add(conValue);
                                }
                            }
                            mapInstance.put(strApiName,string.join(lstConcate, ','));
                        }
                        string val=String.valueOf(mapInstance.get(strApiName));
                        if(val <> EHSer_Constants.CONS_HYPHEN){
                            value = String.valueOf(mapInstance.get(strApiName));
                        }else{
                            value='';
                        }
                        string respKeyId = edlMasterAtt.Response_Key_Id__c;
                        respKeyId = respKeyId.toLowerCase();
                        string objectName = '';
                        
                        if(mapEdlResParam.get(strRespKey).Field_Type__c  == EHSer_Constants.CONS_LINKFIELDTYPE){
                            
                            strLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                            strLookup = strLookup.toLowerCase();
                            apiValue = String.valueOf(mapInstance.get(strLookup));
                            if(!string.isEmpty(apiValue) && !string.isBlank(apiValue)){
                                apiValue = (apiValue != null || apiValue != '') ? apiValue.trim() : '';
                            }
                            if(EHSer_Constants.PROVIDER_KEY_NAMES.contains(strLookup) && EHSer_Constants.SERVICE_NAME_BYPASS.contains(serviceName)){
                                //comparing the locationuniquekey and apivalue from response
                                //putting the accountid in map
                                if(apiValue==resultWrapper.locationUnique && resultWrapper.acctId<>null){
                                    mapTemp.remove(strApiName);
                                    mapTemp.put(strApiName,resultWrapper.acctId);
                                }else{
                                    mapTemp.remove(strApiName);
                                    mapTemp.put(strApiName,null);
                                }
                                if(apiValue==resultWrapper.locationUnique && resultWrapper.locationId<>null){
                                    mapTemp.remove('locationid');
                                    mapTemp.put('locationid',resultWrapper.locationId);
                                }
                                if(apiValue==resultWrapper.locationUnique && resultWrapper.providerIdVal<>null){
                                    mapTemp.remove('provideridval');
                                    mapTemp.put('provideridval',resultWrapper.providerIdVal);
                                } 
                            }else{
                                map<string,boolean> recIdUpdated = new map<string,boolean>();
                                recIdUpdated.put(strApiName,false);
                                
                                for(list<sObject> sObj : searchList){
                                    if(!sObj.isEmpty()){
                                        for(sObject objQuery : sObj){
                                            fieldName = mapEdlResParam.get(strRespKey).Field_API_Name__c;
                                            objectName = mapEdlResParam.get(strRespKey).SFDC_Object_Name__c;
                                            if(objectName == objQuery.getSobjectType().getDescribe().getName()){
                                                boolean fieldExists = objQuery.getSobjectType().getDescribe().fields.getMap().keySet().contains(fieldName.toLowerCase());
                                                if(fieldExists) {
                                                    sfdcValue = String.valueOf(objQuery.get(fieldName));
                                                    sfdcValue = !String.isBlank(sfdcValue) && !String.isEmpty(sfdcValue) ? sfdcValue.trim() : sfdcValue;
                                                    if(!string.isEmpty(apiValue) && !string.isBlank(apiValue) && !string.isEmpty(sfdcValue) && !string.isBlank(sfdcValue) && apiValue<>EHSer_Constants.CONS_HYPHEN_NO_SPACE){
                                                        if(sfdcValue.equalsIgnoreCase(apiValue)){
                                                            // mapping edl response with salesforce record Id
                                                            objectValue.put(String.valueOf(mapInstance.get(strApiName)),String.valueOf(objQuery.get(EHSer_Constants.CONS_ID)));
                                                            mapTemp.remove(strApiName);
                                                            mapTemp.put(strApiName,objectValue.get(String.valueOf(mapInstance.get(strApiName))));
                                                            recIdUpdated.put(strApiName,true);
                                                        }
                                                    }
                                                    
                                                }else{
                                                    
                                                    mapTemp.remove(strApiName);
                                                    mapTemp.put(strApiName,null);
                                                }
                                            }
                                        }
                                    }else{
                                        //recIdUpdated map is used to not to override  the existing strApiName in the  mapTemp map
                                        if(!recIdUpdated.get(strApiName)){
                                            mapTemp.remove(strApiName);
                                            mapTemp.put(strApiName,null);
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                        if(mapEdlResParam.get(strRespKey).Detail_Page__c){
                            
                            detailPageCardWrapper detailCard = new detailPageCardWrapper();
                            detailCard.label = mapEdlResParam.get(strRespKey).SFDC_Response_Label__c;
                            
                            // if link is expected, lookup to SOSL results to map record Id
                            if(mapEdlResParam.get(strRespKey).Field_Type__c  == EHSer_Constants.CONS_LINKFIELDTYPE){
                                
                                // if value is not blank assign to value attribute
                                if(!String.isEmpty(value)  && !String.isBlank(value) ){
                                    detailCard.value = value;
                                    
                                    if(!respKeyId.split(',').contains(strApiName)){
                                        detailCard.isLink = true;
                                    }else{
                                        detailCard.isLink = false;
                                    }
                                } else{
                                    // if value is blank show EHSer_Constants.CONS_HYPHEN
                                    detailCard.value = EHSer_Constants.CONS_HYPHEN;
                                    detailCard.isLink = false;
                                }
                                strLookup = mapEdlResParam.get(strRespKey).Link_Look_For__c;
                                strLookup = strLookup.toLowerCase();
                                String recordId;
                                //assign the salesforce accountId to the map
                                if(EHSer_Constants.PROVIDER_KEY_NAMES.contains(strLookup) && EHSer_Constants.SERVICE_NAME_BYPASS.contains(serviceName)){ 
                                    if(apiValue==resultWrapper.locationUnique && resultWrapper.acctId<>null){
                                        mapTemp.remove(strApiName);
                                        mapTemp.put(strApiName,resultWrapper.acctId);
                                        recordId=resultWrapper.acctId;
                                    }else{
                                        mapTemp.remove(strApiName);
                                        mapTemp.put(strApiName,null);
                                    }
                                    if(apiValue==resultWrapper.locationUnique && resultWrapper.locationId<>null){
                                        mapTemp.remove('locationid');
                                        mapTemp.put('locationid',resultWrapper.locationId);
                                    }
                                    if(apiValue==resultWrapper.locationUnique && resultWrapper.providerIdVal<>null){
                                        mapTemp.remove('provideridval');
                                        mapTemp.put('provideridval',resultWrapper.providerIdVal);
                                    }    
                                }else{
                                    // assign salesforce recordId
                                    recordId = objectValue.get(String.valueOf(mapInstance.get(strApiName)));
                                    detailCard.detailId = recordId;      
                                }
                                // this map shall be used for case creation from detial page
                                if(!String.isEmpty(recordId) && !String.isBlank(recordId)){
                                    mapTemp.remove(strApiName);
                                    mapTemp.put(strApiName,recordId);
                                } else{
                                    mapTemp.remove(strApiName);
                                    mapTemp.put(strApiName,null);
                                    if(!String.isBlank(mapEdlResParam.get(strRespKey).EDL_Link_Service__r.DeveloperName) && !String.isEmpty(mapEdlResParam.get(strRespKey).EDL_Link_Service__r.DeveloperName)){
                                        mapInactiveLink.put(mapEdlResParam.get(strRespKey).Link_Look_For__c,apiValue);
                                        mapDefaultInactiveLinks.put(mapEdlResParam.get(strRespKey).EDL_Link_Service__r.DeveloperName,mapInactiveLink);
                                        detailCard.detailLinkDefaultValues = JSON.serializePretty(mapDefaultInactiveLinks);
                                    } 
                                }
                                //mapPrePopulate.put(edlInstance.API_Response__c,objectValue.get(String.valueOf(mapInstance.get(edlInstance.API_Response__c))));
                            } else if(mapEdlResParam.get(strRespKey).Field_Type__c == EHSer_Constants.CONS_EDL_LINKFIELDTYPE){
                                
                                // if value is not blank assign to value attribute
                                if(!String.isEmpty(value)  && !String.isBlank(value)){
                                    detailCard.value = value;
                                    //string[] lstRespKey = edlMasterAtt.Response_Key_Id__c.split(',');
                                    if(!respKeyId.split(',').contains(strApiName)){
                                        detailCard.isLink = true;
                                    }else{
                                        detailCard.isLink = false;
                                    } 
                                } else{
                                    // if value is blank show EHSer_Constants.CONS_HYPHEN
                                    detailCard.value = EHSer_Constants.CONS_HYPHEN;
                                    detailCard.isLink = false;
                                }
                                // assign salesforce recordId
                                
                                //String recordId = objectValue.get(String.valueOf(mapInstance.get(edlInstance.API_Response__c)));
                                detailCard.detailId = '';
                                if(!mapEDLLinks.isEmpty()){
                                    mapDefaultEDLLinks.put(mapEdlResParam.get(strRespKey).EDL_Link_Service__r.DeveloperName,mapEDLLinks.get(strApiName));
                                    detailCard.detailLinkDefaultValues = JSON.serializePretty(mapDefaultEDLLinks);
                                }
                                
                                
                            } else if(mapEdlResParam.get(strRespKey).Data_Type__c  == EHSer_Constants.CONS_TABLE_CURRENCY){
                                // if currency, set isCurrency flag
                                
                                if(!String.isEmpty(value) && !String.isBlank(value)){
                                    detailCard.value = value;
                                    detailCard.isCurrency = true;
                                } else{
                                    detailCard.value = EHSer_Constants.CONS_HYPHEN;
                                    detailCard.isCurrency = false;
                                }
                                detailCard.isLink = false;
                                detailCard.detailId = '';          
                            }
                            else{
                                // else map value flag
                                if(!String.isEmpty(value) && !String.isBlank(value)){
                                    detailCard.value = value;
                                } else{
                                    detailCard.value = EHSer_Constants.CONS_HYPHEN;
                                }
                                detailCard.isLink = false;
                                detailCard.isCurrency = false;
                                detailCard.detailId = '';
                            }
                            lstDetailWrap.add(detailCard);
                            // prepare section level detail Card
                            if(mapSectionResp.containsKey(mapEdlResParam.get(strRespKey).Section_Name__c)){
                                mapSectionResp.get(mapEdlResParam.get(strRespKey).Section_Name__c).add(detailCard);
                            } else {
                                mapSectionResp.put(mapEdlResParam.get(strRespKey).Section_Name__c,new list<detailPageCardWrapper> {detailCard});
                            }
                        }
                        
                    }
                    // put direct map instance, used for access softheon attributes
                    detailMapping.detailContent = mapInstance;
                }
                //system.debug('fine till here:');
                // prepare other buttons and softheon button
                list<string> lstDataSet = new list<string>(); 
                list<string> lstDataValuePair = new list<string>();
                map<string,string> mapDataSet = new map<string,string>();
                string detailRecordTypeId = '';
                string strPrePopulate = '';
                string prePopValue = '';
                map<string,string> brandMapping = getBrandMap();
                
                map<string,object> mapDefPreSetBrand = new map<string,object>();
                map<string,object> mapInstanceSource = detailMapping.detailContent;
                map<string,object> mapInstanceTemp = detailMapping.detailContent;
                
                // iterate over button attributes
                for(EDL_Button_Attribute__mdt edlButton : [SELECT Id, Button_Label__c,Entity_API_Name__c,Softhoen_Service_Name__c,EDLBrandAttribute__c,
                                                           IsActive__c,Order__c,IsSoftheonButton__c,Creation_Entity_Name__c,Action_Name__c,BrandSetup__c,IsMultipleService__c,MultiserviceKey__c
                                                           FROM EDL_Button_Attribute__mdt 
                                                           WHERE EDL_Master_Attributes__r.DeveloperName =: serviceName
                                                           AND IsActive__c =: TRUE ORDER BY Order__c]){
                                                               
                                                               // if softheon button, add to list of softheon option
                                                               
                                                               if(edlButton.Button_Label__c == 'New Case'){
                                                                   
                                                                   EHSER_CaseCreationBasedOnRecordType.caseCreationWrapper createObj = EHSER_CaseCreationBasedOnRecordType.caseCreationAutoPopulateValues(mapTemp,null,edlButton.Creation_Entity_Name__c,true);
                                                                   lstOthertOptions.add(new buttonOptions(edlButton.Button_Label__c,null,edlButton.Action_Name__c,JSON.serializePretty(createObj),edlButton.Entity_API_Name__c,false));
                                                               } 
                                                               //Added for Claim Line Additional Info 4761
                                                               else if(edlButton.Button_Label__c == 'Additional Claim Line details'){
                                                                   
                                                                   EHSER_CaseCreationBasedOnRecordType.caseCreationWrapper createObj = EHSER_CaseCreationBasedOnRecordType.caseCreationAutoPopulateValues(mapTemp,null,edlButton.Creation_Entity_Name__c,true);
                                                                  // lstOthertOptions.add(new buttonOptions(edlButton.Button_Label__c,null,edlButton.Action_Name__c,JSON.serializePretty(createObj),edlButton.Entity_API_Name__c,false));
                                                                   lstOthertOptions.add(new buttonOptions(edlButton.Button_Label__c,null,edlButton.Action_Name__c,JSON.serializePretty(createObj),edlButton.Entity_API_Name__c,false));
                                                               }
                                                               //END
                                                               else{
                                                                   boolean isDisabled = false;
                                                                   if(serviceName == 'Member_Plans' && edlButton.Action_Name__c == 'Order_ID_Card'){
                                                                       string planStatus = String.valueOf(mapInstanceTemp.get('status'));
                                                                       isDisabled = planStatus != 'Active' ? true : false;
                                                                   }
                                                                   lstOthertOptions.add(new buttonOptions(edlButton.Button_Label__c,null,edlButton.Action_Name__c,null,edlButton.Entity_API_Name__c,isDisabled));
                                                               }
                                                               
                                                           }
                detailMapping.detailContent = mapInstanceTemp;
                
                string strBrandMap = JSON.serialize(brandMapping);
                string defVal = '';
                map<string,object> mapTableValues = new map<string,object>();
                map<string,object> mapDateValues = new map<string,object>();
                
                Date dToday = System.Today();
                Datetime dt2 = datetime.newInstance(dToday.year()-2, dToday.month(),dToday.day());
                string startDate = dt2.format(EHSer_Constants.CONS_DATEFORMAT);
                mapDateValues.put(EHSer_Constants.CONS_DATESTART,startDate);
                
                DateTime dT = Date.Today();
                string endDate = dT.format(EHSer_Constants.CONS_DATEFORMAT);
                mapDateValues.put(EHSer_Constants.CONS_DATEEND,endDate);
                // this loop helps in creating the line items section required attributes
                for(EDL_Line_Attribute__mdt edlLineParam : [SELECT Id,Column_Size__c,DataSize__c,Default_Sort_Attribute__c,hideFilter__c,
                                                            Default_Values_To_Map__c,EnableFooterAction__c,EnableSearchBox__c,ShowOnlySearchBox__c,Disable_Two_Year_Restriction__c,
                                                            Footer_Action_Label__c,IsDetailSection__c,IsTable__c,IsCard__c,ShowOnlyDate__c,ShowRowNumber__c,
                                                            Line_Service_Name__c,Line_Item_Order__c,Parent_Value__c,Section_Header__c,Exclude_From_Filter__c,
                                                            EDL_Parent_Service__r.DeveloperName,sortedDirection__c,KeyValue__c,isLeftColumn__c
                                                            FROM EDL_Line_Attribute__mdt 
                                                            WHERE EDL_Parent_Service__r.DeveloperName =: serviceName
                                                            ORDER BY Line_Item_Order__c LIMIT 20]){
                                                                
                                                                // System.debug('edlLineParam.sortedDirection__c'+edlLineParam.sortedDirection__c);   
                                                                if(edlLineParam.sortedDirection__c == null)
                                                                    edlLineParam.sortedDirection__c = 'desc';
                                                                lineDetailsWrapper lineItemWrapper = new lineDetailsWrapper();
                                                                map<string,object> mapLineDef = new map<string,object>();
                                                                defVal = edlLineParam.Default_Values_To_Map__c;
                                                                
                                                                if(!String.isEmpty(defVal) && !String.isBlank(defVal)){
                                                                    String[] lstDefVal = defVal.split(',');
                                                                    for(string strPair : lstDefVal){
                                                                        string[] keyValue = strPair.split(':');
                                                                        string tempKey = keyValue[1].toLowerCase();
                                                                        mapLineDef.put(keyValue[0].trim(),mapClone.get(tempKey.trim()));
                                                                        // Added for SER-10152 to handle records which don't have sub group ID
                                                                        if((mapClone.get(tempKey.trim())==EHSer_Constants.CONS_HYPHEN || mapClone.get(tempKey.trim())==EHSer_Constants.CONS_HYPHEN_NO_SPACE)
                                                                           && serviceName== EHSer_Constants.SUB_GROUPS_SERVICENAME)
                                                                        {
                                                                            mapLineDef.remove(keyValue[0].trim());
                                                                        }
                                                                    }
                                                                    if(edlLineParam.IsTable__c){
                                                                        mapTableValues.put(EHSer_Constants.CONS_MUST,mapLineDef);
                                                                        mapTableValues.put(EHSer_Constants.CONS_DATERANGE,mapDateValues);
                                                                        lineItemWrapper.defaultValues = JSON.serializePretty(mapTableValues);
                                                                    } else if(edlLineParam.IsCard__c){
                                                                        mapTableValues.put(EHSer_Constants.CONS_MUST,mapLineDef);
                                                                        mapTableValues.put(EHSer_Constants.CONS_DATERANGE,mapDateValues);
                                                                        lineItemWrapper.defaultValues = JSON.serializePretty(mapTableValues);
                                                                    } else{
                                                                        lineItemWrapper.defaultValues = JSON.serializePretty(mapLineDef);
                                                                    }
                                                                }
                                                                string strLineParent = edlLineParam.Parent_Value__c;
                                                                strLineParent = strLineParent.toLowerCase();
                                                                lineItemWrapper.isTable = edlLineParam.IsTable__c;
                                                                lineItemWrapper.isDetail = edlLineParam.IsDetailSection__c;
                                                                lineItemWrapper.isCard = edlLineParam.IsCard__c;
                                                                lineItemWrapper.enableFooterAction = edlLineParam.EnableFooterAction__c;
                                                                lineItemWrapper.hideFilter = edlLineParam.hideFilter__c;
                                                                lineItemWrapper.enableSearchBox = edlLineParam.EnableSearchBox__c;
                                                                lineItemWrapper.showOnlyDate = edlLineParam.ShowOnlyDate__c;
                                                                lineItemWrapper.showOnlySearchBox = edlLineParam.ShowOnlySearchBox__c;
                                                                lineItemWrapper.noDateRestriction = edlLineParam.Disable_Two_Year_Restriction__c;
                                                                lineItemWrapper.showRowNumber = edlLineParam.ShowRowNumber__c;
                                                                lineItemWrapper.sortedDirection = edlLineParam.sortedDirection__c;
                                                                lineItemWrapper.dataSize = (Integer)edlLineParam.DataSize__c;
                                                                lineItemWrapper.columnSize = (Integer)edlLineParam.Column_Size__c;
                                                                lineItemWrapper.defaultSortAttribute = (!String.isEmpty(edlLineParam.Default_Sort_Attribute__c) && !String.isBlank(edlLineParam.Default_Sort_Attribute__c)) ? edlLineParam.Default_Sort_Attribute__c.toLowerCase() : edlLineParam.Default_Sort_Attribute__c;
                                                                lineItemWrapper.parentValue = String.valueOf(mapClone.get(strLineParent));
                                                                lineItemWrapper.lineServiceName = edlLineParam.Line_Service_Name__c;
                                                                lineItemWrapper.sectionHeader = edlLineParam.Section_Header__c;
                                                                lineItemWrapper.excludeFromFilter = edlLineParam.Exclude_From_Filter__c;
                                                                lineItemWrapper.isLeftColumn = edlLineParam.isLeftColumn__c;
                                                                if(edlLineParam.KeyValue__c!=null){
                                                                    lineItemWrapper.keyVal=edlLineParam.KeyValue__c;
                                                                }
                                                                lstLineItems.add(lineItemWrapper);
                                                            }
                
                
                // assign values to wrapper
                string strHdrFormat = edlMasterAtt.Detail_Header_Format__c;
                //Added for SER-10152 
               if(serviceName ==EHSer_Constants.SUB_GROUPS_SERVICENAME && ( mapHeaderInfo.get(EHSer_Constants.SUB_GROUPID) == EHSer_Constants.CONS_HYPHEN ||  mapHeaderInfo.get(EHSer_Constants.SUB_GROUPID) ==EHSer_Constants.CONS_HYPHEN_NO_SPACE))
                {
                    strHdrFormat = EHSer_Constants.GROUP_HEADER_FORMAT;
                    if(primaryKey == EHSer_Constants.CONS_HYPHEN || primaryKey == EHSer_Constants.CONS_HYPHEN_NO_SPACE)
                    {
                        primaryKey = mapHeaderInfo.get(EHSer_Constants.GROUP_NAME);
                    }
                }
                boolean formattedHeader = false;
                if(!String.isBlank(strHdrFormat) && !String.isEmpty(strHdrFormat)){
                    for(string strHdr : mapHeaderInfo.keySet()){
                        if(strHdrFormat.contains(strHdr)){
                            formattedHeader = true;
                            if(mapHeaderInfo.get(strHdr)<>null ){
                                strHdrFormat = strHdrFormat.replace(strHdr,mapHeaderInfo.get(strHdr));
                            }else{
                                strHdrFormat = strHdrFormat.replace(strHdr,'');
                            }
                        }
                    }
                }
                detailMapping.keyId = primaryKey;
                detailMapping.iconName = edlMasterAtt.IconName__c;
                detailMapping.objectHeader = edlMasterAtt.DetailHeaderName__c;
                detailMapping.objectSecondHeader = formattedHeader ? strHdrFormat : primaryKey;
                detailMapping.subTabName = primaryKey;
                detailMapping.detailWrapper = lstDetailWrap;
                detailMapping.detailHeaderName = edlMasterAtt.DetailHeaderName__c;
                detailMapping.detailSection = mapSectionResp;
                detailMapping.softheonButtons = lstSoftOptions;
                detailMapping.otherButtons = lstOthertOptions;
                detailMapping.lineItems = lstLineItems;
                detailMapping.brandMapping = strBrandMap;
                detailMapping.errorFlag = false;
                detailMapping.errorMessage = '';
                //Object obj = (Object)detailMapping;
            } catch(Exception e){
                // any exception, log errors and return error flag
                System.debug('Exception:'+e +' Line Number: '+e.getLineNumber());
                logErrors(true,e,null);
                detailMapping.iconName = edlMasterAtt.IconName__c;
                detailMapping.objectHeader = edlMasterAtt.DetailHeaderName__c;
                detailMapping.errorFlag = true;
                detailMapping.errorMessage = System.Label.EHSer_EDL_No_Records_Available;
            }
        }
        
        return detailMapping;
    }
    
    
    /* Name : returSObjbectList
* Purpose : this method returns SOSL results
*/
    public static List<List<sObject>> returnSobjbectList(list<string> searchValue, string strSearchIn){
        List<List <sObject>> resultList = new List<List<sObject>>();
        if(!searchValue.isEmpty()){
            try{
                // perform SOSL with OR
                String searchIds = String.join(searchValue, ' OR ');
                searchIds = String.escapeSingleQuotes(searchIds);
                //String searchQuery = 'FIND \'' + searchIds + '\' IN ALL FIELDS RETURNING  Account (Id,Name,AccountNumber),Contact(Id,name,Id__c,Brand__c,Employee__c)';
                String searchQuery = 'FIND \'' + searchIds + '\' IN ALL FIELDS RETURNING '+strSearchIn;
                
                System.debug('query: '+searchQuery);
                resultList = search.query(searchQuery); // perform search
            } catch (Exception e){
                // any exception, log errors
                System.debug('Exception: '+e.getMessage());
                logErrors(false,e,'returnSobjbectList:'+e.getLineNumber()+','+e.getMessage());
            }
        }
        system.debug('======> '+resultList);
        return resultList;
    }
    
    /* Name: logErrors
* Type: method
* Purpose: to log error to Exception Log
*/
    @TestVisible static void logErrors(Boolean eFlag, Exception logExc, String eBody){
        
        // call error handling mechanism
        EHSer_LogErrors logError = new EHSer_LogErrors(logExc,eFlag,eBody);
        ID jobId = System.enqueueJob(logError);
    }
    
    
    @AuraEnabled
    public static EHSer_FamilyRelatedListController_CC.familyWrapper fetchFamilyRelatedList(string contactId, string metaDataComponent, string objectName){
        EHSer_FamilyRelatedListController_CC.familyWrapper familyRelated = EHSer_FamilyRelatedListController_CC.getFamilyRelatedList(contactId,metaDataComponent,objectName);
        
        return familyRelated;
    }
    
    /* Name: formatMapKeySet
* Type: method
* Purpose: to format map keys to lower set
*/
    public static map<string,object> formatMapKeySet(map<string,object> mapOriginal){
        
        map<string,object> mapFormatted = new map<string,object>();
        string originalKey = '';
        if(mapOriginal <> null && !mapOriginal.isEmpty()){
            for(string mapKey : mapOriginal.keySet()){
                originalKey = mapKey;
                mapKey = mapKey.toLowerCase();
                if(!string.isEmpty(string.valueOf(mapOriginal.get(originalKey))) && !string.isBlank(string.valueOf(mapOriginal.get(originalKey)))){ 
                    mapFormatted.put(mapKey, mapOriginal.get(originalKey));
                }else{
                    mapFormatted.put(mapKey, EHSer_Constants.CONS_HYPHEN);
                }
            }
            return mapFormatted;
        } else{
            return mapFormatted;
        }
    }
    
    /* Name: saveInactvieMember
* Type: method
* Purpose: to insert inactive members before creating a case
*/
    @AuraEnabled
    public static string saveInactvieMember(string objectName, string objectData, string serviceName){
        
        list<sObject> lstObjRecords = new list<sObject>();
        map<string,object> objMapping = new map<string,object>();
        string savedRecId = '';
        try{
            sObject objRecord = Schema.getGlobalDescribe().get(objectName).newSObject();
            //system.debug('data: '+objectData);
            objMapping = (map<string,object>)JSON.deserializeUntyped(objectData);
            //system.debug('objMappingTest'+objMapping);
            map<string,EDL_Header_Response__mdt> mapEdlResParam = new map<string,EDL_Header_Response__mdt>([SELECT Id, API_Response__c,Detail_Page__c,Field_Type__c,
                                                                                                            Data_Type__c,Order_Detail__c,SFDC_Response_Label__c,Link_Look_For__c,
                                                                                                            EDL_Master_Attributes__c,Section_Name__c,SFDC_Object_Name__c,SFDC_Returning_Fields__c,
                                                                                                            IsArrayValue__c,Concatenation__c,
                                                                                                            Field_API_Name__c, EDL_Link_Service__r.DeveloperName
                                                                                                            FROM EDL_Header_Response__mdt 
                                                                                                            WHERE EDL_Master_Attributes__r.DeveloperName =: serviceName
                                                                                                            ORDER BY Order_Detail__c LIMIT 100]);
            string fieldType = '';
            // iterate over response attributes
            for(string respKey : mapEdlResParam.keySet()){
                string apiRespKey = mapEdlResParam.get(respKey).API_Response__c;
                apiRespKey = apiRespKey.toLowerCase();
                string fieldApiName = mapEdlResParam.get(respKey).Field_API_Name__c;
                // map api fields with response value
                if(!string.isEmpty(fieldApiName)){
                    boolean fieldExists = objRecord.getSobjectType().getDescribe().fields.getMap().keySet().contains(fieldApiName.toLowerCase());
                    boolean fieldEditable = objRecord.getSobjectType().getDescribe().fields.getMap().get(fieldApiName.toLowerCase()).getDescribe().isCalculated();
                    
                    if(fieldExists && !fieldEditable){
                        fieldType = String.valueOf(objRecord.getSobjectType().getDescribe().fields.getMap().get(fieldApiName).getDescribe().getType());
                        fieldType = fieldType.toLowerCase();
                        if(fieldType == EHSer_Constants.CONS_TABLE_DATE){
                            // get the response value into a string
                            String stringDate_Value = (String)objMapping.get(apiRespKey);
                            
                            if(!String.isEmpty(stringDate_Value)&& !String.isBlank(stringDate_Value)){
                                // if not empty, format the date
                                String[] splitDate_Value = stringDate_Value.split('/');
                                Date formattedDate_Value = Date.newInstance(Integer.valueOf(splitDate_Value[2]), Integer.valueOf(splitDate_Value[0]), Integer.valueOf(splitDate_Value[1]));
                                if(formattedDate_Value.year() != 9999){
                                    // if not open date
                                    objRecord.put(fieldApiName,formattedDate_Value);
                                }else{
                                    // if open date assign null
                                    objRecord.put(fieldApiName,null);
                                }
                            } else{
                                // if respose is null, formatting not required
                                objRecord.put(fieldApiName,null);
                            }
                        } else{
                            // map direct value mapping for record creation
                            
                            objRecord.put(fieldApiName,objMapping.get(apiRespKey));
                        }
                    }
                }
            }
            string strBrand = String.valueOf(objMapping.get(EHSer_Constants.CONS_BRAND));
            
            string strNewBrand = (!String.isEmpty(strBrand) && !String.isBlank(strBrand)) ? strBrand.toLowerCase() : strBrand;
            string strRecTypeName = getRecordTypeFromBrand(strNewBrand);
            String strRecTypeId = objRecord.getSobjectType().getDescribe().getRecordTypeInfosByDeveloperName().get(strRecTypeName).getRecordTypeId();
            
            objRecord.put(EHSer_Constants.CONS_RECORDTYPEID,strRecTypeId);
            //system.debug('record : '+JSON.serialize(objRecord));
            
            insert objRecord;
            savedRecId = String.valueOf(objRecord.get('Id'));
        } catch(Exception e){
            system.debug('catchException:'+e.getLineNumber()+','+e.getMessage());
            logErrors(false,e,'saveInactvieMember:'+e.getLineNumber()+','+e.getMessage());
            
            savedRecId = '';
        }
        return savedRecId;
    }
    
    public static string getRecordTypeFromBrand(string strBrand){
        
        map<string,string> mapBrandRecType = new map<string,string>();
        map<string,EHSer_LOB_Record_Type_Mapping__mdt> mapAllBrandRecType = new map<string,EHSer_LOB_Record_Type_Mapping__mdt>([SELECT Id,DeveloperName,LOB_Name__c,LOB_Type__c,Mapped_Rec_Value__c,SFDC_RecType_Name__c
                                                                                                                                FROM EHSer_LOB_Record_Type_Mapping__mdt LIMIT 100]);
        
        for(string strKey : mapAllBrandRecType.keySet()){
            string lobName = mapAllBrandRecType.get(strKey).LOB_Name__c;
            lobName = lobName.toLowerCase();
            mapBrandRecType.put(lobName,mapAllBrandRecType.get(strKey).SFDC_RecType_Name__c);
        }
        
        return mapBrandRecType.get(strBrand);
    }
    
    public static map<string,string> getBrandMap(){
        map<string,string> mapBrandType = new map<string,string>();
        map<string,EHSer_LOB_Record_Type_Mapping__mdt> mapAllBrandRecType = new map<string,EHSer_LOB_Record_Type_Mapping__mdt>([SELECT Id,DeveloperName,LOB_Name__c,LOB_Type__c,Mapped_Rec_Value__c,
                                                                                                                                Softheon_Expected_Value__c,SFDC_RecType_Name__c
                                                                                                                                FROM EHSer_LOB_Record_Type_Mapping__mdt LIMIT 100]);
        for(string strKey : mapAllBrandRecType.keySet()){
            string lobName = mapAllBrandRecType.get(strKey).LOB_Name__c;
            lobName = lobName.toLowerCase();
            mapBrandType.put(lobName,mapAllBrandRecType.get(strKey).Softheon_Expected_Value__c);
        }
        
        return mapBrandType;
        
    }
    @AuraEnabled
    public static Integer SubGrouCount(id recordId){
        List<Account> acc =[Select id,Sub_Group_Names__c from account where Id=:recordId];
        set<String> subGroupId = new set<String>();
        //System.debug('Abc'+acc);
        if(acc[0].Sub_Group_Names__c<>null){
            List<String> subGroup = acc[0].Sub_Group_Names__c.split(';');
            for(String value:subGroup){
                subGroupId.add(value);
            }
        }
        
        
        return subGroupId.size();
    }
}