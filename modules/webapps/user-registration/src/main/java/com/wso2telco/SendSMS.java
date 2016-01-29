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

import java.util.List;

 
// TODO: Auto-generated Javadoc
/**
 * The Class SendSMS.
 */
public class SendSMS {
    
    /** The message. */
    private String message = "";
    
    /** The destination addresses. */
    private List<String> destinationAddresses;
    
    /** The password. */
    private String password = "";
    
    /** The application id. */
    private String applicationId = "";
    
    
    /**
     * Instantiates a new send sms.
     */
    public SendSMS() {
    }
    
    /**
     * Gets the message.
     *
     * @return the message
     */
    public String getMessage() {
            return message;
    }

    /**
     * Sets the message.
     *
     * @param message the new message
     */
    public void setMessage(String message) {
            this.message = message;
    }
    
    /**
     * Gets the address.
     *
     * @return the address
     */
    public List<String> getAddress() {
            return destinationAddresses;
    }

    /**
     * Sets the address.
     *
     * @param destinationAddresses the new address
     */
    public void setAddress(List<String> destinationAddresses) {
            this.destinationAddresses = destinationAddresses;
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
    
    
}
