--return response for request
--request format is update:{{CDDB2TB:{SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-04&#COL_DATE,10:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}},{CDDB2TB:{SET col_date = ?,col_time = ? WHERE COL_VARCHAR = ? AND COL_DECIMAL = ?::2010-11-04&#COL_DATE,11:01:01&#COL_TIME,0123456789&#COL_VARCHAR,1.11&#COL_DECIMAL}}}
CREATE OR REPLACE PROCEDURE chundoong_data_facade_cud
(schema_name IN VARCHAR2,in_request IN VARCHAR2, result OUT VARCHAR2)
AS
  request VARCHAR2(30000) := in_request;
  tab_name VARCHAR2(100) := '';
  condition VARCHAR2(1000) := '';
  sub_result VARCHAR2(8000) := '';
  colon_idx INTEGER := 0;
  com_idx INTEGER := 0;
  cud_cls VARCHAR2(10) := '';
  BEGIN
  
   cud_cls := substr(request,1,6);
   request := substr(request,INSTR(request,':{{')+3);--remove "update:{{"
   colon_idx := INSTR(request,':');
   result := '';
   
   IF colon_idx > 0 THEN
	   WHILE colon_idx > 0 LOOP
	     tab_name := substr(request,1,colon_idx-1);
	     condition := substr(request,colon_idx+1,INSTR(request,'}}')-colon_idx);
	     sub_result := '';

       IF cud_cls = 'insert' THEN
	     		chundoong_sub_result_insert(schema_name,tab_name,condition,sub_result);
       ELSIF cud_cls = 'update' THEN
	     		chundoong_sub_result_update(schema_name,tab_name,condition,sub_result);
       ELSE
	     		chundoong_sub_result_delete(schema_name,tab_name,condition,sub_result);
       END IF;

	     com_idx := INSTR(request,'},{');
	     	     
	     IF com_idx > 0 THEN
	        result := result || sub_result || ',';  
	     	  request := substr(request,com_idx+3);
	        colon_idx := INSTR(request,':');
	     ELSE
	        result := result || sub_result;
	        colon_idx := 0;
	     END IF;
	   END LOOP;
	 ELSE
	   result := 'NO RESULT';
	 END IF;
	 
	 result := 'result:{' || result || '}';

END;
/