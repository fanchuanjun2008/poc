
-- Create table
create table DEMO_BDXX
(
  ywbm    VARCHAR2(2),
  zddwbm  VARCHAR2(36),
  zddh    VARCHAR2(10),
  pzbm    VARCHAR2(36),
  zdsl    NUMBER(6),
  fhsl    NUMBER(6),
  fhzk    NUMBER(8,4),
  zkbj    CHAR(1),
  lrrq    DATE,
  clrq    DATE,
  bz      VARCHAR2(200),
  ts      DATE,
  id_bdxx VARCHAR2(36)
);
-- Add comments to the columns 
comment on column DEMO_BDXX.ywbm
  is '业务部门';
comment on column DEMO_BDXX.zddwbm
  is '征订单位编码';
comment on column DEMO_BDXX.zddh
  is '征订单号';
comment on column DEMO_BDXX.pzbm
  is '品种编码';
comment on column DEMO_BDXX.zdsl
  is '征订数量';
comment on column DEMO_BDXX.fhsl
  is '发货数量';
comment on column DEMO_BDXX.fhzk
  is '发货折扣';
comment on column DEMO_BDXX.zkbj
  is '折扣标识 0 顺加 1 固定';
comment on column DEMO_BDXX.lrrq
  is '录入日期';
comment on column DEMO_BDXX.clrq
  is '处理日期';
comment on column DEMO_BDXX.bz
  is '备注';
comment on column DEMO_BDXX.ts
  is 'TS时间戳';
comment on column DEMO_BDXX.id_bdxx
  is '报订单主键';
  
  
  --创建放单时的报订单数据视图
  
create or replace view bdxx as
select bd.ywbm,
       bd.zddwbm as zddwbm,
       bd.zddh,
       pz.id_pzxx as pzbm,
       bd.zdsl,
       '0' as fhsl,
       bd.zkbj,
       (case
         when bd.zkbj = '0' then
          bd.fhzk
         when bd.zkbj = '1' then
          (select kczk from demo_kcb kc where kc.pzbm = bd.pzbm) + bd.fhzk
       end) fhzk,
       bd.lrrq,
       bd.clrq,
       bd.ts,
       kc.kcsl,
       (case when yfsl is null then 0
             when yfsl is not null then yfsl
               end
       ) yfsl
  from demo_bdxx bd
  left join demo_khxx kh
    on bd.zddwbm = kh.id_khxx
  left join demo_pzxx pz
    on bd.pzbm = pz.id_pzxx
  left join demo_kcb kc
    on kc.pzbm = bd.pzbm
  left join (select sum(f.fhsl) as yfsl, b.zddh
               from demo_bdxx b
               left join demo_fhb f
                 on b.zddh = f.zddh
              group by b.zddh) a
    on a.zddh = bd.zddh;





-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3306000004', '3306000004', '3075260', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01270126', null, 'cb657bc7-5e7e-4f19-a781-df0ef6d89198');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3301270001', '3301270001', '3075260', 2, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01051886', null, '4a5d5aae-4be8-425e-a9d0-c623f346ba8c');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3309000003', '3309000003', '3852451', 3, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:03654389', null, 'bf4690f2-16bd-491d-ba3b-6a681dc219dc');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3309000001', '3309000001', '3852451', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:03654390', null, '9d96deeb-a292-45c5-87ef-7bc8e0ddf070');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3302110001', '3302110001', '3852451', 2, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:04179926', null, '1f992c47-ab77-44bc-ad91-15a94733136c');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3325270001', '3325270001', '3852451', 3, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:02042692', null, 'e251557d-741d-4767-8def-93da0ae896c6');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3307830003', '3307830003', '1918367', 2, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:02102266', null, '51dc86f3-a39d-42f9-89c3-4eaaf4d91002');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3303820001', '3303820001', '3075260', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01274531', null, '438fd7b5-3393-46ce-9e5f-237d6298dfa8');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3301270001', '3301270001', '3075260', 10, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01051888', null, '60ead6a7-6525-4d24-9e97-848d0b78ed2c');

-- insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
-- values ('01', '3301850004', '3301850004', '3075260', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:08186291', null, '46156ea9-26d4-435f-a1f1-e21ced0f2c66');

------------------------
------------------------
insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '048c71eb-1ddd-482c-a286-f519e2ce300b', '3306000004', 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01270126', null, 'cb657bc7-5e7e-4f19-a781-df0ef6d89198');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '151cca06-3460-4cec-baa7-4833ce129f95', '3301270001', 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', 2, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01051886', null, '4a5d5aae-4be8-425e-a9d0-c623f346ba8c');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '8897f119-9d9f-47bd-ad38-3907ae9f6ce8', '3309000003', 'dbbe535f-1362-4523-9877-97c3d216f1d0', 3, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:03654389', null, 'bf4690f2-16bd-491d-ba3b-6a681dc219dc');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '18478144-5208-4363-ae45-25401126a942', '3309000001', 'dbbe535f-1362-4523-9877-97c3d216f1d0', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:03654390', null, '9d96deeb-a292-45c5-87ef-7bc8e0ddf070');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', 'f07361b3-7a3a-4daf-8a23-17e45d5827c3', '3302110001', 'dbbe535f-1362-4523-9877-97c3d216f1d0', 2, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:04179926', null, '1f992c47-ab77-44bc-ad91-15a94733136c');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', 'c4aeb31a-9449-4197-b610-78808309e975', '3325270001', 'dbbe535f-1362-4523-9877-97c3d216f1d0', 3, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:02042692', null, 'e251557d-741d-4767-8def-93da0ae896c6');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '981d4fbd-86e0-41f1-a9c3-284b68fc156a', '3307830003', '640c58a2-5b6c-452d-87c9-fce2c7b49a27', 2, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:02102266', null, '51dc86f3-a39d-42f9-89c3-4eaaf4d91002');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '90ad3cb2-7f4b-41ea-ad8e-f00471a8e163', '3303820001', 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01274531', null, '438fd7b5-3393-46ce-9e5f-237d6298dfa8');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '151cca06-3460-4cec-baa7-4833ce129f95', '3301270001', 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', 10, 0, 6.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:01051888', null, '60ead6a7-6525-4d24-9e97-848d0b78ed2c');

insert into demo_bdxx (YWBM, ZDDWBM, ZDDH, PZBM, ZDSL, FHSL, FHZK, ZKBJ, LRRQ, CLRQ, BZ, TS, ID_BDXX)
values ('01', '0508174c-da03-4ea9-bb43-1a85ef89ba2c', '3301850004', 'd61aa8a5-c405-46a0-82ce-e3cb124a3ac9', 5, 0, 5.0000, '0', to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-06-2017 09:26:47', 'dd-mm-yyyy hh24:mi:ss'), '电子:08186291', null, '46156ea9-26d4-435f-a1f1-e21ced0f2c66');




