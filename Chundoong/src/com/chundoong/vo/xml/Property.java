package com.chundoong.vo.xml;

import java.util.HashMap;
import java.util.Map;

import com.chundoong.exception.ChunDoongException;


public class Property{
    private String name;
    private String column;
    private SqlType sqlType;
    private String fkTable;
    private String fkColumn;
    private String refClassName;
    private String nullValue;
    private boolean pk;
    private boolean fk;
    private Clazz clazz;
    
    /**
     * key is class name of parent object, and value is parent's foreign key Property object
     */
    private Map<String,Property> fkMap;
    
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    
    public String getNameByParent(String parentClassName) {
        Property p = fkMap.get(parentClassName);
        if(p == null)
            throw new ChunDoongException("can't find parent property object.");
        return p.getName();
    }
    
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the column
     */
    public String getColumn() {
        return column;
    }
    /**
     * @param column the column to set
     */
    public void setColumn(String column) {
        this.column = column;
    }
    /**
     * @return the sqlType
     */
    public SqlType getSqlType() {
        return sqlType;
    }
    /**
     * @param sqlType the sqlType to set
     */
    public void setSqlType(SqlType sqlType) {
        this.sqlType = sqlType;
    }
    /**
     * @return the refClassName
     */
    public String getRefClassName() {
        return refClassName;
    }
    /**
     * @param refClassName the refClassName to set
     */
    public void setRefClassName(String refClassName) {
        this.refClassName = refClassName;
    }
    /**
     * @return the nullValue
     */
    public String getNullValue() {
        return nullValue;
    }
    /**
     * @param nullValue the nullValue to set
     */
    public void setNullValue(String nullValue) {
        this.nullValue = nullValue;
    }
    /**
     * @return the fkTable
     */
    public String getFkTable() {
        return fkTable;
    }
    /**
     * @param fkTable the fkTable to set
     */
    public void setFkTable(String fkTable) {
        this.fkTable = fkTable;
    }
    /**
     * @return the fkColumn
     */
    public String getFkColumn() {
        return fkColumn;
    }
    /**
     * @param fkColumn the fkColumn to set
     */
    public void setFkColumn(String fkColumn) {
        this.fkColumn = fkColumn;
    }
    /**
     * @return the pk
     */
    public boolean isPk() {
        return pk;
    }
    /**
     * @param pk the pk to set
     */
    public void setPk(boolean pk) {
        this.pk = pk;
    }
    /**
     * @return the fk
     */
    public boolean isFk() {
        return fk;
    }
    /**
     * @param fk the fk to set
     */
    public void setFk(boolean fk) {
        this.fk = fk;
    }

    /**
     * @return the fkMap
     */
    public Map<String, Property> getFkMap() {
        return fkMap;
    }

    public void putFkMap(String key, Property value) {
        if(this.fkMap == null)
            this.fkMap = new HashMap<String,Property>();
        this.fkMap.put(key, value);
    }
    
    public void putAllFkMap(Map<String, Property> map) {
        if(map == null) return;
        
        if(this.fkMap == null){
            this.fkMap = map;
            return;
        }
        this.fkMap.putAll(map);
    }

    /**
     * @return the clazz
     */
    public Clazz getClazz() {
        return clazz;
    }

    /**
     * @param clazz the clazz to set
     */
    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

}