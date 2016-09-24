package com.chundoong.db.stmt;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.db.stmt.Statement;
import com.chundoong.vo.Request;
import com.chundoong.vo.Variable;

public abstract class ComnStatement implements Statement{
    protected Request r;
    
    protected ComnStatement(Request r){
        this.r = r;
    }
    
    protected static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            }catch (SQLException e) {}
        }
    }

    protected static void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            }catch (SQLException e) {}
        }
    }
    
    protected static void close(CallableStatement cs) {
        if (cs != null) {
            try {
                cs.close();
            }catch (SQLException e) {}
        }
    }

    /**
     * @return the statement
     */
    protected abstract String getStatement(Object targetObject, DGContext dgc);
}