package com.chundoong.db.stmt;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.stmt.java.JavaStatementFactory;
import com.chundoong.db.stmt.procedure.ProcedureStatementFactory;

public class StatementFactoryBuilder {
        
    public static StatementFactory getFactory(boolean isJava){
        if(isJava)
            return new JavaStatementFactory();
        else
            return new ProcedureStatementFactory();
    }
            
}
