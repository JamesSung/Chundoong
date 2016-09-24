--return response for request
--request format is update:{{CDDB2TB:{SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-04&#COL_DATE,10:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}},{CDDB2TB:{SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-04&#COL_DATE,11:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}}}
CREATE PROCEDURE chundoong_data_facade_cud
(IN schema_name VARCHAR(50),IN request VARCHAR(30000), OUT result VARCHAR(1000))
LANGUAGE SQL
  BEGIN
  DECLARE tab_name VARCHAR(50);
  DECLARE condition VARCHAR(1000);
  DECLARE sub_result VARCHAR(8000) DEFAULT '';
  DECLARE colon_idx INTEGER DEFAULT 0;
  DECLARE com_idx INTEGER DEFAULT 0;
  DECLARE cud_cls VARCHAR(10);
  
   SET cud_cls = substr(request,1,6);
   SET request = substr(request,POSSTR(request,':{{')+3);--remove "update:{{"
   SET colon_idx = POSSTR(request,':');
   SET result = '';
   
   IF colon_idx > 0 THEN
	   WHILE colon_idx > 0 DO
	     SET tab_name = substr(request,1,colon_idx-1);
	     SET condition = substr(request,colon_idx+1,POSSTR(request,'}}')-colon_idx);
	     SET sub_result = '';

       IF cud_cls = 'insert' THEN
	     		CALL ntsfmi.chundoong_sub_result_insert(schema_name,tab_name,condition,sub_result);
       ELSEIF cud_cls = 'update' THEN
	     		CALL ntsfmi.chundoong_sub_result_update(schema_name,tab_name,condition,sub_result);
       ELSE
	     		CALL ntsfmi.chundoong_sub_result_delete(schema_name,tab_name,condition,sub_result);
       END IF;

	     SET com_idx = POSSTR(request,'},{');
	     	     
	     IF com_idx > 0 THEN
	        SET result = result || sub_result || ',';  
	     	  SET request = substr(request,com_idx+3);
	        SET colon_idx = POSSTR(request,':');
	     ELSE
	        SET result = result || sub_result;
	        SET colon_idx = 0;
	     END IF;
	   END WHILE;
	 ELSE
	   SET result = 'NO RESULT';
	 END IF;
	 
	 SET result = 'result:{' || result || '}';

END!
