package com.chundoong.db.transaction;

import javax.sql.DataSource;


public class TxContext{
    private String transactionType;
    private DataSource dataSource;
    private IsolationLevel isolationLevel;
    private boolean autoCommit;
    
    /**
     * @return the isolationLevel
     */
    public IsolationLevel getIsolationLevel() {
        return isolationLevel;
    }
    /**
     * @param isolationLevel the isolationLevel to set
     */
    public void setIsolationLevel(IsolationLevel isolationLevel) {
        this.isolationLevel = isolationLevel;
    }
    /**
     * @return the autoCommit
     */
    public boolean isAutoCommit() {
        return autoCommit;
    }
    /**
     * @param autoCommit the autoCommit to set
     */
    public void setAutoCommit(boolean autoCommit) {
        this.autoCommit = autoCommit;
    }
    /**
     * @return the transactionType
     */
    public String getTransactionType() {
        return transactionType;
    }
    /**
     * @param transactionType the transactionType to set
     */
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    /**
     * @return the dataSource
     */
    public DataSource getDataSource() {
        return dataSource;
    }
    /**
     * @param dataSource the dataSource to set
     */
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
}