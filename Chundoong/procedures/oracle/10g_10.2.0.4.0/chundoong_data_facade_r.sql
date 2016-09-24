--return response for request
--request format is select:{{tab_name:{where_stmt::col_value&#col_name,...}},{tab_name2:{where_stmt::col_value&#col_name,...}},...}}}
CREATE OR REPLACE PROCEDURE chundoong_data_facade_r
(schema_name IN VARCHAR2,in_request IN VARCHAR2, result OUT VARCHAR2)
AS
  request VARCHAR(10000) := in_request;
  tab_name VARCHAR2(100) := '';
  condition VARCHAR2(1000) := '';
  sub_result VARCHAR2(8000) := '';
  colon_idx INTEGER := 0;
  com_idx INTEGER := 0;

  BEGIN
  
   request := substr(request,INSTR(request,':{{')+3);--remove "select:{{"
   colon_idx := INSTR(request,':');
   result := '';
   
   IF colon_idx > 0 THEN
	   WHILE colon_idx > 0 LOOP
	     tab_name := substr(request,1,colon_idx-1);
	     condition := substr(request,colon_idx+1,INSTR(request,'}}')-colon_idx);
	     sub_result := '';

	     chundoong_create_sub_result(schema_name,tab_name,condition,sub_result);

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