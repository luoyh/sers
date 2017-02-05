
# sys

```
drop table if exists sys;
create table sys (
	id int not null auto_increment,
	sys_key varchar(32) not null,
	sys_value varchar(128) not null,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id),
	unique index s_key(sys_key)
) engine=innodb default charset=utf8;
```

# member

```
drop table if exists member;
create table member (
	id bigint not null auto_increment,
	openid varchar(64) not null,
	mobile varchar(16) not null,
	name varchar(12) not null,
	age tinyint(4) not null,
	school varchar(20) not null,
	sex tinyint(2) not null default 0 comment '0:secret,1:male,2:female',
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

# drill_record

```
drop table if exists drill_record;
create table drill_record (
	id bigint  not null auto_increment,
	member_id bigint  not null,
	type tinyint not null comment '0:order,1:suite,2:wrong',
	result tinyint not null comment '0:void,1:incertitude,2:bingo,3:wrong,4:part',
	suite_id bigint  not null,
	question_id bigint  not null,
	answers json,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

# drill_result

```
drop table if exists drill_result;
create table drill_result (
	id bigint not null auto_increment,
	member_id bigint not null,
	subject_id bigint not null,
	type int not null comment '-3:suite,-2:suite order,-1:all,0:single,1:multi,2:solve,3:other',
	target_id bigint null comment 'drill order is question(type!=-3) other is suite(type=-3)',
	score int not null,
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
)engine=innodb default charset=utf8;
```

# subject

```
drop table if exists subject;
create table subject (
	id bigint not null auto_increment,
	name varchar(8) not null comment '科目名称',
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id),
	unique index s_name(name)
) engine=innodb default charset=utf8;
```


# suite

```
drop table if exists suite;
create table suite (
	id bigint not null auto_increment,
	title varchar(32) not null comment '试卷标题',
	years int not null comment '试卷年份，4位',
	months int not null comment '试卷月份',
	subject_id int not null comment '所属科目',
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id),
	unique index sub_title(subject_id, title)
) engine=innodb default charset=utf8;
```

# question

```
drop table if exists question;
create table question (
	id bigint  not null auto_increment,
	sort int not null comment '题目排序，也就是题目编号',
	title varchar(128) not null comment '题目标题',
	type tinyint not null comment '0:single,1:multi,2:solve,3:other',
	suite_id bigint not null comment '试卷id',
	subject_id bigint not null comment '科目id',
	score int not null comment '题目分数',
	options json comment '题目选项',
	answers json comment '题目答案，当为选择题时为数组',
	description varchar(128) comment '题目说明',
	images json comment '题目图片，数组',
	ass_images json comment '题目解答图片，数组',
	gmt_created datetime not null,
	gmt_modified datetime not null,
	primary key(id)
) engine=innodb default charset=utf8;
```

