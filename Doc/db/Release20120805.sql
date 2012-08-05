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
  is '����ƻ���';
-- Add comments to the columns 
comment on column ASSETREMOVEPLAN.PLANID
  is '�ƻ����';
comment on column ASSETREMOVEPLAN.ASSETPARENTCATEGORYID
  is '�豸�����';
comment on column ASSETREMOVEPLAN.ASSETCATEGORYID
  is '�豸�����';
comment on column ASSETREMOVEPLAN.STORAGEFLAG
  is '�ֹ�˾����Ŀ���ʶ';
comment on column ASSETREMOVEPLAN.STORAGE
  is '�ֹ�˾����Ŀ��ID';
comment on column ASSETREMOVEPLAN.PLANDATECYCLE
  is 'ʱ��Σ��磺�ܼƻ���20120723-20120729��';
comment on column ASSETREMOVEPLAN.CREATEDDATE
  is '����ʱ��';
comment on column ASSETREMOVEPLAN.STARTDATE
  is '��ʼ����';
comment on column ASSETREMOVEPLAN.ENDDATE
  is '��������';
comment on column ASSETREMOVEPLAN.PLANCATEGORY
  is '�ƻ����';
comment on column ASSETREMOVEPLAN.ASSETCOUNT
  is '�ƻ��豸����';
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
  is '�ƻ��ƻ���';
-- Add comments to the columns 
comment on column ASSETMOVEPLAN.PLANID
  is '�ƻ����';
comment on column ASSETMOVEPLAN.ASSETPARENTCATEGORYID
  is '�豸�����';
comment on column ASSETMOVEPLAN.ASSETCATEGORYID
  is '�豸�����';
comment on column ASSETMOVEPLAN.STORAGEFLAG
  is '�ֹ�˾����Ŀ���ʶ';
comment on column ASSETMOVEPLAN.STORAGE
  is '�ֹ�˾����Ŀ��ID';
comment on column ASSETMOVEPLAN.PLANDATECYCLE
  is 'ʱ��Σ��磺�ܼƻ���20120723-20120729��';
comment on column ASSETMOVEPLAN.CREATEDDATE
  is '����ʱ��';
comment on column ASSETMOVEPLAN.STARTDATE
  is '��ʼ����';
comment on column ASSETMOVEPLAN.ENDDATE
  is '��������';
comment on column ASSETMOVEPLAN.PLANCATEGORY
  is '�ƻ����';
comment on column ASSETMOVEPLAN.ASSETCOUNT
  is '�ƻ��豸����';
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
values ('006', '�ƻ�', '000', null, 3, '006', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006001', '��װ�ƻ�', '006', '~/admin/AssetUsedPlan.aspx', 2, '006001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006002', '��װ�ƻ�����', '006', '~/admin/Report_AssetUserdPlan.aspx', 2, '006002', null);
values ('006004', '�ƻ��ƻ�', '006', '~/admin/Move_Plan.aspx', 2, '006004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006005', '�ƻ��ƻ�����', '006', '~/admin/Report_Move_Plan.aspx', 2, '006005', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006006', '����ƻ�', '006', '~/admin/reMove_Plan.aspx', 2, '006006', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('006007', '����ƻ�����', '006', '~/admin/Report_reMove_Plan.aspx', 2, '006007', null);
commit;
