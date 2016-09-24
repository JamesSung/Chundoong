--커서 분리 후 return result for a table
CREATE OR REPLACE PROCEDURE chundoong_create_sub_result
(schema_name IN VARCHAR2, table_name IN VARCHAR2, condition IN VARCHAR, sub_result OUT VARCHAR)
AS
  select_stmt VARCHAR2(5000) := '';
  column_stmt VARCHAR2(4000) := '';
  where_stmt VARCHAR2(1000) := '';
  where_keys VARCHAR2(1000) := '';
  row_result VARCHAR2(4000) := '';
  table_result VARCHAR2(8000) := '';
  at_end SMALLINT := 0;
  c1 SYS_REFCURSOR;
  
  BEGIN

   chundoong_gen_col_stmt(schema_name, table_name,column_stmt);
   chundoong_gen_requst_stmt(schema_name, table_name,condition,where_stmt);
   chundoong_gen_stmt_keys(condition,where_keys);
  		
   select_stmt := 'SELECT ' || column_stmt ||
              '  FROM ' || schema_name || '.' || table_name  ||
              ' WHERE ' || where_stmt;
     
--     SET select_stmt = 'select col_varchar from ntsfmi.cddb2tb where COL_VARCHAR = cast( ? as varchar(10))';-- AND COL_VARCHAR = cast( ? as varchar(10))';
--     SET where_keys = '0123456789';

   chundoong_create_stmt_cursor(select_stmt,where_keys,c1);
   
   
   LOOP
     FETCH c1 INTO row_result;
     EXIT WHEN c1%NOTFOUND;
     
     table_result := table_result || '{' || row_result || '},';
   END LOOP;
   CLOSE c1;
   
   IF LENGTH(table_result) = 0 THEN
   		sub_result := '{}';
   ELSE
   		sub_result := '{' || table_name || ':' || SUBSTR(table_result,1,LENGTH(table_result)-1) || '}';

   END IF;
END;
/
