package com.axiata.dialog;

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

public class MePinStatusRequest implements Callable<String> {

    private static Log log = LogFactory.getLog(MePinStatusRequest.class);
    private String transactionId;

    public MePinStatusRequest(String transactionId) {
        this.transactionId = transactionId;
    }

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
