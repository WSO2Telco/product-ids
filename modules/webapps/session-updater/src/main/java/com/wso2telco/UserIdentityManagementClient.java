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
import java.util.ArrayList;
import java.util.List;

import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.wso2.carbon.identity.mgt.stub.UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException;
import org.wso2.carbon.identity.mgt.stub.UserIdentityManagementAdminServiceStub;
import org.wso2.carbon.um.ws.api.stub.*;
import org.wso2.carbon.um.ws.api.stub.SetUserClaimValues;
import org.wso2.carbon.um.ws.api.stub.ClaimValue;
import org.wso2.carbon.um.ws.api.stub.PermissionDTO;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceStub;
// TODO: Auto-generated Javadoc
//import org.wso2.carbon.um.ws.api.stub.getC
       
 
/**
 * The Class UserIdentityManagementClient.
 */
public class UserIdentityManagementClient {
    
    /** The service name. */
    private final String serviceName = "UserIdentityManagementAdminService";
    
    /** The set user claim. */
    private SetUserClaimValues setUserClaim;
    
    /** The end point. */
    private String endPoint;
    
    /** The remote user. */
    private UserIdentityManagementAdminServiceStub remoteUser;
    
    /**
     * Instantiates a new user identity management client.
     *
     * @param backEndUrl the back end url
     * @param sessionCookie the session cookie
     * @throws AxisFault the axis fault
     */
    public UserIdentityManagementClient(String backEndUrl, String sessionCookie)
            throws AxisFault {
         this.endPoint = backEndUrl + "/services/" + serviceName;
           remoteUser = new UserIdentityManagementAdminServiceStub(endPoint);
        
        // Authenticate Your stub from sessionCooke
        ServiceClient serviceClient = null;
        Options option;
        
        serviceClient = remoteUser._getServiceClient();
        
        option = serviceClient.getOptions();
        option.setManageSession(true);
        option.setProperty(
                org.apache.axis2.transport.http.HTTPConstants.COOKIE_STRING,
                sessionCookie);
    }
    
    /**
     * Lock user.
     *
     * @param username the username
     * @throws RemoteException the remote exception
     * @throws UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException the user identity management admin service identity mgt service exception exception
     */
    public void lockUser(String username) throws RemoteException, UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException {
        System.out.println("Remote User lockUserAccount................" + username);
        remoteUser.lockUserAccount(username);
    }
}
