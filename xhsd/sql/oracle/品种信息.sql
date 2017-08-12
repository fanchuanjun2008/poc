        prompt Importing table demo_pzxx...
set feedback off
set define off
insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('1606221', '9787534256295', '鸟奴/动物小说大王沈石溪品藏书系', 17.0000, to_date('01-10-2009', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), '27a66a9e-8a78-451f-bc30-9424f78c6c0f', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('1918367', '9787533885625', '益智游戏(上新编学前班综合教育儿童用书)', 4.3000, to_date('01-07-2010', 'dd-mm-yyyy'), to_date('01-05-2011', 'dd-mm-yyyy'), '640c58a2-5b6c-452d-87c9-fce2c7b49a27', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('2465240', '9787534272912', '十万个为什么(生命与常识幼儿版)/好宝宝最爱问的小问号', 15.0000, to_date('01-02-2013', 'dd-mm-yyyy'), to_date('01-02-2013', 'dd-mm-yyyy'), 'f7a58c35-23d5-4d8f-8cf2-2c223b003317', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('2574319', '9787552600483', '科学(小升初)/暑假衔接', 15.0000, to_date('01-05-2013', 'dd-mm-yyyy'), to_date('01-04-2016', 'dd-mm-yyyy'), '2150a999-0b90-47f4-bf3c-57f060b35c6f', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3075260', '9787308111119', '科学/小升初衔接教程', 15.0000, to_date('01-04-2013', 'dd-mm-yyyy'), to_date('01-05-2013', 'dd-mm-yyyy'), 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3101654', '9787533941321', '琦君散文(粽子里的乡愁名家散文典藏)', 26.0000, to_date('01-01-2015', 'dd-mm-yyyy'), to_date('01-01-2015', 'dd-mm-yyyy'), 'a924d911-fa0e-46e6-aa47-2c950ffdf244', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3153360', '9787534279874', '2年级问题多/君伟上小学', 13.0000, to_date('01-03-2014', 'dd-mm-yyyy'), to_date('01-03-2015', 'dd-mm-yyyy'), 'bd77b4ea-0daf-4e2c-803b-12e9a4b752f1', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3592787', '9787517810698', '数字图书馆特色资源共享与服务研究', 48.0000, to_date('01-05-2015', 'dd-mm-yyyy'), to_date('01-06-2016', 'dd-mm-yyyy'), '849bfe12-b9bd-487a-a71b-0f8bcb8c593c', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3707779', '9787213074332', '维修中的托马斯/托马斯和朋友益智大拼图', 22.8000, to_date('01-07-2016', 'dd-mm-yyyy'), to_date('01-07-2016', 'dd-mm-yyyy'), '5e86fd0e-304c-4dc2-b086-1436113d9434', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3833604', '9787534031335', '智慧七巧板(2岁升级版)/多湖辉新头脑开发丛书', 19.8000, to_date('01-04-2017', 'dd-mm-yyyy'), to_date('01-04-2017', 'dd-mm-yyyy'), '3283c8b3-c542-4781-9bb7-8b06ae138f33', null);

insert into demo_pzxx (PZBM, ISBN, SM, DJ, CBRQ, YSNY, ID_PZXX, TS)
values ('3852451', '9787534045929', '推理(5岁)/头脑开发丛书', 19.8000, to_date('01-05-2017', 'dd-mm-yyyy'), to_date('01-05-2017', 'dd-mm-yyyy'), 'dbbe535f-1362-4523-9877-97c3d216f1d0', null);

prompt Done.


-- Create table
create table DEMO_PZXX
(
  pzbm    VARCHAR2(10),
  isbn    VARCHAR2(20),
  sm      VARCHAR2(200),
  dj      NUMBER(7,4),
  cbrq    DATE,
  ysny    DATE,
  id_pzxx VARCHAR2(36),
  ts      DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column DEMO_PZXX.pzbm
  is '品种编码';
comment on column DEMO_PZXX.isbn
  is 'ISBN';
comment on column DEMO_PZXX.sm
  is '书名';
comment on column DEMO_PZXX.dj
  is '定价';
comment on column DEMO_PZXX.cbrq
  is '出版日期';
comment on column DEMO_PZXX.ysny
  is '印刷年月';
comment on column DEMO_PZXX.id_pzxx
  is '品种信息主键';
comment on column DEMO_PZXX.ts
  is 'ts时间戳';

