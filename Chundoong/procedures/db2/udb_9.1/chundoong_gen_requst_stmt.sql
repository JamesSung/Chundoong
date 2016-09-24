--generate where statement
--condition's format is {where_statement::col_value&#col_name,col_value&#col_name,...}
CREATE PROCEDURE chundoong_gen_requst_stmt
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(2000), OUT result_stmt VARCHAR(2000))
LANGUAGE SQL
  BEGIN
  DECLARE col_name VARCHAR(100);
  DECLARE numeric_cls CHARACTER(1);
  DECLARE con_stmt VARCHAR(2000) DEFAULT ' ';
  DECLARE con_vals VARCHAR(1600);
  DECLARE q_idx  SMALLINT DEFAULT 0;
  DECLARE d_colon_idx  SMALLINT DEFAULT 0;
  DECLARE shap_idx  SMALLINT DEFAULT 0;
  DECLARE com_idx  SMALLINT DEFAULT 0;
  DECLARE r_col_type  VARCHAR(20);  
  
  SET d_colon_idx = POSSTR(condition,'::');
  SET con_vals = substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
  SET condition = substr(condition,2,d_colon_idx-2);--where statement
  
   SET q_idx = POSSTR(condition,'?');
	   WHILE q_idx > 0 DO
	     SET shap_idx = POSSTR(con_vals,'&#');-- ':' changed  to '&#'
	     SET com_idx = POSSTR(con_vals,',');
	     IF com_idx = 0 THEN
	     		SET col_name = substr(con_vals,shap_idx+2);
	     ELSE
	     		SET col_name = substr(con_vals,shap_idx+2,com_idx-shap_idx-2);
	     		SET con_vals = substr(con_vals,com_idx+1);
	     END IF;
	     
	     	     
	     CALL ntsfmi.chundoong_gen_col_type(schema_name,table_name,col_name,r_col_type);
	     
	     IF POSSTR(r_col_type,'DECIMAL') > 0 or
	        	POSSTR(r_col_type,'INT') > 0 or
	        	POSSTR(r_col_type,'FLOAT') > 0 or
	        	POSSTR(r_col_type,'NUM') > 0 or
	        	POSSTR(r_col_type,'DOUBLE') > 0     THEN
	     		SET numeric_cls = 'N';
	     ELSE
	     		SET numeric_cls = 'C';
	     END IF;
	     	     		
	     IF numeric_cls = 'N' THEN
       		SET con_stmt = con_stmt || substr(condition,1,q_idx-1) || 'CAST(CAST(? AS VARCHAR(100)) AS ' || r_col_type || ')'; 	   
       ELSE
       		SET con_stmt = con_stmt || substr(condition,1,q_idx-1) || 'CAST(? AS ' || r_col_type || ')'; 	   
       END IF;
        
	     SET condition = substr(condition,q_idx+1);
	     SET q_idx = POSSTR(condition,'?');
	     
	     IF q_idx = 0 and length(condition) > 0 THEN
	     		SET con_stmt = con_stmt || condition;
	     END IF;
	   END WHILE;

   SET result_stmt = con_stmt;

END!
