package com.chundoong.query.visitor;

import java.util.List;

import com.chundoong.query.ObjectNavigator;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Property;

public abstract class PAbstractVisitor implements QueryVisitor{
    StringBuffer query = new StringBuffer();

    public void generate(Object target,Clazz clazz,boolean isParent){
        query.append(",{");
        query.append(clazz.getTable());
        query.append(":{");
        if(isAddComumn())
            addColumns(clazz);
        addColumnValues(target,clazz,isParent);
        query.append("}}");
        
    }
    
    protected abstract boolean isAddComumn(); 
    protected abstract boolean isAddSqlType(); 
    
    protected void addColumnValues(Object target, Clazz clazz,boolean isParent){
        
        List<Property> pks = clazz.getPks();
        int size = pks.size();
        int i = 0;
        for(Property pk : pks){
            i++;
            if(isParent)
                query.append(ObjectNavigator.getObjectByFieldName(pk.getNameByParent(target.getClass().getName()), target));
            else
                query.append(ObjectNavigator.getObjectByFieldName(pk.getName(), target));
            query.append("&#");
            query.append(pk.getColumn());
            if(isAddSqlType()){
                query.append(":");
                query.append(pk.getSqlType().getName());
            }
            if(i != size)
                query.append(",");
        }
//        query.append("}}");
    }
    
    protected void addColumns(Clazz clazz){
        
        List<Property> pks = clazz.getPks();
        int size = pks.size();
        int i = 0;
        for(Property pk : pks){
            i++;
            query.append(pk.getColumn());
            if(i == size)
                query.append(" = ?");
            else
                query.append(" = ? AND ");
        }
        query.append("::");
    }
    
    public String getResultQuery(){
        return query.toString().substring(1);//remove a comma
    }

}