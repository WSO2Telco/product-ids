/*
 * LoginHistory.java
 * Oct 28, 2014  10:29:17 AM
 * Roshan.Saputhanthri
 *
 * Copyright (C) Dialog Axiata PLC. All Rights Reserved.
 */

package com.axiata.dialog.entity;

import java.sql.Date;

/**
 * <TO-DO> <code>LoginHistory</code>
 * @version $Id: LoginHistory.java,v 1.00.000
 */
public class LoginHistory {
    
    private String applicationId;
    private String authUser;
    private String authenticated;
    private String authenticators;
    private String authIpaddress;
    private String createdDate;

    public LoginHistory(String applicationId, String authUser, String authenticated, String authIpaddress, String createdDate) {
        this.applicationId = applicationId;
        this.authUser = authUser;
        this.authenticated = authenticated;
        this.authIpaddress = authIpaddress;
        this.createdDate = createdDate;
    }   
    
    public String getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    public String getAuthUser() {
        return authUser;
    }

    public void setAuthUser(String authUser) {
        this.authUser = authUser;
    }

    public String getAuthenticated() {
        return ( authenticated.equalsIgnoreCase("1") ? "SUCCESS" : "FAILED");
    }

    public void setAuthenticated(String authenticated) {
        this.authenticated = authenticated;
    }

    public String getAuthenticators() {
        return authenticators;
    }

    public void setAuthenticators(String authenticators) {
        this.authenticators = authenticators;
    }

    public String getAuthIpaddress() {
        return authIpaddress;
    }

    public void setAuthIpaddress(String authIpaddress) {
        this.authIpaddress = authIpaddress;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
}
