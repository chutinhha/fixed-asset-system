-- Create table
create table ASSETREMOVEPLAN
(
  PLANID                NUMBER(10) not null,
  ASSETPARENTCATEGORYID VARCHAR2(40),
  ASSETCATEGORYID       VARCHAR2(40),
  STORAGEFLAG           NVARCHAR2(40),
  STORAGE               NVARCHAR2(40),
  PLANDATECYCLE         VARCHAR2(40),
  CREATEDDATE           DATE,
  STARTDATE             DATE,
  ENDDATE               DATE,
  PLANCATEGORY          NUMBER(8),
  ASSETCOUNT            NUMBER(8)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ASSETREMOVEPLAN
  is '拆机计划表';
-- Add comments to the columns 
comment on column ASSETREMOVEPLAN.PLANID
  is '计划编号';
comment on column ASSETREMOVEPLAN.ASSETPARENTCATEGORYID
  is '设备父类别';
comment on column ASSETREMOVEPLAN.ASSETCATEGORYID
  is '设备子类别';
comment on column ASSETREMOVEPLAN.STORAGEFLAG
  is '分公司、项目体标识';
comment on column ASSETREMOVEPLAN.STORAGE
  is '分公司、项目体ID';
comment on column ASSETREMOVEPLAN.PLANDATECYCLE
  is '时间段（如：周计划，20120723-20120729）';
comment on column ASSETREMOVEPLAN.CREATEDDATE
  is '创建时间';
comment on column ASSETREMOVEPLAN.STARTDATE
  is '开始日期';
comment on column ASSETREMOVEPLAN.ENDDATE
  is '结束日期';
comment on column ASSETREMOVEPLAN.PLANCATEGORY
  is '计划类别';
comment on column ASSETREMOVEPLAN.ASSETCOUNT
  is '计划设备数量';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASSETREMOVEPLAN
  add constraint PK_ASSETREMOVEPLAN_PLANID primary key (PLANID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create table
create table ASSETMOVEPLAN
(
  PLANID                NUMBER(10) not null,
  ASSETPARENTCATEGORYID VARCHAR2(40),
  ASSETCATEGORYID       VARCHAR2(40),
  STORAGEFLAG           NVARCHAR2(40),
  STORAGE               NVARCHAR2(40),
  PLANDATECYCLE         VARCHAR2(40),
  CREATEDDATE           DATE,
  STARTDATE             DATE,
  ENDDATE               DATE,
  PLANCATEGORY          NUMBER(8),
  ASSETCOUNT            NUMBER(8)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table ASSETMOVEPLAN
  is '移机计划表';
-- Add comments to the columns 
comment on column ASSETMOVEPLAN.PLANID
  is '计划编号';
comment on column ASSETMOVEPLAN.ASSETPARENTCATEGORYID
  is '设备父类别';
comment on column ASSETMOVEPLAN.ASSETCATEGORYID
  is '设备子类别';
comment on column ASSETMOVEPLAN.STORAGEFLAG
  is '分公司、项目体标识';
comment on column ASSETMOVEPLAN.STORAGE
  is '分公司、项目体ID';
comment on column ASSETMOVEPLAN.PLANDATECYCLE
  is '时间段（如：周计划，20120723-20120729）';
comment on column ASSETMOVEPLAN.CREATEDDATE
  is '创建时间';
comment on column ASSETMOVEPLAN.STARTDATE
  is '开始日期';
comment on column ASSETMOVEPLAN.ENDDATE
  is '结束日期';
comment on column ASSETMOVEPLAN.PLANCATEGORY
  is '计划类别';
comment on column ASSETMOVEPLAN.ASSETCOUNT
  is '计划设备数量';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASSETMOVEPLAN
  add constraint PK_ASSETMOVEPLAN_PLANID primary key (PLANID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create sequence 
create sequence SEQ_ASSETMOVEPLAN_PLANID
minvalue 1
maxvalue 2147483647
start with 41
increment by 1
cache 20
order;
-- Create sequence 
create sequence SEQ_ASSETMOVEPLAN_PLANID
minvalue 1
maxvalue 2147483647
start with 41
increment by 1
cache 20
order;
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006', '计划', '000', null, 3, '006', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006001', '安装计划', '006', '~/admin/AssetUsedPlan.aspx', 2, '006001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006002', '安装计划汇总', '006', '~/admin/Report_AssetUserdPlan.aspx', 2, '006002', null);
values ('006004', '移机计划', '006', '~/admin/Move_Plan.aspx', 2, '006004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006005', '移机计划汇总', '006', '~/admin/Report_Move_Plan.aspx', 2, '006005', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006006', '拆机计划', '006', '~/admin/reMove_Plan.aspx', 2, '006006', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006007', '拆机计划汇总', '006', '~/admin/Report_reMove_Plan.aspx', 2, '006007', null);
commit;
