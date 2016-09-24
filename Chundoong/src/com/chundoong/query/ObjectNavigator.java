package com.chundoong.query;


import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.chundoong.exception.ChunDoongException;

public class ObjectNavigator {
    private static Log logger = LogFactory.getLog(ObjectNavigator.class);

    private static final String FIELD_SPLIT = "\\.";
    
    private static Map<String,Map<String,Field>> clazzFieldMap = new HashMap<String,Map<String,Field>>();
            
    
    public static Object getObjectByFieldName(String fieldName, Object sourceObject){
       if(sourceObject instanceof Map){
           return ((Map)sourceObject).get(fieldName);
       }
           
 	   String[] fieldNames = fieldName.split(FIELD_SPLIT);
 	   
   	   if(logger.isDebugEnabled()){
   		   if(sourceObject != null)
   		   logger.debug("type of sorce object : "+sourceObject.getClass().getName());
   	   }
   	   
	   int fieldSize = fieldNames.length;
	   Object currObject = sourceObject;
	   
 	   for(int i=0; i < fieldSize; i++){
 		   
 		   if(currObject == null)  break;
 		   
 		   if(currObject instanceof List ){
 			   currObject = processListObject(currObject, fieldNames[i]);
 		   }else if(currObject.getClass().isArray()){
 			  currObject = processArrayObject(currObject, fieldNames[i]);
 		   }else{
 			   currObject = findFieldValue(currObject, fieldNames[i]);
 		   }
		   
 	   	   if(logger.isDebugEnabled()){
 	   		   logger.debug("fieldName : "+fieldNames[i]);
 	   		   if(currObject != null)
 	   		       logger.debug("currObject : "+currObject.getClass().getName() + ", currValue : " +currObject);
 	   	   }
 	   	   
 	   }
    	
    	return currObject;
    }
        
   private static Object processArrayObject(Object currObject, String fieldName){
    	List result = new ArrayList();
    	int length = Array.getLength(currObject);
    	Object reObjt = null;
    	for(int i=0; i < length; i++){
    		
    		reObjt = getObjectByFieldName(fieldName, Array.get(currObject,i));
    		if(reObjt == null) continue;
    		
    		if(reObjt instanceof List){
    			result.addAll((List)reObjt);   			
    		}else if(reObjt.getClass().isArray()){
    			int elmlength = Array.getLength(reObjt);
    			for(int j=0; j < elmlength; j++){
    				result.add(Array.get(reObjt,j));
    			}
    		}else{
    			result.add(reObjt);
    		}
    	}
    	
    	return result;
    }
    
    private static Object processListObject(Object currObject, String fieldName){
    	List result = new ArrayList();
    	List list = (List)currObject;
    	int size = list.size();
    	Object reObjt = null;
    	for(int i=0; i < size; i++){
    		
    		reObjt = getObjectByFieldName(fieldName, list.get(i));
    		
    		if(reObjt instanceof List ){
    			result.addAll((List)reObjt);
    		}else{
    			result.add(reObjt);
    		}
    	}
    	
    	return result;
    }
    
    private static Object findFieldValue(Object tgtObject, String fieldName){
        try {
            Class<?> clazz =  tgtObject.getClass();
            String className = clazz.getName();
            if(!clazzFieldMap.containsKey(className)){
                synchronized(clazzFieldMap){
                    clazzFieldMap.put(className, makeFieldMap(clazz));
                }
            }
            
            Field attr = clazzFieldMap.get(className).get(fieldName);
            if(attr == null)
                return null;
            attr.setAccessible(true);
         return attr.get(tgtObject);
     }
     catch (SecurityException e) {
         e.printStackTrace();
         throw new ChunDoongException(e);
     }
     catch (IllegalAccessException e) {
         e.printStackTrace();
         throw new ChunDoongException(e);
     }
   }
    
    public static Class<?> findFieldType(String type, String fieldName){
        try {
            return findFieldType(Class.forName(type),fieldName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ChunDoongException(e);
        }       
    }
    
    public static Class<?> findFieldType(Class<?> clazz, String fieldName){
        try {
            String className = clazz.getName();
            if(!clazzFieldMap.containsKey(className)){
                synchronized(clazzFieldMap){
                    clazzFieldMap.put(className, makeFieldMap(clazz));
                }
            }
            
            Field attr = clazzFieldMap.get(className).get(fieldName);
            if(attr == null)
                return null;
            attr.setAccessible(true);
         return attr.getDeclaringClass();
     }
     catch (SecurityException e) {
         e.printStackTrace();
         throw new ChunDoongException(e);
     }
   }
    
    public static Field findChildField(Class<?> clazz, String fieldName){
        String[] fields = fieldName.split(".");
        Field result = null;
        for(String f : fields){
            if(result == null)
                result = findField(clazz, f);
            else
                result = findField(result.getDeclaringClass(), f);
        }
        
        return result;
    }

    public static Field findField(Class<?> clazz, String fieldName){
        try {
            String className = clazz.getName();
            if(!clazzFieldMap.containsKey(className)){
                synchronized(clazzFieldMap){
                    clazzFieldMap.put(className, makeFieldMap(clazz));
                }
            }
            
            Field attr = clazzFieldMap.get(className).get(fieldName);
            if(attr == null)
                return null;
            attr.setAccessible(true);
         return attr;
     }
     catch (SecurityException e) {
         e.printStackTrace();
         throw new ChunDoongException(e);
     }
   }
    
    private static Map<String,Field> makeFieldMap(Class<?> clazz){
        Map<String,Field> m = new HashMap<String,Field>();
        Field[] fs = clazz.getDeclaredFields();
        if(fs == null)
            return m;
        for(Field f : fs){
            m.put(f.getName(), f);
        }
        return m;
    }
      
}
