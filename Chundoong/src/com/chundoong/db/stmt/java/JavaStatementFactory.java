package com.chundoong.db.stmt.java;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.stmt.Statement;
import com.chundoong.db.stmt.StatementFactory;
import com.chundoong.db.stmt.java.JSelectStatement;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.vo.Request;

public class JavaStatementFactory implements StatementFactory{

    public Statement getStatement(Request r) {
        switch(r.getStatementType()){
        case SELECT:
            return new JSelectStatement(r);
        //TODO cud
        }
        return null;
    }
    
}