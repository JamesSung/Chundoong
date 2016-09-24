package com.chundoong.query.visitor;

import java.util.List;

import com.chundoong.query.ObjectNavigator;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Property;

//generate like this => {CDDB2TB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}}
public class PSelectVisitor extends PAbstractVisitor{
    @Override
    protected boolean isAddComumn() {
        return true;
    }

    @Override
    protected boolean isAddSqlType() {
        return true;
    }
    
}