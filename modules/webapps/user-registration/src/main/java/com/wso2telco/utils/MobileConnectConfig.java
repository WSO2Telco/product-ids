package com.wso2telco.utils;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import java.util.List;

@XmlRootElement(name = "MobileConnectConfig")
public class MobileConnectConfig {

    private String dataSourceName;
    private String encryptAppend;
    private String keyfile;
    private GSMAExchangeConfig gsmaExchangeConfig;
    private SMSConfig smsConfig;
    private USSDConfig ussdConfig;
    private String listenerWebappHost;


    @XmlElement(name = "MSS")
    protected MSS mss;
    
    @XmlElement(name = "HEADERENRICH")
    protected HEADERENRICH headerenrich;

    @XmlElement(name = "DataSourceName", defaultValue = "jdbc/CONNECT_DB")
    public String getDataSourceName() {
        return dataSourceName;
    }
    
    @XmlElement(name = "EncryptAppend")
    public String getEncryptAppend() {
        return encryptAppend;
    }
    
    @XmlElement(name = "Keyfile")
    public String getKeyfile() {
        return keyfile;
    }

    @XmlElement(name = "GSMAExchangeConfig")
    public GSMAExchangeConfig getGsmaExchangeConfig() {
        return gsmaExchangeConfig;
    }

    @XmlElement(name = "SMS")
    public SMSConfig getSmsConfig() {
        return smsConfig;
    }

    @XmlElement(name = "USSD")
    public USSDConfig getUssdConfig() {
        return ussdConfig;
    }

    @XmlElement(name = "ListenerWebappHost")
    public String getListenerWebappHost() {
        if (listenerWebappHost == null || listenerWebappHost.isEmpty()) {
            return "http://" + System.getProperty("carbon.local.ip") + ":9764";
        }
        return listenerWebappHost;
    }
    
    public void setDataSourceName(String dataSourceName) {
        this.dataSourceName = dataSourceName;
    }
    
    public void setEncryptAppend(String EncryptAppend) {
        this.encryptAppend = EncryptAppend;
    }
    
    public void setKeyfile(String Keyfile) {
        this.keyfile = Keyfile;
    }

    public void setGsmaExchangeConfig(GSMAExchangeConfig gsmaExchangeConfig) {
        this.gsmaExchangeConfig = gsmaExchangeConfig;
    }
    
    public void setSmsConfig(SMSConfig smsConfig) {
        this.smsConfig = smsConfig;
    }

    public void setUssdConfig(USSDConfig ussdConfig) {
        this.ussdConfig = ussdConfig;
    }

    public void setListenerWebappHost(String listenerWebappHost) {
        this.listenerWebappHost = listenerWebappHost;
    }

    public HEADERENRICH getHEADERENRICH() {
        return headerenrich;
    }

    public void setHEADERENRICH(HEADERENRICH value) {
        this.headerenrich = value;
    }

    public MSS getMSS() {
        return mss;
    }

    public void setMSS(MSS mss) {
        this.mss = mss;
    }


    public static class GSMAExchangeConfig {
        private String servingOperatorHost;
        private String organization;
        private String authToken;
        private ServingOperator servingOperator;

        @XmlElement(name = "SOHost")
        public String getServingOperatorHost() {
            return servingOperatorHost;
        }

        @XmlElement(name = "Organization")
        public String getOrganization() {
            return organization;
        }

        @XmlElement(name = "AuthToken")
        public String getAuthToken() {
            return authToken;
        }
        
        @XmlElement(name = "ServingOperator")
		public ServingOperator getServingOperator() {
			return servingOperator;
		}

        public void setServingOperatorHost(String servingOperatorHost) {
            this.servingOperatorHost = servingOperatorHost;
        }

        public void setOrganization(String organization) {
            this.organization = organization;
        }

        public void setAuthToken(String authToken) {
            this.authToken = authToken;
        }

		public void setServingOperator(ServingOperator servingOperator) {
			this.servingOperator = servingOperator;
		}
    }

    public static class SMSConfig {

        private String endpoint;
        private String authToken;
        private String message;

        @XmlElement(name = "Endpoint")
        public String getEndpoint() {
            return endpoint;
        }

        @XmlElement(name = "AuthToken")
        public String getAuthToken() {
            return authToken;
        }

        @XmlElement(name = "MessageContent")
        public String getMessage() {
            return message;
        }

        public void setEndpoint(String endpoint) {
            this.endpoint = endpoint;
        }

        public void setAuthToken(String authToken) {
            this.authToken = authToken;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }

    public static class USSDConfig {

        private String endpoint;
        private String authToken;
        private String message;
        private String shortCode;
        private String keyword;
        private String pinauth;
        private String dashBoard;
        private String ussdContextEndpoint;
        private String ussdPinContextEndpoint;

        @XmlElement(name = "Endpoint")
        public String getEndpoint() {
            return endpoint;
        }

        @XmlElement(name = "AuthToken")
        public String getAuthToken() {
            return authToken;
        }

        @XmlElement(name = "MessageContent")
        public String getMessage() {
            return message;
        }

        @XmlElement(name = "ShortCode")
        public String getShortCode() {
            return shortCode;
        }

        @XmlElement(name = "Keyword")
        public String getKeyword() {
            return keyword;
        }

        @XmlElement(name = "Pinauth")
        public String getPinauth() {
            return pinauth;
        }
        @XmlElement(name = "DashBoard")
        public String getDashBoard() {
            return dashBoard;
        }
        @XmlElement(name = "USSDContextEndpoint")
        public String getUssdContextEndpoint() {
			return ussdContextEndpoint;
		}
        @XmlElement(name = "USSDPinContextEndpoint")
        public String getUssdPinContextEndpoint() {
			return ussdPinContextEndpoint;
		}
        
        
        public void setEndpoint(String endpoint) {
            this.endpoint = endpoint;
        }

        public void setAuthToken(String authToken) {
            this.authToken = authToken;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public void setShortCode(String shortCode) {
            this.shortCode = shortCode;
        }

        public void setKeyword(String keyword) {
            this.keyword = keyword;
        }
        
        public void setPinauth(String pinauth) {
            this.pinauth = pinauth;
        }
        
        public void setDashBoard(String dashBoard) {
            this.dashBoard = dashBoard;
        }

		public void setUssdContextEndpoint(String ussdContextEndpoint) {
			this.ussdContextEndpoint = ussdContextEndpoint;
		}

		public void setUssdPinContextEndpoint(String ussdPinContextEndpoint) {
			this.ussdPinContextEndpoint = ussdPinContextEndpoint;
		}
        
    }

    /*public static class HEADERENRICH {

        private String endpoint;
        private String enrichflg;
        private String message;
        private List<String> mobileIPRanges;
        private String key;

        @XmlElementWrapper(name = "MobileIPRanges")
        @XmlElement(name = "IPRange")
        public List<String> getMobileIPRanges() {
            return mobileIPRanges;
        }

        public void setMobileIPRanges(List<String> mobileIPRanges) {
            this.mobileIPRanges = mobileIPRanges;
        }

        @XmlElement(name = "Endpoint")
        public String getEndpoint() {
            return endpoint;
        }

        @XmlElement(name = "Enrichflg")
        public String getEnrichflg() {
            return enrichflg;
        }

		@XmlElement(name = "key")
				public String getKey() {
					return key;
		}

        public void setEndpoint(String endpoint) {
            this.endpoint = endpoint;
        }

        public void setEnrichflg(String enrichflg) {
            this.enrichflg = enrichflg;
        }

        public void setKey(String key) {
            this.key = key;
        }
    }*/

    public static class HEADERENRICH {

        private List<OPERATOR> Operators;
        private String endpoint;
        private String enrichflg;
        private String key;

        @XmlElement(name = "Endpoint")
        public String getEndpoint() {
            return endpoint;
        }

        @XmlElement(name = "Enrichflg")
        public String getEnrichflg() {
            return enrichflg;
        }

        public void setEndpoint(String endpoint) {
            this.endpoint = endpoint;
        }

        public void setEnrichflg(String enrichflg) {
            this.enrichflg = enrichflg;
        }

        @XmlElement(name = "key")
        public String getKey() {
            return key;
        }
        public void setKey(String key) {
            this.key = key;
        }

        @XmlElement(name = "Operator")
        public List<OPERATOR> getOperators() {
            return Operators;
        }

        public void setOperators(List<OPERATOR> Operators) {
            this.Operators = Operators;
        }

    }

    public static class OPERATOR {

        private String operatorName;

        private String message;
        private List<String> mobileIPRanges;

        @XmlElementWrapper(name = "MobileIPRanges")
        @XmlElement(name = "IPRange")
        public List<String> getMobileIPRanges() {
            return mobileIPRanges;
        }

        public void setMobileIPRanges(List<String> mobileIPRanges) {
            this.mobileIPRanges = mobileIPRanges;
        }


        @XmlElement(name = "operatorName")
        public String getOperatorName() {
            return operatorName;
        }

        public void setOperatorName(String operatorName){ this.operatorName = operatorName; }



    }

    public static class MSS {
        private String endpoint;
        private int successStatus;
        private String mssText;
        private String mssPinTest;

        @XmlElement(name = "MssText")
        public String getMssText() {
            return mssText;
        }

        public void setMssText(String mssText) {
            this.mssText = mssText;
        }

        @XmlElement(name = "MssPinText")
        public String getMssPinTest() {
            return mssPinTest;
        }

        public void setMssPinTest(String mssPinTest) {
            this.mssPinTest = mssPinTest;
        }



        @XmlElement(name = "Endpoint")
        public String getEndpoint() {
            return endpoint;
        }

        @XmlElement(name = "SuccessStatus")
        public int getSuccessStatus() {
            return successStatus;
        }

        public void setEndpoint(String endpoint) {
            this.endpoint = endpoint;
        }

        public void setSuccessStatus(int successStatus) {
            this.successStatus = successStatus;
        }

    }
}
