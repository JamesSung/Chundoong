package com.chundoong.query.visitor;


//generate like this => {CDDB2TB:{A123456781&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}}
public class PDeleteVisitor extends PAbstractVisitor{
        
    @Override
    protected boolean isAddComumn() {
        return false;
    }

    @Override
    protected boolean isAddSqlType() {
        return false;
    }
}