package com.chundoong.db.executor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.vo.Request;



public class StatementExecutorFactory {

//    private static Log log = LogFactory.getLog(StatementFactoryBuilder.class);
        
    public static StatementExecutor getExecutor(Request r, DGContext dgc){
        if(!dgc.isDisableProcedure() && r.isIncludeChild())
            return new PStatementExecutor();
        else
            return new JStatementExecutor();
    }
            
}
