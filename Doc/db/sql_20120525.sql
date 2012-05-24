prompt PL/SQL Developer import file
prompt Created on 2012��5��24�� by Administrator
set feedback off
set define off
prompt Creating ASSET...
create table ASSET
(
  assetno          VARCHAR2(20) not null,
  assetcategoryid  VARCHAR2(40) not null,
  assetname        NVARCHAR2(100) not null,
  storage          NVARCHAR2(40) not null,
  state            NUMBER(1) not null,
  depreciationyear NUMBER(1) not null,
  unitprice        NUMBER(18,2) not null,
  brand            NVARCHAR2(100) not null,
  managemode       NUMBER(1) not null,
  financecategory  NUMBER(1) not null,
  supplierid       NVARCHAR2(40) not null,
  purchasedate     DATE not null,
  expireddate      DATE
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ASSET.assetno
  is '�豸���';
comment on column ASSET.assetcategoryid
  is '�豸���';
comment on column ASSET.assetname
  is '�豸����';
comment on column ASSET.storage
  is '��ŵص�';
comment on column ASSET.state
  is '�豸״̬';
comment on column ASSET.depreciationyear
  is '�۾�����';
comment on column ASSET.unitprice
  is '����';
comment on column ASSET.brand
  is 'Ʒ��';
comment on column ASSET.managemode
  is '����ģʽ �й�:0�Թ�:1';
comment on column ASSET.financecategory
  is '�������(A��:0��B��:1)';
comment on column ASSET.supplierid
  is '��Ӧ��';
comment on column ASSET.purchasedate
  is '��������';

prompt Creating ASSETCATEGORY...
create table ASSETCATEGORY
(
  assetcategoryid       VARCHAR2(40) not null,
  assetparentcategoryid VARCHAR2(40),
  assetname             NVARCHAR2(100) not null,
  remark                NVARCHAR2(100)
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ASSETMAINTAIN...
create table ASSETMAINTAIN
(
  assetmaintainid VARCHAR2(40) not null,
  assetno         VARCHAR2(20) not null,
  maintaintype    NUMBER(1) not null
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ASSETMAINTAIN.assetmaintainid
  is '�豸ά��ID';
comment on column ASSETMAINTAIN.assetno
  is '�豸���';
comment on column ASSETMAINTAIN.maintaintype
  is 'ά�����ͣ���װ��0 ά�ޣ� 1 �ƻ��� 2  ����� 3';

prompt Creating ASSETSETUPINFO...
create table ASSETSETUPINFO
(
  assetsetupinfoid      VARCHAR2(40) not null,
  applysetupdate        DATE not null,
  applydate             DATE not null,
  applyuserid           VARCHAR2(40) not null,
  contactphone          VARCHAR2(40) not null,
  projectcontactorid    VARCHAR2(40) not null,
  projectcontactorphone VARCHAR2(40) not null,
  plansetupdate         DATE not null,
  actualsetupdate       DATE not null
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ASSETSETUPINFO.applysetupdate
  is '���밲װ����';
comment on column ASSETSETUPINFO.applydate
  is '��������';
comment on column ASSETSETUPINFO.applyuserid
  is '������';
comment on column ASSETSETUPINFO.contactphone
  is '��ϵ�绰';
comment on column ASSETSETUPINFO.projectcontactorid
  is '��Ŀ����ϵ��';
comment on column ASSETSETUPINFO.projectcontactorphone
  is '��Ŀ����ϵ�绰';
comment on column ASSETSETUPINFO.plansetupdate
  is '�ƻ���װ����';
comment on column ASSETSETUPINFO.actualsetupdate
  is 'ʵ�ʰ�װ����';

prompt Creating PROCUREMENTCONTRACT...
create table PROCUREMENTCONTRACT
(
  contractid   VARCHAR2(50) not null,
  content      NVARCHAR2(2000),
  createddate  DATE,
  contractdate DATE,
  supplier     NVARCHAR2(50),
  operator     NVARCHAR2(50),
  subcompany   VARCHAR2(50),
  creator      NVARCHAR2(50)
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PROCUREMENTCONTRACT
  is '��ͬ';
comment on column PROCUREMENTCONTRACT.contractid
  is '��ͬ���';
comment on column PROCUREMENTCONTRACT.content
  is '��ͬ����';
comment on column PROCUREMENTCONTRACT.createddate
  is '��������';
comment on column PROCUREMENTCONTRACT.contractdate
  is 'ǩ������';
comment on column PROCUREMENTCONTRACT.supplier
  is '��Ӧ��';
comment on column PROCUREMENTCONTRACT.operator
  is '��ͬ������';
comment on column PROCUREMENTCONTRACT.subcompany
  is '�ֹ�˾';
comment on column PROCUREMENTCONTRACT.creator
  is '������';
alter table PROCUREMENTCONTRACT
  add constraint PK_PROCONTRACT_CONTRACTID primary key (CONTRACTID)
  using index 
  tablespace TEST_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PROCUREMENTCONTRACTDETAIL...
create table PROCUREMENTCONTRACTDETAIL
(
  contractdetailid   VARCHAR2(50) not null,
  contractid         VARCHAR2(50),
  assetcategoryid    VARCHAR2(50),
  assetname          NVARCHAR2(100),
  assetspecification NVARCHAR2(100),
  unitprice          NUMBER(18,2),
  procurenumber      NUMBER(1)
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PROCUREMENTCONTRACTDETAIL
  is '��ͬ��ϸ';
comment on column PROCUREMENTCONTRACTDETAIL.contractdetailid
  is '��ͬ��ϸId';
comment on column PROCUREMENTCONTRACTDETAIL.contractid
  is '��ͬ���';
comment on column PROCUREMENTCONTRACTDETAIL.assetcategoryid
  is '�豸���';
comment on column PROCUREMENTCONTRACTDETAIL.assetname
  is '�豸����';
comment on column PROCUREMENTCONTRACTDETAIL.assetspecification
  is '�豸���';
comment on column PROCUREMENTCONTRACTDETAIL.unitprice
  is '����';
comment on column PROCUREMENTCONTRACTDETAIL.procurenumber
  is '�ɹ�����';
alter table PROCUREMENTCONTRACTDETAIL
  add constraint PK_CONTRACTDETAILID primary key (CONTRACTDETAILID)
  using index 
  tablespace TEST_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROCUREMENTCONTRACTDETAIL
  add constraint FK_PROCONTRACT_CONTRACTID foreign key (CONTRACTID)
  references PROCUREMENTCONTRACT (CONTRACTID);

prompt Creating PROCUREMENTSCHEDULEHEAD...
create table PROCUREMENTSCHEDULEHEAD
(
  psid                    VARCHAR2(50) not null,
  procurementscheduledate DATE,
  reason                  NVARCHAR2(500),
  subcompany              VARCHAR2(50),
  applyuser               NVARCHAR2(50),
  applydate               DATE,
  approveuser             NVARCHAR2(50),
  approvedate             DATE,
  approveresult           NUMBER(1),
  rejectreason            NVARCHAR2(500),
  createddate             DATE
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
comment on table PROCUREMENTSCHEDULEHEAD
  is '�ɹ��ƻ���';
comment on column PROCUREMENTSCHEDULEHEAD.psid
  is '����';
comment on column PROCUREMENTSCHEDULEHEAD.procurementscheduledate
  is '�ƻ��ɹ�����';
comment on column PROCUREMENTSCHEDULEHEAD.reason
  is '����';
comment on column PROCUREMENTSCHEDULEHEAD.subcompany
  is '�ֹ�˾';
comment on column PROCUREMENTSCHEDULEHEAD.applyuser
  is '������';
comment on column PROCUREMENTSCHEDULEHEAD.applydate
  is '��������';
comment on column PROCUREMENTSCHEDULEHEAD.approveuser
  is '�����';
comment on column PROCUREMENTSCHEDULEHEAD.approvedate
  is '�������';
comment on column PROCUREMENTSCHEDULEHEAD.approveresult
  is '��˽����ͬ�⣬�ܾ���';
comment on column PROCUREMENTSCHEDULEHEAD.rejectreason
  is '�ܾ�����';
comment on column PROCUREMENTSCHEDULEHEAD.createddate
  is '�ɹ�����������';
alter table PROCUREMENTSCHEDULEHEAD
  add constraint PK_PROCUREMENTSCHEDULEHEAD_ID primary key (PSID)
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

prompt Creating PROCUREMENTSCHEDULEDETAIL...
create table PROCUREMENTSCHEDULEDETAIL
(
  detailid           VARCHAR2(50) not null,
  assetcategoryid    VARCHAR2(50),
  assetname          NVARCHAR2(100),
  assetspecification NVARCHAR2(100),
  unitprice          NUMBER(18,2),
  plannumber         NUMBER(1),
  psid               VARCHAR2(50)
)
tablespace TEST_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PROCUREMENTSCHEDULEDETAIL.detailid
  is '��ϸId';
comment on column PROCUREMENTSCHEDULEDETAIL.assetcategoryid
  is '�豸���';
comment on column PROCUREMENTSCHEDULEDETAIL.assetname
  is '�豸����';
comment on column PROCUREMENTSCHEDULEDETAIL.assetspecification
  is '�豸���';
comment on column PROCUREMENTSCHEDULEDETAIL.unitprice
  is '����';
comment on column PROCUREMENTSCHEDULEDETAIL.plannumber
  is '�ƻ��ɹ�����';
comment on column PROCUREMENTSCHEDULEDETAIL.psid
  is '�ƻ��ɹ���Id';
alter table PROCUREMENTSCHEDULEDETAIL
  add constraint PK__PROSCHEDULE_DETAIL_ID primary key (DETAILID)
  using index 
  tablespace TEST_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PROCUREMENTSCHEDULEDETAIL
  add constraint FK__PROSCHEDULE__ID foreign key (PSID)
  references PROCUREMENTSCHEDULEHEAD (PSID);

prompt Disabling triggers for ASSET...
alter table ASSET disable all triggers;
prompt Disabling triggers for ASSETCATEGORY...
alter table ASSETCATEGORY disable all triggers;
prompt Disabling triggers for ASSETMAINTAIN...
alter table ASSETMAINTAIN disable all triggers;
prompt Disabling triggers for ASSETSETUPINFO...
alter table ASSETSETUPINFO disable all triggers;
prompt Disabling triggers for PROCUREMENTCONTRACT...
alter table PROCUREMENTCONTRACT disable all triggers;
prompt Disabling triggers for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL disable all triggers;
prompt Disabling triggers for PROCUREMENTSCHEDULEHEAD...
alter table PROCUREMENTSCHEDULEHEAD disable all triggers;
prompt Disabling triggers for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL disable all triggers;
prompt Disabling foreign key constraints for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL disable constraint FK_PROCONTRACT_CONTRACTID;
prompt Disabling foreign key constraints for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL disable constraint FK__PROSCHEDULE__ID;
prompt Loading ASSET...
prompt Table is empty
prompt Loading ASSETCATEGORY...
prompt Table is empty
prompt Loading ASSETMAINTAIN...
prompt Table is empty
prompt Loading ASSETSETUPINFO...
prompt Table is empty
prompt Loading PROCUREMENTCONTRACT...
prompt Table is empty
prompt Loading PROCUREMENTCONTRACTDETAIL...
prompt Table is empty
prompt Loading PROCUREMENTSCHEDULEHEAD...
prompt Table is empty
prompt Loading PROCUREMENTSCHEDULEDETAIL...
prompt Table is empty
prompt Enabling foreign key constraints for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL enable constraint FK_PROCONTRACT_CONTRACTID;
prompt Enabling foreign key constraints for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL enable constraint FK__PROSCHEDULE__ID;
prompt Enabling triggers for ASSET...
alter table ASSET enable all triggers;
prompt Enabling triggers for ASSETCATEGORY...
alter table ASSETCATEGORY enable all triggers;
prompt Enabling triggers for ASSETMAINTAIN...
alter table ASSETMAINTAIN enable all triggers;
prompt Enabling triggers for ASSETSETUPINFO...
alter table ASSETSETUPINFO enable all triggers;
prompt Enabling triggers for PROCUREMENTCONTRACT...
alter table PROCUREMENTCONTRACT enable all triggers;
prompt Enabling triggers for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL enable all triggers;
prompt Enabling triggers for PROCUREMENTSCHEDULEHEAD...
alter table PROCUREMENTSCHEDULEHEAD enable all triggers;
prompt Enabling triggers for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL enable all triggers;
set feedback on
set define on
prompt Done.
