--DB2/UDB 9.1

create table cd_typetb(
	col_varchar   varchar(10)  not null primary key,
	col_character character(10),
	col_smallint  smallint,
	col_integer   integer,
	col_double    double,
	col_decimal   decimal(4,2),
	col_date      date,
	col_time      time,
	col_timestamp timestamp
);

create table cd_prodtb(
	id            character(5)  not null primary key,
	name          varchar(10),
	amt_integer   integer,
	amt_double    double,
	amt_decimal   decimal(10,2),
	reg_date      date,
	reg_time      time,
	reg_timestamp timestamp
);

create table cd_itemtb(
	fk_id       character(5) not null,
	item_code   charater(5) not null,
	item_value  varchar(50),
	primary key (fk_id,item_code),
	FOREIGN KEY(fk_id)  REFERENCES  cd_prodtb(id)
);

create table cd_itemconttb(
	fk_id          character(5) not null,
	fk_item_code   charater(5) not null,
	seq_num        integer not null,
	contents       varchar(100),
	primary key    (fk_id,fk_item_code,seq_num),
	FOREIGN KEY(fk_id,fk_item_code)  REFERENCES  cd_itemtb(fk_id,item_code)
);

--insert into cddb2tb
--values('0123456789','01234567',1,1,1.11,1.11,current_date,current_time,current_timestamp);
