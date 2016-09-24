package com.chundoong.db.transaction;

import com.chundoong.exception.ChunDoongException;

public class TransactionFactory {

    private static String TX_TYPE_EXTERNAL = "EXTERNAL";
    private static String TX_TYPE_INTERNAL = "INTERNAL";

    public static Transaction getTransaction(TxContext txContext){
        String txType =  txContext.getTransactionType();
        if(TX_TYPE_EXTERNAL.equalsIgnoreCase(txType))
            return new ExternalTransaction(txContext.getDataSource(),txContext.getIsolationLevel(),txContext.isAutoCommit());
        else if(TX_TYPE_INTERNAL.equalsIgnoreCase(txType))
            return new InternalTransaction(txContext.getDataSource(),txContext.getIsolationLevel()); 
        else
            throw new ChunDoongException("transaction type(" + txType + ") was not defined.");
    }
    
}
