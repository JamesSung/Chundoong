--return result for a table
--condition's format is {SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-01&#COL_DATE,10:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}
CREATE PROCEDURE chundoong_sub_result_update
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(1000), OUT sub_result VARCHAR(100))
LANGUAGE SQL
  BEGIN
  DECLARE result_stmt VARCHAR(2000);
  DECLARE update_stmt VARCHAR(2000) DEFAULT '';
  DECLARE update_keys VARCHAR(2000) DEFAULT '';
  DECLARE row_cnt SMALLINT DEFAULT 0;
  
   CALL ntsfmi.chundoong_gen_requst_stmt(schema_name, table_name,condition,update_stmt);
   CALL ntsfmi.chundoong_gen_stmt_keys(condition,update_keys);
  		
   SET result_stmt = 'UPDATE ' || schema_name || '.' || table_name  || update_stmt;
     
   CALL ntsfmi.chundoong_execute_stmt(result_stmt,update_keys,row_cnt);
   
   SET sub_result = table_name || ':' || rtrim(char(row_cnt));
END!
