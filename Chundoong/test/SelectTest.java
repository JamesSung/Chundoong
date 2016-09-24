//package sfmi.framework.channel.svcmediator;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;

import junit.framework.TestCase;

public class SelectTest extends TestCase {

    Connection conn = null;
        
    public void setUp() throws Exception {
        super.setUp();
//        Class.forName("com.ibm.db2.jcc.DB2Driver");
//        conn = DriverManager.getConnection("jdbc:db2://42.8.162.100:60000/QTDEVDB", "D2008132", "ghkwo00");
        Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@42.8.163.102:1639:HDXUTF", "b2b_mng", "b2b00");
    }
    
    public void testCall1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_gen_col_stmt( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
        
    public void testCall2() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_gen_requst_stmt( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{COL_VARCHAR = ? AND COL_DATE = ?::0123456789&#COL_VARCHAR,2010-10-28&#COL_DATE}" ) ; //column type must be upper case
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall2_1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_gen_requst_stmt( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{SELECT 'COL_VARCHAR:'||COL_VARCHAR||'COL_DATE:'||CHAR(COL_DATE) FROM  CD_TYPETB WHERE COL_VARCHAR = ? AND COL_DATE = ?::0123456789&#COL_VARCHAR,2010-10-28&#COL_DATE}" ) ; //column type must be upper case
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall3() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_gen_stmt_keys( ?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "{COL_VARCHAR = ? AND COL_DATE = ?::0123456789&#COL_VARCHAR:VARCHAR,2010-10-28&#COL_DATE:DATE}" ) ; //column type must be upper case
        stpCall.setString( 2, out ) ; 
        stpCall.registerOutParameter( 2, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(2) ;
        
        System.out.println(out);
    }
    
    public void testCall4() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_create_sub_result( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{COL_VARCHAR = ? AND COL_DATE = ?::A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall4_1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_create_sub_result( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{COL_VARCHAR = ? AND COL_SMALLINT = ?::0123456789&#COL_VARCHAR,1&#COL_SMALLINT}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }

    public void testCall4_2() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_create_sub_result( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{COL_VARCHAR = ? AND COL_TIME = ?::0123456789&#COL_VARCHAR,10:30:08&#COL_TIME}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall4_3() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_create_sub_result( ?,?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "CD_TYPETB" ) ; 
        stpCall.setString( 3, "{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}" ) ; 
        stpCall.setString( 4, out ) ; 
        stpCall.registerOutParameter( 4, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(4) ;
        
        System.out.println(out);
    }
    
    public void testCall5() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_data_facade_r( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "select:{{CD_TYPETB:{COL_VARCHAR = ? AND COL_DATE = ?::A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE}}}" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
    
    public void testCall5_1() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_data_facade_r( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "select:{{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}}}" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
    
    public void testCall5_3() throws Exception{
        CallableStatement stpCall ; 
        String sql = "CALL b2b_mng.chundoong_data_facade_r( ?,?,? )" ; 
        String out = "";
        stpCall = conn.prepareCall( sql ) ; 
        stpCall.setString( 1, "B2B_MNG" ) ; 
        stpCall.setString( 2, "select:{{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}},{CD_TYPETB:{COL_VARCHAR = ? AND COL_DECIMAL = ?::0123456789&#COL_VARCHAR:VARCHAR,1.11&#COL_DECIMAL:DECIMAL}}}" ) ; 
        stpCall.setString( 3, out ) ; 
        stpCall.registerOutParameter( 3, Types.VARCHAR ) ; 
        stpCall.execute() ; 
        out = stpCall.getString(3) ;
        
        System.out.println(out);
    }
}
