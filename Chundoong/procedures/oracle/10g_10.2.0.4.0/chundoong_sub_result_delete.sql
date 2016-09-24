--return result for a table
--condition's format is {A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE OR REPLACE PROCEDURE chundoong_sub_result_delete
(schema_name IN VARCHAR2, table_name IN VARCHAR2, in_condition IN VARCHAR2, sub_result OUT VARCHAR2)
AS
  condition VARCHAR2(2000) := in_condition;
  result_stmt VARCHAR2(1000) := '';
  delete_stmt VARCHAR2(1000) := '';
  delete_keys VARCHAR2(1000) := '';
  row_cnt SMALLINT := 0;
  
  BEGIN
  
   chundoong_gen_delete_stmt(schema_name, table_name,condition,delete_stmt);
   condition := '{' || delete_stmt || '::' || substr(condition,2);
   chundoong_gen_requst_stmt(schema_name, table_name,condition,result_stmt);
   chundoong_gen_stmt_keys(condition,delete_keys);
  		
   chundoong_execute_stmt(result_stmt,delete_keys,row_cnt);
   
   sub_result := table_name || ':' || row_cnt;
END;
/
