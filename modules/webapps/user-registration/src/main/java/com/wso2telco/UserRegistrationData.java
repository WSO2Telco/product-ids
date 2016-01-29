/*******************************************************************************
 * Copyright (c) 2015-2016, WSO2.Telco Inc. (http://www.wso2telco.com) 
 * 
 * All Rights Reserved. WSO2.Telco Inc. licences this file to you under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.wso2telco;

 
// TODO: Auto-generated Javadoc
/**
 * The Class UserRegistrationData.
 */
public class UserRegistrationData {

    /** The user name. */
    private String userName;
    
    /** The msisdn. */
    private String msisdn;
    
    /** The open id. */
    private String openId;
    
    /** The password. */
    private String password;
    
    /** The claim. */
    private String claim;
    
    /** The domain. */
    private String domain;
    
    /** The field values. */
    private String fieldValues;
    
    /** The user registration time. */
    private long userRegistrationTime;
    
    /** The update profile. */
    private boolean updateProfile;
    
    /** The hash pin. */
    private String hashPin;



	/**
	 * Instantiates a new user registration data.
	 *
	 * @param userName the user name
	 * @param msisdn the msisdn
	 * @param openId the open id
	 * @param password the password
	 * @param claim the claim
	 * @param domain the domain
	 * @param params the params
	 * @param updateProfile the update profile
	 */
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
    
    


    /**
     * Gets the hash pin.
     *
     * @return the hash pin
     */
    public String getHashPin() {
		return hashPin;
	}




	/**
	 * Sets the hash pin.
	 *
	 * @param hashPin the new hash pin
	 */
	public void setHashPin(String hashPin) {
		this.hashPin = hashPin;
	}

    /**
     * Checks if is update profile.
     *
     * @return true, if is update profile
     */
    public boolean isUpdateProfile() {
		return updateProfile;
	}


	/**
	 * Sets the update profile.
	 *
	 * @param updateProfile the new update profile
	 */
	public void setUpdateProfile(boolean updateProfile) {
		this.updateProfile = updateProfile;
	}


	/**
	 * Gets the user name.
	 *
	 * @return the user name
	 */
	public String getUserName() {
        return userName;
    }

    /**
     * Sets the user name.
     *
     * @param userName the new user name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the msisdn.
     *
     * @return the msisdn
     */
    public String getMsisdn() {
        return msisdn;
    }

    /**
     * Sets the msisdn.
     *
     * @param msisdn the new msisdn
     */
    public void setMsisdn(String msisdn) {
        this.msisdn = msisdn;
    }

    /**
     * Gets the open id.
     *
     * @return the open id
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * Sets the open id.
     *
     * @param openId the new open id
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * Gets the password.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password.
     *
     * @param password the new password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets the claim.
     *
     * @return the claim
     */
    public String getClaim() {
        return claim;
    }

    /**
     * Sets the claim.
     *
     * @param claim the new claim
     */
    public void setClaim(String claim) {
        this.claim = claim;
    }

    /**
     * Gets the domain.
     *
     * @return the domain
     */
    public String getDomain() {
        return domain;
    }

    /**
     * Sets the domain.
     *
     * @param domain the new domain
     */
    public void setDomain(String domain) {
        this.domain = domain;
    }

    /**
     * Gets the field values.
     *
     * @return the field values
     */
    public String getFieldValues() {
        return fieldValues;
    }

    /**
     * Sets the field values.
     *
     * @param fieldValues the new field values
     */
    public void setFieldValues(String fieldValues) {
        this.fieldValues = fieldValues;
    }

    /**
     * Gets the user registration time.
     *
     * @return the user registration time
     */
    public long getUserRegistrationTime() {
        return userRegistrationTime;
    }
}
