--return response for request
--request format is select:{{tab_name:{where_stmt::col_value&#col_name,...}},{tab_name2:{where_stmt::col_value&#col_name,...}},...}}}
CREATE PROCEDURE chundoong_data_facade_r
(IN schema_name VARCHAR(50),IN request VARCHAR(10000), OUT result VARCHAR(32000))
LANGUAGE SQL
  BEGIN
  DECLARE tab_name VARCHAR(50);
  DECLARE condition VARCHAR(1000);
  DECLARE sub_result VARCHAR(8000) DEFAULT '';
  DECLARE colon_idx INTEGER DEFAULT 0;
  DECLARE com_idx INTEGER DEFAULT 0;
  
   SET request = substr(request,POSSTR(request,':{{')+3);--remove "select:{{"
   SET colon_idx = POSSTR(request,':');
   SET result = '';
   
   IF colon_idx > 0 THEN
	   WHILE colon_idx > 0 DO
	     SET tab_name = substr(request,1,colon_idx-1);
	     SET condition = substr(request,colon_idx+1,POSSTR(request,'}}')-colon_idx);
	     SET sub_result = '';

	     CALL ntsfmi.chundoong_sub_result_select(schema_name,tab_name,condition,sub_result);

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
