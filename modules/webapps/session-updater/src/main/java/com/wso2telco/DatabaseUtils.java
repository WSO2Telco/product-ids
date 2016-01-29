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

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.wso2telco.entity.LoginHistory;



 
// TODO: Auto-generated Javadoc
/**
 * The Class DatabaseUtils.
 */
public class DatabaseUtils {

    /** The ussd datasource. */
    private static volatile DataSource ussdDatasource = null;
    
   // private static final org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(Endpoints.class.getName());

    /** The log. */
   private static Log log = LogFactory.getLog(DatabaseUtils.class);

    /**
     * Initialize data source.
     *
     * @throws NamingException the naming exception
     */
    public static void initializeDataSource() throws NamingException {
        if (ussdDatasource != null ) {
            return;
        }

        String statdataSourceName = "jdbc/CONNECT_DB";

        if (statdataSourceName != null) {
            try {
                Context ctx = new InitialContext();
                ussdDatasource = (DataSource) ctx.lookup(statdataSourceName);
            } catch (NamingException e) {
               //log.error(e);
               throw e;
            }

        }
    }
   
     /**
      * Update u ser status.
      *
      * @param sessionID the session id
      * @param status the status
      * @throws SQLException the SQL exception
      */
     public static void updateUSerStatus(String sessionID, String status) throws SQLException{
        Connection connection = null;
        PreparedStatement ps = null;
        
        String sql = "INSERT INTO `clientstatus` (`SessionID`, `Status`) VALUES (?, ?);";
       
            try {
                connection = getUssdDBConnection();
            
                ps = connection.prepareStatement(sql);

                ps.setString(1, sessionID);
                ps.setString(2, status);

                // LOG.info(sql);
                ps.execute();
                        
		} catch (NamingException ex) {
			log.error("Naming Error occurred: "+ex);
                 //Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
             } 
            catch (SQLException e) {
    			log.error("SQL Error occurred: "+e);
                    System.out.print(e.getMessage());
		} finally {
                        connection.close();			
		}
            
    }
     
    /**
     * Update status.
     *
     * @param sessionID the session id
     * @param status the status
     * @throws SQLException the SQL exception
     */
    public static void updateStatus(String sessionID, String status) throws SQLException{
        Connection connection = null;
        PreparedStatement ps = null;
        
        String sql =
		             "update `clientstatus` set "
		                     + "Status=? where " 
                                     + "SessionID=?;" ;
       
            try {
                connection = getUssdDBConnection();
            
                ps = connection.prepareStatement(sql);

                ps.setString(1, status);
                ps.setString(2, sessionID);

                ps.execute();
             
                        
            } catch (NamingException ex) {
    			log.error("Naming Error occurred: "+ex);
                // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
             } 
            catch (SQLException e) {
    			log.error("SQL Error occurred: "+e);
                System.out.print(e.getMessage());
            } finally {
                connection.close();			
            }
            
    }
    
    /**
     * Update pin status.
     *
     * @param sessionID the session id
     * @param status the status
     * @param userpin the userpin
     * @throws SQLException the SQL exception
     */
    public static void updatePinStatus(String sessionID, String status, String userpin) throws SQLException{
        Connection connection = null;
        PreparedStatement ps = null;
        
        String sql =
		             "update `clientstatus` set "
		                     + "Status=? , pin = ? where " 
                                     + "SessionID=?;" ;
       
            try {
                connection = getUssdDBConnection();
            
                ps = connection.prepareStatement(sql);

                ps.setString(1, status);
                ps.setString(2, userpin);
                ps.setString(3, sessionID);

                ps.execute();
             
                        
            } catch (NamingException ex) {
                // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
             } 
            catch (SQLException e) {
                System.out.print(e.getMessage());
            } finally {
                connection.close();			
            }
            
    }

    /**
     * Update pin status.
     *
     * @param sessionID the session id
     * @param status the status
     * @param userpin the userpin
     * @param ussdSessionID the ussd session id
     * @throws SQLException the SQL exception
     */
    public static void updatePinStatus(String sessionID, String status, String userpin, String ussdSessionID) throws SQLException{

        Connection connection = null;

        PreparedStatement ps = null;





        String sql =

                "update `clientstatus` set  Status=? , pin = ?, ussdsessionid=? where SessionID=?;" ;



        try {

            connection = getUssdDBConnection();



            ps = connection.prepareStatement(sql);



            ps.setString(1, status);

            ps.setString(2, userpin);

            ps.setString(3, ussdSessionID);

            ps.setString(4, sessionID);



            ps.execute();





        } catch (NamingException ex) {

            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);

        }

        catch (SQLException e) {

            System.out.print(e.getMessage());

        } finally {

            connection.close();

        }



    }
     
    /**
     * Gets the u ser status.
     *
     * @param sessionID the session id
     * @return the u ser status
     * @throws SQLException the SQL exception
     */
    public static String getUSerStatus(String sessionID) throws SQLException{
        Connection connection = null;
        PreparedStatement ps = null;
        String userStatus = null; 
        ResultSet rs = null;
        
        String sql =
		             "select Status "
		                     + "from `clientstatus` where " + "SessionID=?;";
       
            try {
                connection = getUssdDBConnection();
            
                ps = connection.prepareStatement(sql);
            
                ps.setString(1, sessionID);

                rs = ps.executeQuery();
            
                while (rs.next()) {
                    userStatus = rs.getString("Status");
                }
                        
		} catch (NamingException ex) {
                   // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
                } 
                catch (SQLException e) {
                    System.out.print(e.getMessage());
		} finally {
                        connection.close();
                        
		}
            
            return userStatus;
     }
    

    
    /**
     * Gets the ussd db connection.
     *
     * @return the ussd db connection
     * @throws SQLException the SQL exception
     * @throws NamingException the naming exception
     */
    public static Connection getUssdDBConnection() throws SQLException,NamingException {
        initializeDataSource();
        if (ussdDatasource != null) {
            return ussdDatasource.getConnection();
        } else {
            throw new SQLException("USSD Datasource not initialized properly");
        }
    }
    
    /**
     * Read multiple password no of attempts.
     *
     * @param username the username
     * @return the int
     * @throws SQLException the SQL exception
     */
    public static int readMultiplePasswordNoOfAttempts(String username) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null;
        int noOfAttempts = 0;
        ResultSet rs = null;

        String sql = "select attempts from `multiplepasswords` where " + "username=?;";
        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                noOfAttempts = rs.getInt("attempts");
            }
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
        }
        return noOfAttempts;
    }

    /**
     * Checks if is first pin request.
     *
     * @param username the username
     * @return true, if is first pin request
     * @throws SQLException the SQL exception
     */
    private static boolean isFirstPinRequest(String username) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        int count = 0;
        ResultSet rs = null;

        String sql = "select count(*) as total from `multiplepasswords` where " + "username=?;";
        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
        }
        return count == 0;
    }
    
    /**
     * Update multiple password no of attempts.
     *
     * @param username the username
     * @param attempts the attempts
     * @throws SQLException the SQL exception
     */
    public static void updateMultiplePasswordNoOfAttempts(String username, int attempts) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null;
        String sql = null;
        boolean isFirstPinRequest = isFirstPinRequest(username);
        if(isFirstPinRequest) {
            sql = "INSERT INTO `multiplepasswords` set " +
                    "attempts=?, " +
                    "username=?;"; 
        } else {
            sql = "update `multiplepasswords` set "
                + "attempts=? where "
                + "username=?;";
        }
        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, attempts);
            ps.setString(2, username);
            ps.execute();
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
        }
    }
    
    /**
     * Delete user.
     *
     * @param username the username
     * @throws SQLException the SQL exception
     */
    public static void deleteUser(String username) throws SQLException {

        Connection connection = null;
        String sql = "delete from `multiplepasswords` where " + "username=?;";
        try {
            connection = getUssdDBConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.execute();
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
        }
    }
	
	   /**
   	 * Gets the login history.
   	 *
   	 * @param userId the user id
   	 * @param application the application
   	 * @param fromDate the from date
   	 * @param toDate the to date
   	 * @return the login history
   	 * @throws SQLException the SQL exception
   	 */
   	public static List<LoginHistory> getLoginHistory(String userId, String application, Date fromDate, Date toDate) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        String userStatus = null;
        ResultSet rs = null;
        
        if (application.equalsIgnoreCase("__ALL__")) {
            application = "%";
        }
        
        List<LoginHistory> loghistory = new ArrayList();
        
        String sql = "SELECT id, reqtype, application_id, authenticated_user, isauthenticated, authenticators, ipaddress, created_date "
                + "FROM sp_login_history "
                + "WHERE application_id like ? "
                + "AND authenticated_user = ? "
                + "AND created_date between ? and ? "
                + "order by id desc";
        
        if ((application == null) || (application.isEmpty())) {
            application = "%";
        }
        
        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, application);
            ps.setString(2, userId);
            ps.setTimestamp(3, new Timestamp(fromDate.getTime()));
            ps.setTimestamp(4, getEndOfDay(toDate));
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                 SimpleDateFormat sdf = new SimpleDateFormat("yyy-MMM-dd HH:mm:ss z");
                 sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
                 String creationDate = sdf.format(rs.getTimestamp("created_date"));
                loghistory.add(new LoginHistory(rs.getString("application_id"), rs.getString("authenticated_user"),
                        (rs.getInt("isauthenticated") == 1) ? "SUCCESS" : "FAILED", rs.getString("ipaddress"),creationDate ));
            }
            
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
            
        }
        
        return loghistory;
    }
    
    /**
     * Gets the login apps.
     *
     * @param userId the user id
     * @return the login apps
     * @throws SQLException the SQL exception
     */
    public static List<String> getLoginApps(String userId) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        List<String> apps = new ArrayList();
        ResultSet rs = null;
        
        String sql = "SELECT distinct application_id "
                + "FROM sp_login_history "
                + "WHERE authenticated_user = ?";
        
        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, userId);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                apps.add(rs.getString(1));
            }
            
        } catch (NamingException ex) {
            // Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            connection.close();
            
        }
        
        return apps;
    }
	
    /**
     * Gets the end of day.
     *
     * @param date the date
     * @return the end of day
     */
    public static Timestamp getEndOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return new java.sql.Timestamp(calendar.getTime().getTime());
    }

    /**
     * Gets the me pin session id.
     *
     * @param transactionId the transaction id
     * @return the me pin session id
     * @throws SQLException the SQL exception
     */
    public static String getMePinSessionID(String transactionId) throws SQLException{
        String sessionID=null;
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT session_id FROM mepin_transactions WHERE transaction_id = ?";

        try {
            connection = getUssdDBConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, transactionId);
            rs = ps.executeQuery();

            while (rs.next()) {
                sessionID= rs.getString(1);
            }

        } catch (NamingException ex) {
            log.error("Error while connecting to DB", ex);
        } catch (SQLException e) {
            log.error("Error in querying DB", e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return sessionID;
    }
}
