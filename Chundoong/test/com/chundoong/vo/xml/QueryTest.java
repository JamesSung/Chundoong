package com.chundoong.vo.xml;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.thoughtworks.xstream.XStream;

import junit.framework.TestCase;
import org.junit.Test;



public class QueryTest //extends TestCase 
{

    public void setUp() throws Exception {
        //super.setUp();
    }
    
    @Test
    public void setQueryTest()throws Exception{
        String query = "select:{{cd_prodtb:{id = ?::${pk.id}&#id:character}}," +
        		"\r\n     {cd_itemtb:{fk_id = ?::${pk.id2}&#fk_id:character}}";

        Query q = new Query();
        q.appendQuery(query);     
        
        System.out.println("result query : "+q.getQuery());
        System.out.println("result vars : "+new XStream().toXML(q.getVars()));
    }
    
}
