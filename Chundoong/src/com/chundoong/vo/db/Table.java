package com.chundoong.vo.db;

import java.util.ArrayList;
import java.util.List;

public class Table{
    private String name;
    private List<Row> rows = new ArrayList<Row>();
    
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the rows
     */
    public List<Row> getRows() {
        return rows;
    }
    
    public void addRow(Row row){
        rows.add(row);
    }
    
    public void addRows(List<Row> rows){
        if(rows == null || rows.size() == 0)
            return;
        this.rows.addAll(rows);
    }
}