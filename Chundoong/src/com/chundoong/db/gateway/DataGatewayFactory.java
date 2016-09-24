package com.chundoong.db.gateway;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.config.ORMapConfig;
import com.chundoong.config.PropertyResource;
import com.chundoong.vo.xml.Clazz;

public class DataGatewayFactory {

    private static Log log = LogFactory.getLog(DataGatewayFactory.class);
            
    private static Map<String, DataGateway> resourceHolder = new ConcurrentHashMap<String, DataGateway>(30);

    public static DataGateway getDataGateway(String resourceName){
        if(resourceHolder.containsKey(resourceName))
            return resourceHolder.get(resourceName);
            
        resourceHolder.put(resourceName, buildDataGateway(resourceName));
        return resourceHolder.get(resourceName);
    }
    
    private static DataGateway buildDataGateway(String resourceName){
        ORMapConfig cf = ORMapConfig.getInstance();
        cf.prcessConfig(resourceName);
        
        DGContext dgc = new DGContext();
        dgc.setCm(cf.getClassMap(resourceName));
        dgc.setTcm(cf.getTableClassMap(resourceName));
        dgc.setPr(cf.getPropertyResource(resourceName));
        dgc.setQm(cf.getQueryMap(resourceName));
        
        return new DataGatewayImpl(dgc);
    }
            
}
