--return result for a table
--condition's format is {A123456789&#COL_VARCHAR:VARCHAR,2010-11-04&#COL_DATE:DATE,10:01:01&#COL_TIME:TIME}
CREATE OR REPLACE PROCEDURE chundoong_sub_result_insert
(schema_name IN VARCHAR2, table_name IN VARCHAR2, in_condition IN VARCHAR2, sub_result OUT VARCHAR2)
AS
  condition VARCHAR2(2000) := in_condition;
  result_stmt VARCHAR2(2000) := '';
  insert_stmt VARCHAR2(2000) := '';
  insert_keys VARCHAR2(2000) := '';
  row_cnt SMALLINT := 0;

  BEGIN
  
   chundoong_gen_insert_stmt(schema_name, table_name,condition,insert_stmt);
   condition := '{' || insert_stmt || '::' || substr(condition,2);
   chundoong_gen_requst_stmt(schema_name, table_name,condition,result_stmt);
   chundoong_gen_stmt_keys(condition,insert_keys);
  		
   chundoong_execute_stmt(result_stmt,insert_keys,row_cnt);
   
   sub_result := table_name || ':' || row_cnt;
END;
/