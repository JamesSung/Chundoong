package com.chundoong.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.chundoong.db.stmt.StatementType;
import com.chundoong.exception.ChunDoongException;

public class Request implements Serializable{
    
    private static final long serialVersionUID = -8977933532039151264L;

    private boolean includeChild;
    private boolean findByCondition;
    private StatementType stmtType;
    private String schema;
    private String queryId;
    
    private String whereClause;// full sql version is not supported.
    
    /**
     * when you find a object with custom where clause, use this property.<br/> 
     * this property will contain search key field name and value. For example <br/>
     * when find a object by primary key, pk field name of<br/> 
     * an object,not table column name, must be set. Don't need to add a variable
     * for CUD. 
     */
    private List<Variable> variables = new ArrayList<Variable>();
    
    /**
     * The target object for CRUD, when find a object create a empty object<br>
     * and set values only for primary key fields then add it. Don't add a null at any case.   
     */
    private List<Object> targets = new ArrayList<Object>();

    /**
     * @return the includeChild
     */
    public boolean isIncludeChild() {
        return includeChild;
    }

    /**
     * 
     * @param includeChild the includeChild to set
     */
    public void setIncludeChild(boolean includeChild) {
        this.includeChild = includeChild;
    }

    /**
     * @return the whereClause
     */
    public String getWhereClause() {
        return whereClause;
    }

    /**
     * @param whereClause the whereClause to set
     */
    public void setWhereClause(String whereClause) {
        if(whereClause == null || "".equals(whereClause))
            throw new ChunDoongException("the where clause cann't be null or blank.");
        if(!whereClause.trim().startsWith("where"))
            throw new ChunDoongException("the where clause must start with 'where'.");
            
        setFindByCondition(true);
        this.whereClause = whereClause;
    }

    /**
     * @return the variables
     */
    public List<Variable> getVariables() {
        return variables;
    }

    /**
     * @param variables the variables to set
     */
    public void setVariables(List<Variable> variables) {
        this.variables = variables;
    }
    
    public void addVariable(String name, Object value){
        variables.add(new Variable(name,null,value));
    }
    
    public void addTargetObjcet(Object obj){
        targets.add(obj);
    }

    /**
     * @return the findByCondition
     */
    public boolean isFindByCondition() {
        return findByCondition;
    }

    /**
     * @param findByCondition the findByCondition to set
     */
    private void setFindByCondition(boolean findByCondition) {
        this.findByCondition = findByCondition;
    }

    /**
     * @return the stmtType
     */
    public StatementType getStatementType() {
        return stmtType;
    }

    /**
     * this method is used internally. client don't need to set StmtType.
     * @param stmtType the stmtType to set
     */
    public void setStatementType(StatementType stmtType) {
        this.stmtType = stmtType;
    }

    /**
     * @return the schema
     */
    public String getSchema() {
        return schema;
    }

    /**
     * @param schima the schema to set
     */
    public void setSchema(String schema) {
        this.schema = schema;
    }

    /**
     * @return the targets
     */
    public List<Object> getTargets() {
        return targets;
    }

    /**
     * @return the queryId
     */
    public String getQueryId() {
        return queryId;
    }

    /**
     * @param queryId the queryId to set
     */
    public void setQueryId(String queryId) {
        this.queryId = queryId;
    }

}