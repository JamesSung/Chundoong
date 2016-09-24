package com.chundoong.db.gateway;

import java.util.Map;

import com.chundoong.config.PropertyResource;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Query;

public class DGContext{
    private static String STR_Y = "Y";
    private Map<String, Clazz> cm;
    private Map<String, String> tcm;//table name:class type name
    private PropertyResource pr;
    private Map<String, Query> qm;//query map
    
    /**
     * @return the disableProcedure
     */
    public boolean isDisableProcedure() {
        if(pr == null) return false;
        return STR_Y.equalsIgnoreCase(pr.getProperty(PropertyResource.DISABLE_PROCEDURE));
    }

    /**
     * @param cm the cm to set
     */
    public void setCm(Map<String, Clazz> cm) {
        this.cm = cm;
    }
    
    public void setTcm(Map<String, String> tcm) {
        this.tcm = tcm;
    }
    
    public Clazz getClazz(String key){
        return cm.get(key);
    }

    /**
     * @param pr the pr to set
     */
    public void setPr(PropertyResource pr) {
        this.pr = pr;
    }

    /**
     * @param qm the qm to set
     */
    public void setQm(Map<String, Query> qm) {
        this.qm = qm;
    }
    
    public Query getQuery(String key){
        return qm.get(key);
    }
}