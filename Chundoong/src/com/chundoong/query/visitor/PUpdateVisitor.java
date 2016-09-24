package com.chundoong.query.visitor;

//generate like this => {CDDB2TB:{SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-04&#COL_DATE,10:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}}
public class PUpdateVisitor extends PAbstractVisitor{
        
    @Override
    protected boolean isAddComumn() {
        return true;
    }

    @Override
    protected boolean isAddSqlType() {
        return true;
    }
}