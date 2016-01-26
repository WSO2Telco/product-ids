package com.wso2telco;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminService;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminServiceException;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminServiceIdentityException;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminServiceStub;
import org.wso2.carbon.identity.user.registration.stub.dto.UserDTO;
import org.wso2.carbon.identity.user.registration.stub.dto.UserFieldDTO;

import java.rmi.RemoteException;

/**
 * Created by nipuni on 3/26/15.
 */
public class UserRegistrationAdminServiceClient {

    private static Log log = LogFactory.getLog(UserRegistrationAdminServiceClient.class);
    private UserRegistrationAdminService userRegistrationAdminService;

    public UserRegistrationAdminServiceClient(String backendUrl){
        try {
            userRegistrationAdminService = new UserRegistrationAdminServiceStub(null, backendUrl);
        } catch (Exception e) {
            log.error(e);
        }
    }

    public void addUser(UserDTO userDTO) throws RemoteException, UserRegistrationAdminServiceException {
        userRegistrationAdminService.addUser(userDTO);
    }

    public UserFieldDTO[] readUserFieldsForUserRegistration(String dialect) throws UserRegistrationAdminServiceIdentityException, RemoteException {
        return userRegistrationAdminService.readUserFieldsForUserRegistration(dialect);
    }
}
