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
package com.wso2telco.entity;

import java.sql.Date;

 
// TODO: Auto-generated Javadoc
/**
 * The Class LoginHistory.
 */
public class LoginHistory {
    
    /** The application id. */
    private String applicationId;
    
    /** The auth user. */
    private String authUser;
    
    /** The authenticated. */
    private String authenticated;
    
    /** The authenticators. */
    private String authenticators;
    
    /** The auth ipaddress. */
    private String authIpaddress;
    
    /** The created date. */
    private String createdDate;

    /**
     * Instantiates a new login history.
     *
     * @param applicationId the application id
     * @param authUser the auth user
     * @param authenticated the authenticated
     * @param authIpaddress the auth ipaddress
     * @param createdDate the created date
     */
    public LoginHistory(String applicationId, String authUser, String authenticated, String authIpaddress, String createdDate) {
        this.applicationId = applicationId;
        this.authUser = authUser;
        this.authenticated = authenticated;
        this.authIpaddress = authIpaddress;
        this.createdDate = createdDate;
    }   
    
    /**
     * Gets the application id.
     *
     * @return the application id
     */
    public String getApplicationId() {
        return applicationId;
    }

    /**
     * Sets the application id.
     *
     * @param applicationId the new application id
     */
    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    /**
     * Gets the auth user.
     *
     * @return the auth user
     */
    public String getAuthUser() {
        return authUser;
    }

    /**
     * Sets the auth user.
     *
     * @param authUser the new auth user
     */
    public void setAuthUser(String authUser) {
        this.authUser = authUser;
    }

    /**
     * Gets the authenticated.
     *
     * @return the authenticated
     */
    public String getAuthenticated() {
        return ( authenticated.equalsIgnoreCase("1") ? "SUCCESS" : "FAILED");
    }

    /**
     * Sets the authenticated.
     *
     * @param authenticated the new authenticated
     */
    public void setAuthenticated(String authenticated) {
        this.authenticated = authenticated;
    }

    /**
     * Gets the authenticators.
     *
     * @return the authenticators
     */
    public String getAuthenticators() {
        return authenticators;
    }

    /**
     * Sets the authenticators.
     *
     * @param authenticators the new authenticators
     */
    public void setAuthenticators(String authenticators) {
        this.authenticators = authenticators;
    }

    /**
     * Gets the auth ipaddress.
     *
     * @return the auth ipaddress
     */
    public String getAuthIpaddress() {
        return authIpaddress;
    }

    /**
     * Sets the auth ipaddress.
     *
     * @param authIpaddress the new auth ipaddress
     */
    public void setAuthIpaddress(String authIpaddress) {
        this.authIpaddress = authIpaddress;
    }

    /**
     * Gets the created date.
     *
     * @return the created date
     */
    public String getCreatedDate() {
        return createdDate;
    }

    /**
     * Sets the created date.
     *
     * @param createdDate the new created date
     */
    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
}
