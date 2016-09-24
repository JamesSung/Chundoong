package com.chundoong;

public class PrimaryKey implements Cloneable{
    private String id;
    private String itemCode;
    private String seqNum;
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the itemCode
     */
    public String getItemCode() {
        return itemCode;
    }
    /**
     * @param itemCode the itemCode to set
     */
    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }
    /**
     * @return the seqNum
     */
    public String getSeqNum() {
        return seqNum;
    }
    /**
     * @param seqNum the seqNum to set
     */
    public void setSeqNum(String seqNum) {
        this.seqNum = seqNum;
    }
    
    public PrimaryKey clone(){
        PrimaryKey pk = new PrimaryKey();
        pk.setId(id);
        pk.setItemCode(itemCode);
        pk.setSeqNum(seqNum);
        return pk;
    }
}