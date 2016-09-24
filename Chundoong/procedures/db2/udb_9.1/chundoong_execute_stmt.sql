-- this is for CUD statement
-- key variable size must be the size of the longst column.
-- and key variable count should be increased to the max count of host variables in statements.
-- for example all of select statement may use under 10 host variables, but update and insert 
-- statement could use over count of columns in tables
-- so, key variable count should be column count of the biggest table(has many columns)
-- plus host variable count in where statement.
CREATE PROCEDURE chundoong_execute_stmt
(IN statement VARCHAR(2000), IN value_keys VARCHAR(2000), OUT count SMALLINT)
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
  DECLARE key11 VARCHAR(100); 
  DECLARE key12 VARCHAR(100); 
  DECLARE key13 VARCHAR(100); 
  DECLARE key14 VARCHAR(100); 
  DECLARE key15 VARCHAR(100); 
  DECLARE key16 VARCHAR(100); 
  DECLARE key17 VARCHAR(100); 
  DECLARE key18 VARCHAR(100); 
  DECLARE key19 VARCHAR(100); 
  DECLARE key20 VARCHAR(100); 
  DECLARE key21 VARCHAR(100); 
  DECLARE key22 VARCHAR(100); 
  DECLARE key23 VARCHAR(100); 
  DECLARE key24 VARCHAR(100); 
  DECLARE key25 VARCHAR(100); 
  DECLARE key26 VARCHAR(100); 
  DECLARE key27 VARCHAR(100); 
  DECLARE key28 VARCHAR(100); 
  DECLARE key29 VARCHAR(100); 
  DECLARE key30 VARCHAR(100); 
  DECLARE key31 VARCHAR(100); 
  DECLARE key32 VARCHAR(100); 
  DECLARE key33 VARCHAR(100); 
  DECLARE key34 VARCHAR(100); 
  DECLARE key35 VARCHAR(100); 
  DECLARE key36 VARCHAR(100); 
  DECLARE key37 VARCHAR(100); 
  DECLARE key38 VARCHAR(100); 
  DECLARE key39 VARCHAR(100); 
  DECLARE key40 VARCHAR(100); 
  DECLARE key41 VARCHAR(100); 
  DECLARE key42 VARCHAR(100); 
  DECLARE key43 VARCHAR(100); 
  DECLARE key44 VARCHAR(100); 
  DECLARE key45 VARCHAR(100); 
  DECLARE key46 VARCHAR(100); 
  DECLARE key47 VARCHAR(100); 
  DECLARE key48 VARCHAR(100); 
  DECLARE key49 VARCHAR(100); 
  DECLARE key50 VARCHAR(100); 
  DECLARE key51 VARCHAR(100); 
  DECLARE key52 VARCHAR(100); 
  DECLARE key53 VARCHAR(100); 
  DECLARE key54 VARCHAR(100); 
  DECLARE key55 VARCHAR(100); 
  DECLARE key56 VARCHAR(100); 
  DECLARE key57 VARCHAR(100); 
  DECLARE key58 VARCHAR(100); 
  DECLARE key59 VARCHAR(100); 
  DECLARE key60 VARCHAR(100); 
  DECLARE key61 VARCHAR(100); 
  DECLARE key62 VARCHAR(100); 
  DECLARE key63 VARCHAR(100); 
  DECLARE key64 VARCHAR(100); 
  DECLARE key65 VARCHAR(100); 
  DECLARE key66 VARCHAR(100); 
  DECLARE key67 VARCHAR(100); 
  DECLARE key68 VARCHAR(100); 
  DECLARE key69 VARCHAR(100); 
  DECLARE key70 VARCHAR(100); 
  DECLARE key71 VARCHAR(100); 
  DECLARE key72 VARCHAR(100); 
  DECLARE key73 VARCHAR(100); 
  DECLARE key74 VARCHAR(100); 
  DECLARE key75 VARCHAR(100); 
  DECLARE key76 VARCHAR(100); 
  DECLARE key77 VARCHAR(100); 
  DECLARE key78 VARCHAR(100); 
  DECLARE key79 VARCHAR(100); 
  DECLARE key80 VARCHAR(100); 
  DECLARE key_cnt SMALLINT DEFAULT 0;
  DECLARE com_idx SMALLINT DEFAULT 0;
  DECLARE at_last SMALLINT DEFAULT 0;
  DECLARE exe_cnt INTEGER DEFAULT 0;
--  DECLARE c1 CURSOR WITH RETURN FOR s1;
  
     
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
	     ELSEIF key_cnt = 11 THEN
	        SET key11 = curr_key;
	     ELSEIF key_cnt = 12 THEN
	        SET key12 = curr_key;
	     ELSEIF key_cnt = 13 THEN
	        SET key13 = curr_key;
	     ELSEIF key_cnt = 14 THEN
	        SET key14 = curr_key;
	     ELSEIF key_cnt = 15 THEN
	        SET key15 = curr_key;
	     ELSEIF key_cnt = 16 THEN
	        SET key16 = curr_key;
	     ELSEIF key_cnt = 17 THEN
	        SET key17 = curr_key;
	     ELSEIF key_cnt = 18 THEN
	        SET key18 = curr_key;
	     ELSEIF key_cnt = 19 THEN
	        SET key19 = curr_key;
	     ELSEIF key_cnt = 20 THEN
	        SET key20 = curr_key;
	     ELSEIF key_cnt = 21 THEN
	        SET key21 = curr_key;
	     ELSEIF key_cnt = 22 THEN
	        SET key22 = curr_key;
	     ELSEIF key_cnt = 23 THEN
	        SET key23 = curr_key;
	     ELSEIF key_cnt = 24 THEN
	        SET key24 = curr_key;
	     ELSEIF key_cnt = 25 THEN
	        SET key25 = curr_key;
	     ELSEIF key_cnt = 26 THEN
	        SET key26 = curr_key;
	     ELSEIF key_cnt = 27 THEN
	        SET key27 = curr_key;
	     ELSEIF key_cnt = 28 THEN
	        SET key28 = curr_key;
	     ELSEIF key_cnt = 29 THEN
	        SET key29 = curr_key;
	     ELSEIF key_cnt = 30 THEN
	        SET key30 = curr_key;
	     ELSEIF key_cnt = 31 THEN
	        SET key31 = curr_key;
	     ELSEIF key_cnt = 32 THEN
	        SET key32 = curr_key;
	     ELSEIF key_cnt = 33 THEN
	        SET key33 = curr_key;
	     ELSEIF key_cnt = 34 THEN
	        SET key34 = curr_key;
	     ELSEIF key_cnt = 35 THEN
	        SET key35 = curr_key;
	     ELSEIF key_cnt = 36 THEN
	        SET key36 = curr_key;
	     ELSEIF key_cnt = 37 THEN
	        SET key37 = curr_key;
	     ELSEIF key_cnt = 38 THEN
	        SET key38 = curr_key;
	     ELSEIF key_cnt = 39 THEN
	        SET key39 = curr_key;
	     ELSEIF key_cnt = 40 THEN
	        SET key40 = curr_key;
	     ELSEIF key_cnt = 41 THEN
	        SET key41 = curr_key;
	     ELSEIF key_cnt = 42 THEN
	        SET key42 = curr_key;
	     ELSEIF key_cnt = 43 THEN
	        SET key43 = curr_key;
	     ELSEIF key_cnt = 44 THEN
	        SET key44 = curr_key;
	     ELSEIF key_cnt = 45 THEN
	        SET key45 = curr_key;
	     ELSEIF key_cnt = 46 THEN
	        SET key46 = curr_key;
	     ELSEIF key_cnt = 47 THEN
	        SET key47 = curr_key;
	     ELSEIF key_cnt = 48 THEN
	        SET key48 = curr_key;
	     ELSEIF key_cnt = 49 THEN
	        SET key49 = curr_key;
	     ELSEIF key_cnt = 50 THEN
	        SET key50 = curr_key;
	     ELSEIF key_cnt = 51 THEN
	        SET key51 = curr_key;
	     ELSEIF key_cnt = 52 THEN
	        SET key52 = curr_key;
	     ELSEIF key_cnt = 53 THEN
	        SET key53 = curr_key;
	     ELSEIF key_cnt = 54 THEN
	        SET key54 = curr_key;
	     ELSEIF key_cnt = 55 THEN
	        SET key55 = curr_key;
	     ELSEIF key_cnt = 56 THEN
	        SET key56 = curr_key;
	     ELSEIF key_cnt = 57 THEN
	        SET key57 = curr_key;
	     ELSEIF key_cnt = 58 THEN
	        SET key58 = curr_key;
	     ELSEIF key_cnt = 59 THEN
	        SET key59 = curr_key;
	     ELSEIF key_cnt = 60 THEN
	        SET key60 = curr_key;
	     ELSEIF key_cnt = 61 THEN
	        SET key61 = curr_key;
	     ELSEIF key_cnt = 62 THEN
	        SET key62 = curr_key;
	     ELSEIF key_cnt = 63 THEN
	        SET key63 = curr_key;
	     ELSEIF key_cnt = 64 THEN
	        SET key64 = curr_key;
	     ELSEIF key_cnt = 65 THEN
	        SET key65 = curr_key;
	     ELSEIF key_cnt = 66 THEN
	        SET key66 = curr_key;
	     ELSEIF key_cnt = 67 THEN
	        SET key67 = curr_key;
	     ELSEIF key_cnt = 68 THEN
	        SET key68 = curr_key;
	     ELSEIF key_cnt = 69 THEN
	        SET key69 = curr_key;
	     ELSEIF key_cnt = 70 THEN
	        SET key70 = curr_key;
	     ELSEIF key_cnt = 71 THEN
	        SET key71 = curr_key;
	     ELSEIF key_cnt = 72 THEN
	        SET key72 = curr_key;
	     ELSEIF key_cnt = 73 THEN
	        SET key73 = curr_key;
	     ELSEIF key_cnt = 74 THEN
	        SET key74 = curr_key;
	     ELSEIF key_cnt = 75 THEN
	        SET key75 = curr_key;
	     ELSEIF key_cnt = 76 THEN
	        SET key76 = curr_key;
	     ELSEIF key_cnt = 77 THEN
	        SET key77 = curr_key;
	     ELSEIF key_cnt = 78 THEN
	        SET key78 = curr_key;
	     ELSEIF key_cnt = 79 THEN
	        SET key79 = curr_key;
	     ELSEIF key_cnt = 80 THEN
	        SET key80 = curr_key;
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
   		EXECUTE s1 USING key1;
	 ELSEIF key_cnt = 2 THEN
   		EXECUTE s1 USING key1,key2;
	 ELSEIF key_cnt = 3 THEN
   		EXECUTE s1 USING key1,key2,key3;
	 ELSEIF key_cnt = 4 THEN
   		EXECUTE s1 USING key1,key2,key3,key4;
	 ELSEIF key_cnt = 5 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5;
	 ELSEIF key_cnt = 6 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6;
	 ELSEIF key_cnt = 7 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7;
	 ELSEIF key_cnt = 8 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8;
	 ELSEIF key_cnt = 9 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9;
	 ELSEIF key_cnt = 10 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;
   ELSEIF key_cnt = 11 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11;
	 ELSEIF key_cnt = 12 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12;
	 ELSEIF key_cnt = 13 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13;
	 ELSEIF key_cnt = 14 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14;
	 ELSEIF key_cnt = 15 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15;
	 ELSEIF key_cnt = 16 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16;
	 ELSEIF key_cnt = 17 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17;
	 ELSEIF key_cnt = 18 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18;
	 ELSEIF key_cnt = 19 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19;
	 ELSEIF key_cnt = 20 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20;
   ELSEIF key_cnt = 21 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21;
	 ELSEIF key_cnt = 22 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22;
	 ELSEIF key_cnt = 23 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23;
	 ELSEIF key_cnt = 24 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24;
	 ELSEIF key_cnt = 25 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25;
	 ELSEIF key_cnt = 26 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26;
	 ELSEIF key_cnt = 27 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27;
	 ELSEIF key_cnt = 28 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28;
	 ELSEIF key_cnt = 29 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29;
	 ELSEIF key_cnt = 30 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30;
   ELSEIF key_cnt = 31 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31;
	 ELSEIF key_cnt = 32 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32;
	 ELSEIF key_cnt = 33 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33;
	 ELSEIF key_cnt = 34 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34;
	 ELSEIF key_cnt = 35 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35;
	 ELSEIF key_cnt = 36 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36;
	 ELSEIF key_cnt = 37 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37;
	 ELSEIF key_cnt = 38 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38;
	 ELSEIF key_cnt = 39 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39;
	 ELSEIF key_cnt = 40 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40;
   ELSEIF key_cnt = 41 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41;                                                      
	 ELSEIF key_cnt = 42 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42;                                                
	 ELSEIF key_cnt = 43 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43;                                          
	 ELSEIF key_cnt = 44 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44;                                    
	 ELSEIF key_cnt = 45 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45;                              
	 ELSEIF key_cnt = 46 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46;                        
	 ELSEIF key_cnt = 47 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47;                  
	 ELSEIF key_cnt = 48 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48;            
	 ELSEIF key_cnt = 49 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49;      
	 ELSEIF key_cnt = 50 THEN                                                                                                                                                                                                                                                                                               
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50;
   ELSEIF key_cnt = 51 THEN                                                                                                                                                                                                                                  
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51;                                                      
	 ELSEIF key_cnt = 52 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52;                                                
	 ELSEIF key_cnt = 53 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53;                                          
	 ELSEIF key_cnt = 54 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54;                                    
	 ELSEIF key_cnt = 55 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55;                              
	 ELSEIF key_cnt = 56 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56;                        
	 ELSEIF key_cnt = 57 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57;                  
	 ELSEIF key_cnt = 58 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58;            
	 ELSEIF key_cnt = 59 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59;      
	 ELSEIF key_cnt = 60 THEN                                                                                                                                                                                                                                                                                                                                                           
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60;
   ELSEIF key_cnt = 61 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61;                                                      
	 ELSEIF key_cnt = 62 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62;                                                
	 ELSEIF key_cnt = 63 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63;                                          
	 ELSEIF key_cnt = 64 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64;                                    
	 ELSEIF key_cnt = 65 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65;                              
	 ELSEIF key_cnt = 66 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66;                        
	 ELSEIF key_cnt = 67 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67;                  
	 ELSEIF key_cnt = 68 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68;            
	 ELSEIF key_cnt = 69 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69;      
	 ELSEIF key_cnt = 70 THEN                                                                                                                                                                                                                                                                                                                                                                                                                       
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70;
   ELSEIF key_cnt = 71 THEN
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71;                                                      
	 ELSEIF key_cnt = 72 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72;                                                
	 ELSEIF key_cnt = 73 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73;                                          
	 ELSEIF key_cnt = 74 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74;                                    
	 ELSEIF key_cnt = 75 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75;                              
	 ELSEIF key_cnt = 76 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76;                        
	 ELSEIF key_cnt = 77 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77;                  
	 ELSEIF key_cnt = 78 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78;            
	 ELSEIF key_cnt = 79 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78,key79;      
	 ELSEIF key_cnt = 80 THEN                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
   		EXECUTE s1 USING key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40,key41,key42,key43,key44,key45,key46,key47,key48,key49,key50,key51,key52,key53,key54,key55,key56,key57,key58,key59,key60,key61,key62,key63,key64,key65,key66,key67,key68,key69,key70,key71,key72,key73,key74,key75,key76,key77,key78,key79,key80;
    -- ELSE 
       
   END IF;
   
   get diagnostics exe_cnt = ROW_COUNT;
   SET count = exe_cnt;
END!
