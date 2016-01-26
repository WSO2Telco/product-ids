/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.axiata.dialog;


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
//import org.wso2.carbon.um.ws.api.stub.getC
       
/**
 *
 * @author tharanga_07219
 */
public class UserIdentityManagementClient {
    private final String serviceName = "UserIdentityManagementAdminService";
    private SetUserClaimValues setUserClaim;
    private String endPoint;
    private UserIdentityManagementAdminServiceStub remoteUser;
    
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
    
    public void lockUser(String username) throws RemoteException, UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException {
        System.out.println("Remote User lockUserAccount................" + username);
        remoteUser.lockUserAccount(username);
    }
}
