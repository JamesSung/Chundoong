--generate where key values
--condition's format is {where_statement::col_value&#col_name,col_value&#col_name,...}
CREATE PROCEDURE chundoong_gen_stmt_keys
(IN condition VARCHAR(1000),OUT result_keys VARCHAR(1000))
LANGUAGE SQL
  BEGIN
  DECLARE col_val VARCHAR(100);
  DECLARE col_vals VARCHAR(1000) DEFAULT '';
  DECLARE com_idx  INT DEFAULT 0;
  DECLARE colon_idx  INT DEFAULT 0;
  
  SET colon_idx = POSSTR(condition,'::');
  SET condition = substr(condition,colon_idx+2,length(condition)-colon_idx-2);-- key column and value list
  
   SET com_idx = POSSTR(condition,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 DO
	     SET col_val = substr(condition,1,POSSTR(condition,'&#')-1);
       SET col_vals = col_vals || col_val || ',';
       
	     SET com_idx = POSSTR(condition,',');
	     IF com_idx > 0 THEN
	     		SET condition = substr(condition,com_idx+1);
	     END IF;
	   END WHILE;
	   SET col_vals = SUBSTR(col_vals,1,LENGTH(col_vals)-1);
	 ELSE
	   SET col_vals = substr(condition,1,POSSTR(condition,'&#')-1);
	 END IF;
   
   SET result_keys = col_vals;

END!
