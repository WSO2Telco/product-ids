/*******************************************************************************
 * Copyright (c) 2015-2016, WSO2.Telco Inc. (http://www.wso2telco.com) 
 * 
 * All Rights Reserved. WSO2.Telco Inc. licences this file to youunder the Apache License, Version 2.0 (the "License");
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
package com.wso2telco.identity.application.authentication.endpoint;

import java.io.IOException;

// TODO: Auto-generated Javadoc
/**
 * The Class AuthenticationException.
 */
public class AuthenticationException extends IOException {
    
    /**
     * Instantiates a new authentication exception.
     */
    public AuthenticationException(){
        super();
    }

    /**
     * Instantiates a new authentication exception.
     *
     * @param e the e
     */
    public AuthenticationException(Exception e){
        super(e);
    }

    /**
     * Instantiates a new authentication exception.
     *
     * @param message the message
     */
    public AuthenticationException(String message){
        super(message);
    }
}
