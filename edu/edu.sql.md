
# member

```
create table member (
	id bigint unsigned not null auto_increment,
	openid varchar(64) not null,
	mobile varchar(16) not null,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

# answer_record

```
create table order_record (
	id bigint unsigned not null auto_increment,
	member_id bigint unsigned not null,
	type tinyint not null comment '0:order,1:suite,2:wrong',
	result tinyint not null comment '0:void,1:incertitude,2:bingo,3:wrong,4:part',
	suite_id bigint unsigned not null,
	question_id bigint unsigned not null,
	answers json,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

# subject

```
create table subject (
	id int unsigned not null auto_increment,
	name varchar(8) not null,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id),
	unique index s_name(name)
) engine=innodb default charset=utf8;
```


# suite

```
create table suite (
	id bigint unsigned not null auto_increment,
	title varchar(32) not null,
	subject_id int not null,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id),
	unique index sub_title(subject_id, title)
) engine=innodb default charset=utf8;
```

# question

```
create table question (
	id bigint unsigned not null auto_increment,
	sort int not null,
	title varchar(128) not null,
	type tinyint not null comment '0:single,1:multi,2:solve,3:other',
	suite_id bigint not null,
	subject_id bigint not null,
	options json,
	answers json,
	description varchar(128),
	images json,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

