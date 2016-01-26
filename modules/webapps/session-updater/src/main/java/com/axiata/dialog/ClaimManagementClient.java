/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.axiata.dialog;


import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
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
public class ClaimManagementClient {
    private final String serviceName = "RemoteUserStoreManagerService";
    private SetUserClaimValues setUserClaim;
    private String endPoint;
    private RemoteUserStoreManagerServiceStub remoteUser;
    
    public ClaimManagementClient(String backEndUrl, String sessionCookie)
            throws AxisFault {
         this.endPoint = backEndUrl + "/services/" + serviceName;
           remoteUser = new RemoteUserStoreManagerServiceStub(endPoint);
        
     
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

    public void setClaim() throws RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException {
        System.out.println("Remote User " + remoteUser.getProfileNames("admin").toString());
    }
    
    public String getPIN(String msisdn) throws RemoteException, RemoteUserStoreManagerServiceUserStoreExceptionException{
        return remoteUser.getUserClaimValue(msisdn, "http://wso2.org/claims/pin", "default");
//        ClaimDTO[] arr = remoteUser.getUserClaimValues(msisdn, "default");
//        for(ClaimDTO dto : arr) {
//            if("http://wso2.org/claims/pin".equals(dto.getClaimUri())) {
//                return dto.getValue();
//            }
//        }
//        return null;
    }
}
