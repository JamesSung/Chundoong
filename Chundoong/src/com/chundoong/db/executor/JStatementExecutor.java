package com.chundoong.db.executor;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.db.stmt.Statement;
import com.chundoong.db.stmt.StatementFactory;
import com.chundoong.db.stmt.StatementFactoryBuilder;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;


public class JStatementExecutor implements StatementExecutor{

    private StatementFactory sf = StatementFactoryBuilder.getFactory(true);

    public Response execute(Request r, DGContext dgc) {
        // TODO Auto-generated method stub
        return null;
    }

}