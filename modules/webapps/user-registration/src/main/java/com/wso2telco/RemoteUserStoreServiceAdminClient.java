package com.wso2telco;

import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.wso2.carbon.um.ws.api.stub.ClaimValue;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceStub;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceUserStoreExceptionException;

import java.rmi.RemoteException;

public class RemoteUserStoreServiceAdminClient {
    private final String serviceName = "RemoteUserStoreManagerService";
    private RemoteUserStoreManagerServiceStub remoteUserStoreManagerServiceStub;
    private String endPoint;

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

    public void setUserClaim(String userName, String claimURI, String claimValue, String profileName) throws
            RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException {

            remoteUserStoreManagerServiceStub.setUserClaimValue(userName, claimURI, claimValue, profileName);
    }

    public void setUserClaims(String userName, ClaimValue[] claimValues, String profileName ) throws
            RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException {
            remoteUserStoreManagerServiceStub.setUserClaimValues(userName, claimValues, profileName);
    }

    public boolean isExistingUser(String username) throws RemoteUserStoreManagerServiceUserStoreExceptionException, RemoteException {
        return remoteUserStoreManagerServiceStub.isExistingUser(username);
    }

}