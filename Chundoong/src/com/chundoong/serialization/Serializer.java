package com.chundoong.serialization;

import com.chundoong.db.gateway.DGContext;

public interface Serializer{
    public Object deSerialze(String rows,String className, DGContext dgc);
}
