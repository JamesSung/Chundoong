-- this is for select statement
-- key variable size must be the size of the longst column.
-- and key variable count should be increased to the max count of host variables in statements.
CREATE PROCEDURE chundoong_create_stmt_cursor
(IN statement VARCHAR(2000), IN value_keys VARCHAR(1000))
DYNAMIC RESULT SETS 1
LANGUAGE SQL
  BEGIN
  DECLARE curr_key VARCHAR(100);
  DECLARE key1 VARCHAR(100);
  DECLARE key2 VARCHAR(100);
  DECLARE key3 VARCHAR(100);
  DECLARE key4 VARCHAR(100);
  DECLARE key5 VARCHAR(100);
  DECLARE key6 VARCHAR(100);
  DECLARE key7 VARCHAR(100);
  DECLARE key8 VARCHAR(100);
  DECLARE key9 VARCHAR(100); 
  DECLARE key10 VARCHAR(100); 
  DECLARE key_cnt SMALLINT DEFAULT 0;
  DECLARE com_idx SMALLINT DEFAULT 0;
  DECLARE at_last SMALLINT DEFAULT 0;
  DECLARE c1 CURSOR WITH RETURN FOR s1;
  
     
   PREPARE s1 FROM statement;

   SET com_idx = POSSTR(value_keys,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 DO
	     SET curr_key = substr(value_keys,1,com_idx-1);
	     SET key_cnt = key_cnt + 1;
	     IF key_cnt = 1 THEN
	        SET key1 = curr_key;
	     ELSEIF key_cnt = 2 THEN
	        SET key2 = curr_key;
	     ELSEIF key_cnt = 3 THEN
	        SET key3 = curr_key;
	     ELSEIF key_cnt = 4 THEN
	        SET key4 = curr_key;
	     ELSEIF key_cnt = 5 THEN
	        SET key5 = curr_key;
	     ELSEIF key_cnt = 6 THEN
	        SET key6 = curr_key;
	     ELSEIF key_cnt = 7 THEN
	        SET key7 = curr_key;
	     ELSEIF key_cnt = 8 THEN
	        SET key8 = curr_key;
	     ELSEIF key_cnt = 9 THEN
	        SET key9 = curr_key;
	     ELSEIF key_cnt = 10 THEN
	        SET key10 = curr_key;
	     END IF;

	     IF at_last = 0  THEN
	     		SET value_keys = substr(value_keys,com_idx+1);	     
	     END IF;

    	 SET com_idx = POSSTR(value_keys,',');
	     
	     IF com_idx = 0 AND at_last = 0 THEN
	     		SET com_idx = LENGTH(value_keys)+1;
	     		SET at_last = 1;
	     END IF;
	   END WHILE;
	 ELSE
	   SET key_cnt = 1;
	   SET key1 = value_keys;
	 END IF;

   IF key_cnt = 1 THEN
   		OPEN c1 USING key1;
	 ELSEIF key_cnt = 2 THEN
   		OPEN c1 USING key1,key2;
	 ELSEIF key_cnt = 3 THEN
   		OPEN c1 USING key1,key2,key3;
	 ELSEIF key_cnt = 4 THEN
   		OPEN c1 USING key1,key2,key3,key4;
	 ELSEIF key_cnt = 5 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5;
	 ELSEIF key_cnt = 6 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5,key6;
	 ELSEIF key_cnt = 7 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5,key6,key7;
	 ELSEIF key_cnt = 8 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5,key6,key7,key8;
	 ELSEIF key_cnt = 9 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9;
	 ELSEIF key_cnt = 10 THEN
   		OPEN c1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
   END IF;
   
END!
