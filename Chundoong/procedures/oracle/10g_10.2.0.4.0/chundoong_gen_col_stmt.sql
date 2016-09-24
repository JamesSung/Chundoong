--4.1 generate column_list for a table 
CREATE OR REPLACE PROCEDURE chundoong_gen_col_stmt
(schema_name IN VARCHAR2, tab_name IN VARCHAR2, column_stmt OUT VARCHAR2)
AS
  col_name VARCHAR2(100) := '';
  col_type VARCHAR2(100) := '';
  sel_stmt VARCHAR2(4000) := ' ';
  
  CURSOR C1 IS
		select column_name,data_type
		from COLS 
		where table_name = tab_name      
		order by column_id;

  BEGIN

   OPEN c1;

   LOOP
     FETCH c1 INTO col_name,col_type;
     EXIT WHEN c1%NOTFOUND;
     
     IF col_type = 'DATE' THEN
     	  sel_stmt := sel_stmt || '''' || col_name || ':''||to_char(' || col_name ||',''YYYY-MM-DD HH24:MI:SS'')||'',''||';     
     ELSIF col_type like 'TIMESTAMP%' THEN
				sel_stmt := sel_stmt || '''' || col_name || ':''||to_char(' || col_name ||',''YYYY-MM-DD HH24:MI:SS.FF'')||'',''||';     
	   ELSE 
     		sel_stmt := sel_stmt || '''' || col_name || ':''||' || col_name ||'||'',''||';
     END IF;
	
   END LOOP;
   
   CLOSE c1;
   
   column_stmt := SUBSTR(sel_stmt,1,LENGTH(sel_stmt)-7);

END;
/
