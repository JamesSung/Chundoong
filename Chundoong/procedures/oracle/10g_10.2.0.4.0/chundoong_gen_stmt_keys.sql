--generate where key values
--condition's format is {where_statement::col_value&#col_name,col_value&#col_name,...}
CREATE OR REPLACE PROCEDURE chundoong_gen_stmt_keys
(condition IN VARCHAR2,result_keys OUT VARCHAR2)
AS
  col_val VARCHAR2(1000) := '';
  col_vals VARCHAR2(4000) := '';
  cond VARCHAR(1000) := '';
  com_idx  INT := 0;
  colon_idx  INT := 0;
  BEGIN
  
  colon_idx := INSTR(condition,'::');
  cond := substr(condition,colon_idx+2,length(condition)-colon_idx-2);-- key column and value list
  
   com_idx := INSTR(cond,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 LOOP
	     col_val := substr(cond,1,INSTR(cond,'&#')-1);
       col_vals := col_vals || col_val || ',';
       
	     com_idx := INSTR(cond,',');
	     IF com_idx > 0 THEN
	     		cond := substr(cond,com_idx+1);
	     END IF;
	   END LOOP;
	     col_vals := SUBSTR(col_vals,1,LENGTH(col_vals)-1);
	 ELSE
	     col_vals := substr(cond,1,INSTR(cond,'&#')-1);
	 END IF;
   
   result_keys := col_vals;

END;
/
