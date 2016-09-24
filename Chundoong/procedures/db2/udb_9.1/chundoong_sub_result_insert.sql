--return result for a table
--condition's format is {A123456789&#COL_VARCHAR:VARCHAR,2010-11-04&#COL_DATE:DATE,10:01:01&#COL_TIME:TIME}
CREATE PROCEDURE chundoong_sub_result_insert
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(1000), OUT sub_result VARCHAR(100))
LANGUAGE SQL
  BEGIN
  DECLARE result_stmt VARCHAR(2000);
  DECLARE insert_stmt VARCHAR(2000) DEFAULT '';
  DECLARE insert_keys VARCHAR(2000) DEFAULT '';
  DECLARE row_cnt SMALLINT DEFAULT 0;
  
   CALL ntsfmi.chundoong_gen_insert_stmt(schema_name, table_name,condition,insert_stmt);
   SET condition = '{' || insert_stmt || '::' || substr(condition,2);
   CALL ntsfmi.chundoong_gen_requst_stmt(schema_name, table_name,condition,result_stmt);
   CALL ntsfmi.chundoong_gen_stmt_keys(condition,insert_keys);
  		
   CALL ntsfmi.chundoong_execute_stmt(result_stmt,insert_keys,row_cnt);
   
   SET sub_result = table_name || ':' || rtrim(char(row_cnt));
END!
