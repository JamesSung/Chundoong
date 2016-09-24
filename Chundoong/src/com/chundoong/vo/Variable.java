package com.chundoong.vo;

import java.io.Serializable;


public class Variable implements Serializable{

    private static final long serialVersionUID = -2064892544939672171L;
    
    private String name;
    
    /**
     * sqlType can get from xml, so client may not need to set this value. 
     */
    private String sqlType;
    private Object value;
        
    public Variable(String name, String sqlType, Object value) {
        super();
        this.name = name;
        this.sqlType = sqlType;
        this.value = value;
    }

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
     * @return the sqlType
     */
    public String getSqlType() {
        return sqlType;
    }
    /**
     * @param sqlType the sqlType to set
     */
    public void setSqlType(String sqlType) {
        this.sqlType = sqlType;
    }
    /**
     * @return the value
     */
    public Object getValue() {
        return value;
    }
    /**
     * @param value the value to set
     */
    public void setValue(Object value) {
        this.value = value;
    }
        
}