package com.chundoong.vo.xml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Clazz{
    private String name;
    private String table;

    /**
     * key is field name
     */
    private Map<String,Property> properties = new HashMap<String,Property>();
    
    /**
     * key is column name
     */
    private Map<String,Property> colPropMap = new HashMap<String,Property>();
    
    /**
     * key is field name, value is child class type name
     */
    private Map<String,Child> childs;
    private List<Property> pks = new ArrayList<Property>();
    private List<Property> fks = new ArrayList<Property>();
    
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the table
     */
    public String getTable() {
        return table;
    }
    /**
     * @param table the table to set
     */
    public void setTable(String table) {
        this.table = table;
    }
    
    public void addProperty(String key, Property value){
        this.properties.put(key, value);
        this.colPropMap.put(value.getColumn(), value);
        if(value.isPk())
            pks.add(value);
        if(value.isFk())
            fks.add(value);
    }
    
    public Property getProperty(String key){
        return this.properties.get(key);
    }
    
    public Property getPropertyByColumnName(String key){
        return this.colPropMap.get(key);
    }
    
    /**
     * @return the properties
     */
    public Map<String, Property> getProperties() {
        return properties;
    }
    /**
     * @return the pks
     */
    public List<Property> getPks() {
        return pks;
    }
    /**
     * @return the fks
     */
    public List<Property> getFks() {
        return fks;
    }
    /**
     * @return the childs
     */
    public Map<String, Child> getChilds() {
        return childs;
    }
    
    public void addChild(String field, Child child) {
        if(childs == null)
            childs = new HashMap<String,Child>();
        childs.put(field, child);
    }
    
    public boolean hasChild(){
        if(childs == null)
            return false;
            
        return !childs.isEmpty();
    }
}