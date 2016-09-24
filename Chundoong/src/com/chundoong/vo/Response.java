package com.chundoong.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Response  implements Serializable{

    private static final long serialVersionUID = 4336010280482388449L;
    
    private Object resultObject;

    /**
     * @return the resultObject
     */
    public Object getResultObject() {
        return resultObject;
    }

    /**
     * @param resultObject the resultObject to set
     */
    public void setResultObject(Object resultObject) {
        this.resultObject = resultObject;
    }
    
}