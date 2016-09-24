package com.chundoong.vo.xml;

public class Child{
    private String typeName;
    private Class<?> containerType;//parent field type
    
    /**
     * @return the typeName
     */
    public String getTypeName() {
        return typeName;
    }
    /**
     * @param typeName the typeName to set
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    /**
     * @return the containerType
     */
    public Class<?> getContainerType() {
        return containerType;
    }
    /**
     * @param containerType the containerType to set
     */
    public void setContainerType(Class<?> containerType) {
        this.containerType = containerType;
    }
}