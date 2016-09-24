package com.chundoong.db.stmt;

import com.chundoong.vo.Request;


public interface StatementFactory{
    public Statement getStatement(Request r);
}