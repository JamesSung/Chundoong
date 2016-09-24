package com.chundoong;

import java.util.List;

public class Item{
    private PrimaryKey pk;
    private String value;
    private List<ItemContants> itemContents;
    /**
     * @return the pk
     */
    public PrimaryKey getPk() {
        return pk;
    }
    /**
     * @param pk the pk to set
     */
    public void setPk(PrimaryKey pk) {
        this.pk = pk;
    }
    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }
    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
    /**
     * @return the itemContents
     */
    public List<ItemContants> getItemContents() {
        return itemContents;
    }
    /**
     * @param itemContents the itemContents to set
     */
    public void setItemContents(List<ItemContants> itemContents) {
        this.itemContents = itemContents;
    }
    
}