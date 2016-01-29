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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;
import java.sql.SQLException;
import java.util.concurrent.Callable;

// TODO: Auto-generated Javadoc
/**
 * The Class MePinStatusRequest.
 */
public class MePinStatusRequest implements Callable<String> {

    /** The log. */
    private static Log log = LogFactory.getLog(MePinStatusRequest.class);
    
    /** The transaction id. */
    private String transactionId;

    /**
     * Instantiates a new me pin status request.
     *
     * @param transactionId the transaction id
     */
    public MePinStatusRequest(String transactionId) {
        this.transactionId = transactionId;
    }

    /* (non-Javadoc)
     * @see java.util.concurrent.Callable#call()
     */
    @Override
    public String call() {
        String allowStatus = null;

        String clientId = FileUtil.getApplicationProperty("mepin.clientid");
        String url = FileUtil.getApplicationProperty("mepin.url");
        url = url + "?transaction_id=" + transactionId + "&client_id=" + clientId + "";
        log.info("MePIN Status URL: " + url);

        String authHeader = "Basic " + FileUtil.getApplicationProperty("mepin.accesstoken");

        try {
            HttpsURLConnection connection = (HttpsURLConnection) new URL(url).openConnection();

            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("Authorization", authHeader);

            String resp = "";
            int statusCode = connection.getResponseCode();
            InputStream is;
            if ((statusCode == 200) || (statusCode == 201)) {
                is = connection.getInputStream();
            } else {
                is = connection.getErrorStream();
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String output;
            while ((output = br.readLine()) != null) {
                resp += output;
            }
            br.close();

            log.info("MePIN Status Response Code: " + statusCode + " " + connection.getResponseMessage());
            log.info("MePIN Status Response: " + resp);

            JsonObject responseJson = new JsonParser().parse(resp).getAsJsonObject();
            String respTransactionId = responseJson.getAsJsonPrimitive("transaction_id").getAsString();
            JsonPrimitive allowObject = responseJson.getAsJsonPrimitive("allow");

            if (allowObject != null) {
                allowStatus = allowObject.getAsString();
                if (Boolean.parseBoolean(allowStatus)) {
                    allowStatus = "APPROVED";
                    String sessionID = DatabaseUtils.getMePinSessionID(respTransactionId);
                    DatabaseUtils.updateStatus(sessionID, allowStatus);
                }
            }

        } catch (IOException e) {
            log.error("Error while MePIN Status request" + e);
        } catch (SQLException e) {
            log.error("Error in connecting to DB" + e);
        }
        return allowStatus;
    }
}
