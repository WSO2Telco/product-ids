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
package com.wso2telco.identity.application.authentication.endpoint.samlsso;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// TODO: Auto-generated Javadoc
/**
 * The Class SAMLSSOLogin.
 */
public class SAMLSSOLogin extends HttpServlet {

    /* (non-Javadoc)
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        if(request.getRequestURI().contains("/samlsso_login.do")){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (request.getRequestURI().contains("/samlsso_redirect.do")){
            request.getRequestDispatcher("samlsso_redirect.jsp").forward(request, response);
        }  else if (request.getRequestURI().contains("/samlsso_notification.do")){
            request.getRequestDispatcher("samlsso_notification.jsp").forward(request, response);
        }

    }

}
