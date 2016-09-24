package com.chundoong.vo.db;

import java.util.ArrayList;
import java.util.List;

public class Row{
    private List<Column> columns = new ArrayList<Column>();

    /**
     * @return the columns
     */
    public List<Column> getColumns() {
        return columns;
    }
    
    public void addColumn(Column column){
        columns.add(column);
    }
    
    public void addColumns(List<Column> columns){
        if(columns == null || columns.size() == 0)
            return;
        this.columns.addAll(columns);
    }
}