--4.1 generate column_list for a table 
CREATE PROCEDURE chundoong_gen_col_stmt
(IN schema_name VARCHAR(50), IN table_name VARCHAR(50), OUT column_stmt VARCHAR(4000))
LANGUAGE SQL
  BEGIN
  DECLARE col_name VARCHAR(100);
  DECLARE col_type VARCHAR(100);
  DECLARE sel_stmt VARCHAR(4000) DEFAULT ' ';
  DECLARE not_found CONDITION FOR SQLSTATE '02000';
  DECLARE at_end SMALLINT DEFAULT 0;
  
   DECLARE C1 CURSOR FOR
		select colname,typename
		from SYSCAT.COLUMNS 
		where tabschema = schema_name    
		  and tabname = table_name      
		order by colno;

   DECLARE CONTINUE HANDLER FOR not_found
     SET at_end = 1;

   OPEN c1;
   ins_loop:
   LOOP
     FETCH c1 INTO col_name,col_type;
     IF at_end = 1 THEN
       LEAVE ins_loop;
     END IF;
     
     IF col_type = 'CHARACTER' or col_type = 'VARCHAR' THEN
     	SET sel_stmt = sel_stmt || '''' || col_name || ':''||' || col_name ||'||'',''||';
     ELSE
     	SET sel_stmt = sel_stmt || '''' || col_name || ':''||char(' || col_name ||')||'',''||';     
     END IF;
   END LOOP;
   CLOSE c1;
   
   SET column_stmt = SUBSTR(sel_stmt,1,LENGTH(sel_stmt)-7);

END!
