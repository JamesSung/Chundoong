package com.chundoong.config;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.helpers.DefaultHandler;

import com.chundoong.config.ORMapSaxHandler;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Query;


public class ORMapConfig {

    private static Log log = LogFactory.getLog(ORMapConfig.class);
            
    /** Comma ±¸ºÐÀÚ */
    private static final String DELIM_COMMA = ",";

    private static final String ORMAPPING_CONFIG_PATH = "ormapping.config.path";
    
    private static final String ORMAPPING_CONFIG_SIZE = "ormapping.path.size";
    
    private static final String QUERY_CONFIG_PATH = "query.config.path";
    
    private static final String QUERY_CONFIG_SIZE = "query.path.size";

    private static final int DEFAULT_CONFIG_SIZE = 10;

    private static Set<String> lock = new HashSet<String>();
    
    private static Map<String,PropertyResource> propMap = new ConcurrentHashMap<String,PropertyResource>(30);
    private static Map<String,Map<String,Clazz>> calssMap = new ConcurrentHashMap<String,Map<String,Clazz>>(30);
    private static Map<String,Map<String,String>> tableCalssMap = new ConcurrentHashMap<String,Map<String,String>>(30);
    private static Map<String,Map<String,Clazz>> subCalssMap = new ConcurrentHashMap<String,Map<String,Clazz>>(100);
    private static Map<String,Map<String,Query>> queryMap = new ConcurrentHashMap<String,Map<String,Query>>(30);
    private static Map<String,Map<String,Query>> subQueryMap = new ConcurrentHashMap<String,Map<String,Query>>(100);

    private static ORMapConfig instace = new ORMapConfig();
    
    public static ORMapConfig getInstance(){
        return instace;
    }
    
    public void prcessConfig(String resourceName){
        
        while(lock.contains(resourceName)){
            //waiting for 500 ms
            try { Thread.sleep(500); } catch (InterruptedException e) {}
        }
        
        if(propMap.containsKey(resourceName))
            return;
        
        lock.add(resourceName);
        
        try{
           PropertyResource resource = PropertyResource.getInstance(resourceName);
           String configPaths = resource.getProperty(ORMAPPING_CONFIG_PATH);
           String configSize = resource.getProperty(ORMAPPING_CONFIG_SIZE);
           int iConfigSize = DEFAULT_CONFIG_SIZE;
           if(configSize != null)
               iConfigSize = Integer.parseInt(configSize.trim());

           Map<String,Clazz> classMap = new HashMap<String,Clazz>();
           
           for(int i=0; i <= iConfigSize; i++){
               configPaths = resource.getProperty(ORMAPPING_CONFIG_PATH+i);
               if(configPaths == null) continue;
               
               if (!"".equals(configPaths.trim())) {
                   for (String configPath : configPaths.split(DELIM_COMMA)) {
                       if("".equals(configPath)) continue;
                       
                       classMap.putAll(load(configPath.trim()));
                   }
               }
           }
           calssMap.put(resourceName, classMap);
           tableCalssMap.put(resourceName, generateTableClassMap(classMap));
           propMap.put(resourceName, resource);
           
           //query xml pasing
           configPaths = resource.getProperty(QUERY_CONFIG_PATH);
           configSize = resource.getProperty(QUERY_CONFIG_SIZE);
           iConfigSize = DEFAULT_CONFIG_SIZE;
           if(configSize != null)
               iConfigSize = Integer.parseInt(configSize.trim());

           Map<String,Query> qMap = new HashMap<String,Query>();
           
           for(int i=0; i <= iConfigSize; i++){
               configPaths = resource.getProperty(QUERY_CONFIG_PATH+i);
               if(configPaths == null) continue;
               
               if (!"".equals(configPaths.trim())) {
                   for (String configPath : configPaths.split(DELIM_COMMA)) {
                       if("".equals(configPath)) continue;
                       
                       qMap.putAll(loadQuery(configPath.trim()));
                   }
               }
           }
           
           queryMap.put(resourceName,qMap);
           
        }catch(IOException e){
            e.printStackTrace();
            throw new ChunDoongException(e);
        }finally{
            lock.remove(resourceName);
        }
    }
    
    private Map<String,String> generateTableClassMap(Map<String,Clazz> classMap){
        Map<String,String> result = new HashMap<String,String>();
        if(classMap == null)
            return result;
        
        for(Clazz c : classMap.values()){
            result.put(c.getTable(), c.getName());
        }
        
        return result;
    }
    
    /**
     * return a Map<String,com.chundoong.vo.xml.Clazz>. The key is class type name 
     * @param resourceName
     * @return
     */
    private Map<String,Clazz> load(String resourceName){
        if(subCalssMap.containsKey(resourceName))
            return subCalssMap.get(resourceName);

        if (log.isDebugEnabled()) {
            log.debug(resourceName + " parsing is starting");
        }
        
        ORMapSaxHandler handler = new ORMapSaxHandler();      

        XmlResource resource = XmlResource.getInstance(resourceName, handler);
        resource.parse();

        subCalssMap.put(resourceName,handler.getClassMap());
       
        if (log.isDebugEnabled()) {
            log.debug(resourceName + " parsing end");
        }

        return subCalssMap.get(resourceName);
        
    }
    
    private Map<String,Query> loadQuery(String resourceName){
        if(subQueryMap.containsKey(resourceName))
            return subQueryMap.get(resourceName);

        if (log.isDebugEnabled()) {
            log.debug(resourceName + " parsing is starting");
        }
        
        QueryMapSaxHandler handler = new QueryMapSaxHandler();      

        XmlResource resource = XmlResource.getInstance(resourceName, handler);
        resource.parse();

        subQueryMap.put(resourceName,handler.getQueryMap());
       
        if (log.isDebugEnabled()) {
            log.debug(resourceName + " parsing end");
        }

        return subQueryMap.get(resourceName);
        
    }
    
    public PropertyResource getPropertyResource(String key){
        return propMap.get(key);
    }
    
    /**
     * return a Map<String,com.chundoong.vo.xml.Clazz>.
     * here the key is a config file name 
     * @param resourceName
     * @return
     */
    public Map<String,Clazz> getClassMap(String key){
        return calssMap.get(key);
    }
    
    public Map<String,String> getTableClassMap(String key){
        return tableCalssMap.get(key);
    }
            
    public Map<String,Query> getQueryMap(String key){
        return queryMap.get(key);
    }
}
