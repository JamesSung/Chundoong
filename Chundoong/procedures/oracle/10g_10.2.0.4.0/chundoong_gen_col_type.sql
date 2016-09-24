--return column length
CREATE OR REPLACE PROCEDURE chundoong_gen_col_type
(schema_name IN VARCHAR2, tab_name IN VARCHAR2, col_name IN VARCHAR2, r_col_type  OUT VARCHAR2)
AS
  col_type VARCHAR2(100) := '';
  col_len  SMALLINT := 0;  
  col_pcs  SMALLINT := 0;  
  col_scale  SMALLINT := 0;  
  
   CURSOR C1  IS
		select data_type,data_length,data_precision,data_scale
		from COLS 
		where table_name = tab_name      
		  and column_name = col_name;

  BEGIN

   OPEN C1;
   FETCH C1 INTO col_type,col_len,col_pcs,col_scale;
  
   IF  col_type = 'NUMBER' and col_scale > 0 THEN
         r_col_type := 'NUMBER(' || col_pcs  || ',' || col_scale  || ')'; 				 	   
   ELSIF  INSTR(col_type,'CHAR') > 0 THEN
         r_col_type := 'CHAR(' || col_len || ')'; 	   
   ELSE
         r_col_type := col_type;  
   END IF;
   CLOSE C1;

END;
/