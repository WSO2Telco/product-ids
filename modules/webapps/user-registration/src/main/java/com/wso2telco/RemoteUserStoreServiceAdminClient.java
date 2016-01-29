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

import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.wso2.carbon.um.ws.api.stub.ClaimValue;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceStub;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceUserStoreExceptionException;

import java.rmi.RemoteException;

// TODO: Auto-generated Javadoc
/**
 * The Class RemoteUserStoreServiceAdminClient.
 */
public class RemoteUserStoreServiceAdminClient {
    
    /** The service name. */
    private final String serviceName = "RemoteUserStoreManagerService";
    
    /** The remote user store manager service stub. */
    private RemoteUserStoreManagerServiceStub remoteUserStoreManagerServiceStub;
    
    /** The end point. */
    private String endPoint;

    /**
     * Instantiates a new remote user store service admin client.
     *
     * @param backEndUrl the back end url
     * @param sessionCookie the session cookie
     * @throws AxisFault the axis fault
     */
    public RemoteUserStoreServiceAdminClient(String backEndUrl, String sessionCookie) throws AxisFault {
        this.endPoint = backEndUrl + "/services/" + serviceName;
        remoteUserStoreManagerServiceStub = new RemoteUserStoreManagerServiceStub(endPoint);
        //Authenticate Your stub from sessionCookie
        ServiceClient serviceClient;
        Options option;

        serviceClient = remoteUserStoreManagerServiceStub._getServiceClient();
        option = serviceClient.getOptions();
        option.setManageSession(true);
        option.setProperty(org.apache.axis2.transport.http.HTTPConstants.COOKIE_STRING, sessionCookie);
    }

    /**
     * Sets the user claim.
     *
     * @param userName the user name
     * @param claimURI the claim uri
     * @param claimValue the claim value
     * @param profileName the profile name
     * @throws RemoteException the remote exception
     * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
     */
    public void setUserClaim(String userName, String claimURI, String claimValue, String profileName) throws
            RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException {

            remoteUserStoreManagerServiceStub.setUserClaimValue(userName, claimURI, claimValue, profileName);
    }

    /**
     * Sets the user claims.
     *
     * @param userName the user name
     * @param claimValues the claim values
     * @param profileName the profile name
     * @throws RemoteException the remote exception
     * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
     */
    public void setUserClaims(String userName, ClaimValue[] claimValues, String profileName ) throws
            RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException {
            remoteUserStoreManagerServiceStub.setUserClaimValues(userName, claimValues, profileName);
    }

    /**
     * Checks if is existing user.
     *
     * @param username the username
     * @return true, if is existing user
     * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
     * @throws RemoteException the remote exception
     */
    public boolean isExistingUser(String username) throws RemoteUserStoreManagerServiceUserStoreExceptionException, RemoteException {
        return remoteUserStoreManagerServiceStub.isExistingUser(username);
    }

}
