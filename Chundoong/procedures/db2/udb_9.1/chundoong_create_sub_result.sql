--커서 분리 후 return result for a table
CREATE PROCEDURE chundoong_create_sub_result
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(1000), OUT sub_result VARCHAR(8000))
LANGUAGE SQL
  BEGIN
  DECLARE select_stmt VARCHAR(5000);
  DECLARE column_stmt VARCHAR(4000) DEFAULT '';
  DECLARE request_stmt VARCHAR(1000) DEFAULT '';
  DECLARE where_keys VARCHAR(1000) DEFAULT '';
  DECLARE row_result VARCHAR(4000);
  DECLARE table_result VARCHAR(8000) DEFAULT '';
  DECLARE not_found CONDITION FOR SQLSTATE '02000';
  DECLARE at_end SMALLINT DEFAULT 0;
  DECLARE prefix VARCHAR(10);
  DECLARE result_set RESULT_SET_LOCATOR VARYING;
  
   DECLARE CONTINUE HANDLER FOR not_found
     SET at_end = 1;

   --TODO alternative => client send colum_stmt, this will increase network trapic
   
   CALL ntsfmi.chundoong_gen_requst_stmt(schema_name, table_name,condition,request_stmt);
   CALL ntsfmi.chundoong_gen_stmt_keys(condition,where_keys);

   SET prefix = condition.substr(2,6);
   
   --when select all columns there is where clause only
   IF prefix = 'SELECT' or prefix = 'select' THEN
   		 SET select_stmt = request_stmt;
   ELSE
		   CALL ntsfmi.chundoong_gen_col_stmt(schema_name, table_name,column_stmt);
		   SET select_stmt = 'SELECT ' || column_stmt ||
		              '  FROM ' || schema_name || '.' || table_name  ||
		              ' WHERE ' || request_stmt;
   END IF;
              
     
   CALL ntsfmi.chundoong_create_stmt_cursor(select_stmt,where_keys);
   ASSOCIATE RESULT SET LOCATOR (result_set) WITH PROCEDURE ntsfmi.chundoong_create_stmt_cursor;
   ALLOCATE c1 CURSOR FOR RESULT SET result_set;   
   
   
   ins_loop:
   LOOP
     FETCH c1 INTO row_result;
     IF at_end = 1 THEN
       LEAVE ins_loop;
     END IF;
     SET table_result = table_result || '{' || row_result || '},';
   END LOOP;
   CLOSE c1;
   
   IF LENGTH(table_result) = 0 THEN
   		SET sub_result = '{}';
   ELSE
   		SET sub_result = '{' || table_name || ':' || SUBSTR(table_result,1,LENGTH(table_result)-1) || '}';

   END IF;
END!

