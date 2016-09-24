CREATE PROCEDURE chundoong_gen_col_type
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), IN col_name VARCHAR(100), OUT r_col_type  VARCHAR(20))
LANGUAGE SQL
  BEGIN
--  DECLARE not_found CONDITION FOR SQLSTATE '02000';
  DECLARE col_type VARCHAR(20);
  DECLARE col_len  SMALLINT DEFAULT 0;  
  DECLARE col_scale  SMALLINT DEFAULT 0;  
  
   DECLARE C1 CURSOR FOR
		select typename,length,scale
		from SYSCAT.COLUMNS 
		where tabschema = schema_name    
		  and tabname = table_name      
		  and colname = col_name;

--   DECLARE CONTINUE HANDLER FOR not_found
--     SET at_end = 1;

   OPEN c1;
   FETCH c1 INTO col_type,col_len,col_scale;
   CLOSE c1;
  
		   IF  col_type = 'DECIMAL' THEN
		         SET r_col_type = 'DECIMAL(' || rtrim(char(col_len))  || ',' || rtrim(char(col_scale))  || ')'; 	   
		   ELSEIF  col_type = 'CHARACTER' THEN
		         SET r_col_type = 'CHARACTER(' || rtrim(char(col_len)) || ')'; 	   
		   ELSEIF  col_type = 'VARCHAR' THEN
		         SET r_col_type = 'VARCHAR('|| rtrim(char(col_len)) || ')'; 	   
		   ELSE
		         SET r_col_type = col_type;  
		   END IF;

END!