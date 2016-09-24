-- this is for CUD statement
-- key variable size must be the size of the longst column.
-- and key variable count should be increased to the max count of host variables in statements.
-- for example all of select statement may use under 10 host variables, but update and insert 
-- statement could use over count of columns in tables
-- so, key variable count should be column count of the biggest table(has many columns)
-- plus host variable count in where statement.
CREATE OR REPLACE PROCEDURE chundoong_execute_stmt
(s1 IN VARCHAR2, in_value_keys IN VARCHAR2, count OUT SMALLINT)
AS
  value_keys VARCHAR2(4000) := in_value_keys;
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
  key11 VARCHAR2(100) := ''; 
  key12 VARCHAR2(100) := ''; 
  key13 VARCHAR2(100) := ''; 
  key14 VARCHAR2(100) := ''; 
  key15 VARCHAR2(100) := ''; 
  key16 VARCHAR2(100) := ''; 
  key17 VARCHAR2(100) := ''; 
  key18 VARCHAR2(100) := ''; 
  key19 VARCHAR2(100) := ''; 
  key20 VARCHAR2(100) := ''; 
  key21 VARCHAR2(100) := ''; 
  key22 VARCHAR2(100) := ''; 
  key23 VARCHAR2(100) := ''; 
  key24 VARCHAR2(100) := ''; 
  key25 VARCHAR2(100) := ''; 
  key26 VARCHAR2(100) := ''; 
  key27 VARCHAR2(100) := ''; 
  key28 VARCHAR2(100) := ''; 
  key29 VARCHAR2(100) := ''; 
  key30 VARCHAR2(100) := ''; 
  key31 VARCHAR2(100) := ''; 
  key32 VARCHAR2(100) := ''; 
  key33 VARCHAR2(100) := ''; 
  key34 VARCHAR2(100) := ''; 
  key35 VARCHAR2(100) := ''; 
  key36 VARCHAR2(100) := ''; 
  key37 VARCHAR2(100) := ''; 
  key38 VARCHAR2(100) := ''; 
  key39 VARCHAR2(100) := ''; 
  key40 VARCHAR2(100) := ''; 
  key41 VARCHAR2(100) := ''; 
  key42 VARCHAR2(100) := ''; 
  key43 VARCHAR2(100) := ''; 
  key44 VARCHAR2(100) := ''; 
  key45 VARCHAR2(100) := ''; 
  key46 VARCHAR2(100) := ''; 
  key47 VARCHAR2(100) := ''; 
  key48 VARCHAR2(100) := ''; 
  key49 VARCHAR2(100) := ''; 
  key50 VARCHAR2(100) := ''; 
  key51 VARCHAR2(100) := ''; 
  key52 VARCHAR2(100) := ''; 
  key53 VARCHAR2(100) := ''; 
  key54 VARCHAR2(100) := ''; 
  key55 VARCHAR2(100) := ''; 
  key56 VARCHAR2(100) := ''; 
  key57 VARCHAR2(100) := ''; 
  key58 VARCHAR2(100) := ''; 
  key59 VARCHAR2(100) := ''; 
  key60 VARCHAR2(100) := ''; 
  key61 VARCHAR2(100) := ''; 
  key62 VARCHAR2(100) := ''; 
  key63 VARCHAR2(100) := ''; 
  key64 VARCHAR2(100) := ''; 
  key65 VARCHAR2(100) := ''; 
  key66 VARCHAR2(100) := ''; 
  key67 VARCHAR2(100) := ''; 
  key68 VARCHAR2(100) := ''; 
  key69 VARCHAR2(100) := ''; 
  key70 VARCHAR2(100) := ''; 
  key71 VARCHAR2(100) := ''; 
  key72 VARCHAR2(100) := ''; 
  key73 VARCHAR2(100) := ''; 
  key74 VARCHAR2(100) := ''; 
  key75 VARCHAR2(100) := ''; 
  key76 VARCHAR2(100) := ''; 
  key77 VARCHAR2(100) := ''; 
  key78 VARCHAR2(100) := ''; 
  key79 VARCHAR2(100) := ''; 
  key80 VARCHAR2(100) := ''; 
  key_cnt SMALLINT := 0;
  com_idx SMALLINT := 0;
  at_last SMALLINT := 0;
  exe_cnt INTEGER := 0;

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
	     ELSIF key_cnt = 11 THEN
	        key11 := curr_key;
	     ELSIF key_cnt = 12 THEN
	        key12 := curr_key;
	     ELSIF key_cnt = 13 THEN
	        key13 := curr_key;
	     ELSIF key_cnt = 14 THEN
	        key14 := curr_key;
	     ELSIF key_cnt = 15 THEN
	        key15 := curr_key;
	     ELSIF key_cnt = 16 THEN
	        key16 := curr_key;
	     ELSIF key_cnt = 17 THEN
	        key17 := curr_key;
	     ELSIF key_cnt = 18 THEN
	        key18 := curr_key;
	     ELSIF key_cnt = 19 THEN
	        key19 := curr_key;
	     ELSIF key_cnt = 20 THEN
	        key20 := curr_key;
	     ELSIF key_cnt = 21 THEN
	        key21 := curr_key;
	     ELSIF key_cnt = 22 THEN
	        key22 := curr_key;
	     ELSIF key_cnt = 23 THEN
	        key23 := curr_key;
	     ELSIF key_cnt = 24 THEN
	        key24 := curr_key;
	     ELSIF key_cnt = 25 THEN
	        key25 := curr_key;
	     ELSIF key_cnt = 26 THEN
	        key26 := curr_key;
	     ELSIF key_cnt = 27 THEN
	        key27 := curr_key;
	     ELSIF key_cnt = 28 THEN
	        key28 := curr_key;
	     ELSIF key_cnt = 29 THEN
	        key29 := curr_key;
	     ELSIF key_cnt = 30 THEN
	        key30 := curr_key;
	     ELSIF key_cnt = 31 THEN
	        key31 := curr_key;
	     ELSIF key_cnt = 32 THEN
	        key32 := curr_key;
	     ELSIF key_cnt = 33 THEN
	        key33 := curr_key;
	     ELSIF key_cnt = 34 THEN
	        key34 := curr_key;
	     ELSIF key_cnt = 35 THEN
	        key35 := curr_key;
	     ELSIF key_cnt = 36 THEN
	        key36 := curr_key;
	     ELSIF key_cnt = 37 THEN
	        key37 := curr_key;
	     ELSIF key_cnt = 38 THEN
	        key38 := curr_key;
	     ELSIF key_cnt = 39 THEN
	        key39 := curr_key;
	     ELSIF key_cnt = 40 THEN
	        key40 := curr_key;
	     ELSIF key_cnt = 41 THEN
	        key41 := curr_key;
	     ELSIF key_cnt = 42 THEN
	        key42 := curr_key;
	     ELSIF key_cnt = 43 THEN
	        key43 := curr_key;
	     ELSIF key_cnt = 44 THEN
	        key44 := curr_key;
	     ELSIF key_cnt = 45 THEN
	        key45 := curr_key;
	     ELSIF key_cnt = 46 THEN
	        key46 := curr_key;
	     ELSIF key_cnt = 47 THEN
	        key47 := curr_key;
	     ELSIF key_cnt = 48 THEN
	        key48 := curr_key;
	     ELSIF key_cnt = 49 THEN
	        key49 := curr_key;
	     ELSIF key_cnt = 50 THEN
	        key50 := curr_key;
	     ELSIF key_cnt = 51 THEN
	        key51 := curr_key;
	     ELSIF key_cnt = 52 THEN
	        key52 := curr_key;
	     ELSIF key_cnt = 53 THEN
	        key53 := curr_key;
	     ELSIF key_cnt = 54 THEN
	        key54 := curr_key;
	     ELSIF key_cnt = 55 THEN
	        key55 := curr_key;
	     ELSIF key_cnt = 56 THEN
	        key56 := curr_key;
	     ELSIF key_cnt = 57 THEN
	        key57 := curr_key;
	     ELSIF key_cnt = 58 THEN
	        key58 := curr_key;
	     ELSIF key_cnt = 59 THEN
	        key59 := curr_key;
	     ELSIF key_cnt = 60 THEN
	        key60 := curr_key;
	     ELSIF key_cnt = 61 THEN
	        key61 := curr_key;
	     ELSIF key_cnt = 62 THEN
	        key62 := curr_key;
	     ELSIF key_cnt = 63 THEN
	        key63 := curr_key;
	     ELSIF key_cnt = 64 THEN
	        key64 := curr_key;
	     ELSIF key_cnt = 65 THEN
	        key65 := curr_key;
	     ELSIF key_cnt = 66 THEN
	        key66 := curr_key;
	     ELSIF key_cnt = 67 THEN
	        key67 := curr_key;
	     ELSIF key_cnt = 68 THEN
	        key68 := curr_key;
	     ELSIF key_cnt = 69 THEN
	        key69 := curr_key;
	     ELSIF key_cnt = 70 THEN
	        key70 := curr_key;
	     ELSIF key_cnt = 71 THEN
	        key71 := curr_key;
	     ELSIF key_cnt = 72 THEN
	        key72 := curr_key;
	     ELSIF key_cnt = 73 THEN
	        key73 := curr_key;
	     ELSIF key_cnt = 74 THEN
	        key74 := curr_key;
	     ELSIF key_cnt = 75 THEN
	        key75 := curr_key;
	     ELSIF key_cnt = 76 THEN
	        key76 := curr_key;
	     ELSIF key_cnt = 77 THEN
	        key77 := curr_key;
	     ELSIF key_cnt = 78 THEN
	        key78 := curr_key;
	     ELSIF key_cnt = 79 THEN
	        key79 := curr_key;
	     ELSIF key_cnt = 80 THEN
	        key80 := curr_key;
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
   		EXECUTE IMMEDIATE s1 USING key1;
	 ELSIF key_cnt = 2 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2;
	 ELSIF key_cnt = 3 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3;
	 ELSIF key_cnt = 4 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4;
	 ELSIF key_cnt = 5 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5;
	 ELSIF key_cnt = 6 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6;
	 ELSIF key_cnt = 7 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7;
	 ELSIF key_cnt = 8 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8;
	 ELSIF key_cnt = 9 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9;
	 ELSIF key_cnt = 10 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
     ELSIF key_cnt = 11 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11;
	 ELSIF key_cnt = 12 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12;
	 ELSIF key_cnt = 13 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13;
	 ELSIF key_cnt = 14 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14;
	 ELSIF key_cnt = 15 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15;
	 ELSIF key_cnt = 16 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16;
	 ELSIF key_cnt = 17 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17;
	 ELSIF key_cnt = 18 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18;
	 ELSIF key_cnt = 19 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19;
	 ELSIF key_cnt = 20 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20;
   ELSIF key_cnt = 21 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21;
	 ELSIF key_cnt = 22 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22;
	 ELSIF key_cnt = 23 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23;
	 ELSIF key_cnt = 24 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24;
	 ELSIF key_cnt = 25 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25;
	 ELSIF key_cnt = 26 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26;
	 ELSIF key_cnt = 27 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27;
	 ELSIF key_cnt = 28 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28;
	 ELSIF key_cnt = 29 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29;
	 ELSIF key_cnt = 30 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30;
   ELSIF key_cnt = 31 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31;
	 ELSIF key_cnt = 32 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32;
	 ELSIF key_cnt = 33 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33;
	 ELSIF key_cnt = 34 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34;
	 ELSIF key_cnt = 35 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35;
	 ELSIF key_cnt = 36 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36;
	 ELSIF key_cnt = 37 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37;
	 ELSIF key_cnt = 38 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38;
	 ELSIF key_cnt = 39 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39;
	 ELSIF key_cnt = 40 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40;
   ELSIF key_cnt = 41 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41;                                                      
	 ELSIF key_cnt = 42 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42;                                                
	 ELSIF key_cnt = 43 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43;                                          
	 ELSIF key_cnt = 44 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44;                                    
	 ELSIF key_cnt = 45 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45;                              
	 ELSIF key_cnt = 46 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46;                        
	 ELSIF key_cnt = 47 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47;                  
	 ELSIF key_cnt = 48 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48;            
	 ELSIF key_cnt = 49 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49;      
	 ELSIF key_cnt = 50 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50;
   ELSIF key_cnt = 51 THEN                                                                                                                                                                                                                                  
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51;                                                      
	 ELSIF key_cnt = 52 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52;                                                
	 ELSIF key_cnt = 53 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53;                                          
	 ELSIF key_cnt = 54 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54;                                    
	 ELSIF key_cnt = 55 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55;                              
	 ELSIF key_cnt = 56 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56;                        
	 ELSIF key_cnt = 57 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57;                  
	 ELSIF key_cnt = 58 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58;            
	 ELSIF key_cnt = 59 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59;      
	 ELSIF key_cnt = 60 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60;
   ELSIF key_cnt = 61 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61;                                                      
	 ELSIF key_cnt = 62 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62;                                                
	 ELSIF key_cnt = 63 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63;                                          
	 ELSIF key_cnt = 64 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64;                                    
	 ELSIF key_cnt = 65 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65;                              
	 ELSIF key_cnt = 66 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66;                        
	 ELSIF key_cnt = 67 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67;                  
	 ELSIF key_cnt = 68 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68;            
	 ELSIF key_cnt = 69 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69;      
	 ELSIF key_cnt = 70 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70;
   ELSIF key_cnt = 71 THEN
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71;                                                      
	 ELSIF key_cnt = 72 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72;                                                
	 ELSIF key_cnt = 73 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73;                                          
	 ELSIF key_cnt = 74 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74;                                    
	 ELSIF key_cnt = 75 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75;                              
	 ELSIF key_cnt = 76 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76;                        
	 ELSIF key_cnt = 77 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77;                  
	 ELSIF key_cnt = 78 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78;            
	 ELSIF key_cnt = 79 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78,key79;      
	 ELSIF key_cnt = 80 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE IMMEDIATE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78,key79,key80;
    -- ELSE 
       
   END IF;
   
   count := SQL%ROWCOUNT;
END;
/
