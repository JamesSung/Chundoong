package com.chundoong.serialization;

import java.util.Map;

import com.chundoong.config.ORMapConfig;
import com.chundoong.config.PropertyResource;
import com.chundoong.db.gateway.DGContext;

import com.chundoong.vo.xml.Clazz;
import com.thoughtworks.xstream.XStream;

import junit.framework.TestCase;

import org.junit.Test;

public class Row2ObjectTest // extends TestCase
{

    public void setUp() throws Exception {
       // super.setUp();
    }
    
    @Test
    public void deSerialzeTest(){
        String resourceName = "/chundoong_1.properties";
        ORMapConfig cf = ORMapConfig.getInstance();
        cf.prcessConfig(resourceName);
        Map<String,Clazz> classMap = cf.getClassMap(resourceName);
        PropertyResource pr = cf.getPropertyResource(resourceName);
        
        DGContext dgc = new DGContext();
        dgc.setCm(classMap);
        dgc.setPr(pr);
        
        String row = "result:{{CD_PRODTB:{ID:12345,NAME:01234567  ,AMT_INTEGER:1     ,AMT_DOUBLE:1.11E0                  ,AMT_DECIMAL:01.11 ,REG_DATE:2010-10-28,REG_TIME:10:30:08,REG_TIMESTAMP:2010-10-28-10.30.08.566488}},{CD_ITEMTB:{FK_ID:12345,ITEM_CODE:I9999  ,ITEM_VALUE:VAL1}},{CD_ITEMCONTTB:{FK_ID:12345,FK_ITEM_CODE:I9999  ,SEQ_NUM:1,CONTENTS:CONTENT1}}}";
        Object result = Row2Object.getInstance().deSerialze(row,"com.chundoong.Product", dgc);
        
        System.out.println(new XStream().toXML(result));
//        row = "result:{{CDDB2TB:{COL_VARCHAR:0123456789,COL_CHARACTER:01234567  ,COL_SMALLINT:1     ,COL_INTEGER:1          ,COL_DOUBLE:1.11E0                  ,COL_DECIMAL:01.11 ,COL_DATE:2010-10-28,COL_TIME:10:30:08,COL_TIMESTAMP:2010-10-28-10.30.08.566488},{COL_VARCHAR:0123456789,COL_CHARACTER:01234567  ,COL_SMALLINT:1     ,COL_INTEGER:1          ,COL_DOUBLE:1.11E0                  ,COL_DECIMAL:01.11 ,COL_DATE:2010-10-28,COL_TIME:10:30:08,COL_TIMESTAMP:2010-10-28-10.30.08.566488}}}";
//        result = Row2Object.getInstance().deSerialze(row, "com.chundoong.Product",dgc);
//        
//        System.out.println(new XStream().toXML(result));
    }
}