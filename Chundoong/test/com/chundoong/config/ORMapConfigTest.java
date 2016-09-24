package com.chundoong.config;



import java.util.Map;

import com.chundoong.vo.xml.Clazz;
import com.thoughtworks.xstream.XStream;

import junit.framework.TestCase;
import org.junit.Test;

public class ORMapConfigTest //extends TestCase 
{

    public void setUp() throws Exception {
       // super.setUp();
    }
    
    @Test
    public void processConfigTest(){
        ORMapConfig cf = ORMapConfig.getInstance();
        cf.prcessConfig("/chundoong_1.properties");
        Map<String,Clazz> classMap = cf.getClassMap("/chundoong_1.properties");
        System.out.print(new XStream().toXML(classMap));
    }
    
}
