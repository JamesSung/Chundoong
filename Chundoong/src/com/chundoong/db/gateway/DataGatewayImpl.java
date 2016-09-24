package com.chundoong.db.gateway;

import java.util.Map;

import com.chundoong.db.executor.StatementExecutor;
import com.chundoong.db.executor.StatementExecutorFactory;
import com.chundoong.db.stmt.StatementFactory;
import com.chundoong.db.stmt.StatementType;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;



public class DataGatewayImpl implements DataGateway{
    
    private DGContext dgc;//config loader will create this instance when create DataGatewayImpl.
    
    public Response find(Request r){
        r.setStatementType(StatementType.SELECT);
        return getStatementExecutor(r).execute(r,dgc);
    }
    
    public Response insert(Request r){
        r.setStatementType(StatementType.INSERT);
        return getStatementExecutor(r).execute(r,dgc);
    }
    
    public Response delete(Request r){
        r.setStatementType(StatementType.DELETE);
        return getStatementExecutor(r).execute(r,dgc);
    }
    
    public Response update(Request r){
        if(r.isIncludeChild())
            throw new ChunDoongException("update does not support include child mode!");
        r.setStatementType(StatementType.UPDATE);
        return getStatementExecutor(r).execute(r,dgc);
    }

    private StatementExecutor getStatementExecutor(Request r) {
        return StatementExecutorFactory.getExecutor(r,dgc);
    }

    public DataGatewayImpl(DGContext dgc) {
        super();
        this.dgc = dgc;
    }

}