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
package com.wso2telco.manager;

import java.rmi.RemoteException;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.carbon.authenticator.stub.LoginAuthenticationExceptionException;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminServiceException;
import org.wso2.carbon.identity.user.registration.stub.UserRegistrationAdminServiceIdentityException;
import org.wso2.carbon.identity.user.registration.stub.dto.UserDTO;
import org.wso2.carbon.identity.user.registration.stub.dto.UserFieldDTO;
import org.wso2.carbon.um.ws.api.stub.RemoteUserStoreManagerServiceUserStoreExceptionException;
import org.wso2.carbon.user.core.UserCoreConstants;

import com.wso2telco.DatabaseUtils;
import com.wso2telco.FileUtil;
import com.wso2telco.LoginAdminServiceClient;
import com.wso2telco.RemoteUserStoreServiceAdminClient;
import com.wso2telco.UserRegistrationAdminServiceClient;
import com.wso2telco.UserRegistrationData;
import com.wso2telco.manager.UserProfileClaimsConstant;

// TODO: Auto-generated Javadoc
/**
 * The Class UserProfileManager.
 */
public class UserProfileManager {
	
/** The user profile manager. */
private static UserProfileManager userProfileManager;

/** The remote user store service admin client. */
private RemoteUserStoreServiceAdminClient remoteUserStoreServiceAdminClient;

/** The log. */
private static Log log = LogFactory.getLog(UserProfileManager.class);
    
    /**
     * Instantiates a new user profile manager.
     */
    private UserProfileManager(){}
    
     
    static{
        try{
        	userProfileManager = new UserProfileManager();
        }catch(Exception e){
        	log.error("Error occured"+e);
            throw new RuntimeException("Exception occured in creating singleton instance");
        }
    }
    
    /**
     * Gets the single instance of UserProfileManager.
     *
     * @return single instance of UserProfileManager
     */
    public static UserProfileManager getInstance(){
        return userProfileManager;
    }
    
     
    /**
     * Manage profile.
     *
     * @param userRegistrationData the user registration data
     * @throws RemoteException the remote exception
     * @throws SQLException the SQL exception
     * @throws UserRegistrationAdminServiceIdentityException the user registration admin service identity exception
     * @throws LoginAuthenticationExceptionException the login authentication exception exception
     * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
     * @throws UserRegistrationAdminServiceException the user registration admin service exception
     * @throws Exception the exception
     */
    public void manageProfile(UserRegistrationData userRegistrationData) throws RemoteException, SQLException, UserRegistrationAdminServiceIdentityException, LoginAuthenticationExceptionException, RemoteUserStoreManagerServiceUserStoreExceptionException, UserRegistrationAdminServiceException, Exception {

		if (isUserExists(userRegistrationData.getUserName())) {
			updateUserProfile(userRegistrationData);
		} else {
			createUserProfile(userRegistrationData);
		}

	}
    
    
     
	/**
	 * Checks if is user exists.
	 *
	 * @param userName the user name
	 * @return true, if is user exists
	 * @throws SQLException the SQL exception
	 * @throws Exception the exception
	 */
	public boolean isUserExists(String userName) throws SQLException, Exception {
		 
		getAdminClient();
		boolean userExists = false;
		if (remoteUserStoreServiceAdminClient.isExistingUser(userName)) {
			userExists = true; // user already exists
		}
		log.info("is user exists"+userExists);
		return userExists;
	}

	 
	/**
	 * Gets the admin client.
	 *
	 * @return the admin client
	 * @throws SQLException the SQL exception
	 * @throws RemoteException the remote exception
	 * @throws Exception the exception
	 */
	public void getAdminClient() throws SQLException, RemoteException, Exception {
		 
		LoginAdminServiceClient lAdmin = new LoginAdminServiceClient(FileUtil.getApplicationProperty("isadminurl"));
		 
		String sessionCookie = lAdmin.authenticate(FileUtil.getApplicationProperty("adminusername"),
				FileUtil.getApplicationProperty("adminpassword"));
		 
		remoteUserStoreServiceAdminClient = new RemoteUserStoreServiceAdminClient(
				FileUtil.getApplicationProperty("isadminurl"), sessionCookie);
		log.debug("RemoteUserStoreServiceAdminClient "+remoteUserStoreServiceAdminClient);
	}

	 
	/**
	 * Creates the user profile.
	 *
	 * @param userRegistrationData the user registration data
	 * @throws RemoteException the remote exception
	 * @throws UserRegistrationAdminServiceIdentityException the user registration admin service identity exception
	 * @throws UserRegistrationAdminServiceException the user registration admin service exception
	 * @throws SQLException the SQL exception
	 */
	public void createUserProfile(UserRegistrationData userRegistrationData) throws RemoteException,
			UserRegistrationAdminServiceIdentityException, UserRegistrationAdminServiceException, SQLException {
		
		 
		String adminURL = FileUtil.getApplicationProperty("isadminurl") + UserProfileClaimsConstant.SERVICE_URL;
		log.debug(adminURL);
		 
		UserRegistrationAdminServiceClient userRegistrationAdminServiceClient = new UserRegistrationAdminServiceClient(
				adminURL);
		 
		UserFieldDTO[] userFieldDTOs = userRegistrationAdminServiceClient
				.readUserFieldsForUserRegistration(userRegistrationData.getClaim());
		
		 
		String[] fieldValues = userRegistrationData.getFieldValues().split(",");
		for (int count = 0; count < fieldValues.length; count++) {
			userFieldDTOs[count].setFieldValue(fieldValues[count]);
			log.info("userFieldDTOs : "+userFieldDTOs[count].getFieldName()+" = "+fieldValues[count]);
			 
			if (userRegistrationData.getHashPin() != null && userFieldDTOs[count].getFieldName().equals("pin")) {
				userFieldDTOs[count].setFieldValue(userRegistrationData.getHashPin());
				log.info("userFieldDTOs : "+userFieldDTOs[count].getFieldName()+" = "+userRegistrationData.getHashPin());

			}
		}
		
		//setting properties of user DTO
		UserDTO userDTO = new UserDTO();
		userDTO.setOpenID(userRegistrationData.getOpenId());
		userDTO.setPassword(userRegistrationData.getPassword());
		userDTO.setUserFields(userFieldDTOs);
		userDTO.setUserName(userRegistrationData.getUserName());
		
		// add user DTO to the user registration admin service client
		userRegistrationAdminServiceClient.addUser(userDTO);
		
		//update databse after success registration of user
		DatabaseUtils.updateRegStatus(userRegistrationData.getUserName(), UserProfileClaimsConstant.REG_STATUS);
		DatabaseUtils.updateAuthenticateData(userRegistrationData.getUserName(), UserProfileClaimsConstant.AUTH_STATUS);
		log.info("user registration successfull "+userRegistrationData.getUserName());
	}

	 
	/**
	 * Update user profile.
	 *
	 * @param userRegistrationData the user registration data
	 * @throws RemoteException the remote exception
	 * @throws UserRegistrationAdminServiceIdentityException the user registration admin service identity exception
	 * @throws LoginAuthenticationExceptionException the login authentication exception exception
	 * @throws RemoteUserStoreManagerServiceUserStoreExceptionException the remote user store manager service user store exception exception
	 * @throws SQLException the SQL exception
	 */
	public void updateUserProfile(UserRegistrationData userRegistrationData) throws RemoteException,
			UserRegistrationAdminServiceIdentityException, LoginAuthenticationExceptionException,
			RemoteUserStoreManagerServiceUserStoreExceptionException, SQLException {

		String userName = userRegistrationData.getUserName();
		String pinHash = userRegistrationData.getHashPin();

		if (userRegistrationData.isUpdateProfile()) {
			
			log.info("user profile update for the loa2 to loa3 registration "+userRegistrationData.getUserName());
			 
			String adminURL = FileUtil.getApplicationProperty("isadminurl") + UserProfileClaimsConstant.SERVICE_URL;
			log.debug(adminURL);
			 
			UserRegistrationAdminServiceClient userRegistrationAdminServiceClient = new UserRegistrationAdminServiceClient(
					adminURL);
			 
			UserFieldDTO[] userFieldDTOs = userRegistrationAdminServiceClient
					.readUserFieldsForUserRegistration(userRegistrationData.getClaim());
			
			 
			String[] fieldValues = userRegistrationData.getFieldValues().split(",");
			
			for (int count = 0; count < fieldValues.length; count++) {
				
								
				 
				if (userFieldDTOs[count].getClaimUri().equals(UserProfileClaimsConstant.LOA)) {
					log.debug(userFieldDTOs[count].getClaimUri()+" : "+fieldValues[count]);
					remoteUserStoreServiceAdminClient.setUserClaim(userName, UserProfileClaimsConstant.LOA,
							fieldValues[count], UserCoreConstants.DEFAULT_PROFILE);
				}
				 
				if (userFieldDTOs[count].getClaimUri().equals(UserProfileClaimsConstant.CHALLENGEQUESTION1)) {
					log.debug(userFieldDTOs[count].getClaimUri()+" : "+fieldValues[count]);
					remoteUserStoreServiceAdminClient.setUserClaim(userName,
							UserProfileClaimsConstant.CHALLENGEQUESTION1, fieldValues[count],
							UserCoreConstants.DEFAULT_PROFILE);
				}
				 
				if (userFieldDTOs[count].getClaimUri().equals(UserProfileClaimsConstant.CHALLENGEQUESTION2)) {
					log.debug(userFieldDTOs[count].getClaimUri()+" : "+fieldValues[count]);
					remoteUserStoreServiceAdminClient.setUserClaim(userName,
							UserProfileClaimsConstant.CHALLENGEQUESTION2, fieldValues[count],
							UserCoreConstants.DEFAULT_PROFILE);
				}

			}
		}
		
		log.info("user profile update for pin "+userRegistrationData.getUserName());
		 
		log.debug(UserProfileClaimsConstant.PIN+" : "+pinHash);
		remoteUserStoreServiceAdminClient.setUserClaim(userName, UserProfileClaimsConstant.PIN, pinHash,
				UserCoreConstants.DEFAULT_PROFILE);
		
		//update databse after success profile update 
		DatabaseUtils.updateRegStatus(userName, UserProfileClaimsConstant.REG_STATUS);
		DatabaseUtils.updateAuthenticateData(userName, UserProfileClaimsConstant.AUTH_STATUS);
		log.info("user profile update successfull "+userRegistrationData.getUserName());
	}

    
    

}
