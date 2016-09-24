--generate delete statement
--condition's format is {0123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE PROCEDURE chundoong_gen_delete_stmt
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(1000), OUT delete_stmt VARCHAR(1000))
LANGUAGE SQL
  BEGIN
  DECLARE col_name VARCHAR(100);
  DECLARE col_conds VARCHAR(500) DEFAULT '';
  DECLARE com_idx  INT DEFAULT 0;
  DECLARE d_colon_idx  INT DEFAULT 0;
  DECLARE colon_idx  INT DEFAULT 0;
  DECLARE shap_idx  INT DEFAULT 0;
  
  SET d_colon_idx = POSSTR(condition,'::');
  SET condition = substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
  
   SET com_idx = POSSTR(condition,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 DO
	     SET shap_idx = POSSTR(condition,'&#');
	     SET condition = substr(condition,shap_idx+2);
	     SET com_idx = POSSTR(condition,',');

	     IF com_idx = 0 THEN
	     		SET col_name = condition;
	     ELSE
	     		SET col_name = substr(condition,1,com_idx-1);
	     		SET condition = substr(condition,com_idx+1);
	     END IF;
       SET col_conds = col_conds || col_name || '=? AND ';
       
	   END WHILE;
	   SET col_conds = SUBSTR(col_conds,1,LENGTH(col_conds)-4);
	 ELSE
	   SET shap_idx = POSSTR(condition,'&#');
	   SET col_conds = substr(condition,shap_idx+2) || '=?';
	 END IF;
   
   SET delete_stmt = 'DELETE FROM ' || schema_name || '.' || table_name || ' WHERE ' || col_conds ;

END!
