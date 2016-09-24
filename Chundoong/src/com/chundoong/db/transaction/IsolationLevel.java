package com.chundoong.db.transaction;

import java.sql.Connection;
import java.sql.SQLException;

public class IsolationLevel {

    private int isolationLevel = -99;
    private int originLevel = -99;
    
    public static IsolationLevel READ_COMMITTED = new IsolationLevel(Connection.TRANSACTION_READ_COMMITTED);
    public static IsolationLevel READ_UNCOMMITTED = new IsolationLevel(Connection.TRANSACTION_READ_UNCOMMITTED);
    
    public IsolationLevel(int isolationLevel) {
        this.isolationLevel = isolationLevel;
    }
    
    public void applyIsolationLevel(Connection conn) throws SQLException {
        if(isolationLevel == -99) return;
        
        originLevel = conn.getTransactionIsolation();
        if (isolationLevel != originLevel) {
            conn.setTransactionIsolation(isolationLevel);
        }
    }

    public void restoreIsolationLevel(Connection conn) throws SQLException {
        if (isolationLevel != originLevel) {
          conn.setTransactionIsolation(originLevel);
        }
    }
}
