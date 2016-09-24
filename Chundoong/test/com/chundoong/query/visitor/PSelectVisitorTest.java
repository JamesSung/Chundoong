package com.chundoong.query.visitor;



import java.util.Map;

import com.chundoong.config.ORMapConfig;
import com.chundoong.vo.xml.Clazz;
import com.thoughtworks.xstream.XStream;
import com.chundoong.query.Object2PQueryTest;
import org.junit.Test;

public class PSelectVisitorTest extends Object2PQueryTest {

    public void setUp() throws Exception {
       // super.setUp();
    }
    
    @Test
    public void generateTest(){
        ORMapConfig cf = ORMapConfig.getInstance();
        cf.prcessConfig("/chundoong_1.properties");
        Map<String,Clazz> classMap = cf.getClassMap("/chundoong_1.properties");
        QueryVisitor qv = new PSelectVisitor();
        
        System.out.print(new XStream().toXML(classMap.get("com.chundoong.Product")));
        
        qv.generate(makeProduct(), classMap.get("com.chundoong.Product"),false);
        
        System.out.print("result query : "+qv.getResultQuery());
    }
        
}
