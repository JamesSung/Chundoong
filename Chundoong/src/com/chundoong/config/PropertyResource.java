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
 * ������Ƽ �Ӽ��� �ε��ϴ� �ڿ�Ŭ����
 * 
 */
public class PropertyResource {
    public static String DISABLE_PROCEDURE = "disable_procedure"; 
    
    /**
     * �ڿ��� �ش��ϴ� PropertyResource �ν��Ͻ��� �����Ѵ�.
     * 
     */
    public static PropertyResource getInstance(String resourceName) throws IOException {
        // �ڿ��� �ش��ϴ� PropertyResource ��ü�� �����´�.
        PropertyResource resource = PropertyResourceHolder.resourceHolder.get(resourceName);
        
        if (resource == null) {
            resource = new PropertyResource();
            resource.load(resourceName);
            
            PropertyResourceHolder.resourceHolder.put(resourceName, resource);
        }
        
        return resource;
    }
    
    /**
     * PropertyResource �ڿ��� ��� Ŭ����
     */
    private static class PropertyResourceHolder {
        private static Map<String, PropertyResource> resourceHolder = 
            new HashMap<String, PropertyResource>();
    }
    
    //--------------------------------------------------------------------------
    // PropertyResource instance area
    //--------------------------------------------------------------------------
    
    /**
     * Properties �ν��Ͻ�
     */
    private Properties properties;
    
    /**
     * ������Ƽ�� �ִ� ��� �Ӽ����� �����Ѵ�.
     */
    public Enumeration<?> propertyNames() {
        return properties.propertyNames();
    }
    
    /**
     * Key�� �ش��ϴ� �Ӽ����� �����Ѵ�.
     */
    public String getProperty(String key) {
        return encoding(properties.getProperty(key));
    }
    
    /**
     * Key�� �ش��ϴ� �Ӽ����� �����Ѵ�.<br>
     * ���� �Ӽ����� ���� ��� �⺻���� �����Ѵ�.
     */
    public String getProperty(String key, String defaultValue) {
        return encoding(properties.getProperty(key, defaultValue));
    }
    
    /**
     * �ڿ��� �ش��ϴ� �Ӽ��� �ε��Ѵ�.
     */
    public Properties load(String resourceName) throws IOException {
        if (properties == null || properties.isEmpty()) {
            // Properties �ν��Ͻ� ����
            properties = new Properties();
            
            // �ڿ� �Ӽ� �ε�
            InputStream is = getResourceAsStream(resourceName);
            properties.load(is);
            is.close();
        }
        
        return properties;
    }
    
    /**
     * �ڿ��� �ش��ϴ� �Ӽ������� �ε��� �Է½�Ʈ���� �����Ѵ�.
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
     * �ڿ��� �ش��ϴ� �Ӽ��� ��ε��Ѵ�.
     */
    public Properties reload(String resourceName) throws IOException {
        properties = null;
        return load(resourceName);
    }
    
    /**
     * �ش� value�� ���� �ѱ�Encoding�� �����Ѵ�.
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
 