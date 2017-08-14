-- Create table
create table DEMO_FHB
(
  ywbm   VARCHAR2(2),
  zddwbm VARCHAR2(36),
  zddh   VARCHAR2(10),
  pzbm   VARCHAR2(36),
  fhsl   NUMBER(6),
  fhzk   NUMBER(8,4),
  fdrq   DATE,
  fdr    VARCHAR2(10),
  clzt   CHAR(1) default 'b',
  bz     VARCHAR2(200),
  ts     DATE,
  id_fhb VARCHAR2(36)
);
-- Add comments to the columns 
comment on column DEMO_FHB.ywbm
  is '业务部门';
comment on column DEMO_FHB.zddwbm
  is '征订单位编码';
comment on column DEMO_FHB.zddh
  is '征订单号';
comment on column DEMO_FHB.pzbm
  is '品种编码';
comment on column DEMO_FHB.fhsl
  is '发货数量';
comment on column DEMO_FHB.fhzk
  is '发货折扣';
comment on column DEMO_FHB.fdrq
  is '放单日期';
comment on column DEMO_FHB.fdr
  is '放单人';
comment on column DEMO_FHB.clzt
  is '处理日期 ';
comment on column DEMO_FHB.bz
  is '备注';
comment on column DEMO_FHB.ts
  is 'TS时间戳';
comment on column DEMO_FHB.id_fhb
  is '发货单主键';
