package com.wso2telco;

/**
 * Created by nipuni on 3/26/15.
 */
public class UserRegistrationData {

    private String userName;
    private String msisdn;
    private String openId;
    private String password;
    private String claim;
    private String domain;
    private String fieldValues;
    private long userRegistrationTime;
    private boolean updateProfile;
    private String hashPin;



	public UserRegistrationData(String userName, String msisdn, String openId, String password, String claim, String domain, String params, boolean updateProfile) {
        this.userName = userName;
        this.msisdn = msisdn;
        this.openId = openId;
        this.password = password;
        this.claim = claim;
        this.domain = domain;
        this.fieldValues = params;
        this.updateProfile = updateProfile;
        
        userRegistrationTime = System.currentTimeMillis();
    }
    
    


    public String getHashPin() {
		return hashPin;
	}




	public void setHashPin(String hashPin) {
		this.hashPin = hashPin;
	}

    public boolean isUpdateProfile() {
		return updateProfile;
	}


	public void setUpdateProfile(boolean updateProfile) {
		this.updateProfile = updateProfile;
	}


	public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMsisdn() {
        return msisdn;
    }

    public void setMsisdn(String msisdn) {
        this.msisdn = msisdn;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getClaim() {
        return claim;
    }

    public void setClaim(String claim) {
        this.claim = claim;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getFieldValues() {
        return fieldValues;
    }

    public void setFieldValues(String fieldValues) {
        this.fieldValues = fieldValues;
    }

    public long getUserRegistrationTime() {
        return userRegistrationTime;
    }
}
