package com.chundoong.config;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.chundoong.exception.ChunDoongException;

/**
 * 프로퍼티 속성을 로드하는 자원클래스
 * 
 */
public class PropertyResource {
    public static String DISABLE_PROCEDURE = "disable_procedure"; 
    
    /**
     * 자원명에 해당하는 PropertyResource 인스턴스를 리턴한다.
     * 
     */
    public static PropertyResource getInstance(String resourceName) throws IOException {
        // 자원명에 해당하는 PropertyResource 객체를 가져온다.
        PropertyResource resource = PropertyResourceHolder.resourceHolder.get(resourceName);
        
        if (resource == null) {
            resource = new PropertyResource();
            resource.load(resourceName);
            
            PropertyResourceHolder.resourceHolder.put(resourceName, resource);
        }
        
        return resource;
    }
    
    /**
     * PropertyResource 자원을 담는 클래스
     */
    private static class PropertyResourceHolder {
        private static Map<String, PropertyResource> resourceHolder = 
            new HashMap<String, PropertyResource>();
    }
    
    //--------------------------------------------------------------------------
    // PropertyResource instance area
    //--------------------------------------------------------------------------
    
    /**
     * Properties 인스턴스
     */
    private Properties properties;
    
    /**
     * 프로퍼티에 있는 모든 속성명을 리턴한다.
     */
    public Enumeration<?> propertyNames() {
        return properties.propertyNames();
    }
    
    /**
     * Key에 해당하는 속성값을 리턴한다.
     */
    public String getProperty(String key) {
        return encoding(properties.getProperty(key));
    }
    
    /**
     * Key에 해당하는 속성값을 리턴한다.<br>
     * 만약 속성값이 없을 경우 기본값을 리턴한다.
     */
    public String getProperty(String key, String defaultValue) {
        return encoding(properties.getProperty(key, defaultValue));
    }
    
    /**
     * 자원명에 해당하는 속성을 로드한다.
     */
    public Properties load(String resourceName) throws IOException {
        if (properties == null || properties.isEmpty()) {
            // Properties 인스턴스 생성
            properties = new Properties();
            
            // 자원 속성 로드
            InputStream is = getResourceAsStream(resourceName);
            properties.load(is);
            is.close();
        }
        
        return properties;
    }
    
    /**
     * 자원명에 해당하는 속성정보를 로드할 입력스트림을 생성한다.
     */
    public InputStream getResourceAsStream(String resourceName) {
        //return getClass().getResourceAsStream(resourceName);
        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(resourceName);
        if(is==null)
            is = getClass().getResourceAsStream(resourceName);
        if(is == null)
            throw new ChunDoongException(resourceName + "is not found.");
        return is;
    }
    
    /**
     * 자원명에 해당하는 속성을 재로드한다.
     */
    public Properties reload(String resourceName) throws IOException {
        properties = null;
        return load(resourceName);
    }
    
    /**
     * 해당 value에 대한 한글Encoding을 수행한다.
     */
    private String encoding(String value) {
    	if(value == null) 
    		return null;
    	
        try {
            return new String(value.getBytes("8859_1"), "KSC5601");
        }
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        
        return "";
    }
}
 