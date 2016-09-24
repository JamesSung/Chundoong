package com.chundoong.db.stmt;

import java.sql.Connection;
import java.util.List;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.vo.Response;
import com.chundoong.vo.Variable;

public interface Statement{
    public Response execute(DGContext dgc);
}