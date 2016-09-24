--return result for a table
--condition's format is {SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-01&#COL_DATE,10:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}
CREATE OR REPLACE PROCEDURE chundoong_sub_result_update
(schema_name IN VARCHAR2, table_name IN VARCHAR2, condition IN VARCHAR2, sub_result OUT VARCHAR2)
AS
  result_stmt VARCHAR2(2000) := '';
  update_stmt VARCHAR2(2000) := '';
  update_keys VARCHAR2(2000) := '';
  row_cnt SMALLINT := 0;

  BEGIN
  
   chundoong_gen_requst_stmt(schema_name, table_name,condition,update_stmt);
   chundoong_gen_stmt_keys(condition,update_keys);
  		
   result_stmt := 'UPDATE ' || schema_name || '.' || table_name  || update_stmt;
     
   chundoong_execute_stmt(result_stmt,update_keys,row_cnt);
   
   sub_result := table_name || ':' || row_cnt;
END;
/
