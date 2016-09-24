package com.chundoong.db.transaction;


import java.sql.SQLException;

public interface Transaction {

    public void open() throws SQLException;

    public void close() throws SQLException;

    public void commit() throws SQLException;

    public void rollback() throws SQLException;

//   public Connection getConnection() throws SQLException;

}
