package com.chundoong.query;



import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.chundoong.PrimaryKey;
import com.chundoong.Product;
import com.chundoong.Item;
import com.chundoong.config.ORMapConfig;
import com.chundoong.config.PropertyResource;
import com.chundoong.db.gateway.DGContext;
import com.chundoong.query.visitor.PSelectVisitor;
import com.chundoong.query.visitor.QueryVisitor;
import com.chundoong.vo.xml.Clazz;
import com.thoughtworks.xstream.XStream;

import junit.framework.TestCase;
import org.junit.Test;

public class Object2PQueryTest // extends TestCase 
{

    public void setUp() throws Exception {
        //super.setUp();
    }
    
    @Test
    public void pSelectTest(){
        String resourceName = "/chundoong_1.properties";
        ORMapConfig cf = ORMapConfig.getInstance();
        cf.prcessConfig(resourceName);
        Map<String,Clazz> classMap = cf.getClassMap(resourceName);
        PropertyResource pr = cf.getPropertyResource(resourceName);
        
        DGContext dgc = new DGContext();
        dgc.setCm(classMap);
        dgc.setPr(pr);
        
        System.out.println(new XStream().toXML(classMap.get("com.chundoong.Product")));
        
        QueryVisitor qv = new PSelectVisitor();
        new Object2PQuery(makeProduct4Select(), dgc).invite(qv);
        System.out.println("result query : "+qv.getResultQuery());
    }
    
    public Product makeProduct4Select(){
        Product p = new Product();
        p.setId("P0001");
        return p;
    }
    
    public Product makeProduct(){
        Product p = new Product();
        p.setId("P0001");
        p.setName("Name1");
        p.setAmount(new BigDecimal("123.00"));
        p.setRegDate(new Date(System.currentTimeMillis()));
        p.setRegTime(new Time(System.currentTimeMillis()));
        p.setRegTimeStamp(new Timestamp(System.currentTimeMillis()));
        
        p.setItems(makeItems(p.getPk()));
        return p;
    }
    
    public List<Item> makeItems(PrimaryKey pk){
        List<Item> items = new ArrayList<Item>();
        PrimaryKey i1pk = pk.clone();
        i1pk.setItemCode("I001");
        Item i1 = new Item();
        i1.setPk(i1pk);
        i1.setValue("Value1");
        items.add(i1);
        
        PrimaryKey i2pk = pk.clone();
        i2pk.setItemCode("I002");
        Item i2 = new Item();
        i2.setPk(i2pk);
        i2.setValue("Value2");
        items.add(i2);
        
        return items;
    }
    
}
