package com.chundoong.db.executor;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.db.stmt.Statement;
import com.chundoong.db.stmt.StatementFactory;
import com.chundoong.db.stmt.StatementFactoryBuilder;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;


public class PStatementExecutor implements StatementExecutor{

    private StatementFactory sf = StatementFactoryBuilder.getFactory(false);
    
    public Response execute(Request r, DGContext dgc) {
        return sf.getStatement(r).execute(dgc);
    }

}