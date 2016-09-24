package com.chundoong.db.executor;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;


public interface StatementExecutor{
    public Response execute(Request r, DGContext dgc);
}
