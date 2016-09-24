package com.chundoong.db.stmt.procedure;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.config.ORMapSaxHandler;
import com.chundoong.db.gateway.DGContext;
import com.chundoong.db.stmt.ComnStatement;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.query.Object2PQuery;
import com.chundoong.query.Object2Query;
import com.chundoong.query.ObjectNavigator;
import com.chundoong.query.visitor.PDeleteVisitor;
import com.chundoong.query.visitor.PInsertVisitor;
import com.chundoong.query.visitor.PSelectVisitor;
import com.chundoong.query.visitor.PUpdateVisitor;
import com.chundoong.query.visitor.QueryVisitor;
import com.chundoong.vo.Request;
import com.chundoong.vo.xml.Query;

public abstract class PStatement extends ComnStatement{
    private static Log log = LogFactory.getLog(PStatement.class);

    protected static String STR_CALL = "CALL ";
    protected static String STR_DOT = ".";
    protected static String SQL_SELECT = "CHUNDOONG_DATA_FACADE_R( ?,?,?,? )";
    protected static String SQL_DELETE,SQL_INSERT,SQL_UPDATE = "CHUNDOONG_DATA_FACADE_CUD( ?,?,? )";
    
    PStatement(Request r) {
        super(r);
    }
    
    protected String getStatement(Object tgtObj, DGContext dgc){
        if(r.getQueryId() != null)
            return generateQuery(tgtObj, dgc.getQuery(r.getQueryId()));
        
        Object2Query oq = new Object2PQuery(tgtObj, dgc);
        QueryVisitor v = generateQueryVisitor();
        oq.invite(v);
        
        if(log.isDebugEnabled())
            log.debug(" statement : " + v.getResultQuery());
        
        return v.getResultQuery();
    }
    
    private String generateQuery(Object tgtObj, Query query){
        Set<String> vars = query.getVars();
        String q = query.getQuery();
        if(vars.isEmpty())
            return q;
        
        String value = null; 
        for(String var : vars){
            value = String.valueOf(ObjectNavigator.getObjectByFieldName(var, tgtObj));
            q = q.replaceAll(new StringBuffer("${").append(var).append("}").toString(), value);
            
            if(log.isDebugEnabled()){
                log.debug(" field name : "+var);
                log.debug(" field value : "+value);
            }
        }
        
        if(log.isDebugEnabled())
            log.debug("result query :" + q);
            
        return q;
    }
    
    private QueryVisitor generateQueryVisitor(){
        switch(r.getStatementType()){
            case SELECT:
                return new PSelectVisitor(); 
            case UPDATE:
                return new PUpdateVisitor(); 
            case INSERT:
                return new PInsertVisitor(); 
            case DELETE:
                return new PDeleteVisitor(); 
            default:
                throw new ChunDoongException("unvalid statement type!");
        }
    }

}