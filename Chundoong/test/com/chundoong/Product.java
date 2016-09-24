package com.chundoong;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

public class Product{
    private PrimaryKey pk;
    private String name;
    private BigDecimal amount;
    private Date regDate;
    private Time regTime;
    private Timestamp regTimeStamp;
    private List<Item> items;
    
    public void setId(String id){
        if(pk == null)
            pk = new PrimaryKey();
        
        pk.setId(id);
    }
    
    public String getId(){
        if(pk == null)
            return null;
        
        return pk.getId();
    }
    
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
     * @return the amount
     */
    public BigDecimal getAmount() {
        return amount;
    }
    /**
     * @param amount the amount to set
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    /**
     * @return the regDate
     */
    public Date getRegDate() {
        return regDate;
    }
    /**
     * @param regDate the regDate to set
     */
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
    /**
     * @return the regTime
     */
    public Time getRegTime() {
        return regTime;
    }
    /**
     * @param regTime the regTime to set
     */
    public void setRegTime(Time regTime) {
        this.regTime = regTime;
    }
    /**
     * @return the regTimeStamp
     */
    public Timestamp getRegTimeStamp() {
        return regTimeStamp;
    }
    /**
     * @param regTimeStamp the regTimeStamp to set
     */
    public void setRegTimeStamp(Timestamp regTimeStamp) {
        this.regTimeStamp = regTimeStamp;
    }
    /**
     * @return the items
     */
    public List<Item> getItems() {
        return items;
    }
    /**
     * @param items the items to set
     */
    public void setItems(List<Item> items) {
        this.items = items;
    }
    
}