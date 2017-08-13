prompt Importing table demo_kcb...
set feedback off
set define off
insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '1606221', 1612.00, 60.0000, '0', null, '503d9b6b-1ccc-4b5c-bea1-ff7c889939ad');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '1918367', 2.00, 60.0000, '1', null, 'c42bf5d0-0210-4baf-a0b5-c03c75f7980b');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '2465240', 77.00, 55.0000, '0', null, '9584741d-543d-4c9b-a72a-ed26003396ba');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '2574319', 91.00, 50.0000, '1', null, 'ad7fbaa0-43e0-41f6-a4f4-b6a8b71de1a4');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3075260', 5.00, 60.0000, '0', null, '218a1644-3f9a-41d2-ad1f-108b3d706517');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3101654', 280.00, 60.0000, '0', null, 'fdbe21f6-37f8-4fff-85c3-d8a9f4f8f058');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3153360', 8.00, 50.0000, '0', null, '6479ad68-b145-4230-ba24-6f054b0b70fc');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3592787', 1.00, 60.0000, '0', null, '16b86683-fad5-45e8-a84a-3c6d6330b4fb');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3707779', 486.00, 55.0000, '0', null, 'c89c7d13-145c-4969-8bed-75240054bc21');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3833604', 2.00, 60.0000, '0', null, 'daf1b702-35bf-4da1-9367-5b6945f4a72c');

insert into demo_kcb (YWBM, PZBM, KCSL, KCZK, KCZT, TS, ID_KCB)
values ('01', '3852451', 10.00, 60.0000, '0', null, 'a1d3d99c-0704-4394-b7ce-22cf4ffe928d');

prompt Done.


-- Create table
create table DEMO_KCB
(
  ywbm   VARCHAR2(2),
  pzbm   VARCHAR2(10),
  kcsl   NUMBER(10,2),
  kczk   NUMBER(8,4),
  kczt   CHAR(1),
  ts     DATE,
  id_kcb VARCHAR2(36)
);
-- Add comments to the columns 
comment on column DEMO_KCB.ywbm
  is '业务部门';
comment on column DEMO_KCB.pzbm
  is '品种编码';
comment on column DEMO_KCB.kcsl
  is '库存数量';
comment on column DEMO_KCB.kczk
  is '库存折扣';
comment on column DEMO_KCB.kczt
  is '库存状态  1 锁定';
comment on column DEMO_KCB.ts
  is 'ts时间戳';
comment on column DEMO_KCB.id_kcb
  is '库存主键';

