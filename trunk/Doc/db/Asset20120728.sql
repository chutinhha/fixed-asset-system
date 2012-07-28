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
  is '�ù��ƻ���';
-- Add comments to the columns 
comment on column ASSETRUNPLAN.PLANID
  is '�ƻ���ţ�ʱ���+�ֹ�˾����Ŀ��+����ID���ַ����Ĺ�ϣֵ��';
comment on column ASSETRUNPLAN.ASSETPARENTCATEGORYID
  is '�豸�����';
comment on column ASSETRUNPLAN.ASSETCATEGORYID
  is '�豸�����';
comment on column ASSETRUNPLAN.STORAGEFLAG
  is '�ֹ�˾����Ŀ���ʶ';
comment on column ASSETRUNPLAN.STORAGE
  is '�ֹ�˾����Ŀ��ID';
comment on column ASSETRUNPLAN.PLANDATECYCLE
  is 'ʱ��Σ��磺�ܼƻ���20120723-20120729��';
comment on column ASSETRUNPLAN.CREATEDDATE
  is '����ʱ��';
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
