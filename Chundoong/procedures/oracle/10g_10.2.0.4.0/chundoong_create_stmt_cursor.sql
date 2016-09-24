-- this is for select statement
-- key variable size must be the size of the longst column.
-- and key variable count should be increased to the max count of host variables in statements.
CREATE OR REPLACE PROCEDURE chundoong_create_stmt_cursor
(statement IN VARCHAR2, in_value_keys IN VARCHAR2, c1 IN OUT SYS_REFCURSOR)
AS
  value_keys VARCHAR2(2000) := in_value_keys;
  curr_key VARCHAR2(100) := '';
  key1 VARCHAR2(100) := '';
  key2 VARCHAR2(100) := '';
  key3 VARCHAR2(100) := '';
  key4 VARCHAR2(100) := '';
  key5 VARCHAR2(100) := '';
  key6 VARCHAR2(100) := '';
  key7 VARCHAR2(100) := '';
  key8 VARCHAR2(100) := '';
  key9 VARCHAR2(100) := ''; 
  key10 VARCHAR2(100) := ''; 
  key_cnt SMALLINT := 0;
  com_idx SMALLINT := 0;
  at_last SMALLINT := 0;
  
  BEGIN
  
   com_idx := INSTR(value_keys,',');
   IF com_idx > 0 THEN
	   WHILE com_idx > 0 LOOP
	     curr_key := substr(value_keys,1,com_idx-1);
	     key_cnt := key_cnt + 1;
	     IF key_cnt = 1 THEN
	        key1 := curr_key;
	     ELSIF key_cnt = 2 THEN
	        key2 := curr_key;
	     ELSIF key_cnt = 3 THEN
	        key3 := curr_key;
	     ELSIF key_cnt = 4 THEN
	        key4 := curr_key;
	     ELSIF key_cnt = 5 THEN
	        key5 := curr_key;
	     ELSIF key_cnt = 6 THEN
	        key6 := curr_key;
	     ELSIF key_cnt = 7 THEN
	        key7 := curr_key;
	     ELSIF key_cnt = 8 THEN
	        key8 := curr_key;
	     ELSIF key_cnt = 9 THEN
	        key9 := curr_key;
	     ELSIF key_cnt = 10 THEN
	        key10 := curr_key;
	     END IF;

	     IF at_last = 0  THEN
	     		value_keys := substr(value_keys,com_idx+1);	     
	     END IF;

    	 com_idx := INSTR(value_keys,',');
	     
	     IF com_idx = 0 AND at_last = 0 THEN
	     		com_idx := LENGTH(value_keys)+1;
	     		at_last := 1;
	     END IF;
	   END LOOP;
	 ELSE
	    key_cnt := 1;
	    key1 := value_keys;
	 END IF;

   IF key_cnt = 1 THEN
   		OPEN c1 FOR statement USING key1;
	 ELSIF key_cnt = 2 THEN
   		OPEN c1 FOR statement USING key1,key2;
	 ELSIF key_cnt = 3 THEN
   		OPEN c1 FOR statement USING key1,key2,key3;
	 ELSIF key_cnt = 4 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4;
	 ELSIF key_cnt = 5 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5;
	 ELSIF key_cnt = 6 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5,key6;
	 ELSIF key_cnt = 7 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5,key6,key7;
	 ELSIF key_cnt = 8 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5,key6,key7,key8;
	 ELSIF key_cnt = 9 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5,key6,key7,key8,key9;
	 ELSIF key_cnt = 10 THEN
   		OPEN c1 FOR statement USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
   END IF;
   
END;
/
