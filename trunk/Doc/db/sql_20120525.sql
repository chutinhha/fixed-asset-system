prompt PL/SQL Developer import file
prompt Created on 2012年5月24日 by Administrator
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
  is '设备编号';
comment on column ASSET.assetcategoryid
  is '设备类别';
comment on column ASSET.assetname
  is '设备名称';
comment on column ASSET.storage
  is '存放地点';
comment on column ASSET.state
  is '设备状态';
comment on column ASSET.depreciationyear
  is '折旧年限';
comment on column ASSET.unitprice
  is '单价';
comment on column ASSET.brand
  is '品牌';
comment on column ASSET.managemode
  is '管理模式 托管:0自管:1';
comment on column ASSET.financecategory
  is '账务类别(A帐:0、B帐:1)';
comment on column ASSET.supplierid
  is '供应商';
comment on column ASSET.purchasedate
  is '购入日期';

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
  is '设备维护ID';
comment on column ASSETMAINTAIN.assetno
  is '设备编号';
comment on column ASSETMAINTAIN.maintaintype
  is '维护类型：安装：0 维修： 1 移机： 2  拆机： 3';

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
  is '申请安装日期';
comment on column ASSETSETUPINFO.applydate
  is '申请日期';
comment on column ASSETSETUPINFO.applyuserid
  is '申请人';
comment on column ASSETSETUPINFO.contactphone
  is '联系电话';
comment on column ASSETSETUPINFO.projectcontactorid
  is '项目体联系人';
comment on column ASSETSETUPINFO.projectcontactorphone
  is '项目体联系电话';
comment on column ASSETSETUPINFO.plansetupdate
  is '计划安装日期';
comment on column ASSETSETUPINFO.actualsetupdate
  is '实际安装日期';

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
  is '合同';
comment on column PROCUREMENTCONTRACT.contractid
  is '合同编号';
comment on column PROCUREMENTCONTRACT.content
  is '合同内容';
comment on column PROCUREMENTCONTRACT.createddate
  is '创建日期';
comment on column PROCUREMENTCONTRACT.contractdate
  is '签订日期';
comment on column PROCUREMENTCONTRACT.supplier
  is '供应商';
comment on column PROCUREMENTCONTRACT.operator
  is '合同负责人';
comment on column PROCUREMENTCONTRACT.subcompany
  is '分公司';
comment on column PROCUREMENTCONTRACT.creator
  is '创建人';
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
  is '合同明细';
comment on column PROCUREMENTCONTRACTDETAIL.contractdetailid
  is '合同明细Id';
comment on column PROCUREMENTCONTRACTDETAIL.contractid
  is '合同编号';
comment on column PROCUREMENTCONTRACTDETAIL.assetcategoryid
  is '设备类别';
comment on column PROCUREMENTCONTRACTDETAIL.assetname
  is '设备名称';
comment on column PROCUREMENTCONTRACTDETAIL.assetspecification
  is '设备规格';
comment on column PROCUREMENTCONTRACTDETAIL.unitprice
  is '单价';
comment on column PROCUREMENTCONTRACTDETAIL.procurenumber
  is '采购数量';
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
  is '采购计划单';
comment on column PROCUREMENTSCHEDULEHEAD.psid
  is '单号';
comment on column PROCUREMENTSCHEDULEHEAD.procurementscheduledate
  is '计划采购日期';
comment on column PROCUREMENTSCHEDULEHEAD.reason
  is '事由';
comment on column PROCUREMENTSCHEDULEHEAD.subcompany
  is '分公司';
comment on column PROCUREMENTSCHEDULEHEAD.applyuser
  is '申请人';
comment on column PROCUREMENTSCHEDULEHEAD.applydate
  is '申请日期';
comment on column PROCUREMENTSCHEDULEHEAD.approveuser
  is '审核人';
comment on column PROCUREMENTSCHEDULEHEAD.approvedate
  is '审核日期';
comment on column PROCUREMENTSCHEDULEHEAD.approveresult
  is '审核结果（同意，拒绝）';
comment on column PROCUREMENTSCHEDULEHEAD.rejectreason
  is '拒绝理由';
comment on column PROCUREMENTSCHEDULEHEAD.createddate
  is '采购单创建日期';
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
  is '明细Id';
comment on column PROCUREMENTSCHEDULEDETAIL.assetcategoryid
  is '设备类别';
comment on column PROCUREMENTSCHEDULEDETAIL.assetname
  is '设备名称';
comment on column PROCUREMENTSCHEDULEDETAIL.assetspecification
  is '设备规格';
comment on column PROCUREMENTSCHEDULEDETAIL.unitprice
  is '单价';
comment on column PROCUREMENTSCHEDULEDETAIL.plannumber
  is '计划采购数量';
comment on column PROCUREMENTSCHEDULEDETAIL.psid
  is '计划采购单Id';
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
