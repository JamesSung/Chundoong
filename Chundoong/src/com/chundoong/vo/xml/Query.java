package com.chundoong.vo.xml;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Query{
    private String id;
    private String clazz;
    private StringBuffer query = new StringBuffer();
    private Set<String> vars = new HashSet<String>();
    
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the query
     */
    public String getQuery() {
        return query.toString();
    }
    /**
     * @param query the query to set
     */
//    public void setQuery(String query) {
//        this.query = replaceByPattern(query,"\\s");
//        setVariables();
//    }
    
    public void appendQuery(String query) {
        query = replaceByPattern(query,"\\s");
        this.query.append(query);
//        setVariables();
    }
    
    /**
     * @return the vars
     */
    public Set<String> getVars() {
        return vars;
    }
    /**
     * @param vars the vars to set
     */
    public void setVars(Set<String> vars) {
        this.vars = vars;
    }
    
    private String replaceByPattern(String value, String pattern) {
        
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(value);
        StringBuffer sb = new StringBuffer();
        boolean result = m.find();
        while(result) {
            m.appendReplacement(sb, "");
            result = m.find();
        }
        m.appendTail(sb);
        return sb.toString();
    }
    
    public void setVariables(){
        String q = this.query.toString();
        int s = q.indexOf("${");
        int e = 0;
        while(s > 0){
            e = q.indexOf("}", s);
            vars.add(q.substring(s+2, e));
            q = q.substring(e);
            s = q.indexOf("${");
        }
    }
    /**
     * @return the clazz
     */
    public String getClazz() {
        return clazz;
    }
    /**
     * @param clazz the clazz to set
     */
    public void setClazz(String clazz) {
        this.clazz = clazz;
    }
    
}
