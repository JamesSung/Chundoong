package com.chundoong.config;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.chundoong.exception.ChunDoongException;
import com.chundoong.query.ObjectNavigator;
import com.chundoong.vo.xml.Child;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Property;
import com.chundoong.vo.xml.SqlType;

public class ORMapSaxHandler extends DefaultHandler {

    // log
    private static Log log = LogFactory.getLog(ORMapSaxHandler.class);
    
    
    private Map<String, Clazz> classMap = new HashMap<String, Clazz>();
    
    /**
     * key is 'table_name.column_name'
     */
    private Map<String, Property> propMap = new HashMap<String, Property>();
    
    private Clazz classVo;
    private Property property;
    private String fk;    
    int dot_idx;
    
    
    /** class node name */
    private static final String CLASS_ELEMENT = "class";
    
    /** property node name */
    private static final String PROPERTY_ELEMENT = "property";
    
    private static final String NAME_ATTRIBUTE = "name";
    private static final String TABLE_ATTRIBUTE = "table";
    private static final String COLUMN_ATTRIBUTE = "column";
    private static final String SQL_TYPE_ATTRIBUTE = "sql-type";
    private static final String REF_CLASS_NAME_ATTRIBUTE = "ref-class-name";
    private static final String NULL_VALUE_ATTRIBUTE = "null-value";
    private static final String ISPK_ATTRIBUTE = "isPk";
    private static final String FK_ATTRIBUTE = "fk";
    
    private static final String DOT = ".";
    
    @Override
    public void startElement(String namespaceURI,
                             String localName,
                             String qName,
                             Attributes attributes) throws SAXException {
                    if(CLASS_ELEMENT.equals(qName)){
                        configClass(qName, attributes);
                    }else if(PROPERTY_ELEMENT.equals(qName)){
                        configProperty(qName, attributes);
                    }
            
    }
    
    private void configClass(String tagName, Attributes attributes) throws SAXException {
        classVo = new Clazz();
        classVo.setName(attributes.getValue(NAME_ATTRIBUTE));
        if(attributes.getValue(TABLE_ATTRIBUTE) != null)
            classVo.setTable(attributes.getValue(TABLE_ATTRIBUTE).toUpperCase());
        
        
        if (log.isDebugEnabled()) {
            log.debug(tagName + " $name="
                          + classVo.getName()
                          + ",$table="
                          + classVo.getTable()
                          );
        }
        
        if(classVo.getName() == null || "".equals(classVo.getName()))
            throw new ChunDoongException(" class(" + classVo.getTable() + ") name attribute is mondatory.");
        if(classVo.getTable() == null || "".equals(classVo.getTable()))
            throw new ChunDoongException(" class(" + classVo.getName() + ") table attribute is mondatory.");
        if(classMap.containsKey(classVo.getName()))
            throw new ChunDoongException("class name(" + classVo.getName() + ") already exist.");
                
        classMap.put(classVo.getName(), classVo);
    }
    
    private Class<?> getContanerClass(String fieldName){
        return ObjectNavigator.findFieldType(classVo.getName(),fieldName);
    }
    
    private void configProperty(String tagName, Attributes attributes) throws SAXException {
        if(attributes.getValue(REF_CLASS_NAME_ATTRIBUTE) != null){
            Child c = new Child();
            c.setTypeName(attributes.getValue(REF_CLASS_NAME_ATTRIBUTE));
            c.setContainerType(getContanerClass(attributes.getValue(NAME_ATTRIBUTE)));
            
            classVo.addChild(attributes.getValue(NAME_ATTRIBUTE),c);
            return;
        }
        property = new Property();
        
        property.setClazz(classVo);
        property.setName(attributes.getValue(NAME_ATTRIBUTE));
        if(attributes.getValue(COLUMN_ATTRIBUTE) != null)
            property.setColumn(attributes.getValue(COLUMN_ATTRIBUTE).toUpperCase());
        property.setSqlType(generateSqlType(attributes.getValue(SQL_TYPE_ATTRIBUTE)));
        property.setRefClassName(attributes.getValue(REF_CLASS_NAME_ATTRIBUTE));
        property.setNullValue(attributes.getValue(NULL_VALUE_ATTRIBUTE));
        if("true".equalsIgnoreCase(attributes.getValue(ISPK_ATTRIBUTE))
                || "y".equalsIgnoreCase(attributes.getValue(ISPK_ATTRIBUTE)))
            property.setPk(true);
        
        if(property.getName() == null || "".equals(property.getName()))
            throw new ChunDoongException(" property(" + classVo.getName() + ") name attribute is mondatory.");
        if(property.getRefClassName() == null && (property.getColumn() == null || "".equals(property.getColumn())))
            throw new ChunDoongException(" property(" + classVo.getName() + DOT + property.getName() + ") column attribute is mondatory.");
        if(property.getRefClassName() == null && (property.getSqlType() == null || "".equals(property.getSqlType())))
            throw new ChunDoongException(" property(" + classVo.getName() + DOT + property.getName() + ") sql-type attribute is mondatory.");

        propMap.put(classVo.getTable()+"."+property.getColumn(),property);

        fk = attributes.getValue(FK_ATTRIBUTE);
        if(fk != null){
            fk = fk.toUpperCase();
            dot_idx = fk.indexOf(DOT);
            if(dot_idx < 0)
                throw new ChunDoongException("the format of fk attribute's(" + classVo.getName() + DOT + property.getName() + DOT + fk + ") value  must be \"table_name.column\"");
                
            property.setFkTable(fk.substring(0, dot_idx));
            property.setFkColumn(fk.substring(dot_idx+1));
            property.setFk(true);
            
            Property fkP = propMap.get(fk);
            property.putAllFkMap(fkP.getFkMap());
            
            property.putFkMap(fkP.getClazz().getName(), fkP);
        }
        
        if (log.isDebugEnabled()) {
            log.debug(tagName + " $name="
                          + property.getName()
                          + ",$column="
                          + property.getColumn()
                          + ",$sql-type="
                          + property.getSqlType()
                          + ",$ref-class-name="
                          + property.getRefClassName()
                          + ",$null-value="
                          + property.getNullValue()
                          + ",$fk="
                          + fk);
            log.debug("propMap key:"+ classVo.getTable()+"."+property.getColumn()+", value :"+property.getName());
        }
        
        classVo.addProperty(property.getName(), property); 
    }    
    
    private SqlType generateSqlType(String t){
        if(log.isDebugEnabled()){
            log.debug("input:"+t);
        }
            
        SqlType st = new SqlType();
        int i = t.indexOf("(");
        if(i < 0){
            st.setName(t);
            return st;
        }
            
        String length = t.substring(i+1, t.indexOf(")"));
        String scale = null;
        int j = length.indexOf(",");
        if(j >= 0){
            scale = length.substring(j+1);
            length = length.substring(0,j);
            st.setScale(Short.parseShort(scale));
        }
        
        st.setName(t.substring(0,i));
        st.setLength(Short.parseShort(length));
        
        return st;
    }
    
    public Map<String, Clazz> getClassMap() {
        return classMap;
    }

 }
