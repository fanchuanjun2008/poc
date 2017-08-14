
-- Create table
create table DEMO_KHXX
(
  khbh    VARCHAR2(10),
  khmc    VARCHAR2(200),
  kyzt    CHAR(1),
  ts      DATE,
  id_khxx VARCHAR2(36)
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
  
  --创建按店放单客户查询视图
 CREATE OR REPLACE VIEW khxx as
select *
  from demo_khxx k
  left join (select sum(zdsl) as totalzdsl, zddwbm
               from demo_bdxx
              group by zddwbm) zdsl
    on k.id_khxx = zdsl.zddwbm where totalzdsl is not null 
  
  

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
insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302060001', '浙北仑区店', '1', null, '9ab3810b-751c-47c1-a5fc-83141f063165');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302060003', '浙北仑区店中心门市', '1', null, '4272f7ce-1726-42b0-a076-2dd96f1636ca');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302110001', '浙镇海区店', '1', null, 'f07361b3-7a3a-4daf-8a23-17e45d5827c3');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302270001', '浙鄞州区店', '1', null, '1655d86f-238d-45ab-ad78-4b8f5508a5ed');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302270002', '浙鄞州区店鄞州书城', '1', null, 'a14eeb80-e7d6-494a-bf28-6c2c2734ef2d');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302270005', '浙鄞州区店石碶门店', '1', null, '619bb4cc-17a8-4cca-974c-6200d9f501c1');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302810003', '浙余姚市店余姚书城', '1', null, 'b10b01cd-ae2d-4c4a-91de-16460d82b978');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302810004', '浙余姚市店泗门书城', '1', null, '958c5123-c875-4104-9aae-6b4988c22936');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302820003', '浙慈溪市店慈溪书城', '1', null, 'f745fa10-c15d-4fbf-b3fa-751cf900ae36');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302820005', '浙慈溪市店观海卫门市', '1', null, '0a884e09-e514-4bba-9263-3c692de69dcf');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3302830001', '浙宁波市奉化区店', '1', null, 'a34ab5a3-f3a0-4496-a0c9-67a81b8026f5');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3303000001', '浙温州市店', '1', null, '7ea0ecf9-e542-436e-82c9-8a82aead52b5');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3303270001', '浙苍南县店', '1', null, '863ffb44-c52a-4627-ac2a-ce62099b864c');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3303810001', '浙瑞安市店', '1', null, 'e096f377-6b67-46e2-9646-cd6e65ca3507');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3303810003', '浙瑞安市店瑞安书城', '1', null, '4a3f4aa4-9998-4276-bb63-1a5dbaa29e25');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3303820001', '浙乐清市店', '1', null, '90ad3cb2-7f4b-41ea-ad8e-f00471a8e163');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3304240004', '海盐书城', '1', null, '8d3702e7-3b0e-45f8-8a8f-f7f3c09657ad');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3304810001', '浙海宁市店', '1', null, 'e73db576-63e1-48b6-8d58-adbda78348f4');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3304810002', '浙海宁市店长安门市部', '1', null, 'd364b436-1fc1-44f7-905b-468fadf94133');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3304810004', '浙海宁市店购书中心', '1', null, '96f701d4-1cb6-4211-9f60-9b007bd73964');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3305000001', '浙湖州市店', '1', null, '1af255a9-a371-4a69-b65c-9fad91475118');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3305000002', '浙湖州市南浔店', '1', null, 'f1fb28fe-c6cf-4cb8-bfb6-fa83e3d20c0b');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3305210001', '浙德清县店', '1', null, '654e099f-c4d7-4851-9968-51e515d42ce0');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3305210006', '浙德清县店中心门市', '1', null, '6cb6a518-aeeb-462c-acba-b60f3a5c9158');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3306000001', '浙绍兴市店', '1', null, '034cb439-adf8-4577-bbac-c2e91a5fa548');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3306000004', '浙绍兴市店迪荡书城', '1', null, '048c71eb-1ddd-482c-a286-f519e2ce300b');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3306210001', '浙柯桥店', '1', null, '6eb2b3db-1e71-42a2-8b4c-ccc35d76962e');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3306830001', '浙嵊州市店', '1', null, '9e2175e7-47af-46fe-aab9-2cf71cc60f2d');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3307830001', '浙东阳市店', '1', null, 'f060a036-168a-496d-8241-c24f007eaf56');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3307830003', '浙东阳市店中心门市', '1', null, '981d4fbd-86e0-41f1-a9c3-284b68fc156a');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3307840001', '浙永康市店', '1', null, '4ad0e474-dfbe-4e06-a43d-5d455d054662');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3308000003', '浙衢州市店西区书城', '1', null, '1303d63c-8b27-46e7-9658-82b6dc26a68a');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3308220001', '浙常山县店', '1', null, 'd1602118-6d7f-4587-a7c5-10cfe20b5b6e');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3308810001', '浙江山市店', '1', null, '6543925f-eaee-4d0b-8965-ce7352b0e6b4');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3309000001', '浙舟山市店', '1', null, '18478144-5208-4363-ae45-25401126a942');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3309000003', '舟山书城', '1', null, '8897f119-9d9f-47bd-ad38-3907ae9f6ce8');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3310000005', '浙台州开发区书店（台州书城）', '1', null, '4440450a-c66d-4265-b385-681a2b0b9908');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3310230001', '浙天台县店', '1', null, '7e721624-c9e7-44fc-960a-a4a72a12819f');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3310240001', '浙仙居县店', '1', null, 'd7b9296e-e40c-4ef1-9966-5fd3b031707c');

insert into demo_khxx (KHBH, KHMC, KYZT, TS, ID_KHXX)
values ('3325270001', '浙遂昌县店', '1', null, 'c4aeb31a-9449-4197-b610-78808309e975');





