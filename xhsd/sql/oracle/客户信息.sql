prompt Importing table demo_khxx...
set feedback off
set define off
insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3300000011', '馆藏', '1', null, '192b9c02-8cf6-4ecb-bbe9-6d5ee7a23520');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301000002', '浙杭州市店解放路门市部', '1', null, '608428e4-a2a5-482f-8e2a-4c02f99ea050');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301000004', '浙杭州市店单位图供部', '1', null, 'cac61118-5b8f-4871-afc7-66563bbb5eaf');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301000010', '浙杭州市店湖墅门市部', '1', null, '4ef49af1-4b9d-40c3-8640-1a9624cec4a3');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301000013', '浙杭州市店丁桥店', '1', null, 'b96ba8d0-92d6-4003-8ab4-5d5ed875a3b7');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301000029', '浙杭州市店水晶城店', '1', null, 'a3064ff2-f243-48c5-8409-d75ac4a23a62');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301270001', '浙淳安县店', '1', null, '151cca06-3460-4cec-baa7-4833ce129f95');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301810002', '浙萧山区店瓜沥门市部', '1', null, 'ae1eabbb-7cda-4790-9f22-48ddfcf35b6b');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301810003', '浙萧山区店临浦门市部', '1', null, '0aa3a7bf-92ff-4ca2-af62-55200ab1287c');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301810006', '浙萧山区店新华大厦购书中心', '1', null, 'ba02ac8f-6709-4414-9441-83260ead5312');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301810009', '浙萧山区店萧山书城', '1', null, '68cec966-0d49-4626-be84-0aa37258ada8');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301810010', '浙萧山区店义蓬门市', '1', null, '13fe4d85-9db7-4005-b965-5d73725ae123');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301850001', '浙临安市店', '1', null, '43f318ea-9710-4649-8bb7-58388755698c');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3301850004', '浙临安市店临安书城', '1', null, '0508174c-da03-4ea9-bb43-1a85ef89ba2c');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302000006', '浙宁波市店中山东路文教科技门市部', '1', null, 'f2edeaae-8013-4a0f-bdef-331715b7db5a');

prompt Done.


-- Create table
create table DEMO_KHXX
(
  khbh    VARCHAR2(10),
  khmc    VARCHAR2(200),
  kyzt    CHAR(1),
  ts      DATE,
  id_khxx VARCHAR2(36)
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
comment on column DEMO_KHXX.khbh
  is '客户编号';
comment on column DEMO_KHXX.khmc
  is '客户名称';
comment on column DEMO_KHXX.kyzt
  is '可用标志 1 可用 0 不可用';
comment on column DEMO_KHXX.ts
  is 'TS时间戳';
comment on column DEMO_KHXX.id_khxx
  is '客户信息表主键';

