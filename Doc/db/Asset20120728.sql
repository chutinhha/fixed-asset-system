-- Create table
create table ASSETRUNPLAN
(
  PLANID                NUMBER(10) not null,
  ASSETPARENTCATEGORYID VARCHAR2(40),
  ASSETCATEGORYID       VARCHAR2(40),
  STORAGEFLAG           NVARCHAR2(40),
  STORAGE               NVARCHAR2(40),
  PLANDATECYCLE         VARCHAR2(40),
  CREATEDDATE           DATE
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
comment on table ASSETRUNPLAN
  is '用工计划表';
-- Add comments to the columns 
comment on column ASSETRUNPLAN.PLANID
  is '计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值）';
comment on column ASSETRUNPLAN.ASSETPARENTCATEGORYID
  is '设备父类别';
comment on column ASSETRUNPLAN.ASSETCATEGORYID
  is '设备子类别';
comment on column ASSETRUNPLAN.STORAGEFLAG
  is '分公司、项目体标识';
comment on column ASSETRUNPLAN.STORAGE
  is '分公司、项目体ID';
comment on column ASSETRUNPLAN.PLANDATECYCLE
  is '时间段（如：周计划，20120723-20120729）';
comment on column ASSETRUNPLAN.CREATEDDATE
  is '创建时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASSETRUNPLAN
  add constraint PK_ASSETRUNPLAN_PLANID primary key (PLANID)
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
