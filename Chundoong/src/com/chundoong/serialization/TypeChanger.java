package com.chundoong.serialization;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TypeChanger {

	private static Log log = LogFactory.getLog(TypeChanger.class);
	
	
	public static Object changeType(Class<?> type, Object value) {
	    
		if (type == null) return value;
		if (value == null) return value;
		
		if(log.isDebugEnabled()){
            log.debug("type : " + type.getName());
            log.debug("value : " + value);
		}
		
		Class<?> vClass = value.getClass();
		
		if(type.equals(vClass))
		    return value;
		
		if(("java.util.List".equals(type.getName()) || "java.util.ArrayList".equals(type.getName()))
		        && !(value instanceof List)){
		    List list = new ArrayList();
		    list.add(value);
		    return list;
		}
		
		if(type.isArray() && value instanceof List){
		    List list = (List)value;
		    Object arr = java.lang.reflect.Array.newInstance(type.getComponentType(), list.size());
		    list.toArray((Object[])arr);		    
		    return arr;
		}
		
		if("java.sql.Date".equals(type.getName())){
		    return java.sql.Date.valueOf(value.toString());
		}
		
        if("java.sql.Time".equals(type.getName())){
            return java.sql.Time.valueOf(value.toString());
        }
        if("java.sql.Timestamp".equals(type.getName())){
            //FIXME this is only tested for DB2
            String val = value.toString();
            val = val.replaceAll("-", "");
            val = val.replaceAll("\\.", "");

            StringBuffer sb = new StringBuffer();
            val = sb.append(val.substring(0, 4))
                    .append("-")
                    .append(val.substring(4, 6))
                    .append("-")
                    .append(val.substring(6, 8))
                    .append(" ")
                    .append(val.substring(8, 10))
                    .append(":")
                    .append(val.substring(10, 12))
                    .append(":")
                    .append(val.substring(12, 14))
                    .append(".")
                    .append(val.substring(14)).toString();
                    
            
            if(log.isDebugEnabled())
                log.debug(val);
                
            return java.sql.Timestamp.valueOf(val);
        }
		
		if (vClass.equals(String.class) || vClass.equals(BigDecimal.class)) {
			if (value.toString().trim().length() <= 0)
				return value;
						
			if (type.equals(int.class)) {
				return Integer.parseInt(value.toString());
			}
			
			if (type.equals(Integer.class)) {
				return new Integer(value.toString());
			}
			
			if (type.equals(short.class)) {
				return Short.parseShort(value.toString());
			}
			
			if (type.equals(BigDecimal.class)) {
			    String val = value.toString().trim();
			    val = adjustE(val);
			    if(log.isDebugEnabled()) log.debug(val);
			    
				return new BigDecimal(val);
			}

			if (type.equals(double.class) || type.equals(Double.class)) {
                String val = value.toString().trim();
			    val = adjustE(val);
				return (new Double(val.toString())).doubleValue();
			}
			
			if (type.equals(long.class) || type.equals(Long.class)) {
				if (log.isDebugEnabled()) {
					log.debug("value : " + (new Long(value.toString())).longValue());
				}
				return (new Long(value.toString())).longValue();
			}
		}
		
		if (vClass.equals(double.class) ||
				vClass.equals(Double.class)) {
			if (type.equals(int.class) ||
					type.equals(Integer.class)) {
				return (new Double(value.toString())).intValue();
			} else if (type.equals(short.class) || type.equals(Short.class)) {
				return Short.parseShort(value.toString());
			}  else if (type.equals(String.class)) {
				return (new String(value.toString()));
			} else if (type.equals(BigDecimal.class)) {
				return new BigDecimal(value.toString());
			}
		}
		
		if (vClass.equals(int.class) ||
				vClass.equals(Integer.class)) {
			if (type.equals(String.class)) {
				return String.valueOf((Integer)value);
			}
		}
		
		if (vClass.equals(long.class) || vClass.equals(Long.class)) {
			if (type.equals(int.class) || type.equals(Integer.class)) {
				return Integer.parseInt(value.toString());
			}
			if (type.equals(short.class) || type.equals(Short.class)) {
				return Short.parseShort(value.toString());
			}
			
			if(type.equals(BigDecimal.class)){
				return new BigDecimal(value.toString());
			}
		}
		
		if (vClass.equals(Date.class)) {
			if (type.equals(String.class)) {
				return String.valueOf(value);
			}
		}
		
		return value;
	}
	
	private static String adjustE(String val){
	    int idx = val.indexOf("E");
	    if(idx < 0)
	        return val;
	    
	    String point = val.substring(idx+1);
        val = val.substring(0,idx);
	    if(point.startsWith("+")){
	        return new BigDecimal(val).movePointRight(Integer.parseInt(point.substring(1))).toString();
	    }else if(point.startsWith("-")){
            return new BigDecimal(val).movePointLeft(Integer.parseInt(point.substring(1))).toString();
	    }else{
            return new BigDecimal(val).movePointRight(Integer.parseInt(point)).toString();
	    }
	        
	}
}
