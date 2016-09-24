package com.chundoong.query;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.query.visitor.PDeleteVisitor;
import com.chundoong.query.visitor.PSelectVisitor;
import com.chundoong.query.visitor.QueryVisitor;
import com.chundoong.vo.xml.Child;
import com.chundoong.vo.xml.Clazz;

public class Object2PQuery implements Object2Query{
    private static Log log = LogFactory.getLog(ObjectNavigator.class);

    Object tgtObj;
    DGContext dgc;
    Clazz clazz;
//    List<String> querys = new ArrayList<String>();
    
    public Object2PQuery(Object tgtObj, DGContext dgc) {
        super();
        this.tgtObj = tgtObj;
        this.dgc = dgc;
        this.clazz = dgc.getClazz(tgtObj.getClass().getName());
    }
    
    public Object2PQuery(Object tgtObj, DGContext dgc, Clazz clazz) {
        super();
        this.tgtObj = tgtObj;
        this.dgc = dgc;
        this.clazz = clazz;
    }
    
    public void invite(QueryVisitor v){
        if(log.isDebugEnabled()){
            if(tgtObj == null)
                log.debug("current object is null");
            else
                log.debug("current object type:"+tgtObj.getClass().getName());
        }
        
        if(tgtObj == null) return;
        
        if(tgtObj instanceof List){
            inviteList(tgtObj,v);
        }else if(tgtObj.getClass().isArray()){
            inviteArray(tgtObj,v);
        }else if(tgtObj instanceof Map){
            return;//do nothing
        }else{
            inviteObject(tgtObj, v);
        }
            
    }
    
    private void inviteObject(Object tgtObj, QueryVisitor v){
        boolean isParent = false;
        boolean isSelect = false;
        boolean isDelect = false;
        if(v instanceof PSelectVisitor)
            isSelect = true;
        if(v instanceof PDeleteVisitor)
            isDelect = true;
        String className = tgtObj.getClass().getName();
        if(!clazz.getName().equals(className)){
            isParent = true;
        }
//        Clazz clazz = dgc.getClazz(tgtObj.getClass().getName());
        
        v.generate(tgtObj,clazz,isParent);
        
        if(log.isDebugEnabled()){
            log.debug("Curr Type : "+tgtObj.getClass().getName());
            log.debug("Clazz : "+clazz.getName());
        }
        
        if(clazz.hasChild()){
            Map<String, Child> childs = clazz.getChilds();
            Set<String> fields = childs.keySet();
            Object2Query oq = null;
            Object child = null;
            for(String field : fields){
                if(log.isDebugEnabled()){
                    log.debug("field : "+field);
                }
                child = ObjectNavigator.getObjectByFieldName(field, tgtObj);
                if(!isSelect && !isDelect && child == null) return;
                
                if(isParent || child == null){
                    oq = new Object2PQuery(tgtObj,this.dgc,dgc.getClazz(childs.get(field).getTypeName()));
                }else{
                    oq = new Object2PQuery(child,this.dgc);
                }
                oq.invite(v);
            }
        }
        
    }
    
    private void inviteList(Object tgtObj,QueryVisitor v){
        List l = (List)tgtObj;
        for(Object elem : l){
            inviteObject(elem, v);
        }
    }
    
    private void inviteArray(Object tgtObj,QueryVisitor v){
        int length = Array.getLength(tgtObj);
        for(int i=0; i < length; i++){
            inviteObject(Array.get(tgtObj,i), v);
        }
    }

//    public String getQuery(){
//        StringBuffer rst = new StringBuffer("{");
//        for(String query : querys){
//            rst.append(query);
//            rst.append(",");
//        }
//        rst.append("}");
//        return rst.toString();
//    }
}