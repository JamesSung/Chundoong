--generate insert statement
--condition's format is {0123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE OR REPLACE PROCEDURE chundoong_gen_insert_stmt
(schema_name IN VARCHAR2, table_name IN VARCHAR2, in_condition IN VARCHAR2, insert_stmt OUT VARCHAR)
AS
  condition VARCHAR2(2000) := in_condition;
  col_name VARCHAR2(100) := '';
  col_names VARCHAR2(2000) := '';
  questions VARCHAR2(200) := '';
  com_idx  INT := 0;
  d_colon_idx  INT := 0;
  colon_idx  INT := 0;
  shap_idx  INT := 0;

  BEGIN
  
  --d_colon_idx := INSTR(condition,'::');
  --condition := substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
  
   com_idx := INSTR(condition,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 LOOP
	     shap_idx := INSTR(condition,'&#');
	     condition := substr(condition,shap_idx+2);
	     com_idx := INSTR(condition,',');

	     IF com_idx = 0 THEN
	     		col_name := condition;
	     ELSE
	     		col_name := substr(condition,1,com_idx-1);
	     		condition := substr(condition,com_idx+1);
	     END IF;
       col_names := col_names || col_name || ',';
       questions := questions || '?,';
       
	   END LOOP;
	   col_names := SUBSTR(col_names,1,LENGTH(col_names)-2);
	   questions := SUBSTR(questions,1,LENGTH(questions)-1);
	 ELSE
	   shap_idx := INSTR(condition,'&#');
	   col_names := substr(condition,shap_idx+2,LENGTH(condition)-1);
	   col_names := substr(col_names,1,LENGTH(col_names)-1);
	   questions := '?';
	 END IF;
   
   insert_stmt := 'INSERT INTO ' || schema_name || '.' || table_name || '(' || col_names || ') VALUES (' || questions || ')';

END;
/