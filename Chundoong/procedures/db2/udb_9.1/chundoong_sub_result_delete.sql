--return result for a table
--condition's format is {A123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE PROCEDURE chundoong_sub_result_delete
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(1000), OUT sub_result VARCHAR(100))
LANGUAGE SQL
  BEGIN
  DECLARE result_stmt VARCHAR(1000);
  DECLARE delete_stmt VARCHAR(1000) DEFAULT '';
  DECLARE delete_keys VARCHAR(500) DEFAULT '';
  DECLARE row_cnt SMALLINT DEFAULT 0;
  
   CALL ntsfmi.chundoong_gen_delete_stmt(schema_name, table_name,condition,delete_stmt);
   SET condition = '{' || delete_stmt || '::' || substr(condition,2);
   CALL ntsfmi.chundoong_gen_requst_stmt(schema_name, table_name,condition,result_stmt);
   CALL ntsfmi.chundoong_gen_stmt_keys(condition,delete_keys);
  		
   CALL ntsfmi.chundoong_execute_stmt(result_stmt,delete_keys,row_cnt);
   
   SET sub_result = table_name || ':' || rtrim(char(row_cnt));
END!
