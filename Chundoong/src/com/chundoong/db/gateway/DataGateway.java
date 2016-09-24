package com.chundoong.db.gateway;

import com.chundoong.vo.Request;
import com.chundoong.vo.Response;



public interface DataGateway{
    
    /**
     * finding a object by primary key.
     * primary key field which is member field of a target object.
     * primary key fields and value must be set to the request object. 
     * 
     * @param r
     * @return
     */
    public Response find(Request r);
    public Response insert(Request r);
    public Response delete(Request r);
    
    /**
     * update dose not support include child mode.
     * it is not efficiency way in most of cases.
     * use 'unit of work pattern[Fowler,PEAA]' and add individual objects to the request object.
     * 
     * @param r
     * @return
     */
    public Response update(Request r);
}