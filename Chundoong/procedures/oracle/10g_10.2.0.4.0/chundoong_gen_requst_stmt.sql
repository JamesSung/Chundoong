--generate where statement
--condition's format is {where_statement::col_value&#col_name,col_value&#col_name,...}
CREATE OR REPLACE PROCEDURE chundoong_gen_requst_stmt
(schema_name IN VARCHAR2, table_name IN VARCHAR2, in_condition IN VARCHAR2, result_stmt OUT VARCHAR2)
AS
  col_name_type VARCHAR2(150) := '';
  condition VARCHAR2(1000) := in_condition;
  col_name VARCHAR2(100) := '';
  numeric_cls CHAR(1) := ' ';
  con_stmt VARCHAR2(2000) := ' ';
  con_vals VARCHAR2(2000) := '';
  q_idx  SMALLINT := 0;
  q_cnt  SMALLINT := 0;
  d_colon_idx  SMALLINT := 0;
  shap_idx  SMALLINT := 0;
  s_colon_idx  SMALLINT := 0;
  com_idx  SMALLINT := 0;
  r_col_type  VARCHAR2(20) := '';  
  
  BEGIN
  
   d_colon_idx := INSTR(condition,'::');
   con_vals := substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
   condition := substr(condition,2,d_colon_idx-2);--where statement
  
    q_idx := INSTR(condition,'?');
	   WHILE q_idx > 0 LOOP
	      shap_idx := INSTR(con_vals,'&#');-- ':' changed  to '#'
	      com_idx := INSTR(con_vals,',');
          q_cnt := q_cnt + 1;

	     IF com_idx = 0 THEN
	     		 col_name := substr(con_vals,shap_idx+2);
	     ELSE
	     		 col_name := substr(con_vals,shap_idx+2,com_idx-shap_idx-2);
	     		 con_vals := substr(con_vals,com_idx+1);
	     END IF;
	     
	     --s_colon_idx := INSTR(col_name_type,':');
	     --col_name := substr(col_name_type,1,s_colon_idx-1);
	     --col_type := substr(col_name_type,s_colon_idx+1);
	     	     
	     chundoong_gen_col_type(schema_name,table_name,col_name,r_col_type);
	     
	     IF INSTR(r_col_type,'DECIMAL') > 0 or
	        	INSTR(r_col_type,'INT') > 0 or
	        	INSTR(r_col_type,'FLOAT') > 0 or
	        	INSTR(r_col_type,'NUM') > 0 or
	        	INSTR(r_col_type,'DOUBLE') > 0     THEN
	     		numeric_cls := 'N';
	     ELSE
	     		numeric_cls := 'C';
	     END IF;
	     
	     		
	     IF numeric_cls = 'N' THEN
       		con_stmt := con_stmt || substr(condition,1,q_idx-1) || 'CAST(CAST(:' || q_cnt || ' AS VARCHAR2(100)) AS ' || r_col_type || ')'; 	   
         ELSE
       		con_stmt := con_stmt || substr(condition,1,q_idx-1) || 'CAST(:' || q_cnt || ' AS ' || r_col_type || ')'; 	   
         END IF;
        
	     condition := substr(condition,q_idx+1);
	     q_idx := INSTR(condition,'?');
	     
	     IF q_idx = 0 and length(condition) > 0 THEN
	     		con_stmt := con_stmt || condition;
	     END IF;
	   END LOOP;

   result_stmt := con_stmt;

END;
/