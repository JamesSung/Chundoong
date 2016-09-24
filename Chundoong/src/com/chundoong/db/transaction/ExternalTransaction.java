package com.chundoong.db.transaction;


import javax.sql.DataSource;

import com.chundoong.exception.ChunDoongException;

import java.sql.Connection;
import java.sql.SQLException;

public class ExternalTransaction implements Transaction {

  private DataSource dataSource;
  private Connection connection;
  private IsolationLevel isolationLevel;
  private boolean originAutoCommit;
  private boolean autoCommit;

  public ExternalTransaction(DataSource ds, IsolationLevel isolationLevel, boolean autoCommit){
    dataSource = ds;

    this.isolationLevel = isolationLevel;
    this.autoCommit = autoCommit;
  }

  public void open() throws SQLException {
    connection = dataSource.getConnection();
    if (connection == null) {
      throw new ChunDoongException("The DataSource returned a null connection.");
    }
    
    isolationLevel.applyIsolationLevel(connection);

    if (autoCommit) {
      originAutoCommit = connection.getAutoCommit();
      if (originAutoCommit != autoCommit) {
        connection.setAutoCommit(autoCommit);
      }
    }
  }

  public void commit() throws SQLException {
  }

  public void rollback() throws SQLException {
  }

  public void close() throws SQLException {
    if (connection != null) {
      try {
        isolationLevel.restoreIsolationLevel(connection);
        connection.setAutoCommit(originAutoCommit);
      } finally {
        connection.close();
        connection = null;
      }
    }
  }


}
