package com.chundoong.db.stmt.java;

import com.chundoong.db.stmt.ComnStatement;
import com.chundoong.vo.Request;

public abstract class JStatement extends ComnStatement{
    
    JStatement(Request r){
        super(r);
    }
}