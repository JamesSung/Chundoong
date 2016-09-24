--Oracle Database 10g Enterprise Edition Release 10.2.0.4.0 - 64bi

create table cd_typetb(
	col_varchar   varchar2(10)  not null primary key,
	col_character character(10),
	col_smallint  smallint,
	col_integer   integer,
	col_double    number(10,2),
	col_decimal   number(10,2),
	col_date      date,
	col_time      date,
	col_timestamp timestamp
);

create table cd_prodtb(
	id            character(5)  not null primary key,
	name          varchar2(10),
	amt_integer   integer,
	amt_double    number(10,2),
	amt_decimal   number(10,2),
	reg_date      date,
	reg_time      date,
	reg_timestamp timestamp
);

create table cd_itemtb(
	fk_id       character(5) not null,
	item_code   character(5) not null,
	item_value  varchar2(50),
	primary key (fk_id,item_code),
	FOREIGN KEY(fk_id)  REFERENCES  cd_prodtb(id)
);

create table cd_itemconttb(
	fk_id          character(5) not null,
	fk_item_code   character(5) not null,
	seq_num        integer not null,
	contents       varchar2(100),
	primary key    (fk_id,fk_item_code,seq_num),
	FOREIGN KEY(fk_id,fk_item_code)  REFERENCES  cd_itemtb(fk_id,item_code)
);

--insert into CD_PRODTB
--values('P0001','prdnm1',1,1.11,1.11,current_date,current_date,current_timestamp);
