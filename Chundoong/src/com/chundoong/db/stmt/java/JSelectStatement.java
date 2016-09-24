package com.chundoong.db.stmt.java;

import java.sql.Connection;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;


public class JSelectStatement extends JStatement{

    JSelectStatement(Request r) {
        super(r);
    }

    public Response execute(DGContext dgc) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected String getStatement(Object targetObject, DGContext dgc) {
        // TODO Auto-generated method stub
        return null;
    }
    
}