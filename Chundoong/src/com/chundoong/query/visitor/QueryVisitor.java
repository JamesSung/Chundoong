package com.chundoong.query.visitor;

import com.chundoong.vo.xml.Clazz;

public interface QueryVisitor{
    public void generate(Object target,Clazz clazz, boolean isParent);
    public String getResultQuery();
}