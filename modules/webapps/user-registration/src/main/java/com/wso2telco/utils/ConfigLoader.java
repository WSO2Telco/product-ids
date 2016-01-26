package com.wso2telco.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.carbon.utils.CarbonUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.File;

public class ConfigLoader {

    private Log log = LogFactory.getLog(ConfigLoader.class);

    private LOAConfig loaConfig;
    private MobileConnectConfig mobileConnectConfig;
    private static ConfigLoader loader = new ConfigLoader();

    private ConfigLoader() {
        try {
            this.loaConfig = initLoaConfig();
            this.mobileConnectConfig = initMConnectConfig();
        } catch (JAXBException e) {
            log.error("Error while initiating custom config files", e);
        }
    }

    public static ConfigLoader getInstance() {
        return loader;
    }

    private LOAConfig initLoaConfig() throws JAXBException {
        String configPath = CarbonUtils.getCarbonConfigDirPath() + File.separator + "LOA.xml";
        File file = new File(configPath);
        JAXBContext ctx = JAXBContext.newInstance(LOAConfig.class);
        Unmarshaller um = ctx.createUnmarshaller();
        return  (LOAConfig) um.unmarshal(file);
    }

    public LOAConfig getLoaConfig() {
        return loaConfig;
    }

    private MobileConnectConfig initMConnectConfig() throws JAXBException {
        String configPath = CarbonUtils.getCarbonConfigDirPath() + File.separator + "mobile-connect.xml";
        File file = new File(configPath);
        JAXBContext ctx = JAXBContext.newInstance(MobileConnectConfig.class);
        Unmarshaller um = ctx.createUnmarshaller();
        return (MobileConnectConfig) um.unmarshal(file);
    }

    public MobileConnectConfig getMobileConnectConfig(){
        return mobileConnectConfig;
    }

}
