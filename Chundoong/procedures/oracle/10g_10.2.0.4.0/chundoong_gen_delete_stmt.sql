--generate delete statement
--condition's format is {0123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE OR REPLACE PROCEDURE chundoong_gen_delete_stmt
(schema_name IN VARCHAR2, table_name IN VARCHAR2, in_condition IN VARCHAR2, delete_stmt OUT VARCHAR2)
AS
  condition VARCHAR2(2000) := in_condition;
  col_name VARCHAR2(100) := '';
  col_conds VARCHAR2(1000) := '';
  com_idx  INT := 0;
  d_colon_idx  INT := 0;
  colon_idx  INT := 0;
  shap_idx  INT := 0;

  BEGIN
  
  d_colon_idx := INSTR(condition,'::');
  condition := substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
  
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
       col_conds := col_conds || col_name || '=? AND ';
       
	   END LOOP;
	   col_conds := SUBSTR(col_conds,1,LENGTH(col_conds)-4);
	 ELSE
	   shap_idx := INSTR(condition,'&#');
	   col_conds := substr(condition,shap_idx+2) || '=?';
	 END IF;
   
   delete_stmt := 'DELETE FROM ' || schema_name || '.' || table_name || ' WHERE ' || col_conds ;

END;
/
