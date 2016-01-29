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

import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;
import org.apache.axis2.context.ServiceContext;
import org.apache.axis2.transport.http.HTTPConstants;
import org.wso2.carbon.authenticator.stub.AuthenticationAdminStub;
import org.wso2.carbon.authenticator.stub.LoginAuthenticationExceptionException;
import org.wso2.carbon.authenticator.stub.LogoutAuthenticationExceptionException;
import org.wso2.carbon.um.ws.api.stub.*;
import org.wso2.carbon.um.ws.api.stub.SetUserClaimValues;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;

// TODO: Auto-generated Javadoc
//import org.wso2.


        
/**
 * The Class LoginAdminServiceClient.
 */
public class LoginAdminServiceClient {
	
	/** The service name. */
	private final String serviceName = "AuthenticationAdmin";
    
    /** The authentication admin stub. */
    private AuthenticationAdminStub authenticationAdminStub;
    
    /** The end point. */
    private String endPoint;

    /**
     * Instantiates a new login admin service client.
     *
     * @param backEndUrl the back end url
     * @throws AxisFault the axis fault
     */
    public LoginAdminServiceClient(String backEndUrl) throws AxisFault {
        //String path = "D:/currLife/is/wso2is-5.0.0/repository/resources/security/"
       //         + "wso2carbon.jks";
        
      //  System.setProperty("javax.net.ssl.trustStore", path);
      //  System.setProperty("javax.net.ssl.trustStorePassword", "wso2carbon");
        
        this.endPoint = backEndUrl + "/services/" + serviceName;
        authenticationAdminStub = new AuthenticationAdminStub(endPoint);
        
    }

    /**
     * Authenticate.
     *
     * @param userName the user name
     * @param password the password
     * @return the string
     * @throws RemoteException the remote exception
     * @throws LoginAuthenticationExceptionException the login authentication exception exception
     */
    public String authenticate(String userName, String password)
            throws RemoteException, LoginAuthenticationExceptionException {

        String sessionCookie = null;

        if (authenticationAdminStub.login(userName, password, "localhost")) {
            System.out.println("Login Successful");

            ServiceContext serviceContext = authenticationAdminStub
                    ._getServiceClient().getLastOperationContext()
                    .getServiceContext();
            sessionCookie = (String) serviceContext
                    .getProperty(HTTPConstants.COOKIE_STRING);
            System.out.println(sessionCookie);
        }
        return sessionCookie;
    }

    /**
     * Log out.
     *
     * @throws RemoteException the remote exception
     * @throws LogoutAuthenticationExceptionException the logout authentication exception exception
     */
    public void logOut() throws RemoteException, LogoutAuthenticationExceptionException {
        authenticationAdminStub.logout();
    }

    /**
     * Login user.
     *
     * @param userName the user name
     * @param password the password
     * @return the string
     * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
     */
    public String LoginUser(String userName,String password) throws RemoteUserStoreManagerServiceUserStoreExceptionException{
        String sessionKey = null;
        
        //String path = "/home/gayan/Documents/Dev/GSMA/IS_OpenId/testSetup1908/wso2is-5.0.0/repository/resources/security/"
        //        + "wso2carbon.jks";
        
        try {
                LoginAdminServiceClient lAdmin = new LoginAdminServiceClient(FileUtil.getApplicationProperty("admin_url"));
                String sessionCookie = lAdmin.authenticate("admin", "admin");
                ClaimManagementClient claimManager = new ClaimManagementClient(FileUtil.getApplicationProperty("admin_url"),sessionCookie);
                claimManager.setClaim();
        } catch (AxisFault e) {
                e.printStackTrace();
        } catch (RemoteException e) {
                e.printStackTrace();
        } catch (LoginAuthenticationExceptionException e) {
                e.printStackTrace();
        } 
        return sessionKey;
        
    }
    
    /**
     * Sets the pin.
     *
     * @param pin the new pin
     */
    public void setPIN(String pin){
        ServiceClient serviceClient;
        Options option;
        
        
        SetUserClaimValues claimAdmin = new SetUserClaimValues();
        
        //String username = claimAdmin.getUserName();
        
        System.out.println("Username is = " + claimAdmin.getUserName());
       // Options option
        //claimAdmin.setClaims(param);
    }

}
