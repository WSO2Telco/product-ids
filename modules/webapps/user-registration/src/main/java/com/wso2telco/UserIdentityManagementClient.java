package com.wso2telco;


import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.wso2.carbon.identity.mgt.stub.UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException;
import org.wso2.carbon.identity.mgt.stub.UserIdentityManagementAdminServiceStub;
import org.wso2.carbon.um.ws.api.stub.SetUserClaimValues;

import java.rmi.RemoteException;
//
       

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
    
    public void unlockUser(String username) throws RemoteException, UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException {
        System.out.println("Remote User unlockUserAccount................" + username);
        remoteUser.unlockUserAccount(username, "");
    }
    
    
    public void lockUser(String username) throws RemoteException, UserIdentityManagementAdminServiceIdentityMgtServiceExceptionException {
        System.out.println("Remote User lockUserAccount................" + username);
        remoteUser.lockUserAccount(username);
    }
}
