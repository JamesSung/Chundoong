--generate insert statement
--condition's format is {0123456789&#COL_VARCHAR,2010-11-04&#COL_DATE,10:01:01&#COL_TIME}
CREATE PROCEDURE chundoong_gen_insert_stmt
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN condition VARCHAR(4000), OUT insert_stmt VARCHAR(2000))
LANGUAGE SQL
  BEGIN
  DECLARE col_name VARCHAR(100);
  DECLARE col_names VARCHAR(2000) DEFAULT '';
  DECLARE questions VARCHAR(200) DEFAULT '';
  DECLARE com_idx  INT DEFAULT 0;
  DECLARE d_colon_idx  INT DEFAULT 0;
  DECLARE shap_idx  INT DEFAULT 0;
  
  --SET d_colon_idx = POSSTR(condition,'::');
  --SET condition = substr(condition,d_colon_idx+2,length(condition)-d_colon_idx-2);-- key column and value list
  
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
       SET col_names = col_names || col_name || ',';
       SET questions = questions || '?,';
       
	   END WHILE;
	   SET col_names = SUBSTR(col_names,1,LENGTH(col_names)-2);
	   SET questions = SUBSTR(questions,1,LENGTH(questions)-1);
	 ELSE
	   SET shap_idx = POSSTR(condition,'&#');
	   SET col_names = substr(condition,shap_idx+2,LENGTH(condition)-1);
	   SET questions = '?';
	 END IF;
   
   SET insert_stmt = 'INSERT INTO ' || schema_name || '.' || table_name || '(' || col_names || ') VALUES (' || questions || ')';

END!
