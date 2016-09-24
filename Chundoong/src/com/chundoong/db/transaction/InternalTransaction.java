package com.chundoong.db.transaction;

import javax.sql.DataSource;

import com.chundoong.exception.ChunDoongException;

import java.sql.Connection;
import java.sql.SQLException;

public class InternalTransaction implements Transaction {


  private DataSource dataSource;
  private Connection connection;
  private IsolationLevel isolationLevel;

  public InternalTransaction(DataSource ds, IsolationLevel isolationLevel){
    dataSource = ds;
    this.isolationLevel = isolationLevel;
  }

  public void open() throws SQLException {
    connection = dataSource.getConnection();
    if (connection == null) {
      throw new ChunDoongException("The DataSource returned a null connection.");
    }
    
    isolationLevel.applyIsolationLevel(connection);

    if (connection.getAutoCommit()) {
      connection.setAutoCommit(false);
    }
  }

  public void commit() throws SQLException {
    if (connection != null) {
      connection.commit();
    }
  }

  public void rollback() throws SQLException {
    if (connection != null) {
      connection.rollback();
    }
  }

  public void close() throws SQLException {
    if (connection != null) {
      try {
        isolationLevel.restoreIsolationLevel(connection);
      } finally {
        connection.close();
        connection = null;
      }
    }
  }

}
