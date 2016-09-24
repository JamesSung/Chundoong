package com.chundoong.serialization;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.vo.db.Table;
import com.chundoong.vo.db.Row;
import com.chundoong.vo.db.Column;
import com.chundoong.vo.xml.Child;
import com.chundoong.vo.xml.Clazz;
import com.chundoong.vo.xml.Property;



public class Row2Object implements Serializer{
    private static Log log = LogFactory.getLog(Row2Object.class);
    
    private static Row2Object instance = new Row2Object();
    
    public static Row2Object getInstance(){
        return instance;
    }

    //input parameter looks like this
    //result:{{CDDB2TB:{COL_VARCHAR:0123456789,COL_CHARACTER:01234567  ,COL_SMALLINT:1     ,COL_INTEGER:1          ,COL_DOUBLE:1.11E0                  ,COL_DECIMAL:01.11 ,COL_DATE:2010-10-28,COL_TIME:10:30:08,COL_TIMESTAMP:2010-10-28-10.30.08.566488}},{CDDB2TB:{COL_VARCHAR:0123456789,COL_CHARACTER:01234567  ,COL_SMALLINT:1     ,COL_INTEGER:1          ,COL_DOUBLE:1.11E0                  ,COL_DECIMAL:01.11 ,COL_DATE:2010-10-28,COL_TIME:10:30:08,COL_TIMESTAMP:2010-10-28-10.30.08.566488}}}
    public Object deSerialze(String rows,String className, DGContext dgc) {
        Clazz clazz = dgc.getClazz(className);
        Map<String,Table> tabs = parseString(rows);
        Object target = generateDomainObject(clazz, tabs.get(clazz.getTable()));
        if(target instanceof List){
            List list = (List)target;
            for(Object o : list){
                generateChild( o, clazz ,dgc, tabs);
            }
        }else{
            generateChild( target, clazz ,dgc, tabs);
        }
        
        
        return target;
    }
    
    private void generateChild(Object parent, Clazz clazz ,DGContext dgc, Map<String,Table> tabs){
        if(clazz.hasChild()){
            Map<String, Child> childs = clazz.getChilds();
            Set<String> keys = childs.keySet();
            Child cd = null;
            Clazz cc = null;
            Object cObj = null;
            Field f = null;
            try{
                for(String key : keys){
                    cd = childs.get(key);
                    cc = dgc.getClazz(cd.getTypeName());
                    cObj = generateDomainObject(cc, tabs.get(cc.getTable()));
                    f = parent.getClass().getDeclaredField(key);
                    f.setAccessible(true);
                    f.set(parent, TypeChanger.changeType(f.getType(), cObj));
                    generateChild(cObj, cc, dgc, tabs);
                }
            }catch(NoSuchFieldException e){
                e.printStackTrace();
                throw new ChunDoongException(e);
            }
            catch (IllegalAccessException e) {
                e.printStackTrace();
                throw new ChunDoongException(e);
            }
        }
    }
    
    private Object generateDomainObject(Clazz clazz, Table tab){
        if(log.isDebugEnabled()){
            log.debug("class name : " + clazz.getName() 
                      + ", table name :" + tab.getName()
                      + ", row size :" + tab.getRows().size()
                      );
        }
        
        Object target = null;
        try {
            if(tab == null)
                throw new ChunDoongException("Can't find a result for  table name[" + clazz.getTable() + "]");
            
            List<Row> rows = tab.getRows();
            if(rows == null || rows.size() == 0)
                return null;
            
            if(rows.size() > 1){
                Object elem = null;
                List<Object> targets = new ArrayList<Object>();
                for(Row row : rows){
                    elem = Class.forName(clazz.getName()).newInstance();
                    fillObject(elem, row, clazz);
                    targets.add(elem);
                }      
                target = targets;
            }
            else {
                target = Class.forName(clazz.getName()).newInstance();
                fillObject(target, rows.get(0), clazz);
            }
        }
        catch (InstantiationException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
        catch (IllegalAccessException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
        catch (SecurityException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
        catch (NoSuchFieldException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }
        return target;
    }
    
    private void fillObject(Object value, Row row, Clazz clazz) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InstantiationException, ClassNotFoundException{
        List<Column> cols = row.getColumns();
        Property prop = null;
        Class c = value.getClass();
        if(log.isDebugEnabled())
            log.debug("object type : " + c.getName());

        Map<String, Object> childMap = null;
        Field f = null;
        String fName = null;
        
        //value.getClass().getDeclaredField(name);
        for(Column col : cols){
            prop = clazz.getPropertyByColumnName(col.getName());
            if(prop == null)
                throw new ChunDoongException("Can't find a property for column name[" + col.getName() + "] ");
            if(log.isDebugEnabled()){
                log.debug("field name : " + prop.getName() + ", value : " + col.getValue());
            }
            
            fName = prop.getName();
            if(fName.indexOf(".") > 0){
                if(childMap == null)  childMap = new HashMap<String,Object>();
                
                fillMultiField(value, fName, col, childMap);
                continue;
            }
            
            f = c.getDeclaredField(fName);
            f.setAccessible(true);
            f.set(value, TypeChanger.changeType(f.getType(), col.getValue()));
        }
    }
    
    private void fillMultiField(Object value, String fName, Column col, Map<String, Object> childMap) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException, InstantiationException, ClassNotFoundException{
        
        String[] fields = fName.split("\\.");
        Object currObj = value;
        Class c = null;
        Field f = null;
        Object child = null;
        String childKey = null;
        
        for(int i=0; i < fields.length ; i++){
            c = currObj.getClass();
            
            f = c.getDeclaredField(fields[i]);
            f.setAccessible(true);
            
            if(i == fields.length - 1){
                f.set(currObj, TypeChanger.changeType(f.getType(), col.getValue()));
            }else{
                childKey = getChildKey(fields, i);
                if(childMap.containsKey(childKey)){
                    child = childMap.get(childKey);
                }else{
                    child = Class.forName(f.getType().getName()).newInstance();
                    childMap.put(childKey, child);
                }
//                if(log.isDebugEnabled()){
//                    log.debug("current field name : " + fields[i]);
//                    log.debug("current field type : " + f.getType().getName());
//                    log.debug("current object type : " + currObj.getClass().getName());
//                    log.debug("child object type : " + child.getClass().getName());
//                }
                
                f.set(currObj, child);
                
                currObj = child;
            }
        }        
    }
    
    private String getChildKey(String[] fields, int i){
        StringBuffer key = new StringBuffer();
        for(int j = 0 ; j <= i ; j++){
            key.append(fields[j]);
            if(j != i)
                key.append(".");
        }
        
        return key.toString();
    }
    
    private Map<String,Table> parseString(String rows){
        int dob = rows.indexOf("{{");
        int tcb = rows.indexOf("}}}");
        if(dob < 0 || tcb < 0)
            return null;
        
        rows = rows.substring(dob+2, tcb);
        if(log.isDebugEnabled())
            log.debug("trimed rows : "+rows);
        
        String[] rowArr = rows.split("\\}\\},\\{");//  CDDB2TB:{COL_VARCHAR:0123456789,COL_CHARACTER:01234567,...},{COL_VARCHAR:0123456789,COL_CHARACTER:01234567,...  
        if(rowArr.length  == 0)
            return null;
        
        Map<String,Table> result = new HashMap<String,Table>();
        Table t = null;
        int tIdx = 0;
        for(String row : rowArr){
            if("".equals(row.trim()))
                continue;
            t = new Table();
            tIdx = row.indexOf(":{");
            t.setName(row.substring(0,tIdx));
            t.addRows(generateRows(row.substring(tIdx+2)));
            
            result.put(t.getName(), t);
        }
                
        return result;        
    }
    
    //in parameter looks like "COL_VARCHAR:0123456789,COL_CHARACTER:01234567,...},{COL_VARCHAR:0123456789,COL_CHARACTER:01234567,..."
    private List<Row> generateRows(String rows4Table){
        if(log.isDebugEnabled())
            log.debug("rows4Table : "+rows4Table);

        String[] rowArr = rows4Table.split("\\},\\{");       
        if(rowArr.length == 0)
            return null;
        
        List<Row> rows = new ArrayList<Row>();
        Row r = null;
        for(String row : rowArr){
            if("".equals(row.trim()))
                continue;
            r = new Row();
            r.addColumns(generateColumns(row));
            rows.add(r);
        }
        
        return rows;
    }
    
    //in parameter looks like "COL_VARCHAR:0123456789,COL_CHARACTER:01234567,..."
    private List<Column> generateColumns(String columns){
        if(log.isDebugEnabled())
            log.debug("columns : "+columns);

        String[] colArr = columns.split(",");
        if(colArr.length == 0)
            return null;
        
        List<Column> cols = new ArrayList<Column>();
        Column c = null;
        String[] cArr = new String[2];
        int colIdx = 0;
        for(String col : colArr){
            if("".equals(col.trim()))
                continue;
            c = new Column();
            colIdx = col.indexOf(":");
            cArr[0] = col.substring(0,colIdx);
            cArr[1] = col.substring(colIdx+1);
            c.setName(cArr[0]);
            c.setValue(cArr[1]);
            cols.add(c);
        }
        
        return cols;
    }
}
