
drop table mac_member cascade CONSTRAINTS;
drop table mac_friend cascade CONSTRAINTS;
drop table mac_restaurent cascade CONSTRAINTS;
drop table mac_entertainment cascade CONSTRAINTS;
drop table mac_cafe cascade CONSTRAINTS;
drop table mac_complain cascade CONSTRAINTS;
drop table mac_plan cascade CONSTRAINTS;

delete from mac_plan where name = '육각커피';

select * from mac_member;
select * from mac_friend;
select * from mac_restaurent;
select * from mac_entertainment;
select * from mac_cafe;
select * from mac_complain;
select * from mac_plan;

select * from mac_plan where TO_DATE(plan_date, 'YYYY/MM/DD') >= SYSDATE-1 and id = 'smart1' order by plan_date,plan_time

CREATE TABLE mac_member(
   id varchar2(50),
   pw varchar2(50) not null,
   name varchar2(50) not null,
   address varchar2(500) not null,
   addr_detail varchar2(100),
   instar_id varchar2(50), 
   favor number,
   mood number,
   convenience number,
   constraint mac_mem_id_pk primary key (id)
);


CREATE TABLE mac_friend(
   id varchar2(50),
   friend_id varchar2(50),
   friend_name varchar2(50)
);


CREATE TABLE mac_restaurent(
   name varchar2(100),
   naver_score number,
   address varchar2(500) not null,
   location_Latitude number(17,15) not null,
   location_longitude number(18,15) not null,
   category varchar2(100) not null
);


CREATE TABLE mac_entertainment(
   name varchar2(100),
   address varchar2(500) not null,
   location_Latitude number(17,15) not null,
   location_longitude number(18,15) not null,
   category varchar2(100) not null
);


CREATE TABLE mac_cafe(
   name varchar2(100),
   naver_score number,
   address varchar2(500) not null,
   location_Latitude number(17,15) not null,
   location_longitude number(18,15) not null,
   favor number,
   mood number,
   convenience number,
   category varchar2(100),
   constraint mac_cafe_addr_pk
   primary key(address)
);


CREATE TABLE mac_complain(
   id varchar2(50),
   title varchar2(500) not null,
   content varchar2(2000) not null,
   constraint mac_complain_id_pk primary key (id),
      constraint mac_complain_id_fk foreign key (id)
      references mac_member (id)
);

CREATE TABLE mac_plan(
	id varchar2(50),
	plan_date varchar2(20),
	plan_time varchar2(20),
	name varchar2(100),
	address varchar2(500),
	lat number(17,15),
	lng number(18,15)
);

insert into mac_member values(
'smart1','123456','박예찬','광주광역시 무등로374 두산위브아파트','101','smart1',10,10,5
);

insert into mac_member values(
'smart2','123456','주지성','북한','동-호','smart2',10,5,10
);

insert into mac_member values(
'smart3','123456','김민호','광주광역시 상무공원로114','동-호','smart3',10,10,8
);

insert into mac_member values(
'smart4','123456','양동혁','전남 화순군 광덕로 155','동-호','smart4',10,10,10
);

insert into mac_member values(
'smart5','123456','유준호','광주광역시 두암동','동-호','smart5',5,10,5
);


insert into mac_friend(id,friend_id,friend_name)values(
	'smart1','smart3','김민호'

);

insert into mac_friend(id,friend_id,friend_name)values(
	'smart3','smart1','박예찬'

);
insert into mac_friend(id,friend_id,friend_name) values(
	'smart2','smart5','유준호'

);
insert into mac_friend(id,friend_id,friend_name)values(
	'smart5','smart2','주지성'

);
insert into mac_friend(id,friend_id,friend_name)values(
	'smart4','smart5','유준호'

);


insert into mac_restaurent values(

'캐쥬얼식당',4.38,'광주 남구 제중로46번길 10',35.1386211225234,126.914777982131,'한식'


);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'무드장',4.36,'광주 남구 제중로46번길 3-8',35.1391297558474,126.91451421161,'아시아음식'

);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'까스까스돈까스',4.44,'광주 남구 양림로 77 까스 까스 돈까스',35.1380853335459,126.917221191818,'돈가스'

);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'양림버거',4.44,'광주 남구 백서로 93-1',35.140726122245,126.916139200615,'햄버거'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'세븐코인노래연습장',0.0,'광주 서구 시청로56번길 8 지하 1층 쎄븐코인노래연습장',35.1532792040005,126.852731376864,'노래방'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'코인몬스터 코인노래연습장 광주수완점',0.0,'광주 광산구 임방울대로332번길 9-18 4층 코인몬스터 광주수완점',35.1900155400036,126.825899345851,'노래방'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'더힐코인노래연습장',0.0,'광주 서구 시청로56번길 18 볼륨소주방 지하1층',35.1532788567819,126.853859039694,'노래방'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'비바인터넷노래연습장',0.0,'광주 북구 안산로 40',35.1909007106333,126.902222725777,'노래방'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(
'필통코인노래연습장',0.0,'광주 광산구 임방울대로332번길 9-4',35.1900245538804,126.824650050853,'노래방'


);


insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'르시엘블루
',4.27
,'광주 서구 상무대로 718
',35.14338632
,126.8427554
,5,10,5

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'베비에르과자점
',4.38
,'광주 서구 풍암중앙로 37
',35.12510467
,126.8784631
,10,5,10

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'브레드세븐 상무점
',4.28
,'광주 서구 상무자유로 179
',35.15198183
,126.8538853
,5,10,5

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'미드픽',4.6,'광주 서구 운천로172번길 4 2층',35.14779084
,126.8570383
,10,5,10

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'Hello L',4.02,'광주 서구 상무민주로32번길 322',35.15432973
,126.8592432
,10,10,5

);

drop table mac_member cascade CONSTRAINTS;
drop table mac_friend cascade CONSTRAINTS;
drop table mac_restaurent cascade CONSTRAINTS;
drop table mac_entertainment cascade CONSTRAINTS;
drop table mac_cafe cascade CONSTRAINTS;
drop table mac_complain cascade CONSTRAINTS;
