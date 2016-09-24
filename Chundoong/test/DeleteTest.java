//package sfmi.framework.channel.svcmediator;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;

import junit.framework.TestCase;

public class DeleteTest extends TestCase {

    Connection conn = null;
        
    public void setUp() throws Exception {
        super.setUp();
        Class.forName("com.ibm.db2.jcc.DB2Driver");
        conn = DriverManager.getConnection("jdbc:db2://42.8.162.100:60000/QTDEVDB", "D2008132", "ghkwo00");
    }
    
    
    public void testCall1_1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL ntsfmi.chundoong_gen_delete_stmt( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "NTSFMI" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{2010-11-04&#COL_DATE}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall1_2() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL ntsfmi.chundoong_gen_delete_stmt( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "NTSFMI" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }

    public void testCall2_1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL ntsfmi.chundoong_sub_result_delete( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "NTSFMI" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall2_2() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL ntsfmi.chundoong_data_facade_cud( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "NTSFMI" ) ; 
        stpCall.setString( 2, "delete:{{CD_TYPETB:{A123456780&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}}}" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
    
    public void testCall2_3() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL ntsfmi.chundoong_data_facade_cud( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "NTSFMI" ) ; 
        stpCall.setString( 2, "delete:{{CD_TYPETB:{A123456781&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}},{CD_TYPETB:{A123456782&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}}}" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
}
