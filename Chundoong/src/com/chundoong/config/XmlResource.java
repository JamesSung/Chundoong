package com.chundoong.config;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.chundoong.exception.ChunDoongException;

public class XmlResource {

    public static XmlResource getInstance(String resourceName, DefaultHandler handler){
        // �ڿ��� �ش��ϴ� XmlResource �ν��Ͻ��� �����´�.
        XmlResource resource = XmlResourceHolder.resourceHolder.get(resourceName);
        
        if (resource == null) {
            try {
                resource = new XmlResource(resourceName, handler);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
            XmlResourceHolder.resourceHolder.put(resourceName, resource);
        }
        
        return resource;
    }
    
    /**
     * XmlResource �ڿ��� ��� Ŭ����
     */
    private static class XmlResourceHolder {
        private static Map<String, XmlResource> resourceHolder =
            new HashMap<String, XmlResource>();
    }
    
    //--------------------------------------------------------------------------
    // XmlResource instance area
    //--------------------------------------------------------------------------
    
    /**
     * Xml���� �ڿ���
     */
    private String resourceName;
    
    /**
     * DefaultHandler �ν��Ͻ�
     */
    private DefaultHandler handler;
    
    /**
     * ������
     * @param resourceName
     * @param handler
     * @throws Exception
     */
    private XmlResource(String resourceName, DefaultHandler handler){
        this.resourceName = resourceName;
        this.handler = handler;
    }
    
    /**
     * �ڿ��� �ش��ϴ� Xml �Ӽ��� �ڵ鷯�� ���ؼ� �ε��Ѵ�.
     * 
     * @param resourceName
     * @param handler
     * @return {@link DefaultHandler}
     * @throws Exception
     */
    public void parse() {
        try{
            // parser
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();
            
            // input stream & parsing
            InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(resourceName);
            if(is==null)
            	is = getClass().getResourceAsStream(resourceName);
            	
            parser.parse(is, handler);
        }catch(SAXException e){
            e.printStackTrace();
            throw new ChunDoongException(e);
        }catch(ParserConfigurationException e){
            e.printStackTrace();
            throw new ChunDoongException(e);
        }catch(IOException e){
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
    }

    /**
     * �ڿ��� �ش��ϴ� Xml �Ӽ��� �ڵ鷯�� ���ؼ� �ε��Ѵ�.
     * 
     * @param resourceName
     * @param handler
     * @return {@link DefaultHandler}
     * @throws Exception
     */
    public static void parse(String xml,DefaultHandler handler) throws Exception {
        // parser
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
        
        // input stream & parsing
        InputStream is = new ByteArrayInputStream(xml.getBytes());
        parser.parse(is, handler);
    }
        
}
 