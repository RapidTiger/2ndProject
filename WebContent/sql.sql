
drop table mac_member cascade CONSTRAINTS;
drop table mac_friend cascade CONSTRAINTS;
drop table mac_restaurent cascade CONSTRAINTS;
drop table mac_entertainment cascade CONSTRAINTS;
drop table mac_cafe cascade CONSTRAINTS;
drop table mac_complain cascade CONSTRAINTS;
drop table mac_plan cascade CONSTRAINTS;

delete from mac_plan where name = '����Ŀ��';

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
'smart1','123456','�ڿ���','���ֱ����� �����374 �λ��������Ʈ','101','smart1',10,10,5
);

insert into mac_member values(
'smart2','123456','������','����','��-ȣ','smart2',10,5,10
);

insert into mac_member values(
'smart3','123456','���ȣ','���ֱ����� �󹫰�����114','��-ȣ','smart3',10,10,8
);

insert into mac_member values(
'smart4','123456','�絿��','���� ȭ���� ������ 155','��-ȣ','smart4',10,10,10
);

insert into mac_member values(
'smart5','123456','����ȣ','���ֱ����� �ξϵ�','��-ȣ','smart5',5,10,5
);


insert into mac_friend(id,friend_id,friend_name)values(
	'smart1','smart3','���ȣ'

);

insert into mac_friend(id,friend_id,friend_name)values(
	'smart3','smart1','�ڿ���'

);
insert into mac_friend(id,friend_id,friend_name) values(
	'smart2','smart5','����ȣ'

);
insert into mac_friend(id,friend_id,friend_name)values(
	'smart5','smart2','������'

);
insert into mac_friend(id,friend_id,friend_name)values(
	'smart4','smart5','����ȣ'

);


insert into mac_restaurent values(

'ĳ���Ĵ�',4.38,'���� ���� ���߷�46���� 10',35.1386211225234,126.914777982131,'�ѽ�'


);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'������',4.36,'���� ���� ���߷�46���� 3-8',35.1391297558474,126.91451421161,'�ƽþ�����'

);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'�����',4.44,'���� ���� �縲�� 77 � � ���',35.1380853335459,126.917221191818,'������'

);

insert into mac_restaurent(name,naver_score,address,location_Latitude,location_longitude,category)values(

'�縲����',4.44,'���� ���� �鼭�� 93-1',35.140726122245,126.916139200615,'�ܹ���'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'�������γ뷡������',0.0,'���� ���� ��û��56���� 8 ���� 1�� ������γ뷡������',35.1532792040005,126.852731376864,'�뷡��'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'���θ��� ���γ뷡������ ���ּ�����',0.0,'���� ���걸 �ӹ����332���� 9-18 4�� ���θ��� ���ּ�����',35.1900155400036,126.825899345851,'�뷡��'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'�������γ뷡������',0.0,'���� ���� ��û��56���� 18 �������ֹ� ����1��',35.1532788567819,126.853859039694,'�뷡��'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(

'������ͳݳ뷡������',0.0,'���� �ϱ� �Ȼ�� 40',35.1909007106333,126.902222725777,'�뷡��'

);

insert into mac_entertainment

(name,naver_score,address,location_Latitude,location_longitude,category)values(
'�������γ뷡������',0.0,'���� ���걸 �ӹ����332���� 9-4',35.1900245538804,126.824650050853,'�뷡��'


);


insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'���ÿ����
',4.27
,'���� ���� �󹫴�� 718
',35.14338632
,126.8427554
,5,10,5

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'���񿡸�������
',4.38
,'���� ���� ǳ���߾ӷ� 37
',35.12510467
,126.8784631
,10,5,10

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'�극�弼�� ����
',4.28
,'���� ���� �������� 179
',35.15198183
,126.8538853
,5,10,5

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'�̵���',4.6,'���� ���� ��õ��172���� 4 2��',35.14779084
,126.8570383
,10,5,10

);



insert into mac_cafe

(name,naver_score,address,location_Latitude,location_longitude,favor,mood,convenience)values(

'Hello L',4.02,'���� ���� �󹫹��ַ�32���� 322',35.15432973
,126.8592432
,10,10,5

);

drop table mac_member cascade CONSTRAINTS;
drop table mac_friend cascade CONSTRAINTS;
drop table mac_restaurent cascade CONSTRAINTS;
drop table mac_entertainment cascade CONSTRAINTS;
drop table mac_cafe cascade CONSTRAINTS;
drop table mac_complain cascade CONSTRAINTS;
