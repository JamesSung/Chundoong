package com.chundoong.config;


import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.chundoong.vo.xml.Query;


public class QueryMapSaxHandler extends DefaultHandler {

    // log
    private static Log log = LogFactory.getLog(QueryMapSaxHandler.class);
    
    
    private Map<String, Query> queryMap = new HashMap<String, Query>();
        
    private Query query;
    
    
    /** class node name */
    private static final String QUERY_ELEMENT = "query";
    private static final String ID_ATTRIBUTE = "id";
    private static final String CLASS_ATTRIBUTE = "class";
    
    
    @Override
    public void startElement(String namespaceURI,
                             String localName,
                             String qName,
                             Attributes attributes) throws SAXException {
                    if(QUERY_ELEMENT.equals(qName)){
                        configQuery(qName, attributes);
                    }
            
    }
    
    public void  endElement(String namespaceURI,
                            String localName,
                            String qName) throws SAXException {
                    if(QUERY_ELEMENT.equals(qName)){
                        query.setVariables();
                        if (log.isDebugEnabled()){ 
                            int i = 0;
                            for(String var : query.getVars()){
                                log.debug("var"+ i++ + " : " + var);
                            }
                        }
                        query = null;
                    }
            
    }
    
    private void configQuery(String tagName, Attributes attributes) throws SAXException {
        query = new Query();
        query.setId(attributes.getValue(ID_ATTRIBUTE));
        query.setClazz(attributes.getValue(CLASS_ATTRIBUTE));
        
        
        if (log.isDebugEnabled()) {
            log.debug(tagName + " $id="
                          + query.getId()
                          + ",$Query="
                          + query.getQuery()
                          );
        }
        
        queryMap.put(query.getId(), query);
    }
    
    public void characters(char[] ch, int start, int length) throws SAXException{
        if(query == null || start != 0) return;
        
        query.appendQuery(new String(ch,start,length));
        if (log.isDebugEnabled()) {
            log.debug(query.getId() + " : $query="
                          + query.getQuery()
                          );
        }
   }
        
    
    public Map<String, Query> getQueryMap() {
        return queryMap;
    }

 }
