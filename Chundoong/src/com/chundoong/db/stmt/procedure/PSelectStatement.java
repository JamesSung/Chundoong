package com.chundoong.db.stmt.procedure;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chundoong.db.gateway.DGContext;
import com.chundoong.exception.ChunDoongException;
import com.chundoong.query.Object2PQuery;
import com.chundoong.query.Object2Query;
import com.chundoong.query.visitor.PSelectVisitor;
import com.chundoong.query.visitor.QueryVisitor;
import com.chundoong.serialization.Row2Object;
import com.chundoong.vo.Request;
import com.chundoong.vo.Response;


public class PSelectStatement extends PStatement{
  private static Log log = LogFactory.getLog(PSelectStatement.class);

    PSelectStatement(Request r) {
        super(r);
    }

    public Response execute(DGContext dgc) {
        String out = null;
        String query = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        Response rp = new Response();
        List<Object> ts = this.r.getTargets();

        try {
            out = "";
            query = getStatement(ts.get(0),dgc);
            Connection conn = null;//TODO get connection from data source
            cs = conn.prepareCall(new StringBuffer(STR_CALL).append(r.getSchema()).append(STR_DOT).append(SQL_SELECT).toString());

            cs.setString( 1, r.getSchema() ) ; 
//          cs.setString( 2, "{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}" ) ; 
            cs.setString( 2, query); 
            cs.setString( 3, out ) ; 
            cs.registerOutParameter( 3, Types.VARCHAR ); 
            cs.execute() ; 
            out = cs.getString(3) ;
            if(log.isDebugEnabled()){
                log.debug(out);
            }            
            
            Object rst = null;
            if(r.getQueryId() != null)
                rst = Row2Object.getInstance().deSerialze(out, dgc.getQuery(r.getQueryId()).getClazz(), dgc);
            else
                rst = Row2Object.getInstance().deSerialze(out, ts.get(0).getClass().getName(), dgc);
            
            rp.setResultObject(rst);
            return rp;
        }catch(SQLException e){
            e.printStackTrace();
            log.error("current query : "+query);
            throw new ChunDoongException("The statement execution has failed.",e);
        }finally {
            close(cs);
        }
    }
        
}