package com.chundoong.vo.xml;


public class SqlType{
    private String name;
    private short length = -1;
    private short scale;
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
     * @return the length
     */
    public short getLength() {
        return length;
    }
    /**
     * @param length the length to set
     */
    public void setLength(short length) {
        this.length = length;
    }
    /**
     * @return the scale
     */
    public short getScale() {
        return scale;
    }
    /**
     * @param scale the scale to set
     */
    public void setScale(short scale) {
        this.scale = scale;
    }
}