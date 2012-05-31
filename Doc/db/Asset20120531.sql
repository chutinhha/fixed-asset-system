prompt PL/SQL Developer import file
prompt Created on 2012年5月31日 by Bruce.Huang
set feedback off
set define off
prompt Creating ASSET...
create table ASSET
(
  ASSETNO            VARCHAR2(20) not null,
  ASSETCATEGORYID    VARCHAR2(40),
  ASSETNAME          NVARCHAR2(100),
  STORAGE            NVARCHAR2(40),
  STATE              NUMBER(1),
  DEPRECIATIONYEAR   NUMBER(4),
  UNITPRICE          NUMBER(18,2),
  BRAND              NVARCHAR2(100),
  MANAGEMODE         NUMBER(1),
  FINANCECATEGORY    NUMBER(1),
  SUPPLIERID         NVARCHAR2(40),
  PURCHASEDATE       DATE,
  EXPIREDDATE        DATE,
  ASSETSPECIFICATION NVARCHAR2(100),
  STORAGEFLAG        NVARCHAR2(40),
  SUBCOMPANY         VARCHAR2(50),
  CONTRACTID         VARCHAR2(50),
  CONTRACTDETAILID   VARCHAR2(50)
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
comment on column ASSET.ASSETNO
  is '设备编号';
comment on column ASSET.ASSETCATEGORYID
  is '设备类别';
comment on column ASSET.ASSETNAME
  is '设备名称';
comment on column ASSET.STORAGE
  is '存放地点';
comment on column ASSET.STATE
  is '设备状态';
comment on column ASSET.DEPRECIATIONYEAR
  is '折旧年限';
comment on column ASSET.UNITPRICE
  is '单价';
comment on column ASSET.BRAND
  is '品牌';
comment on column ASSET.MANAGEMODE
  is '管理模式，托管:0自管:1';
comment on column ASSET.FINANCECATEGORY
  is '财务类别(A帐:0B帐:1)';
comment on column ASSET.SUPPLIERID
  is '供应商';
comment on column ASSET.PURCHASEDATE
  is '购入日期';
comment on column ASSET.EXPIREDDATE
  is '折旧到期日期';
comment on column ASSET.ASSETSPECIFICATION
  is '设备规格';
comment on column ASSET.STORAGEFLAG
  is '存放地点标识来源';
comment on column ASSET.SUBCOMPANY
  is '分公司';
comment on column ASSET.CONTRACTID
  is '合同编号';
comment on column ASSET.CONTRACTDETAILID
  is '合同明细编号';
alter table ASSET
  add constraint PK_ASSET_NO primary key (ASSETNO)
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

prompt Creating ASSETCATEGORY...
create table ASSETCATEGORY
(
  ASSETCATEGORYID       VARCHAR2(40) not null,
  ASSETPARENTCATEGORYID VARCHAR2(40),
  ASSETCATEGORYNAME     NVARCHAR2(100),
  REMARK                NVARCHAR2(100),
  CREATEDATE            DATE,
  CREATOR               VARCHAR2(50),
  CATEGORYVALUE         VARCHAR2(50)
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
alter table ASSETCATEGORY
  add constraint PK_ASSETCATEGORYID primary key (ASSETCATEGORYID)
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

prompt Creating ASSETMAINTAIN...
create table ASSETMAINTAIN
(
  ASSETMAINTAINID       VARCHAR2(40) not null,
  MAINTAINTYPE          NUMBER(1) not null,
  APPLYDATE             DATE,
  APPLYUSERID           VARCHAR2(40),
  APPLYCONTENT          NVARCHAR2(2000),
  SUBCOMPANY            NVARCHAR2(50),
  SUBCOMPANYCONTACTORID VARCHAR2(40),
  CREATOR               VARCHAR2(40),
  CREATEDDATE           DATE,
  PROJECTCONTACTORID    VARCHAR2(40),
  PROJECTCONTACTORPHONE VARCHAR2(40),
  PLANMAINTAINDATE      DATE,
  ACTUALMAINTAINDATE    DATE,
  REJECTREASON          NVARCHAR2(500),
  APPROVEUSER           NVARCHAR2(50),
  APPROVEDATE           DATE,
  APPROVERESULT         NUMBER(1),
  ASSETCATEGORYID       VARCHAR2(40),
  MAINTAINCONTENT       NVARCHAR2(500),
  CONFIRMDATE           DATE,
  CONFIRMUSER           VARCHAR2(40)
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
comment on table ASSETMAINTAIN
  is '维修信息';
comment on column ASSETMAINTAIN.ASSETMAINTAINID
  is '设备维护ID';
comment on column ASSETMAINTAIN.MAINTAINTYPE
  is '保修来源：(项目体、自检、月检)';
comment on column ASSETMAINTAIN.APPLYDATE
  is '申请维修日期';
comment on column ASSETMAINTAIN.APPLYUSERID
  is '申请人';
comment on column ASSETMAINTAIN.APPLYCONTENT
  is '申请内容';
comment on column ASSETMAINTAIN.SUBCOMPANY
  is '分公司';
comment on column ASSETMAINTAIN.SUBCOMPANYCONTACTORID
  is '分公司联系人';
comment on column ASSETMAINTAIN.CREATOR
  is '创建人';
comment on column ASSETMAINTAIN.CREATEDDATE
  is '创建日期';
comment on column ASSETMAINTAIN.PROJECTCONTACTORID
  is '项目体联系人';
comment on column ASSETMAINTAIN.PROJECTCONTACTORPHONE
  is '项目体联系电话';
comment on column ASSETMAINTAIN.PLANMAINTAINDATE
  is '计划维修日期';
comment on column ASSETMAINTAIN.ACTUALMAINTAINDATE
  is '实际维修日期';
comment on column ASSETMAINTAIN.REJECTREASON
  is '拒绝理由';
comment on column ASSETMAINTAIN.APPROVEUSER
  is '审核人';
comment on column ASSETMAINTAIN.APPROVEDATE
  is '审核日期';
comment on column ASSETMAINTAIN.APPROVERESULT
  is '审核结果(同意,拒绝)';
comment on column ASSETMAINTAIN.ASSETCATEGORYID
  is '(系统)设备大类';
comment on column ASSETMAINTAIN.MAINTAINCONTENT
  is '已维修明细';
comment on column ASSETMAINTAIN.CONFIRMDATE
  is '确认日期';
comment on column ASSETMAINTAIN.CONFIRMUSER
  is '确认人';
alter table ASSETMAINTAIN
  add constraint PK_ASSETMAINTAINID primary key (ASSETMAINTAINID)
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

prompt Creating ASSETMAINTAINDETAIL...
create table ASSETMAINTAINDETAIL
(
  DETAILID           VARCHAR2(40) not null,
  ASSETMAINTAINID    VARCHAR2(40) not null,
  ASSETNO            VARCHAR2(20) not null,
  PLANMAINTAINDATE   DATE,
  ACTUALMAINTAINDATE DATE,
  MAINTAINCONTENT    NVARCHAR2(500)
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
comment on column ASSETMAINTAINDETAIL.DETAILID
  is '明细Id';
comment on column ASSETMAINTAINDETAIL.ASSETMAINTAINID
  is '设备维护ID';
comment on column ASSETMAINTAINDETAIL.ASSETNO
  is '设备编号';
comment on column ASSETMAINTAINDETAIL.PLANMAINTAINDATE
  is '计划维修日期';
comment on column ASSETMAINTAINDETAIL.ACTUALMAINTAINDATE
  is '实际维修日期';
comment on column ASSETMAINTAINDETAIL.MAINTAINCONTENT
  is '维修说明';
alter table ASSETMAINTAINDETAIL
  add constraint PK_ASSETMAINTAINDETAIL_ID primary key (DETAILID)
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
alter table ASSETMAINTAINDETAIL
  add constraint FK_ASSETMAINTAINDETAIL_MAINID foreign key (ASSETMAINTAINID)
  references ASSETMAINTAIN (ASSETMAINTAINID);

prompt Creating ASSETMOVE...
create table ASSETMOVE
(
  ASSETMOVEID           VARCHAR2(40) not null,
  APPLYDATE             DATE,
  APPLYUSERID           VARCHAR2(40),
  APPLYCONTENT          NVARCHAR2(2000),
  SUBCOMPANY            NVARCHAR2(50),
  SUBCOMPANYCONTACTORID VARCHAR2(40),
  CREATOR               VARCHAR2(40),
  CREATEDDATE           DATE,
  PROJECTCONTACTORID    VARCHAR2(40),
  PROJECTCONTACTORPHONE VARCHAR2(40),
  PLANMOVEDATE          DATE,
  ACTUALMOVEDATE        DATE,
  REJECTREASON          NVARCHAR2(500),
  APPROVEUSER           NVARCHAR2(50),
  APPROVEDATE           DATE,
  APPROVERESULT         NUMBER(1),
  ASSETCATEGORYID       VARCHAR2(40),
  MOVEDCONTENT          NVARCHAR2(500),
  CONFIRMDATE           DATE,
  CONFIRMUSER           VARCHAR2(40)
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
comment on table ASSETMOVE
  is '移机信息';
comment on column ASSETMOVE.ASSETMOVEID
  is '移机单号';
comment on column ASSETMOVE.APPLYDATE
  is '申请移机日期';
comment on column ASSETMOVE.APPLYUSERID
  is '申请人';
comment on column ASSETMOVE.APPLYCONTENT
  is '申请内容';
comment on column ASSETMOVE.SUBCOMPANY
  is '分公司';
comment on column ASSETMOVE.SUBCOMPANYCONTACTORID
  is '分公司联系人';
comment on column ASSETMOVE.CREATOR
  is '创建人';
comment on column ASSETMOVE.CREATEDDATE
  is '创建日期';
comment on column ASSETMOVE.PROJECTCONTACTORID
  is '项目体联系人';
comment on column ASSETMOVE.PROJECTCONTACTORPHONE
  is '项目体联系电话';
comment on column ASSETMOVE.PLANMOVEDATE
  is '计划移机日期';
comment on column ASSETMOVE.ACTUALMOVEDATE
  is '实际移机日期';
comment on column ASSETMOVE.REJECTREASON
  is '拒绝理由';
comment on column ASSETMOVE.APPROVEUSER
  is '审核人';
comment on column ASSETMOVE.APPROVEDATE
  is '审核日期';
comment on column ASSETMOVE.APPROVERESULT
  is '审核结果(同意,拒绝)';
comment on column ASSETMOVE.ASSETCATEGORYID
  is '(系统)设备大类';
comment on column ASSETMOVE.MOVEDCONTENT
  is '已移机明细';
comment on column ASSETMOVE.CONFIRMDATE
  is '确认日期';
comment on column ASSETMOVE.CONFIRMUSER
  is '确认人';
alter table ASSETMOVE
  add constraint PK_ASSETMOVEID primary key (ASSETMOVEID)
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

prompt Creating ASSETMOVEDETAIL...
create table ASSETMOVEDETAIL
(
  DETAILID       VARCHAR2(40) not null,
  ASSETMOVEID    VARCHAR2(40) not null,
  ASSETNO        VARCHAR2(20) not null,
  PLANMOVEDATE   DATE,
  ACTUALMOVEDATE DATE,
  MOVEDCONTENT   NVARCHAR2(500)
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
comment on column ASSETMOVEDETAIL.DETAILID
  is '明细Id';
comment on column ASSETMOVEDETAIL.ASSETMOVEID
  is '移机单号';
comment on column ASSETMOVEDETAIL.ASSETNO
  is '设备编号';
comment on column ASSETMOVEDETAIL.PLANMOVEDATE
  is '计划移机日期';
comment on column ASSETMOVEDETAIL.ACTUALMOVEDATE
  is '实际移机日期';
comment on column ASSETMOVEDETAIL.MOVEDCONTENT
  is '移机说明';
alter table ASSETMOVEDETAIL
  add constraint PK_ASSETMOVEDETAIL_ID primary key (DETAILID)
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
alter table ASSETMOVEDETAIL
  add constraint FK_ASSETMOVEDETAIL_MOVEID foreign key (ASSETMOVEID)
  references ASSETMOVE (ASSETMOVEID);

prompt Creating ASSETREMOVE...
create table ASSETREMOVE
(
  ASSETREMOVEID         VARCHAR2(40) not null,
  APPLYDATE             DATE,
  APPLYUSERID           VARCHAR2(40),
  APPLYCONTENT          NVARCHAR2(2000),
  SUBCOMPANY            NVARCHAR2(50),
  SUBCOMPANYCONTACTORID VARCHAR2(40),
  CREATOR               VARCHAR2(40),
  CREATEDDATE           DATE,
  PROJECTCONTACTORID    VARCHAR2(40),
  PROJECTCONTACTORPHONE VARCHAR2(40),
  PLANREMOVEDATE        DATE,
  ACTUALREMOVEDATE      DATE,
  REJECTREASON          NVARCHAR2(500),
  APPROVEUSER           NVARCHAR2(50),
  APPROVEDATE           DATE,
  APPROVERESULT         NUMBER(1),
  ASSETCATEGORYID       VARCHAR2(40),
  REMOVEDCONTENT        NVARCHAR2(500),
  CONFIRMDATE           DATE,
  CONFIRMUSER           VARCHAR2(40)
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
comment on table ASSETREMOVE
  is '拆机信息';
comment on column ASSETREMOVE.ASSETREMOVEID
  is '拆机单号';
comment on column ASSETREMOVE.APPLYDATE
  is '申请拆机日期';
comment on column ASSETREMOVE.APPLYUSERID
  is '申请人';
comment on column ASSETREMOVE.APPLYCONTENT
  is '申请内容';
comment on column ASSETREMOVE.SUBCOMPANY
  is '分公司';
comment on column ASSETREMOVE.SUBCOMPANYCONTACTORID
  is '分公司联系人';
comment on column ASSETREMOVE.CREATOR
  is '创建人';
comment on column ASSETREMOVE.CREATEDDATE
  is '创建日期';
comment on column ASSETREMOVE.PROJECTCONTACTORID
  is '项目体联系人';
comment on column ASSETREMOVE.PROJECTCONTACTORPHONE
  is '项目体联系电话';
comment on column ASSETREMOVE.PLANREMOVEDATE
  is '计划拆机日期';
comment on column ASSETREMOVE.ACTUALREMOVEDATE
  is '实际拆机日期';
comment on column ASSETREMOVE.REJECTREASON
  is '拒绝理由';
comment on column ASSETREMOVE.APPROVEUSER
  is '审核人';
comment on column ASSETREMOVE.APPROVEDATE
  is '审核日期';
comment on column ASSETREMOVE.APPROVERESULT
  is '审核结果(同意,拒绝)';
comment on column ASSETREMOVE.ASSETCATEGORYID
  is '(系统)设备大类';
comment on column ASSETREMOVE.REMOVEDCONTENT
  is '已维修明细';
comment on column ASSETREMOVE.CONFIRMDATE
  is '确认日期';
comment on column ASSETREMOVE.CONFIRMUSER
  is '确认人';
alter table ASSETREMOVE
  add constraint PK_ASSETREMOVEID primary key (ASSETREMOVEID)
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

prompt Creating ASSETREMOVEDETAIL...
create table ASSETREMOVEDETAIL
(
  DETAILID         VARCHAR2(40) not null,
  ASSETREMOVEID    VARCHAR2(40) not null,
  ASSETNO          VARCHAR2(20) not null,
  PLANREMOVEDATE   DATE,
  ACTUALREMOVEDATE DATE,
  REMOVEDCONTENT   NVARCHAR2(500)
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
comment on column ASSETREMOVEDETAIL.DETAILID
  is '明细Id';
comment on column ASSETREMOVEDETAIL.ASSETREMOVEID
  is '移机单号';
comment on column ASSETREMOVEDETAIL.ASSETNO
  is '设备编号';
comment on column ASSETREMOVEDETAIL.PLANREMOVEDATE
  is '计划拆机日期';
comment on column ASSETREMOVEDETAIL.ACTUALREMOVEDATE
  is '实际拆机日期';
comment on column ASSETREMOVEDETAIL.REMOVEDCONTENT
  is '移机说明';
alter table ASSETREMOVEDETAIL
  add constraint PK_ASSETREMOVEDETAIL_ID primary key (DETAILID)
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
alter table ASSETREMOVEDETAIL
  add constraint FK_ASSETREMOVEDETAIL_MOVEID foreign key (ASSETREMOVEID)
  references ASSETREMOVE (ASSETREMOVEID);

prompt Creating ASSETSETUPINFO...
create table ASSETSETUPINFO
(
  SETUPID               VARCHAR2(40) not null,
  APPLYSETUPDATE        DATE,
  APPLYDATE             DATE,
  APPLYUSERID           VARCHAR2(40),
  CONTACTPHONE          VARCHAR2(40),
  PROJECTCONTACTORID    VARCHAR2(40),
  PROJECTCONTACTORPHONE VARCHAR2(40),
  PLANSETUPDATE         DATE,
  ACTUALSETUPDATE       DATE,
  APPLYCONTENT          NVARCHAR2(2000),
  SUBCOMPANY            NVARCHAR2(50),
  REJECTREASON          NVARCHAR2(500),
  APPROVEUSER           NVARCHAR2(50),
  APPROVEDATE           DATE,
  APPROVERESULT         NUMBER(2),
  CREATEDDATE           DATE,
  SUBCOMPANYCONTACTORID VARCHAR2(40),
  CREATOR               VARCHAR2(40),
  ASSETCATEGORYID       VARCHAR2(40),
  SETUPCONTENT          NVARCHAR2(500),
  CONFIRMDATE           DATE,
  CONFIRMUSER           VARCHAR2(40),
  STORAGETITLE          VARCHAR2(40),
  STORAGEID             VARCHAR2(40)
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
comment on column ASSETSETUPINFO.SETUPID
  is '申请单号';
comment on column ASSETSETUPINFO.APPLYSETUPDATE
  is '申请安装日期';
comment on column ASSETSETUPINFO.APPLYDATE
  is '申请日期';
comment on column ASSETSETUPINFO.APPLYUSERID
  is '申请人';
comment on column ASSETSETUPINFO.CONTACTPHONE
  is '联系电话';
comment on column ASSETSETUPINFO.PROJECTCONTACTORID
  is '项目体联系人';
comment on column ASSETSETUPINFO.PROJECTCONTACTORPHONE
  is '项目体联系电话';
comment on column ASSETSETUPINFO.PLANSETUPDATE
  is '计划安装日期';
comment on column ASSETSETUPINFO.ACTUALSETUPDATE
  is '实际安装日期';
comment on column ASSETSETUPINFO.APPLYCONTENT
  is '申请内容';
comment on column ASSETSETUPINFO.SUBCOMPANY
  is '分公司';
comment on column ASSETSETUPINFO.REJECTREASON
  is '拒绝理由';
comment on column ASSETSETUPINFO.APPROVEUSER
  is '审核人';
comment on column ASSETSETUPINFO.APPROVEDATE
  is '审核日期';
comment on column ASSETSETUPINFO.APPROVERESULT
  is '审核结果(同意,拒绝)';
comment on column ASSETSETUPINFO.CREATEDDATE
  is '创建日期';
comment on column ASSETSETUPINFO.SUBCOMPANYCONTACTORID
  is '分公司联系人';
comment on column ASSETSETUPINFO.CREATOR
  is '创建人';
comment on column ASSETSETUPINFO.ASSETCATEGORYID
  is '(系统)设备大类';
comment on column ASSETSETUPINFO.SETUPCONTENT
  is '已安装明细';
comment on column ASSETSETUPINFO.CONFIRMDATE
  is '确认日期';
comment on column ASSETSETUPINFO.CONFIRMUSER
  is '确认人';
comment on column ASSETSETUPINFO.STORAGETITLE
  is '区分字段：分公司或项目体';
comment on column ASSETSETUPINFO.STORAGEID
  is '项目体ID或分公司ID';
alter table ASSETSETUPINFO
  add constraint PK_ASSETSETUP_ID primary key (SETUPID)
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

prompt Creating ASSETSETUPDETAIL...
create table ASSETSETUPDETAIL
(
  DETAILID        VARCHAR2(40) not null,
  SETUPID         VARCHAR2(40) not null,
  ASSETNO         VARCHAR2(20) not null,
  PLANSETUPDATE   DATE,
  ACTUALSETUPDATE DATE,
  SETUPCONTENT    NVARCHAR2(500)
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
comment on column ASSETSETUPDETAIL.DETAILID
  is '明细Id';
comment on column ASSETSETUPDETAIL.SETUPID
  is '安装单号';
comment on column ASSETSETUPDETAIL.ASSETNO
  is '设备编号';
comment on column ASSETSETUPDETAIL.PLANSETUPDATE
  is '计划安装日期';
comment on column ASSETSETUPDETAIL.ACTUALSETUPDATE
  is '实际安装日期';
comment on column ASSETSETUPDETAIL.SETUPCONTENT
  is '已安装明细';
alter table ASSETSETUPDETAIL
  add constraint PK_ASSETSETUPDETAIL_ID primary key (DETAILID)
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
alter table ASSETSETUPDETAIL
  add constraint FK_ASSETSETUPDETAIL_SETUPID foreign key (SETUPID)
  references ASSETSETUPINFO (SETUPID);

prompt Creating ASSETSUPPLIER...
create table ASSETSUPPLIER
(
  SUPPLIERID      NVARCHAR2(40) not null,
  SUPPLIERNAME    NVARCHAR2(40),
  REMARK          NVARCHAR2(1000),
  SYSTEM          NVARCHAR2(40),
  ASSETCATEGORYID NVARCHAR2(40)
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
comment on table ASSETSUPPLIER
  is '供应商';
comment on column ASSETSUPPLIER.SUPPLIERID
  is '供应商编号';
comment on column ASSETSUPPLIER.SUPPLIERNAME
  is '供应商';
comment on column ASSETSUPPLIER.REMARK
  is '备注';
comment on column ASSETSUPPLIER.SYSTEM
  is '对应系统';
comment on column ASSETSUPPLIER.ASSETCATEGORYID
  is '对应的资产大类ID';
alter table ASSETSUPPLIER
  add constraint PK_ASSETSUPPLIER_ID primary key (SUPPLIERID)
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

prompt Creating BACCOUNT...
create table BACCOUNT
(
  ASSETNO       VARCHAR2(20) not null,
  ASSETNAME     NVARCHAR2(100),
  ACCOUNTEDDATE DATE,
  ACCOUNTEDUSER VARCHAR2(40),
  CREATEDDATE   DATE,
  CREATEDUSER   VARCHAR2(40)
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
comment on table BACCOUNT
  is 'B账信息';
comment on column BACCOUNT.ASSETNO
  is '设备编号';
comment on column BACCOUNT.ASSETNAME
  is '设备名称（冗余字段）';
comment on column BACCOUNT.ACCOUNTEDDATE
  is '入账日期';
comment on column BACCOUNT.ACCOUNTEDUSER
  is '入账人';
comment on column BACCOUNT.CREATEDDATE
  is '操作时间';
comment on column BACCOUNT.CREATEDUSER
  is '操作人';
alter table BACCOUNT
  add constraint PK_BACCOUNT_ASSETNO primary key (ASSETNO)
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

prompt Creating CODERULE...
create table CODERULE
(
  CODEPREFIX          VARCHAR2(20) not null,
  RULENAME            NVARCHAR2(20),
  ISNEEDCODEPREFIX    NUMBER(1),
  ISDEFAULT           NUMBER(1),
  STARTNUMBER         NUMBER(1),
  NUMBERWIDTH         NUMBER(1),
  YEARWIDTH           NUMBER(1),
  CURRENTNO           NUMBER(10),
  CURRENTSERIALNUMBER VARCHAR2(50)
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
comment on table CODERULE
  is '编码规则表';
comment on column CODERULE.CODEPREFIX
  is '编码前缀';
comment on column CODERULE.RULENAME
  is '规则名称';
comment on column CODERULE.ISNEEDCODEPREFIX
  is '是否需要编码前缀';
comment on column CODERULE.ISDEFAULT
  is '是否默认规则';
comment on column CODERULE.STARTNUMBER
  is '开始序号';
comment on column CODERULE.NUMBERWIDTH
  is '序号位数';
alter table CODERULE
  add constraint PK_CODEPREFIX primary key (CODEPREFIX)
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

prompt Creating LB_FGS...
create table LB_FGS
(
  FGSID      NUMBER not null,
  FGS        VARCHAR2(100),
  FGSSORTID  VARCHAR2(100),
  FGLD       VARCHAR2(100),
  FGLDLXDH   VARCHAR2(50),
  WLLZGY     VARCHAR2(100),
  WLLZGYLXDH VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    minextents 1
    maxextents unlimited
  );
comment on table LB_FGS
  is '分公司外劳力管理人员信息表';
comment on column LB_FGS.FGSID
  is '分公司ID';
comment on column LB_FGS.FGS
  is '分公司名称';
comment on column LB_FGS.FGSSORTID
  is '分公司排序ID';
alter table LB_FGS
  add constraint PK_LB_FGS primary key (FGSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    minextents 1
    maxextents unlimited
  );

prompt Creating LB_FGS_XMT...
create table LB_FGS_XMT
(
  XMTID        NUMBER not null,
  XMT          VARCHAR2(100),
  FGSID        NUMBER,
  FGS          VARCHAR2(100),
  XMTLX        VARCHAR2(50),
  WLLGLY       VARCHAR2(100),
  WLLGLYLXDH   VARCHAR2(50),
  KGRQ         DATE,
  JGRQ         DATE,
  JZMJ         NUMBER(14,4),
  ZHAOJIA      NUMBER(16,4),
  MGGRS        NUMBER(14,2),
  GJGGRS       NUMBER(14,2),
  TGGRS        NUMBER(14,2),
  NFGGRS       NUMBER(14,2),
  JZGGRS       NUMBER(14,2),
  QTGGRS       NUMBER(14,2),
  INSTANCEID   NUMBER(12),
  FAINSTANCEID NUMBER(12),
  STATUS       NUMBER(5) default 0,
  CREATETIME   DATE default sysdate,
  ISDELETE     NUMBER(1) default 0,
  FLOWID       NUMBER(12),
  DEPARTID     NUMBER(12),
  ORGANIZEID   NUMBER(12),
  DIYU         VARCHAR2(12),
  XMLX         VARCHAR2(12),
  ISUSE        NUMBER(1) default 1
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    minextents 1
    maxextents unlimited
  );
comment on table LB_FGS_XMT
  is '分公司外劳力劳务项目体信息记录表';
comment on column LB_FGS_XMT.XMTID
  is '项目体ID';
comment on column LB_FGS_XMT.XMT
  is '项目体名称';
comment on column LB_FGS_XMT.FGSID
  is '分公司ID';
comment on column LB_FGS_XMT.FGS
  is '分公司名称';
comment on column LB_FGS_XMT.ISUSE
  is '是否使用(0:未用/1:在用),只需要在用的';
alter table LB_FGS_XMT
  add constraint PK_LB_FGS_XMT primary key (XMTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    minextents 1
    maxextents unlimited
  );

prompt Creating MENUITEM...
create table MENUITEM
(
  MENUID       VARCHAR2(40) not null,
  MENUNAME     NVARCHAR2(50),
  PARENTMENUID VARCHAR2(40),
  MENUADDRESS  VARCHAR2(100),
  ORDERBY      NUMBER(1),
  FUNCTIONID   VARCHAR2(50)
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
comment on table MENUITEM
  is '菜单表';
comment on column MENUITEM.MENUID
  is '编号';
comment on column MENUITEM.MENUNAME
  is '菜单名';
comment on column MENUITEM.PARENTMENUID
  is '父菜单编号';
comment on column MENUITEM.MENUADDRESS
  is '链接地址';
comment on column MENUITEM.ORDERBY
  is '排序';
comment on column MENUITEM.FUNCTIONID
  is '功能Id';
alter table MENUITEM
  add constraint PK_MENUID primary key (MENUID)
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

prompt Creating PROCUREMENTCONTRACT...
create table PROCUREMENTCONTRACT
(
  CONTRACTID   VARCHAR2(50) not null,
  CONTENT      NVARCHAR2(2000),
  CREATEDDATE  DATE,
  CONTRACTDATE DATE,
  SUPPLIER     NVARCHAR2(50),
  OPERATOR     NVARCHAR2(50),
  SUBCOMPANY   VARCHAR2(50),
  CREATOR      NVARCHAR2(50),
  PSID         NVARCHAR2(50)
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
comment on table PROCUREMENTCONTRACT
  is '采购合同';
comment on column PROCUREMENTCONTRACT.CONTRACTID
  is '合同编号';
comment on column PROCUREMENTCONTRACT.CONTENT
  is '主要内容';
comment on column PROCUREMENTCONTRACT.CREATEDDATE
  is '创建日期';
comment on column PROCUREMENTCONTRACT.CONTRACTDATE
  is '签订日期';
comment on column PROCUREMENTCONTRACT.SUPPLIER
  is '供应商';
comment on column PROCUREMENTCONTRACT.OPERATOR
  is '合同负责人';
comment on column PROCUREMENTCONTRACT.SUBCOMPANY
  is '分公司';
comment on column PROCUREMENTCONTRACT.CREATOR
  is '创建人';
comment on column PROCUREMENTCONTRACT.PSID
  is '计划采购单号          ';
alter table PROCUREMENTCONTRACT
  add constraint PK_PROCONTRACT_CONTRACTID primary key (CONTRACTID)
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

prompt Creating PROCUREMENTCONTRACTDETAIL...
create table PROCUREMENTCONTRACTDETAIL
(
  CONTRACTDETAILID   VARCHAR2(50) not null,
  CONTRACTID         VARCHAR2(50),
  ASSETCATEGORYID    VARCHAR2(50),
  ASSETNAME          NVARCHAR2(100),
  ASSETSPECIFICATION NVARCHAR2(100),
  UNITPRICE          NUMBER(18,2),
  PROCURENUMBER      NUMBER(18),
  INPUTNUMBER        NUMBER(18)
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
comment on table PROCUREMENTCONTRACTDETAIL
  is '合同明细';
comment on column PROCUREMENTCONTRACTDETAIL.CONTRACTDETAILID
  is '明细Id';
comment on column PROCUREMENTCONTRACTDETAIL.CONTRACTID
  is '合同编号';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETCATEGORYID
  is '设备类别';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETNAME
  is '设备名称';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETSPECIFICATION
  is '设备规格';
comment on column PROCUREMENTCONTRACTDETAIL.UNITPRICE
  is '单价';
comment on column PROCUREMENTCONTRACTDETAIL.PROCURENUMBER
  is '采购数量';
comment on column PROCUREMENTCONTRACTDETAIL.INPUTNUMBER
  is '已验收登记数量';
alter table PROCUREMENTCONTRACTDETAIL
  add constraint PK_CONTRACTDETAILID primary key (CONTRACTDETAILID)
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
alter table PROCUREMENTCONTRACTDETAIL
  add constraint FK_PROCONTRACT_CONTRACTID foreign key (CONTRACTID)
  references PROCUREMENTCONTRACT (CONTRACTID);

prompt Creating PROCUREMENTSCHEDULEHEAD...
create table PROCUREMENTSCHEDULEHEAD
(
  PSID                    VARCHAR2(50) not null,
  PROCUREMENTSCHEDULEDATE DATE,
  REASON                  NVARCHAR2(500),
  SUBCOMPANY              VARCHAR2(50),
  APPLYUSER               NVARCHAR2(50),
  APPLYDATE               DATE,
  APPROVEUSER             NVARCHAR2(50),
  APPROVEDATE             DATE,
  APPROVERESULT           NUMBER(1),
  REJECTREASON            NVARCHAR2(500),
  CREATEDDATE             DATE
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
comment on column PROCUREMENTSCHEDULEHEAD.PSID
  is '单号';
comment on column PROCUREMENTSCHEDULEHEAD.PROCUREMENTSCHEDULEDATE
  is '计划采购日期';
comment on column PROCUREMENTSCHEDULEHEAD.REASON
  is '采购事由';
comment on column PROCUREMENTSCHEDULEHEAD.SUBCOMPANY
  is '分公司';
comment on column PROCUREMENTSCHEDULEHEAD.APPLYUSER
  is '申请人';
comment on column PROCUREMENTSCHEDULEHEAD.APPLYDATE
  is '申请日期';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVEUSER
  is '审核人';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVEDATE
  is '审核日期';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVERESULT
  is '审核结果(同意,拒绝)';
comment on column PROCUREMENTSCHEDULEHEAD.REJECTREASON
  is '拒绝理由';
comment on column PROCUREMENTSCHEDULEHEAD.CREATEDDATE
  is '创建日期';
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
  DETAILID           VARCHAR2(50) not null,
  ASSETCATEGORYID    VARCHAR2(50),
  ASSETNAME          NVARCHAR2(100),
  ASSETSPECIFICATION NVARCHAR2(100),
  UNITPRICE          NUMBER(18,2),
  PLANNUMBER         NUMBER(18),
  PSID               VARCHAR2(50)
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
comment on column PROCUREMENTSCHEDULEDETAIL.DETAILID
  is '明细Id';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETCATEGORYID
  is '设备类别';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETNAME
  is '设备名称';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETSPECIFICATION
  is '设备规格';
comment on column PROCUREMENTSCHEDULEDETAIL.UNITPRICE
  is '单价';
comment on column PROCUREMENTSCHEDULEDETAIL.PLANNUMBER
  is '计划采购数量';
comment on column PROCUREMENTSCHEDULEDETAIL.PSID
  is '计划采购单Id';
alter table PROCUREMENTSCHEDULEDETAIL
  add constraint PK__PROSCHEDULE_DETAIL_ID primary key (DETAILID)
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
alter table PROCUREMENTSCHEDULEDETAIL
  add constraint FK__PROSCHEDULE__ID foreign key (PSID)
  references PROCUREMENTSCHEDULEHEAD (PSID);

prompt Creating ROLEINFO...
create table ROLEINFO
(
  ROLEID    VARCHAR2(40) not null,
  ROLENAME  NVARCHAR2(20),
  ROLESTATE NUMBER(1)
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
comment on table ROLEINFO
  is '角色表';
comment on column ROLEINFO.ROLEID
  is '角色ID';
comment on column ROLEINFO.ROLENAME
  is '角色名';
comment on column ROLEINFO.ROLESTATE
  is '角色状态';
alter table ROLEINFO
  add constraint PK_ROLEID primary key (ROLEID)
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

prompt Creating ROLEPERMISSION...
create table ROLEPERMISSION
(
  ROLEID           VARCHAR2(40) not null,
  MENUID           VARCHAR2(40) not null,
  REMARK           NVARCHAR2(400),
  LASTMODIFIEDDATE DATE,
  LASTMODIFIEDBY   VARCHAR2(40)
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
comment on table ROLEPERMISSION
  is '角色权限表';
comment on column ROLEPERMISSION.ROLEID
  is '角色编号';
comment on column ROLEPERMISSION.MENUID
  is '菜单编号';
comment on column ROLEPERMISSION.REMARK
  is '备注';
comment on column ROLEPERMISSION.LASTMODIFIEDDATE
  is '最近修改时间';
comment on column ROLEPERMISSION.LASTMODIFIEDBY
  is '最近修改者';
alter table ROLEPERMISSION
  add constraint FK_ROLE_MENUID primary key (ROLEID, MENUID)
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

prompt Creating SUBCOMPANYINFO...
create table SUBCOMPANYINFO
(
  SUBCOMPANYID   NUMBER not null,
  SUBCOMPANYNAME NVARCHAR2(40),
  FGSSORTID      VARCHAR2(100),
  SUBCOMPANYCODE VARCHAR2(3)
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
comment on table SUBCOMPANYINFO
  is '分公司信息表';
comment on column SUBCOMPANYINFO.SUBCOMPANYID
  is '分公司编号';
comment on column SUBCOMPANYINFO.SUBCOMPANYNAME
  is '分公司名称';
comment on column SUBCOMPANYINFO.FGSSORTID
  is '分公司排序ID';
comment on column SUBCOMPANYINFO.SUBCOMPANYCODE
  is '分公司编码(700,701,702)';
alter table SUBCOMPANYINFO
  add constraint PK_SUBCOMPANYID primary key (SUBCOMPANYID)
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

prompt Creating T_USER...
create table T_USER
(
  ID           VARCHAR2(50) default sys_guid() not null,
  USERCODE     VARCHAR2(50),
  USERNAME     VARCHAR2(100),
  LOGINID      VARCHAR2(100),
  USERPASSWORD VARCHAR2(100),
  ISLOCK       VARCHAR2(10),
  ADMINFLAG    VARCHAR2(50),
  NOTE         VARCHAR2(100),
  EMAIL        VARCHAR2(100),
  EXT1         VARCHAR2(100),
  OAID         NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    minextents 1
    maxextents unlimited
  );
comment on table T_USER
  is '系统用户表';
comment on column T_USER.ID
  is '用户ID';
comment on column T_USER.USERNAME
  is '用户姓名';
comment on column T_USER.LOGINID
  is '登录账号';
comment on column T_USER.USERPASSWORD
  is '登录密码';
alter table T_USER
  add constraint PK_T_USER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    minextents 1
    maxextents unlimited
  );

prompt Creating USERMAPROLEINFO...
create table USERMAPROLEINFO
(
  USERID           VARCHAR2(40) not null,
  ROLEID           VARCHAR2(40) not null,
  LASTMODIFIEDDATE DATE,
  LASTMODIFIEDBY   VARCHAR2(40)
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
comment on table USERMAPROLEINFO
  is '用户角色表';
comment on column USERMAPROLEINFO.USERID
  is '用户ID';
comment on column USERMAPROLEINFO.ROLEID
  is '角色ID';
comment on column USERMAPROLEINFO.LASTMODIFIEDDATE
  is '最近修改时间';
comment on column USERMAPROLEINFO.LASTMODIFIEDBY
  is '最近修改者';
alter table USERMAPROLEINFO
  add constraint PK_USER_ROLE_ID primary key (USERID, ROLEID)
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

prompt Disabling triggers for ASSET...
alter table ASSET disable all triggers;
prompt Disabling triggers for ASSETCATEGORY...
alter table ASSETCATEGORY disable all triggers;
prompt Disabling triggers for ASSETMAINTAIN...
alter table ASSETMAINTAIN disable all triggers;
prompt Disabling triggers for ASSETMAINTAINDETAIL...
alter table ASSETMAINTAINDETAIL disable all triggers;
prompt Disabling triggers for ASSETMOVE...
alter table ASSETMOVE disable all triggers;
prompt Disabling triggers for ASSETMOVEDETAIL...
alter table ASSETMOVEDETAIL disable all triggers;
prompt Disabling triggers for ASSETREMOVE...
alter table ASSETREMOVE disable all triggers;
prompt Disabling triggers for ASSETREMOVEDETAIL...
alter table ASSETREMOVEDETAIL disable all triggers;
prompt Disabling triggers for ASSETSETUPINFO...
alter table ASSETSETUPINFO disable all triggers;
prompt Disabling triggers for ASSETSETUPDETAIL...
alter table ASSETSETUPDETAIL disable all triggers;
prompt Disabling triggers for ASSETSUPPLIER...
alter table ASSETSUPPLIER disable all triggers;
prompt Disabling triggers for BACCOUNT...
alter table BACCOUNT disable all triggers;
prompt Disabling triggers for CODERULE...
alter table CODERULE disable all triggers;
prompt Disabling triggers for LB_FGS...
alter table LB_FGS disable all triggers;
prompt Disabling triggers for LB_FGS_XMT...
alter table LB_FGS_XMT disable all triggers;
prompt Disabling triggers for MENUITEM...
alter table MENUITEM disable all triggers;
prompt Disabling triggers for PROCUREMENTCONTRACT...
alter table PROCUREMENTCONTRACT disable all triggers;
prompt Disabling triggers for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL disable all triggers;
prompt Disabling triggers for PROCUREMENTSCHEDULEHEAD...
alter table PROCUREMENTSCHEDULEHEAD disable all triggers;
prompt Disabling triggers for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL disable all triggers;
prompt Disabling triggers for ROLEINFO...
alter table ROLEINFO disable all triggers;
prompt Disabling triggers for ROLEPERMISSION...
alter table ROLEPERMISSION disable all triggers;
prompt Disabling triggers for SUBCOMPANYINFO...
alter table SUBCOMPANYINFO disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for USERMAPROLEINFO...
alter table USERMAPROLEINFO disable all triggers;
prompt Disabling foreign key constraints for ASSETMAINTAINDETAIL...
alter table ASSETMAINTAINDETAIL disable constraint FK_ASSETMAINTAINDETAIL_MAINID;
prompt Disabling foreign key constraints for ASSETMOVEDETAIL...
alter table ASSETMOVEDETAIL disable constraint FK_ASSETMOVEDETAIL_MOVEID;
prompt Disabling foreign key constraints for ASSETREMOVEDETAIL...
alter table ASSETREMOVEDETAIL disable constraint FK_ASSETREMOVEDETAIL_MOVEID;
prompt Disabling foreign key constraints for ASSETSETUPDETAIL...
alter table ASSETSETUPDETAIL disable constraint FK_ASSETSETUPDETAIL_SETUPID;
prompt Disabling foreign key constraints for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL disable constraint FK_PROCONTRACT_CONTRACTID;
prompt Disabling foreign key constraints for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL disable constraint FK__PROSCHEDULE__ID;
prompt Loading ASSET...
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY, CONTRACTID, CONTRACTDETAILID)
values ('ZR70101010002', '0101', '11', '12', 2, 12, 1, '10', 0, 0, '01', to_date('31-05-2012', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), '11', null, '6609', null, null);
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY, CONTRACTID, CONTRACTDETAILID)
values ('ZR70101010001', '0101', '设备名称', '设备名称', 2, 10, 1, '设备名称', 0, 0, '02', to_date('17-05-2012', 'dd-mm-yyyy'), to_date('17-05-2022', 'dd-mm-yyyy'), '设备名称', null, '6609', null, null);
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY, CONTRACTID, CONTRACTDETAILID)
values ('ZR70401010001', '0101', '设备名称', '设备名称', 2, 10, 11, '设备名称', 0, 0, '02', to_date('24-05-2012', 'dd-mm-yyyy'), to_date('24-05-2022', 'dd-mm-yyyy'), '设备名称', null, '6613', null, null);
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY, CONTRACTID, CONTRACTDETAILID)
values ('ZR660903010001', '0301', 'NewEquipment', 'NewEquipment', 2, 10, 1, 'NewEquipment', 0, 0, '03', to_date('04-05-2012', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 'NewEquipment', null, '6609', null, null);
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY, CONTRACTID, CONTRACTDETAILID)
values ('ZR660902010001', '0201', '设备名称', '设备名称', 2, 9, 1, '设备名称', 0, 0, '02', to_date('20-03-2012', 'dd-mm-yyyy'), to_date('20-03-2021', 'dd-mm-yyyy'), '设备名称1', null, '6609', null, null);
commit;
prompt 5 records loaded
prompt Loading ASSETCATEGORY...
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('01', null, '浦江', null, null, null, '01');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('02', null, '科技网', null, null, null, '02');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('03', null, '光显', null, null, null, '03');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0101', '01', '电脑', null, null, null, '01');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0102', '01', '闸机', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0103', '01', 'LED显示屏', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0104', '01', '发卡器', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0201', '02', '交换机', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0301', '03', 'DVR主机', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0302', '03', 'DVS主机', null, null, null, null);
commit;
prompt 10 records loaded
prompt Loading ASSETMAINTAIN...
prompt Table is empty
prompt Loading ASSETMAINTAINDETAIL...
prompt Table is empty
prompt Loading ASSETMOVE...
prompt Table is empty
prompt Loading ASSETMOVEDETAIL...
prompt Table is empty
prompt Loading ASSETREMOVE...
prompt Table is empty
prompt Loading ASSETREMOVEDETAIL...
prompt Table is empty
prompt Loading ASSETSETUPINFO...
prompt Table is empty
prompt Loading ASSETSETUPDETAIL...
prompt Table is empty
prompt Loading ASSETSUPPLIER...
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK, SYSTEM, ASSETCATEGORYID)
values ('01', '浦江', null, '监控', '01');
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK, SYSTEM, ASSETCATEGORYID)
values ('02', '科技网', null, '门禁', '02');
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK, SYSTEM, ASSETCATEGORYID)
values ('03', '光显', null, '监控', '01');
commit;
prompt 3 records loaded
prompt Loading BACCOUNT...
prompt Table is empty
prompt Loading CODERULE...
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PCONTRACT', null, 1, 1, 1, 4, 0, 8, 'PCONTRACT201205290008');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PSH', '采购计划单', 1, 1, 1, 4, 0, 12, 'PSH201205260012');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR7010101', null, 1, 0, 1, 4, 0, 2, 'ZR70101010002');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR7040101', null, 1, 0, 1, 4, 0, 1, 'ZR70401010001');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090301', null, 1, 0, 1, 4, 0, 1, 'ZR660903010001');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PS', null, 1, 1, 1, 4, 0, 10, 'PS201205290010');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090101', null, 1, 1, 1, 4, 0, 2, 'ZR66090101201205270002');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090201', null, 1, 0, 1, 4, 0, 1, 'ZR660902010001');
commit;
prompt 8 records loaded
prompt Loading LB_FGS...
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (6609, '一分公司', '001', '裴建荣', '13901775087', '徐永平', '13601721693');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (6611, '二分公司', '002', '蒋惠忠', '15000855610', '孙博', '13774220439');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (6612, '三分公司', '003', '陆勤', '13003109355', '虞加庆', '13816008111');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (6613, '四分公司', '004', '胡燕燕', '13601900372', '王荣盛', '13041686673');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (7542, '七分公司', '007', '赵迎桃', '13901779025', '王才军', '13564742638');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (15103, '五分公司', '005', '冯明', '13701777943', '王佳玮', '13774310525');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (7544, '设备租赁', '029', '陈荣', '13917118128', '许晓彬', '13482245864');
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (20153, '天津分公司', '788', null, null, null, null);
insert into LB_FGS (FGSID, FGS, FGSSORTID, FGLD, FGLDLXDH, WLLZGY, WLLZGYLXDH)
values (8320, '北京分公司', '999', null, null, null, null);
commit;
prompt 9 records loaded
prompt Loading LB_FGS_XMT...
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20647, '生命科学基础研究与应用研究平台及技术保障条件建设项目', 7542, '七分公司', 'QBXM', '成其', '15221859016', to_date('30-06-2009', 'dd-mm-yyyy'), to_date('30-06-2011', 'dd-mm-yyyy'), 105842, 35589, 140012.77, 62591.15, 20499.05, 85778.93, 16709, 229464.61, 626284, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18585, '金虹桥国际中心', 7542, '七分公司', 'QBXM', '童鑫海', '13585706580', to_date('01-08-2008', 'dd-mm-yyyy'), to_date('22-01-2012', 'dd-mm-yyyy'), 263000, 96101.2316, 257526.61, 351119.27, 52490.42, 98390.89, 123223, 469391.68, 626285, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19262, '华东理工奉贤校区图文信息中心', 6609, '一分公司', 'SBXM', '夏连明', '13564248190', to_date('15-12-2008', 'dd-mm-yyyy'), to_date('30-11-2010', 'dd-mm-yyyy'), 32715.76, 10488.8375, null, null, null, null, null, null, 626286, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18582, '浦东新区金桥S1地块服务公寓工程', 6609, '一分公司', 'SBXM', '何玮炯', '13801853217', to_date('26-09-2008', 'dd-mm-yyyy'), to_date('26-07-2010', 'dd-mm-yyyy'), 67886, 18799.3743, 66965, 33085, 10919, 57626, 13577.2, 88868, 626287, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19322, '金桥28#地块通用厂房701', 6609, '一分公司', 'SBXM', '郑小川', '18721551436', to_date('10-02-2009', 'dd-mm-yyyy'), to_date('01-08-2010', 'dd-mm-yyyy'), 149198, 29299.7199, 63955, 84548, 24070, 73075, 13984, 262990, 626288, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21269, '上海漕河泾开发区浦江高科技园A1地块工业厂房项目一期工程', 6611, '二分公司', 'QBXM', '谈启新', '13681757373', to_date('08-11-2009', 'dd-mm-yyyy'), to_date('20-06-2011', 'dd-mm-yyyy'), 118723, 44850.0049, 147408.07, 76131.95, 28957.42, 69184.4, 27592, 206177.01, 626289, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20666, '上海电影博物馆电影艺术研究所业务大楼', 6611, '二分公司', 'SBXM', '钟力芸', '13601895896', null, null, 103515, 32922.59, 174760.59, 72267.43, 24593.54, 69994.86, 21679.42, 170577.7, 626290, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21268, '轨道交通10号线江湾五角场客运交通枢纽及江湾体育场设备管理用房', 6611, '二分公司', 'QBXM', '唐有金', '13621976026', to_date('01-01-2010', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 27615, 7695.6359, 0, 6669.86, 2404.23, 2678.23, 0, 617606.22, 626292, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18422, '徐汇区区级机关办公大楼', 7542, '七分公司', 'SBXM', '毛春芳', '13918383113', null, null, 25820, 7924.0291, null, null, null, null, null, null, 626293, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22367, '上海建七实业有限公司武夷路150号办公楼大修装饰工程', 15103, '五分公司', 'SBXM', '朱明昌', '13402105603', null, null, null, null, null, null, null, null, null, null, 626294, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19923, '中科院上海战略高技术研发技术保障条件建设项目703', 6612, '三分公司', 'QBXM', '张豫', '13391288823', null, null, null, null, null, null, null, null, null, null, 626295, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21248, '中科院交叉前沿科研项目', 6612, '三分公司', 'QBXM', '史修胜', '13311621027', to_date('25-02-2010', 'dd-mm-yyyy'), to_date('25-09-2011', 'dd-mm-yyyy'), 55463, 19000, 66265.36, 41972.07, 13933.82, 15556.8, 11570.47, 67436.98, 626296, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18462, '苏州中旅花园五标段', 6613, '四分公司', 'SBXM', '陈松青', '13338707513', to_date('26-06-2008', 'dd-mm-yyyy'), to_date('20-09-2009', 'dd-mm-yyyy'), 83000, 8898.4196, null, null, null, null, null, null, 626298, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (15722, '上海盛大中心工程', 6612, '三分公司', 'QBXM', '许华民', '13761211737', null, null, null, null, null, null, null, null, null, null, 626300, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21807, '上海市奉贤区中心医院迁建工程', 6612, '三分公司', 'QBXM', '邵立人', '13801872128', to_date('08-02-2010', 'dd-mm-yyyy'), to_date('19-11-2011', 'dd-mm-yyyy'), 96156, 37031.6983, 61739, 34836, 18883, 106833, 5838, 183700, 626301, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19182, '外高桥海洋工程科技办公楼', 6612, '三分公司', 'QBXM', '王邵峰', '13671679037', to_date('23-04-2010', 'dd-mm-yyyy'), to_date('20-09-2010', 'dd-mm-yyyy'), 22041, 4524.9052, 11114, null, null, 6837, 2545, 12825, 626302, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21207, '上海建工构件公司办公楼', 6612, '三分公司', 'SBXM', '孙迅非', '13918213810', to_date('25-03-2010', 'dd-mm-yyyy'), to_date('25-03-2011', 'dd-mm-yyyy'), 9650, 2322.5261, 8703.57, 6620.91, 1533.64, 6439.16, 2050.35, 15133.12, 626303, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18402, '奉城医院改扩建工程', 6612, '三分公司', 'SBXM', '张坚', '13817260627', to_date('01-01-2010', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'), 27956, 6883.1538, 12810, 16637, 3330, 10490, 5591.2, 27993, 626304, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22528, '天津市文化中心商业体工程', 6612, '三分公司', 'QBXM', '严国耀', '13701804497', to_date('05-06-2010', 'dd-mm-yyyy'), to_date('20-11-2011', 'dd-mm-yyyy'), 417798, 78105.7802, null, null, null, null, null, null, 626306, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20165, '天津市小伙巷地区C地块住宅项目', 6612, '三分公司', 'QBXM', '王瑞清', '15922153879', to_date('01-08-2010', 'dd-mm-yyyy'), to_date('31-07-2012', 'dd-mm-yyyy'), 97251, 22925.3487, 8703.57, 6620.91, 1533.64, 6439.16, 2050.35, 15133.12, 626307, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21688, '天津海河教育园区一期综合配套工程南区公建房屋2标段', 6612, '三分公司', 'QBXM', '俞国平', '15222857288', to_date('15-01-2010', 'dd-mm-yyyy'), to_date('30-04-2011', 'dd-mm-yyyy'), 77000, 34981.15, null, null, null, null, null, null, 626308, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22088, '天津空港物流加工区14#地项目一期二标段工程', 6612, '三分公司', 'SBXM', '康军', '18602614632', to_date('05-04-2010', 'dd-mm-yyyy'), to_date('05-04-2011', 'dd-mm-yyyy'), 102372.95, 24151.3166, null, null, null, null, null, null, 626310, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18644, '浦东新区区委党校迁建工程', 6611, '二分公司', 'QBXM', '郑学麟', '13381737762', null, null, null, null, null, null, null, null, null, null, 626311, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19162, '上海市配套商品房浦东曹路镇基地2号地块工程', 6611, '二分公司', 'SBXM', '李裕华', '13052027963', null, null, null, 25000, null, null, null, null, null, null, 626312, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19022, '上海水上竞技中心工程', 6613, '四分公司', 'QBXM', '洪善华', '13816880989', to_date('01-01-2009', 'dd-mm-yyyy'), to_date('31-03-2011', 'dd-mm-yyyy'), 90000, 40000, null, null, null, null, null, null, 626314, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18142, '上海汇山工程东块 （北外滩）', 6613, '四分公司', 'QBXM', '赵士盛', '13918900230', to_date('10-06-2010', 'dd-mm-yyyy'), to_date('03-02-2011', 'dd-mm-yyyy'), 192570, 69721.0895, 139276.3, 208096.59, 29618.88, 101077.15, 19106.58, 399066.47, 626315, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21727, '广灵二路264弄经济适用房三期工程', 6609, '一分公司', 'SBXM', '黄强', '18916585076', to_date('28-12-2009', 'dd-mm-yyyy'), to_date('28-09-2011', 'dd-mm-yyyy'), 30555, 5436.5, 25794.67, 11502.67, 5069.19, 37679.43, 2438.78, 41804.62, 626316, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22287, '长兴岛潘园公路改建工程4标', 6613, '四分公司', 'SBXM', '卢兴村', '15821736259', to_date('25-12-2009', 'dd-mm-yyyy'), to_date('30-06-2011', 'dd-mm-yyyy'), 0, 8100, null, null, null, null, null, 710314, 626318, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21427, '上海闵行航天城BIPV光伏停车场示范电站建设项目', 6613, '四分公司', 'SBXM', '张宝库', '15921390567', to_date('31-12-2009', 'dd-mm-yyyy'), to_date('28-07-2010', 'dd-mm-yyyy'), 22207, 10500, null, null, null, null, null, null, 626320, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20123, '上海虹桥国际机场扩建工程旅客过夜用房', 6613, '四分公司', 'QBXM', '顾根明', '13817510838', null, null, null, null, null, null, null, null, null, null, 626321, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21108, '上海市公安局长宁分局新建天山路派出所工程', 6613, '四分公司', 'SBXM', '吴军华', '13816227191', null, null, null, null, null, null, null, null, null, null, 626323, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22767, '中航翔凤国际物流（上海）有限公司一期工程1标段', 6613, '四分公司', 'SBXM', '顾才章', '15800716246', to_date('01-07-2010', 'dd-mm-yyyy'), to_date('25-01-2011', 'dd-mm-yyyy'), null, 3438.5138, 5186, 1318, 5194, 1794, 0, 25303, 626326, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22207, '上海市城市建设投资开发总公司企业自用办公楼', 6613, '四分公司', 'SBXM', '陆福弟', '13024187478', to_date('29-03-2010', 'dd-mm-yyyy'), to_date('10-05-2011', 'dd-mm-yyyy'), 22700, 6998.2798, 11485.54, 15116.45, 4200.35, 9914.32, 1561, 28798.89, 626327, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21907, '安徽无为焦炭联产甲醇工程一期年产60万吨甲醇项目A3标段', 6613, '四分公司', 'SBXM', '杨明达', '13122141960', null, null, null, null, null, null, null, null, null, null, 626328, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21908, '安徽无为焦炭联产甲醇工程一期年产60万吨甲醇项目B2标段', 6613, '四分公司', 'SBXM', '杨明达', '13122141960', null, null, null, null, null, null, null, null, null, null, 626329, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21987, '安徽无为焦炭联产甲醇工程一期年产60万吨甲醇项目A1标段', 6613, '四分公司', 'SBXM', '杨明达', '13122141960', null, null, null, null, null, null, null, null, null, null, 626330, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21988, '安徽无为焦炭联产甲醇工程一期年产60万吨甲醇项目B1标段', 6613, '四分公司', 'SBXM', '杨明达', '13122141960', null, null, null, null, null, null, null, null, null, null, 626331, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21127, '北外滩浦江国际金融广场', 6609, '一分公司', 'QBXM', '胡小君', '13817073163', to_date('30-12-2009', 'dd-mm-yyyy'), to_date('24-09-2012', 'dd-mm-yyyy'), 119536, 63179.9802, 212013.1, 147579.38, 37331.4, 221196.85, 37230, 220955.47, 626332, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22387, '科技绿洲三期工业厂房及辅助用房工程桩基', 7542, '七分公司', 'QBXM', '崔恒德', '13621994801', to_date('29-04-2010', 'dd-mm-yyyy'), to_date('23-06-2010', 'dd-mm-yyyy'), null, 621.982, null, null, null, null, null, 33738, 626334, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20967, '闵行区教师进修学院迁建工程', 7542, '七分公司', 'SBXM', '陈建江', '13482828186', to_date('20-08-2009', 'dd-mm-yyyy'), to_date('19-02-2011', 'dd-mm-yyyy'), 19990, 3979.8512, 15032, 6204, 4734, 19575, 4280, 33738, 626335, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21307, '上海市电力公司生产技能培训基地改建工程', 7542, '七分公司', 'SBXM', '陈伟杰', '13816758414', null, null, null, null, null, null, null, null, null, null, 626336, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18086, '番愚路483地块商办楼', 7542, '七分公司', 'SBXM', '陈王平', '13020252116', to_date('18-01-2008', 'dd-mm-yyyy'), to_date('27-12-2009', 'dd-mm-yyyy'), 21238, 8850.0541, 33116, 30272, 10501, 32405, 5913, 64695, 626337, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18804, '中国航空无线电电子研究所紫竹新所区项目', 7542, '七分公司', 'SBXM', '陈建江', '13482828186', to_date('15-02-2009', 'dd-mm-yyyy'), to_date('19-02-2010', 'dd-mm-yyyy'), 19005.53, 5825.1588, 20059, 7201, 3259, 10770, 3916, 45209, 626338, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22507, '上海电气集团桂箐路 99 号研发中心二期工程', 7542, '七分公司', 'SBXM', '陶国华', '13391129492', to_date('10-04-2010', 'dd-mm-yyyy'), to_date('25-11-2010', 'dd-mm-yyyy'), null, 3787.0262, null, null, null, null, null, null, 626339, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22007, '国家电网公司信息系统上海容灾中心工程', 7542, '七分公司', 'SBXM', '秦栋盛', '13816656772', to_date('10-05-2010', 'dd-mm-yyyy'), to_date('05-11-2010', 'dd-mm-yyyy'), 28112, 15510.5377, null, null, null, null, null, null, 626340, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21827, '上海旗忠网球中心新建餐厅展厅连廊工程', 7542, '七分公司', 'SBXM', '孙培华', '13918662808', to_date('01-10-2010', 'dd-mm-yyyy'), to_date('31-10-2010', 'dd-mm-yyyy'), 222, 222, 2, 2, 2, 2, 2, 2, 626341, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19602, '上海市轨道交通12号线工程2A标段虹梅路站土建703', 6612, '三分公司', 'QBXM', '潘志平', '13801852960', to_date('15-03-2009', 'dd-mm-yyyy'), to_date('30-06-2011', 'dd-mm-yyyy'), 24145, 18520.7038, null, null, null, null, null, null, 626342, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21327, '上海市消化病医院工程', 15103, '五分公司', 'SBXM', '林昌世', '13482513335', to_date('16-11-2009', 'dd-mm-yyyy'), to_date('22-08-2011', 'dd-mm-yyyy'), 17520, 10726.1893, 24329.48, 2114.18, 1752.65, 8111.77, 3245, 16569.46, 626343, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21627, '临港新城主城区WNW-C4街坊配套商品房南侧配套商业设施工程', 15103, '五分公司', 'SBXM', '张义田', '13482795073', to_date('15-12-2009', 'dd-mm-yyyy'), to_date('24-12-2010', 'dd-mm-yyyy'), 14015, 5702.9684, 14906.11, 6017.87, 2290.37, 10004.75, 3339, 10076.4, 626344, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21328, '上海电力学院平凉路校区扩建二期图文信息中心和地', 15103, '五分公司', 'SBXM', '沈进浩', '13045655199', null, null, null, null, null, null, null, null, null, null, 626345, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22050, '上海金融学院上川路1111号厂房装修二标段工程', 15103, '五分公司', 'SBXM', '葛锦龙', '13564186298', null, null, null, null, null, null, null, null, null, null, 626346, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21007, '上海市消防局229工程', 15103, '五分公司', 'SBXM', '陈永康', '13818338373', null, null, null, null, null, null, null, null, null, null, 626348, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21067, '崇明县堡镇人民医院整体迁建工程', 15103, '五分公司', 'SBXM', '风中新', '13671733796', to_date('08-10-2009', 'dd-mm-yyyy'), to_date('19-05-2011', 'dd-mm-yyyy'), 50055.66, 14999.926, 52173, 16802, 13685, 72892, 11357, 142325, 626349, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19943, '租赁分公司', 7544, '设备租赁', 'QBXM', '陈荣', '13917118128', null, null, null, null, null, null, null, null, null, null, 626350, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21455, '青浦徐泾基地诸光路地块经济适用房建设项目', 15103, '五分公司', 'SBXM', '周根生', '13501920218', to_date('28-02-2010', 'dd-mm-yyyy'), to_date('10-09-2011', 'dd-mm-yyyy'), 160260, 28922.5194, 54972, 58444, 17408, 88446, 8479, 152929, 626351, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22247, '新凯家园三期B块住宅及公建项目', 15103, '五分公司', 'SBXM', '周根生', '13501920218', to_date('30-04-2010', 'dd-mm-yyyy'), to_date('16-10-2011', 'dd-mm-yyyy'), 88244.73, 16150.0318, 45048.21, 26744.11, 9009.64, 56636.82, 17648.95, 114842.26, 626352, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22828, '碧云别墅银杏苑（金桥S3地块住宅项目）', 15103, '五分公司', 'SBXM', '徐夏强', '13701789043', to_date('15-06-2010', 'dd-mm-yyyy'), to_date('03-06-2012', 'dd-mm-yyyy'), 56688, 13788.8388, 34845, 13459, 6656, 38731, 7086, 98123, 626353, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22987, '上海绿地集团北京大兴19#地块绿地中央广场一期工程', 6611, '二分公司', 'QBXM', '葛德明', '京13681003450', to_date('15-10-2010', 'dd-mm-yyyy'), to_date('30-07-2011', 'dd-mm-yyyy'), 90000, 22000, null, null, null, null, null, null, 626355, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20162, '东丽湖万科城工业化', 20153, '天津分公司', 'QBXM', 'luo', null, null, null, null, null, null, null, null, null, null, null, 626356, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17242, '新建京沪高速铁路上海虹桥站及相关工程', 7542, '七分公司', 'QBXM', '钱凤美', '13611910717', null, null, null, null, null, null, null, null, null, null, 626357, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20388, '西安万科金色城品项目', 6613, '四分公司', 'QBXM', '楼财江', null, to_date('15-03-2008', 'dd-mm-yyyy'), to_date('01-02-2011', 'dd-mm-yyyy'), 309000, 37600, 1, null, null, null, null, null, 626358, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18382, '新建京沪高速铁路上海虹桥站及相关工程', 6612, '三分公司', 'QBXM', '费晓斌', '13774429535', null, null, null, null, null, null, null, null, null, null, 626297, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21267, '新建长宁区周家桥街道社区服务中心（周家桥派出所）工程', 6613, '四分公司', 'SBXM', '张美良', '13671747587', null, null, null, null, null, null, null, null, null, null, 626324, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20948, '大连绿城星海湾工程', 7542, '七分公司', 'QBXM', '潘文', '13604944718', to_date('01-03-2009', 'dd-mm-yyyy'), to_date('14-12-2012', 'dd-mm-yyyy'), 117565, 23830.708, 118020, 80856, 26612, 144696, 16995, 123239, 626354, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21647, '世博会浦东园区出入口广场停车场及配套设施3标', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867441, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21407, '安徽无为焦炭联产甲醇工程一期年产60万吨甲醇项目圆形料仓系统工程', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867442, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20847, '上海市公安局出入境长宁办证点装修工程', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867443, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19302, '长兴江南大道延长工程704', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867444, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18690, '虹桥交通枢纽东交通广场南北车库工程704', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867445, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18882, '虹桥综合交通枢纽市政配套工程11标段', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867446, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18302, '上海浦东三林城W13-4地块商业配套工程', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867447, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (15943, '浦东机场南进场路地道及配套工程北标段', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867448, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13942, '上海交通大学空天科学技术研究中心', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867449, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13482, '上海航天新区院本部大楼工程', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867450, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12782, '南京东路181号办公大楼装修', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867451, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12522, '沪警会堂', 6613, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867452, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22607, '上海交通大学医学院附属仁济医院（闵行）项目', 7542, null, null, null, null, null, null, null, 31581.5376, 96853, 43809, 24337, 76327, 21675, 171780, 867453, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21047, '莲花河畔后续工程', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867454, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20606, '上海虹桥综合交通枢纽地铁西站工程707', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867455, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19422, '虹桥机场公务机基地工程707', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867456, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19263, '中科院新药创制技术保障条件建设项目', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867457, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18803, '虹桥综合交通枢纽中央轴线公共配套地下空间工程（西西延伸段）', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867458, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (16467, '应用技术学院总体', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867459, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14562, '高宝金融大厦', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867460, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14582, '上海市公安局刑事侦查技术大楼', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867461, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9622, '古8、古9地块工程', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867462, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (10562, '中国民生银行总部大楼', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867463, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9662, '生化与细胞实验楼', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867464, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (7750, '武警指挥中心', 7542, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867465, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14722, '蓝光科技厂房', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867466, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14622, '东航浦东机组过夜公寓楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867467, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14442, '上海交通大学图书馆信息中心', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867468, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14422, '虹桥机场南北联络电缆改造工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867469, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14322, '新华联大厦东楼扩建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867470, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14282, '汉高公司中国技术中心工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867471, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14122, '加纳共和国塔马利国家体育场', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867472, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14042, '上海市公安局长宁分局新建教育训练馆和应急联动中心大楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867473, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14023, '松江线路板厂二期工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867474, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13943, '武警总队招待所', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867475, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13902, '宜嘉坊', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867476, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
commit;
prompt 100 records committed...
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13882, '上海化学工业区配套服务设施三期', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867477, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13822, '汽轮厂试车站厂房接长扩建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867478, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13802, '上海市公安局灵石路监区改建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867479, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13662, '上海三爱富10000吨/年聚偏氟乙烯和100吨六氟丙酮项目', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867480, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13602, '国航工作区一期业务楼综合保障楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867481, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13462, '金山沙滩排球景观改造工程商业用房', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867482, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13442, '临港重装备产业区一期市政E5（一标）道路工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867483, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13402, '吴泾化工厂', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867484, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13342, '西藏大厦', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867485, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13182, '交大综合实验楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867486, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21107, '露香园项目一期工程', 6613, '四分公司', 'QBXM', '吴永昌', '13651845231', to_date('28-08-2009', 'dd-mm-yyyy'), to_date('13-09-2012', 'dd-mm-yyyy'), 145202, 51020.2519, 246918.35, 104323.5, 34697.8, 136418.76, 20188, 208131.96, 626322, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22047, '上海新国际博览中心第9-12期项目工程', 6612, '三分公司', 'QBXM', '郭金国', '13816011596', to_date('28-02-2010', 'dd-mm-yyyy'), to_date('24-12-2010', 'dd-mm-yyyy'), 125832, 31996.3726, 212421.37, 41061.54, 27200.02, 43941.73, 30241.61, 86496.36, 626299, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23447, 'S6公路新建工程施工S6-7标', 6609, '一分公司', null, null, null, to_date('30-06-2010', 'dd-mm-yyyy'), to_date('25-03-2012', 'dd-mm-yyyy'), 0, 22622.2666, null, null, null, null, null, null, 876549, null, 0, to_date('17-11-2010 21:34:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23554, '上海长兴供电公司电力生产调度楼', 6609, '一分公司', null, null, null, to_date('28-09-2010', 'dd-mm-yyyy'), to_date('08-09-2012', 'dd-mm-yyyy'), 16085.1, 8194.1253, null, null, null, null, null, null, 876852, null, 0, to_date('18-11-2010 23:54:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13922, '上投佳苑工程', 6609, '一分公司', 'SBXM', '黄幸杰', '13564635321', to_date('08-03-2010', 'dd-mm-yyyy'), to_date('07-12-2010', 'dd-mm-yyyy'), 111361, 7660.0904, 89498.08, 10603.03, 17085.13, 102762.72, 9346.62, 108561.32, 626291, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22127, '上海市闸北区凯科大宁广场工程', 6612, '三分公司', 'SBXM', '周立军', '18918510042', to_date('15-01-2010', 'dd-mm-yyyy'), to_date('15-01-2012', 'dd-mm-yyyy'), 96012.05, 35683.7469, 89144, 79451, 17232, 24293, 19202.4, 44095, 626305, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21467, '上海市白龙港污水处理厂扩建二期工程', 6613, '四分公司', 'SBXM', '郭海利', '13761788719', to_date('20-06-2010', 'dd-mm-yyyy'), to_date('30-08-2011', 'dd-mm-yyyy'), null, 20505.0392, 54762, 47612, 19207, 2469, null, 110865, 626319, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21947, '普陀区中心医院外科医技综合楼', 15103, '五分公司', 'SBXM', '杨春峰', '13501726746', to_date('25-03-2010', 'dd-mm-yyyy'), to_date('05-09-2012', 'dd-mm-yyyy'), 40280, 12497.9282, 36124, 27935, 10654, 25458, 10076, 116415, 626347, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18104, '北京万科昌平工程', 6609, '一分公司', 'SBXM', '龚辉', '13681342377', to_date('01-10-2009', 'dd-mm-yyyy'), to_date('15-11-2011', 'dd-mm-yyyy'), 79307, 10015, null, null, null, null, null, null, 626333, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23407, '中国商飞设计研发中心主体和室外工程设计研发大楼主体施工工程', 6609, null, null, null, null, to_date('10-09-2010', 'dd-mm-yyyy'), to_date('18-11-2011', 'dd-mm-yyyy'), 70390, 27659.8256, 59906.85, 17588.46, 10095.53, 28397.46, 13382.55, 146757.66, 867487, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23007, '上海交通大学医学院附属瑞金医院（嘉定）项目', 15103, '五分公司', 'QBXM', '待定', null, to_date('15-06-2010', 'dd-mm-yyyy'), to_date('28-12-2011', 'dd-mm-yyyy'), 72000, 30689.8672, 76958, 37606, 27087, 114155, 9937, 260922, 867326, null, 0, to_date('26-10-2010 11:10:40', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21607, '张家浜楔型绿地住宅一期一标工程', 6611, '二分公司', 'SBXM', '汤一星', '15601727339', to_date('28-12-2009', 'dd-mm-yyyy'), to_date('28-09-2011', 'dd-mm-yyyy'), 138752, 29126.1341, 52075.21, 55270, 25407, 135340, 27750.4, 206452, 626313, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23975, '天津市文化中心商业体工程707', 7542, '七分公司', null, null, null, to_date('05-06-2010', 'dd-mm-yyyy'), to_date('20-11-2011', 'dd-mm-yyyy'), 417798, 78105.7802, null, null, null, null, null, null, 892302, null, 0, to_date('15-12-2010 14:12:30', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22089, '天津星梦工坊D区41-59号楼工程', 6612, '三分公司', 'SBXM', '王华荣', '13516125104', to_date('08-03-2010', 'dd-mm-yyyy'), to_date('12-01-2011', 'dd-mm-yyyy'), 25327.45, 7598.24, null, null, null, null, null, null, 626309, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23777, '上海漕河泾开发区浦江高科技园A1地块工业厂房项目二期工程', 6611, '二分公司', null, null, null, to_date('01-08-2010', 'dd-mm-yyyy'), to_date('09-04-2012', 'dd-mm-yyyy'), 96106, 37330.001, 78776, 71908, 24825, 59330, 18459, 191810, 896908, null, 0, to_date('27-12-2010 16:31:44', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23803, '中国商飞设计研发中心主体和室外工程客户选型中心、档案信息中心工程', 6609, '一分公司', null, null, null, to_date('30-11-2010', 'dd-mm-yyyy'), to_date('22-11-2011', 'dd-mm-yyyy'), 34188, 13690.2904, null, null, null, null, null, null, 896909, null, 0, to_date('27-12-2010 16:31:47', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23801, '大型客机研制保障条件建设项目一期工程数控加工中心工程', 6609, '一分公司', null, null, null, to_date('22-11-2010', 'dd-mm-yyyy'), to_date('01-10-2011', 'dd-mm-yyyy'), 10750, 5146.5239, null, null, null, null, null, null, 896910, null, 0, to_date('27-12-2010 16:31:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23802, '大型客机研制保障条件建设项目二期工程总装厂房桩基工程', 6609, '一分公司', null, null, null, to_date('30-09-2010', 'dd-mm-yyyy'), to_date('06-11-2010', 'dd-mm-yyyy'), 0, 466.8347, null, null, null, null, null, null, 896911, null, 0, to_date('27-12-2010 16:31:52', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21287, '轨道交通10号线江湾五角场客运交通枢纽及江湾体育场设备管理用房工程', 6611, null, null, null, null, to_date('15-10-2009', 'dd-mm-yyyy'), to_date('30-04-2010', 'dd-mm-yyyy'), 27615, 7695.6359, null, null, null, null, null, null, 867505, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24076, '天津滨海文化商务中心项目施工二标段工程', 6609, '一分公司', null, null, null, to_date('01-09-2010', 'dd-mm-yyyy'), to_date('16-08-2011', 'dd-mm-yyyy'), 91806, 83890.6701, null, null, null, null, null, null, 901297, null, 0, to_date('18-01-2011 10:17:10', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24138, '天津申港置业发展有限公司岭尚家园（二期）施工总承包工程', 6612, '三分公司', null, null, null, to_date('01-01-2011', 'dd-mm-yyyy'), to_date('31-12-2011', 'dd-mm-yyyy'), 106509, 26167.1236, null, null, null, null, null, null, 917658, null, 0, to_date('01-03-2011 15:19:40', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24139, '轨道交通10号线江湾体育场站地下空间开发土建施工工程', 6611, '二分公司', null, null, null, to_date('01-03-2011', 'dd-mm-yyyy'), to_date('30-06-2012', 'dd-mm-yyyy'), 0, 16089.953, null, null, null, null, null, null, 917659, null, 0, to_date('01-03-2011 15:19:43', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24142, '浦东机场西货运区2#货运站项目', 6609, '一分公司', null, null, null, to_date('21-02-2011', 'dd-mm-yyyy'), to_date('16-05-2011', 'dd-mm-yyyy'), 1590, 869.1403, null, null, null, null, null, null, 917660, null, 0, to_date('01-03-2011 15:19:46', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24143, '北京昌平科技园区居住及配套项目二期工程（北京金隅万科）', 6609, '一分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 917661, null, 0, to_date('01-03-2011 15:19:49', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24137, '宝山纺织机械生产基地（一期）项目工程', 7542, '七分公司', null, null, null, to_date('28-02-2011', 'dd-mm-yyyy'), to_date('23-10-2011', 'dd-mm-yyyy'), 81266, 16145.7803, null, null, null, null, null, null, 917662, null, 0, to_date('01-03-2011 15:20:05', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24135, '上海大型居住社区奉贤区南桥基地J4-1、J4-2地块配套商品房', 7542, '七分公司', null, null, null, to_date('30-12-2010', 'dd-mm-yyyy'), to_date('11-06-2012', 'dd-mm-yyyy'), 151664.57, 28637.4457, null, null, null, null, null, null, 917663, null, 0, to_date('01-03-2011 15:20:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24136, '上海大型居住社区奉贤区南桥基地J4-3、J4-4地块配套商品房', 7542, '七分公司', null, null, null, to_date('30-12-2010', 'dd-mm-yyyy'), to_date('11-06-2012', 'dd-mm-yyyy'), 185724.34, 36500.3573, null, null, null, null, null, null, 917664, null, 0, to_date('01-03-2011 15:20:10', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24134, '凌空路（迎宾大道-远航路）新建工程4标', 7542, '七分公司', null, null, null, to_date('31-12-2010', 'dd-mm-yyyy'), to_date('30-12-2012', 'dd-mm-yyyy'), null, 2941.8317, null, null, null, null, null, null, 917665, null, 0, to_date('01-03-2011 15:20:12', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24075, '客户支援中心和技术交流中心工程', 15103, '五分公司', null, null, null, to_date('27-12-2010', 'dd-mm-yyyy'), to_date('18-05-2012', 'dd-mm-yyyy'), 62500, 28260.1186, null, null, null, null, null, null, 917718, null, 0, to_date('01-03-2011 15:39:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23994, '天津市文化中心商业体工程707', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 937372, null, 0, to_date('28-03-2011 09:51:44', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23834, '闵行航天城二期工程八0三所建设项目1标段1、2、3、5、8#', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 937373, null, 0, to_date('28-03-2011 09:51:47', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24241, '京西宾馆地下隐蔽防护、维护修缮工程', 6611, '二分公司', null, null, null, to_date('20-03-2011', 'dd-mm-yyyy'), to_date('31-07-2012', 'dd-mm-yyyy'), 139148, -1, null, null, null, null, null, null, 937374, null, 0, to_date('28-03-2011 09:51:53', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24301, '俄罗斯圣彼得堡波罗的海39-1工程', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 956771, null, 0, to_date('21-04-2011 11:28:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '3', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24338, '天津惠灵顿国际学校体育馆项目工程', 6612, '三分公司', null, null, null, to_date('25-01-2011', 'dd-mm-yyyy'), to_date('30-05-2011', 'dd-mm-yyyy'), 2068.52, 599.6652, null, null, null, null, null, null, 958924, null, 0, to_date('27-04-2011 08:30:46', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24339, '轨道交通10号线江湾五角场客运交通枢纽装修及安装工程', 6611, '二分公司', null, null, null, to_date('24-01-2011', 'dd-mm-yyyy'), to_date('30-04-2011', 'dd-mm-yyyy'), 0, 2496.3218, null, null, null, null, null, null, 958925, null, 0, to_date('27-04-2011 08:30:49', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24346, '广阳家园C、D项目8#商务办公楼等6项及地下车库', 6611, '二分公司', null, null, null, to_date('30-03-2011', 'dd-mm-yyyy'), to_date('26-07-2013', 'dd-mm-yyyy'), 150989, 58879.57, null, null, null, null, null, null, 964714, null, 0, to_date('10-05-2011 15:33:41', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24347, '捷克住宅小区公寓楼项目', 6609, '一分公司', null, null, null, to_date('11-01-2011', 'dd-mm-yyyy'), to_date('16-05-2012', 'dd-mm-yyyy'), 20496.9, 4088.2416, null, null, null, null, null, null, 964715, null, 0, to_date('10-05-2011 15:33:44', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24360, '盘龙谷文化城一期工程H地块1-32#楼总包工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 986814, null, 0, to_date('31-05-2011 11:08:41', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (25163, '上海长丰智能卡有限公司厂房拆除新建项目', 7542, '七分公司', null, null, null, to_date('28-06-2011', 'dd-mm-yyyy'), to_date('26-06-2012', 'dd-mm-yyyy'), 12058, 4594.5545, null, null, null, null, null, null, 1009201, null, 0, to_date('06-07-2011 11:19:23', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24923, '八院航天新区建设工程协作区航天职工宿舍建设项目一标段', 6613, '四分公司', null, null, null, to_date('28-06-2011', 'dd-mm-yyyy'), to_date('22-04-2013', 'dd-mm-yyyy'), 79732.45, 22699.7888, null, null, null, null, null, null, 1009223, null, 0, to_date('06-07-2011 12:04:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24508, '上海南站地区节假日大客流营运指挥中心加建工程', 6612, '三分公司', null, null, null, to_date('15-09-2011', 'dd-mm-yyyy'), to_date('23-12-2011', 'dd-mm-yyyy'), 625, 470.8813, null, null, null, null, null, null, 1009224, null, 0, to_date('06-07-2011 12:04:27', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (25423, '曲江传奇15#、16#、19#~29#楼、商业、超市、休闲商务中心及地下车库建安工程', 6613, '四分公司', null, null, null, to_date('01-07-2011', 'dd-mm-yyyy'), to_date('31-03-2013', 'dd-mm-yyyy'), 129924.56, 19223.87, null, null, null, null, null, null, 1009682, null, 0, to_date('08-07-2011 15:46:07', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (25424, '长风5B项目施工总承包工程（天御国际广场施工总承包工程）', 6611, '二分公司', null, null, null, to_date('08-06-2011', 'dd-mm-yyyy'), to_date('18-06-2013', 'dd-mm-yyyy'), 169206.52, 31290.2083, 112235, 101814, 32273, 114957, 18156, 141382, 1009683, null, 0, to_date('08-07-2011 15:46:09', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24505, '上海国际航运服务中心（西块）项目地上部分工程', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1020197, null, 0, to_date('31-08-2011 13:35:45', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1432230, '广中西路191号厂房建设项目', 7542, '七分公司', null, null, null, to_date('20-09-2011', 'dd-mm-yyyy'), to_date('04-05-2012', 'dd-mm-yyyy'), 11272, 5188.7188, null, null, null, null, null, null, 1020282, null, 0, to_date('01-09-2011 08:58:39', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1428941, '两湾一宅大公建', 6613, '四分公司', null, null, null, to_date('28-08-2011', 'dd-mm-yyyy'), to_date('04-11-2013', 'dd-mm-yyyy'), 66160, 26927.5796, null, null, null, null, null, null, 1020283, null, 0, to_date('01-09-2011 08:58:41', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1418283, '上海浦东国际机场商飞配套五跑道项目场内道路及室外管线工程（一阶段）―地道及地道泵站工程北标', 6613, '四分公司', null, null, null, to_date('05-08-2011', 'dd-mm-yyyy'), to_date('30-09-2012', 'dd-mm-yyyy'), null, 9280.2528, null, null, null, null, null, null, 1020284, null, 0, to_date('01-09-2011 08:58:44', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1428936, '奉贤生物医药产业化基地开发项目一期（一标段）', 6613, '四分公司', null, null, null, to_date('30-06-2011', 'dd-mm-yyyy'), to_date('30-09-2013', 'dd-mm-yyyy'), 167199, 25451.4662, null, null, null, null, null, null, 1020285, null, 0, to_date('01-09-2011 08:58:47', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1418280, '百联南方购物中心友谊百货区域装修项目', 15103, '五分公司', null, null, null, to_date('08-08-2011', 'dd-mm-yyyy'), to_date('30-07-2013', 'dd-mm-yyyy'), 0, 803.6725, null, null, null, null, null, null, 1020289, null, 0, to_date('01-09-2011 08:58:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1483215, '宜山路711号商办综合楼项目桩基、围护工程', 7542, '七分公司', null, null, null, to_date('10-11-2011', 'dd-mm-yyyy'), to_date('29-01-2012', 'dd-mm-yyyy'), 101738, 8798.7078, null, null, null, null, null, null, 1053344, null, 0, to_date('09-11-2011 08:19:07', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1483230, '宛平南路88号地块F栋SVA综合办公楼项目', 7542, '七分公司', null, null, null, to_date('25-10-2011', 'dd-mm-yyyy'), to_date('23-10-2012', 'dd-mm-yyyy'), 8551.7, 4890, null, null, null, null, null, null, 1053345, null, 0, to_date('09-11-2011 08:19:10', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1478767, '徐汇区区级机关办公大楼装修工程', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1053346, null, 0, to_date('09-11-2011 08:19:13', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1483211, '津丽（拍）2010-04地块住宅（华明东区5号地项目）桩基工程', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1053347, null, 0, to_date('09-11-2011 08:19:15', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1478046, '上海市大型居住社区新选址航头基地27-01地块动迁安置房项目', 6611, '二分公司', null, null, null, to_date('12-10-2011', 'dd-mm-yyyy'), to_date('18-01-2014', 'dd-mm-yyyy'), 107051, 24985.4281, null, null, null, null, null, null, 1053348, null, 0, to_date('09-11-2011 08:19:18', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9422, '设备租凭分公司', 7544, '设备租赁', null, null, null, null, null, null, null, null, null, null, null, null, null, 1053349, null, 0, to_date('09-11-2011 08:19:20', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1483191, '宝杨路码头综合客运交通枢纽项目', 15103, '五分公司', null, null, null, to_date('18-10-2011', 'dd-mm-yyyy'), to_date('18-03-2013', 'dd-mm-yyyy'), 9775, 9069.8551, null, null, null, null, null, null, 1053350, null, 0, to_date('09-11-2011 08:19:23', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1483192, '汇智湖畔家园住宅项目（C地块）', 15103, '五分公司', null, null, null, to_date('20-10-2011', 'dd-mm-yyyy'), to_date('18-09-2013', 'dd-mm-yyyy'), 88909.74, 25880.1021, null, null, null, null, null, null, 1053351, null, 0, to_date('09-11-2011 08:19:26', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1490550, '东锦江大酒店商住楼1－6层装修工程', 6612, '三分公司', null, null, null, to_date('20-11-2011', 'dd-mm-yyyy'), to_date('31-01-2012', 'dd-mm-yyyy'), 0, 3158.0086, null, null, null, null, null, null, 1054320, null, 0, to_date('16-11-2011 12:47:22', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19742, '盛大中心安装工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867559, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1485068, '浦江新一轮选址基地16-03地块经济适用房', 6613, '四分公司', null, null, null, to_date('27-11-2011', 'dd-mm-yyyy'), to_date('16-04-2013', 'dd-mm-yyyy'), 230138, 56017.8627, null, null, null, null, null, null, 1054321, null, 0, to_date('16-11-2011 12:49:02', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1495570, '新建川沙A-1地块市政道路及附属设施工程项目3标', 6612, '三分公司', null, null, null, to_date('30-10-2011', 'dd-mm-yyyy'), to_date('28-10-2013', 'dd-mm-yyyy'), 1139, 12883.6277, null, null, null, null, null, null, 1056558, null, 0, to_date('28-11-2011 13:00:25', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1495569, '嘉定区城北大型居住社区（北块）动迁安置房', 6609, '一分公司', null, null, null, to_date('20-11-2011', 'dd-mm-yyyy'), to_date('19-09-2013', 'dd-mm-yyyy'), null, 69196.9787, null, null, null, null, null, null, 1056559, null, 0, to_date('28-11-2011 13:00:28', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1507893, '上海市虹桥商务区核心区（一期）06号地块虹桥项目D19地块项目之地库及上盖总承包工程', 6613, '四分公司', null, null, null, to_date('01-02-2012', 'dd-mm-yyyy'), to_date('26-05-2014', 'dd-mm-yyyy'), 209351, 96139.6318, null, null, null, null, null, null, 1059937, null, 0, to_date('19-12-2011 11:17:36', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1489051, '八院航天新区建设工程协作区航天职工宿舍项目二标段', 6613, '四分公司', null, null, null, to_date('01-11-2011', 'dd-mm-yyyy'), to_date('29-12-2012', 'dd-mm-yyyy'), 10578.6, 6307.252, null, null, null, null, null, null, 1059938, null, 0, to_date('19-12-2011 11:17:38', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1495725, '天津老城厢11#地块项目12#楼精装修承包工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1059939, null, 0, to_date('19-12-2011 11:17:40', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22208, '闵行航天城八部建设项目', 6613, '四分公司', 'SBXM', '韩平', '15000379498', to_date('01-04-2010', 'dd-mm-yyyy'), to_date('01-04-2012', 'dd-mm-yyyy'), 45640, 15629.8676, 53163, 32257, 8442, 30909, 6268, 84103, 626325, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23776, '崇明至启东长江公路隧道工程（上海段）服务区、收费站施工（A1标）工程', 6609, '一分公司', null, null, null, to_date('01-09-2010', 'dd-mm-yyyy'), to_date('15-10-2011', 'dd-mm-yyyy'), 0, 6813.9097, null, null, null, null, null, null, 892581, null, 0, to_date('16-12-2010 13:55:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24004, '国防大学综合服务楼工程', 6611, '二分公司', null, null, null, to_date('13-04-2010', 'dd-mm-yyyy'), to_date('01-05-2011', 'dd-mm-yyyy'), null, 9000, null, null, null, null, null, null, 895434, null, 0, to_date('23-12-2010 08:21:24', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23774, '上海交通大学医学院附属仁济医院（闵行）项目', 7542, '七分公司', null, null, null, null, null, null, 31581.5376, 96853, 43809, 24337, 76327, 21675, 171780, 896904, null, 0, to_date('27-12-2010 16:31:31', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23800, '中国天津周大福滨海中心发展项目二期地连墙工程及二期围护支撑、开挖、降水设计工程', 7542, '七分公司', null, null, null, to_date('15-11-2010', 'dd-mm-yyyy'), to_date('14-03-2011', 'dd-mm-yyyy'), 0, 2900, null, null, null, null, null, null, 896905, null, 0, to_date('27-12-2010 16:31:34', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23804, '闵行航天城二期工程八○三所建设项目1标段工程', 6613, '四分公司', null, null, null, to_date('18-11-2010', 'dd-mm-yyyy'), to_date('11-11-2012', 'dd-mm-yyyy'), 63659, 23089.406, null, null, null, null, null, null, 896906, null, 0, to_date('27-12-2010 16:31:37', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23775, '西安万科曲江传奇一期Ⅱ标段（3#、4#、5#、7#楼，B车库Ⅰ区）建安工程', 6613, '四分公司', null, null, null, to_date('15-08-2010', 'dd-mm-yyyy'), to_date('03-08-2012', 'dd-mm-yyyy'), 84509, 12109.3846, null, null, null, null, null, null, 896907, null, 0, to_date('27-12-2010 16:31:40', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24014, '松江韵意配套商品房项目（05－01地块）工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 896912, null, 0, to_date('27-12-2010 16:31:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24015, '新凯家园C、D块住宅项目（08－05地块）工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 896913, null, 0, to_date('27-12-2010 16:31:58', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23854, '金外滩国际广场（中山南路B4地块商办综合楼）', 6612, '三分公司', null, null, null, to_date('15-11-2010', 'dd-mm-yyyy'), to_date('19-07-2013', 'dd-mm-yyyy'), 78110, 35248.2292, null, null, null, null, null, null, 896914, null, 0, to_date('27-12-2010 16:38:04', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22048, '天津富力响螺湾A07地块工程', 6612, '三分公司', null, null, null, to_date('23-11-2009', 'dd-mm-yyyy'), to_date('09-05-2011', 'dd-mm-yyyy'), 0, 2636.1218, null, null, null, null, null, null, 896915, null, 0, to_date('27-12-2010 16:39:58', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24054, '上海市建筑建材业受理服务中心受理大厅改造项目', 6613, '四分公司', null, null, null, to_date('17-11-2010', 'dd-mm-yyyy'), to_date('31-01-2011', 'dd-mm-yyyy'), 0, 100, null, null, null, null, null, null, 900874, null, 0, to_date('13-01-2011 09:02:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24074, '神州数码上海科技园改扩建工程', 15103, '五分公司', null, null, null, null, null, 51000, 13850, null, null, null, null, null, null, 901287, null, 0, to_date('17-01-2011 14:19:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23654, '青松城老干部活动中心装饰工程（健身房、餐厅工程）', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 958926, null, 0, to_date('27-04-2011 08:30:54', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24345, '桥东二期就近安置动迁配套商品房地块工程商办楼部分', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 964716, null, 0, to_date('10-05-2011 15:33:46', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24504, '黄埔区老城厢露香园旧改地块商品房及配套公建一期（低区）B1地块工程', 6613, '四分公司', null, null, null, to_date('31-10-2011', 'dd-mm-yyyy'), to_date('30-12-2012', 'dd-mm-yyyy'), 17470, 11412.3636, null, null, null, null, null, null, 989795, null, 0, to_date('02-06-2011 14:07:13', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24506, '天津现代城云南路商务会所', 6612, '三分公司', null, null, null, null, null, 6815.27, 1021.405, null, null, null, null, null, null, 989796, null, 0, to_date('02-06-2011 14:07:15', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24507, '横江半塔花园一期工程', 6612, '三分公司', null, null, null, to_date('18-03-2011', 'dd-mm-yyyy'), to_date('26-03-2012', 'dd-mm-yyyy'), 26894.72, 4000, null, null, null, null, null, null, 989797, null, 0, to_date('02-06-2011 14:07:18', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24603, '新江湾城C4地块综合项目（P3地块）工程', 6613, '四分公司', null, null, null, to_date('01-06-2011', 'dd-mm-yyyy'), to_date('28-10-2012', 'dd-mm-yyyy'), 150831, 89382.2039, null, null, null, null, null, null, 1009680, null, 0, to_date('08-07-2011 15:21:16', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (25403, '碧云公馆工程', 6609, '一分公司', null, null, null, to_date('28-06-2011', 'dd-mm-yyyy'), to_date('01-06-2014', 'dd-mm-yyyy'), 193893, 68356.63, null, null, null, null, null, null, 1009681, null, 0, to_date('08-07-2011 15:21:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (24383, '上海长丰智能卡有限公司厂房拆除、临房搭建、管线改造、绿化搬迁工程', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1016992, null, 0, to_date('09-08-2011 14:41:49', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1432235, '津湾广场二期7#、8#楼工程', 7542, '七分公司', null, null, null, to_date('15-08-2011', 'dd-mm-yyyy'), to_date('05-05-2015', 'dd-mm-yyyy'), 309700, null, null, null, null, null, null, null, 1020281, null, 0, to_date('01-09-2011 08:58:36', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1432222, '上海世纪公园七号门餐厅扩建工程', 6611, '二分公司', null, null, null, to_date('15-09-2011', 'dd-mm-yyyy'), to_date('03-02-2012', 'dd-mm-yyyy'), 2127, 945.0403, null, null, null, null, null, null, 1020287, null, 0, to_date('01-09-2011 08:58:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1432229, '钓鱼台国宾馆14号楼翻建工程及附属工程（A标段）', 6611, '二分公司', null, null, null, to_date('25-08-2011', 'dd-mm-yyyy'), to_date('25-04-2013', 'dd-mm-yyyy'), 22000, 18696.2951, null, null, null, null, null, null, 1020288, null, 0, to_date('01-09-2011 08:58:52', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19782, '丽华家园工程704', 6613, '四分公司', 'SBXM', '孙荣', '13795205622', null, null, null, null, null, null, null, null, null, null, 626317, null, 0, to_date('18-09-2010 17:09:32', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
commit;
prompt 200 records committed...
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1495568, '松江洞泾南拓展区42-01地块经济适用房桩基工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1059940, null, 0, to_date('19-12-2011 11:17:43', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1594012, '津丽（拍）2010-04地块（雪优花园）一期工程', 7542, '七分公司', null, null, null, to_date('18-11-2011', 'dd-mm-yyyy'), to_date('22-08-2013', 'dd-mm-yyyy'), 91470.3, 21512.0393, null, null, null, null, null, null, 1091066, null, 0, to_date('17-01-2012 15:09:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1561049, '航天八院509所卫星总装总测整星试验厂房桩基工程', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091067, null, 0, to_date('17-01-2012 15:09:06', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1556288, '古城岩城楼改建工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091068, null, 0, to_date('17-01-2012 15:09:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1556292, '凤湖烟柳度假酒店活动中心工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091069, null, 0, to_date('17-01-2012 15:09:11', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1544712, '天津市老城厢11号地块项目室外道路、室外修改、防水工程施工合同', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091070, null, 0, to_date('17-01-2012 15:09:14', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1539799, '上海世博会地区B02、B03地块商务办公楼地下空间基坑围护工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091071, null, 0, to_date('17-01-2012 15:09:16', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1522467, '海南省直机关公务员公共租赁住房项目', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1091072, null, 0, to_date('17-01-2012 15:09:18', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603938, '金博（上海）建工集团有限公司新建厂房（二期）宿舍楼工程', 7542, '七分公司', null, null, null, to_date('15-11-2011', 'dd-mm-yyyy'), to_date('30-05-2012', 'dd-mm-yyyy'), 16000, 4898.7854, null, null, null, null, null, null, 1095516, null, 0, to_date('09-02-2012 09:35:01', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603937, '金博（天津）建工有限公司宁河现代化装配基地建设项目一期', 7542, '七分公司', null, null, null, to_date('01-01-2012', 'dd-mm-yyyy'), to_date('31-07-2012', 'dd-mm-yyyy'), 48723, 9262.4904, null, null, null, null, null, null, 1095517, null, 0, to_date('09-02-2012 09:35:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603940, '曲江传奇一期1#、2#楼及地下车库建安工程', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1095518, null, 0, to_date('09-02-2012 09:35:05', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603936, '天津市陆家嘴广场项目之桩基及基坑围护工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1095519, null, 0, to_date('09-02-2012 09:35:08', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603935, '中信星耀天嘉湖二期项目望湖苑工程一标段', 6612, '三分公司', null, null, null, to_date('10-12-2011', 'dd-mm-yyyy'), to_date('15-10-2013', 'dd-mm-yyyy'), 56804.22, 20773.573, null, null, null, null, null, null, 1095520, null, 0, to_date('09-02-2012 09:35:11', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603934, '上海市大型居住社区新选址航头基地26-02地块项目', 6611, '二分公司', null, null, null, to_date('08-12-2011', 'dd-mm-yyyy'), to_date('21-03-2014', 'dd-mm-yyyy'), 59028.01, 10100.8748, null, null, null, null, null, null, 1095521, null, 0, to_date('09-02-2012 09:35:14', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603933, '上海市大型居住社区新选址航头基地21-05地块项目', 6611, '二分公司', null, null, null, to_date('08-12-2011', 'dd-mm-yyyy'), to_date('21-03-2014', 'dd-mm-yyyy'), 97825.05, 17260.8343, null, null, null, null, null, null, 1095522, null, 0, to_date('09-02-2012 09:35:16', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603932, '万科北京昌平4-1#楼等5项（4-1#楼、4-2#楼、地下车库、4-甲2#楼、A-5地块-1#楼）', 6609, '一分公司', null, null, null, to_date('24-11-2011', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), 85390, 15003.7492, null, null, null, null, null, null, 1095523, null, 0, to_date('09-02-2012 09:35:18', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1603941, '客户支援中心和技术交流中心（加层）', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1095524, null, 0, to_date('09-02-2012 09:35:21', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1611328, '虹桥商务区核心区一期08地块D13街坊城市综合体项目地下部分', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1097877, null, 0, to_date('12-02-2012 10:22:52', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1617664, '川沙A-1地块场地形成地下结构预留工地（区间段）(暂定)', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1106455, null, 0, to_date('21-02-2012 16:54:01', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1617655, '北京谷泉会议中心客房楼及附属设施工程Ⅰ-Ⅲ区装饰工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1106456, null, 0, to_date('21-02-2012 16:54:05', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1617658, '北京谷泉会议中心三区立面改造工程', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1106457, null, 0, to_date('21-02-2012 16:54:07', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1485071, '浦江新一轮选址基地08-05地块动迁房', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1107637, null, 0, to_date('23-02-2012 12:08:55', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1485070, '浦江新一轮选址基地03-01地块动迁房', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1107638, null, 0, to_date('23-02-2012 12:08:58', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1629359, '世博会浦东园区出入口广场及停车场及配套设施工程3标704', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1107642, null, 0, to_date('23-02-2012 12:25:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1630074, '世博轴综合利用改建工程（暂定）', 6609, '一分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1107858, null, 0, to_date('24-02-2012 08:26:49', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1635382, '南京路上好八连连史展览馆', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1121215, null, 0, to_date('06-03-2012 10:31:46', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1635374, '海南省信访综合楼项目', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1121216, null, 0, to_date('06-03-2012 10:31:48', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1642806, '联华江桥物流仓储项目桩基工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1121234, null, 0, to_date('06-03-2012 10:52:13', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1644541, '陈家镇滨江生态休闲运动居住区4号地块A.B区商品住宅及商业用房3期', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1125841, null, 0, to_date('12-03-2012 10:37:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1649396, '上海市劳动报印务中心印报车间三号机组改造工程', 6609, '一分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1134871, null, 0, to_date('20-03-2012 16:42:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1666011, '国家肝癌科学中心', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1153191, null, 0, to_date('26-03-2012 12:51:51', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1666006, '春秋国旅总部办公楼', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1153192, null, 0, to_date('26-03-2012 12:51:56', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1666004, '新江湾城B2-01地块项目(一期)工程C标', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1153193, null, 0, to_date('26-03-2012 12:51:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1692370, '外滩国际金融服务中心项目 （北地块）      ', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1184013, null, 0, to_date('18-04-2012 10:56:43', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1692367, '闵联TC-29厂房工程', 7542, '七分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1184014, null, 0, to_date('18-04-2012 10:56:45', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23387, '天津市于家堡金融区起步区项目03-16地块', 6609, null, null, null, null, to_date('06-09-2010', 'dd-mm-yyyy'), to_date('28-12-2012', 'dd-mm-yyyy'), 197850, 128362.1846, null, null, null, null, null, null, 867488, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23208, '大型客机研制保障条件项目一期工程浦东基地业主临时设施工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867489, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21787, '世博会浦东园区出入口广场及停车场及配套设施工程2标701', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867490, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21456, '虹桥国际机场上航国内VIP休息室室内装修及安装等工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867491, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20848, '上海崇明越江通道（长江隧桥）运营养护基地工程（A16标段）', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867492, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19724, '警备区9156安装工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867493, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19944, '世博EF安装工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867494, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18224, '波音航空上海浦东国际机场机库工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867495, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17722, '中环线浦东段上中路越江隧道1标', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867496, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17563, '世博村E、F地块工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867497, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17342, '浦东干部学院餐饮中心扩建及物业管理用房', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867498, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (16983, '铁路上海南站2号地块配套商品房项目', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867499, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (16982, '上海警备区9156工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867500, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13362, '古北商住发展项目地下室工程', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867501, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12382, '上海消防局消防指挥中心', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867502, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (10782, '城宁花苑', 6609, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867503, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22727, '华谊综合大厦工程', 6611, null, null, null, null, to_date('01-07-2010', 'dd-mm-yyyy'), to_date('28-07-2011', 'dd-mm-yyyy'), 22669, 7449.9441, 10524, 14872, 5347, 6173, 2384, 35447, 867504, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21227, '上海市总工会黄浦区工人体育馆迁建工程', 6611, null, null, null, null, to_date('01-11-2010', 'dd-mm-yyyy'), to_date('14-03-2012', 'dd-mm-yyyy'), 0, 12597, 19559, 27629, 8016, 6906, 6296, 35367, 867506, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (21487, '上海电影博物馆电影艺术研究所业务大楼', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867507, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17343, '上海杨浦创智天地广场二期工程', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867508, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14463, '市百一店新楼工程', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867509, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14764, '轨道十号线工程', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867510, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14682, '上海市公共实训基地杨浦基地工程', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867511, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13903, '茂名南路53号兰馨公寓', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867512, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12642, '虹口区三门路配套商品房工程', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867513, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (10482, '上海华联又一城项目', 6611, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867514, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23127, '川沙A-1地块场地形成工程', 6612, null, null, null, null, to_date('01-01-2011', 'dd-mm-yyyy'), to_date('30-06-2012', 'dd-mm-yyyy'), 0, 38615, null, null, null, null, null, null, 867515, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23027, '天津海上花苑10-14号楼及社区会所工程（小伙巷二期）', 6612, null, null, null, null, to_date('01-08-2010', 'dd-mm-yyyy'), to_date('31-07-2012', 'dd-mm-yyyy'), 97251, 22925.3487, null, null, null, null, null, null, 867516, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '1', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22887, '天津富力响螺湾A09地块工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867517, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22888, '上海棱光实业股份有限公司制氧车间改建工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867518, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22947, '利福广场工程二次装修工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867519, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22529, '天津虹桥新天地工程', 6612, null, null, null, null, to_date('20-08-2010', 'dd-mm-yyyy'), to_date('30-06-2011', 'dd-mm-yyyy'), 6023, 1620, 4368, 1914, 1428, 9239, 716, 11687, 867520, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '2', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (22187, '磁悬浮上海线桥上梁模拟降噪现场实施及测试配合工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867521, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13042, '汇众汽车轿车底盘厂安亭生产基地二期工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867522, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13022, '新建通用厂房一到四期项目', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867523, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13002, '上海电信网管传输及数据中心机房工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867524, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12984, '静安国际广场装饰改建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867525, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12982, '中国银行上海分行大楼修缮项目', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867526, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12942, '上海航空股份有限公司机务5号楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867527, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12722, '沪青平高速公路六标土建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867528, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12662, '徐汇区人才培训综合楼', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867529, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12582, '电信北区道路一期工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867530, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12502, '上海焦化厂原煤筒仓', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867531, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12362, '上海浦东三林城W14_2地块商业配套工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867532, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12216, '淮阴污水处理厂', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867533, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12213, '长兴造船基地一期三号线分段装焊工场', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867534, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (12202, '磁悬浮试验线工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867535, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11662, '上海市第二中级人民法院审判执行业务楼工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867536, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11602, '汇众汽车轿车底盘厂安亭生产基地', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867537, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11582, '上海市民政第三精神病院总体改扩建工程', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867538, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11182, '洲际大厦', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867539, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9923, '上海赛科90万吨/年乙烯裂解装置 ', 7545, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867540, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20157, '北京万科昌平工程', 8320, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867541, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20159, '北京万科丰台工程', 8320, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867542, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23367, '上海电力学院平凉校区扩建二期教学综合楼改造及其他零星工程', 15103, '五分公司', null, null, null, to_date('31-10-2009', 'dd-mm-yyyy'), to_date('24-12-2010', 'dd-mm-yyyy'), 19857, 6840, 6255, 3169, 1496, 20791, 1764, 22884, 867543, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (23267, '华虹创新园一期建设项目工程', 15103, '五分公司', null, null, null, to_date('20-09-2010', 'dd-mm-yyyy'), to_date('04-10-2011', 'dd-mm-yyyy'), 28272.6, 6649.8733, 20137.69, 12564.59, 6307.45, 12540.39, 5450.08, 43294.88, 867544, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20726, '七建龙华基地改建工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867545, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20648, '上海国际贵都大饭店项目大堂咖啡厅及厨房装饰工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867546, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20463, '七建总部东办公楼维修工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867547, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18762, '世博家园九街坊特色商铺', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867548, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18742, '世博家园十二街坊高中工程', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867549, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (18483, '浦江镇四号地块1标', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867550, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (15702, '大宁国际商业广场电影城装修', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 867551, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20161, '天津万科东丽湖五期住宅工程', 20153, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867552, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20667, '浦东机场T1航站楼南联检区北安检区改造装修工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867553, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
commit;
prompt 300 records committed...
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20429, '国家电网公司上海世博会企业馆', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867554, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20430, '2010年上海世博会中国铁路馆', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867555, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20204, '103主机房楼工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867556, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (20164, '110KV大田输变电工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867557, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19843, '上海世博会企业联合馆', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867558, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (19722, '新国际博览中心P2停车场703', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867560, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17682, '上海南洋模范高级中学', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867561, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17502, '世博中心工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867562, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (17485, '上海虹桥综合交通枢纽地铁西站工程703', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867563, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (15084, '上海地面交通风洞实验中心工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867564, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14784, '浦东国际机场配套宾馆工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867565, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14522, '东锦江大酒店二期工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867566, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (14262, '上海机场集团机关办公楼', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867567, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13542, '浦东国际机场二期航站楼楼前高架', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867568, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13382, '浦东机场二期交通中心工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867569, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (13222, '上海东方飞行培训中心二期工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867570, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11013, '浦东机场二期航站楼', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867571, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11282, '交通银行数据中心', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867572, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11644, '上海光源工程', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867573, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11322, '汽车会展中心', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867574, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (11024, '南站邮政转运楼  ', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867575, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (10122, '金山沙滩排球', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867576, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9342, '上海长途汽车客运站', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867577, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (15822, '南站主站屋', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867578, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (9002, '赛科乙烯', 6612, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 867579, null, 0, to_date('26-10-2010 22:17:59', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 0);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1686303, '航天八院509所卫星总装总测整星试验厂房', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1184016, null, 0, to_date('18-04-2012 10:56:50', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1692365, '朝阳区酒仙桥北路9号（园区内C7A、C7B）房屋装修工程', 6611, '二分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1184017, null, 0, to_date('18-04-2012 10:56:53', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1714475, '联华江桥物流基地仓储项目', 15103, '五分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1221199, null, 0, to_date('16-05-2012 16:03:17', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1696128, '复地天津湖滨广场起步区商业项目', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1221200, null, 0, to_date('16-05-2012 16:03:19', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (16102, '上航浦东机场西货运基地 ', 6612, '三分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1221201, null, 0, to_date('16-05-2012 16:03:21', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, null, null, 1);
insert into LB_FGS_XMT (XMTID, XMT, FGSID, FGS, XMTLX, WLLGLY, WLLGLYLXDH, KGRQ, JGRQ, JZMJ, ZHAOJIA, MGGRS, GJGGRS, TGGRS, NFGGRS, JZGGRS, QTGGRS, INSTANCEID, FAINSTANCEID, STATUS, CREATETIME, ISDELETE, FLOWID, DEPARTID, ORGANIZEID, DIYU, XMLX, ISUSE)
values (1684495, '闵行航天城二期工程八O三所建设项目2标段(4#、6#、7#楼)工程', 6613, '四分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, 1184015, null, 0, to_date('18-04-2012 10:56:48', 'dd-mm-yyyy hh24:mi:ss'), 0, 610780, null, null, '1', '2', 1);
commit;
prompt 331 records loaded
prompt Loading MENUITEM...
prompt Table is empty
prompt Loading PROCUREMENTCONTRACT...
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205280005', null, to_date('28-05-2012', 'dd-mm-yyyy'), to_date('28-05-2012', 'dd-mm-yyyy'), '02', null, '6613', null, null);
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205280006', null, to_date('28-05-2012', 'dd-mm-yyyy'), to_date('31-05-2012', 'dd-mm-yyyy'), '02', null, '15103', null, null);
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205290008', null, to_date('30-05-2012', 'dd-mm-yyyy'), to_date('30-05-2012', 'dd-mm-yyyy'), '02', null, '7542', null, null);
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205290007', null, to_date('25-05-2012', 'dd-mm-yyyy'), to_date('24-05-2012', 'dd-mm-yyyy'), '01', null, '15103', null, null);
commit;
prompt 4 records loaded
prompt Loading PROCUREMENTCONTRACTDETAIL...
insert into PROCUREMENTCONTRACTDETAIL (CONTRACTDETAILID, CONTRACTID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PROCURENUMBER, INPUTNUMBER)
values ('3e2da6a023764bfba5564b1e90c19e08', 'PCONTRACT201205280006', '0101', '1', '1', 1, 1, null);
insert into PROCUREMENTCONTRACTDETAIL (CONTRACTDETAILID, CONTRACTID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PROCURENUMBER, INPUTNUMBER)
values ('e0ced261f86c4ee2bed74a2cab1304b0', 'PCONTRACT201205290008', '0101', '11', '11', 11, 12, null);
insert into PROCUREMENTCONTRACTDETAIL (CONTRACTDETAILID, CONTRACTID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PROCURENUMBER, INPUTNUMBER)
values ('842ca4d1ba9044958ad008fcf72b492f', 'PCONTRACT201205290007', '0101', '1', '1', 10, 1000, null);
commit;
prompt 3 records loaded
prompt Loading PROCUREMENTSCHEDULEHEAD...
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205280003', to_date('28-05-2012', 'dd-mm-yyyy'), '111', '7542', '11', to_date('28-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('28-05-2012 21:06:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205280004', to_date('15-05-2012', 'dd-mm-yyyy'), '111', '7542', '111', to_date('28-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('28-05-2012 21:06:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290007', to_date('29-05-2012', 'dd-mm-yyyy'), '123456', '6609', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('29-05-2012 18:54:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260001', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260002', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260003', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260004', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', null, to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260005', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260006', to_date('30-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260007', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 4, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260010', to_date('26-05-2012', 'dd-mm-yyyy'), '采购事由: * ', '6613', '采购事由: * ', to_date('26-05-2012', 'dd-mm-yyyy'), null, to_date('27-05-2012 11:01:09', 'dd-mm-yyyy hh24:mi:ss'), 2, '12121', to_date('26-05-2012 21:29:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('201205260001', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '7542', '采购事由', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 17:42:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260011', to_date('26-05-2012', 'dd-mm-yyyy'), '111', '20153', '1', to_date('16-05-2012', 'dd-mm-yyyy'), null, to_date('27-05-2012 10:59:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '11', to_date('26-05-2012 21:53:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260012', to_date('18-05-2012', 'dd-mm-yyyy'), '1', '6612', '1', to_date('19-05-2012', 'dd-mm-yyyy'), null, to_date('27-05-2012 10:58:16', 'dd-mm-yyyy hh24:mi:ss'), 2, 'PSH201205260012 ', to_date('26-05-2012 21:54:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205270001', to_date('29-05-2012', 'dd-mm-yyyy'), '1', '15103', '1', to_date('28-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('27-05-2012 10:21:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205270002', to_date('23-05-2012', 'dd-mm-yyyy'), '1', '6612', '1', to_date('25-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('27-05-2012 10:22:06', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290005', to_date('10-05-2012', 'dd-mm-yyyy'), 'qqq', '20153', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), '王玲玲', to_date('29-05-2012 16:46:15', 'dd-mm-yyyy hh24:mi:ss'), 2, '111', to_date('29-05-2012 16:45:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290006', to_date('10-05-2012', 'dd-mm-yyyy'), '1212121', '7542', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('29-05-2012 16:55:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290008', to_date('17-05-2012', 'dd-mm-yyyy'), '采购事由', '7542', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 1, null, to_date('29-05-2012 19:25:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290009', to_date('29-05-2012', 'dd-mm-yyyy'), '1', '6611', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('29-05-2012 19:31:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205290010', to_date('30-05-2012', 'dd-mm-yyyy'), '2012-05-29', '6612', '王玲玲', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('29-05-2012 19:31:46', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 21 records loaded
prompt Loading PROCUREMENTSCHEDULEDETAIL...
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('ed982b65320040d583e6847c1f2e087a', '0103', '1', '1', 1, 1, 'PSH201205260007');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('cb7f2f64a58b4dd592e7cdf35b565625', '0101', '1234', '12345', 111, 111, 'PS201205290007');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('ae252f4e1cfb4e80bf9fdb2bea26dce6', '0101', '121', '121', 121, 120, 'PS201205290007');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('165edd84edf14c71965afa623b2a986c', '1', '2', '23', 4, 4, 'PSH201205260010');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('07dd58bfa5ca413b84331a9a462f5e0a', '1212', '121', '121', 1121, 12121, 'PSH201205260010');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('984fecaa38e14c5f9451751f1433a571', '1', '1', '1', 1, 1, 'PSH201205260001');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('0d88c5f58acd4d67bd590664d170e677', '2', '2', '3', 4, 5, 'PSH201205260002');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('6f775ab5b5f84200a403e770193cf4d7', '1', '1', '2', 3, 4, 'PSH201205260003');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('6a71e85a91ec47c09b67a2829a3b1ad2', '0101', '设备名称', '设备名称', 1, 1, 'PSH201205260012');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('2387dc46f61145b2a095da6b8c5028e0', '0201', '121', '121', 1, 1, 'PSH201205260012');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('3cd420d2d07244fabd4e8bfe83631b5c', '0301', '1', '1', 1, 1, 'PSH201205260012');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('5dba461360a240f7b187d373bcec5b97', '0103', '1', '1', 1, 1, 'PSH201205260011');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('7584b09acafc4f13905f169af881f885', '0101', '11', '11', 11, 111, 'PS201205290005');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('e989163714284eb1a8b5420e4674f96f', '0101', '111', '111', 111, 1000, 'PS201205290006');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('696b52ef8454464294e028996453d028', '0101', '设备名称', '设备规格', 10, 100, 'PS201205290008');
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('49dbad320f244f5b9fcc5276f85c4da7', '0101', '1', '1', 1, 1, 'PS201205290009');
commit;
prompt 16 records loaded
prompt Loading ROLEINFO...
prompt Table is empty
prompt Loading ROLEPERMISSION...
prompt Table is empty
prompt Loading SUBCOMPANYINFO...
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6609, '一分公司', '001', '701');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6611, '二分公司', '002', '702');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6612, '三分公司', '003', '703');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6613, '四分公司', '004', '704');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (7542, '七分公司', '007', '707');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (15103, '五分公司', '005', '705');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (7544, '设备租赁', '029', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (20153, '天津分公司', '788', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (8320, '北京分公司', '999', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (8321, '总公司', '700', '700');
commit;
prompt 10 records loaded
prompt Loading T_USER...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('402882f229ed348e0129ed367eb40001', null, '洪善华', 'hongsh', '7188', null, null, null, null, null, 20022);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('402882f229ed2f330129ed2f5ad20001', null, '刘胜生', 'lss', '123456', null, 'SUPER', null, null, null, 7395);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ed91257d0004', null, '胡燕燕', 'hyy', 'hyy0325', null, 'SUPER', '四分公司', null, null, 8024);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ed927e850005', null, '陶芸', 'ty', '64870495', null, 'SUPER', '三分公司', null, null, 7091);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ed939c2a0006', null, '万志龙', 'wzhl', '121212', null, 'SUPER', '公司', null, null, 5070);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ed9f2c4f001c', null, '钱青', 'qq', '7188', null, null, '一分公司', null, null, 7905);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda0fc9a001d', null, '张惠庆', 'zhanghq', '7188', null, null, '一分公司', null, null, 7845);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda18080001e', null, '顾裕能', 'gyn', '7188', null, null, '一分公司', null, null, 7802);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda241dc001f', null, '徐冰', 'xub', '7188', null, null, '一分公司', null, null, 7946);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda2b2a70020', null, '蒋建华', 'jjh', '7188', null, null, '一分公司', null, null, 7771);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda4293a0021', null, '钱永方', 'qyf', '1384901', null, null, '一分公司组长', null, null, 5064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda4e6dd0022', null, '姚光武', 'ygw', '5269', null, null, '二分公司', null, null, 9603);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda5854f0023', null, '何明俊', 'hmj', '7021', null, null, '二分公司', null, null, 9703);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda67caf0024', null, '袁亦琦', 'yuanyq', '941195', null, null, '二分公司', null, null, 9527);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda74f800025', null, '顾思瀚', 'gsh', '0726', null, null, '二分公司', null, null, 8956);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda7cd4b0026', null, '顾益明', 'gym', '7188', null, null, '三分公司', null, null, 7099);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda8571c0027', null, '潘鸿卿', 'phq', '1111', null, null, '三分公司', null, null, 7094);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda877c40028', null, '应志明', 'yzm', '0164', null, null, '一分公司', null, null, 8021);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda99edf0029', null, '陈志华', 'czh', '531029', null, null, '三分公司', null, null, 7100);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eda9d5fc002a', null, '裴建荣', 'pjr', '1313', null, null, '一分公司', null, null, 8074);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edaa33ac002b', null, '施涛', 'shitao', '7188', null, null, '三分公司', null, null, 10462);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edaa8557002c', null, '刘军', 'liuj', '38930073', null, null, '三分公司', null, null, 19723);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edaaeaf6002d', null, '叶平', 'yeping', '68760125', null, 'SUPER', '三分公司', null, null, 7709);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edab3eb4002e', null, '徐忠民 ', 'xzm', '7188', null, null, '一分公司', null, null, 10503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edab40d7002f', null, '王如银', 'wry', '1652', null, null, '三分公司', null, null, 22307);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edabb3f30030', null, '费建华', 'fjh', '198555', null, null, '三分公司', null, null, 9102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edabef370031', null, '费建华', 'feijh', '7188', null, null, '三分公司', null, null, 12303);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edac72230032', null, '孙迅非', 'sunxf', '7188', null, null, '三分公司', null, null, 20066);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edacccc60033', null, '王永尧', 'wyy', '7188', null, null, '三分公司', null, null, 8842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edacd6a90034', null, '单建平(701)', 'sjp', 'dd6622', null, null, '一分公司', null, null, 7787);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edadd3880035', null, '费跃忠', 'fyz', '7688', null, null, '三分公司', null, null, 7085);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edadd8e70036', null, '徐永平', 'xuyp', '999000', null, null, '一分公司', null, null, 7784);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edae268a0037', null, '高峰', 'gf', '4848', null, null, '三分公司', null, null, 7096);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edae90bd0038', null, '吴善清', 'wusq', '3214', null, null, '一分公司', null, null, 7779);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edaea4740039', null, '康军', 'kj', '7188', null, null, '三分公司', null, null, 7103);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edaf2879003a', null, '谢伟民', 'xiewm', '3214', null, null, '一分公司', null, null, 7776);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb0fa0c003b', null, '刘金宝', 'ljb', '8888', null, null, '一分公司', null, null, 7797);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb1ea96003c', null, '朱松麟', 'zhusl', '7188', null, null, '一分公司', null, null, 7798);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb296c5003d', null, '裴文兵', 'pwb', '2828', null, null, '一分公司', null, null, 8924);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb34de0003e', null, '娄嘉立', 'loujili', '7188', null, null, '一分公司', null, null, 19964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb4680a003f', null, '裴娄庆', 'plq', '720721', null, null, '公司', null, null, 8291);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb558f20040', null, '郑昱祺', 'zhengyuqi', 'aileenjiji', null, 'SUPER', '一分公司', null, null, 10362);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb5e3500041', null, '丁敏捷', 'dmj', '7188', null, null, '一分公司', null, null, 18330);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb690780042', null, '杨俊杰', 'yangjj', '7188', null, null, '一分公司', null, null, 7804);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edb70c3f0043', null, '毕靖', 'bj', '1221', null, 'SUPER', '一分公司', null, null, 7910);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc0ffd60143', null, '宋在元', 'szy', '7188', null, null, '四分公司', null, null, 10030);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc17af00144', null, '江勇', 'jiangy', '198403', null, null, '四分公司', null, null, 15862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc1a3b50145', null, '俞育蓉', 'yuyr', '502502', null, 'SUPER', '公司', null, null, 15422);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc1fd000146', null, '邓东明', 'dengdm', '2828', null, 'SUPER', '公司', null, null, 17244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc2a3210147', null, '陈惠敏', 'chenhm', '7188', null, 'SUPER', '公司领导', null, null, 17484);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc2edf50148', null, '郑惠国', 'zhhg', '2828', null, null, '四分公司', null, null, 9643);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc59abe0149', null, '康正挥', 'kzh', '1650', null, null, '四分公司', null, null, 12363);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc6465e014a', null, '赵欣', 'zhaoxin', '711011', null, null, '四分公司', null, null, 15863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc733d9014b', null, '裘忠林', 'qiuzl', '7188', null, null, '四分公司', null, null, 15882);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edc959f0014c', null, '陈来生', 'cls', '1357', null, null, '四分公司', null, null, 8425);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcb6480014d', null, '梁军', 'liangj', '328927', null, null, '四分公司', null, null, 9444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcbd886014e', null, '邢建华', 'xingjh', '2828', null, null, '四分公司', null, null, 12364);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcc5e2f014f', null, '马家国', 'majg', '7188', null, null, '四分公司', null, null, 10583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcd22b60150', null, '张振国', 'zhzg', '7188', null, null, '四分公司', null, null, 11842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcdb03f0151', null, '赵征', 'zhaozh', '7188', null, null, '四分公司', null, null, 16883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edce30790152', null, '赵君义', 'zhaojy', '7188', null, null, '四分公司', null, null, 14747);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edce38f50153', null, '蒋惠忠', 'jiangwz', '7188', null, null, '二分公司', null, null, 12243);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcef8b90154', null, '潘志灏', 'pzh', '7188', null, null, '五分公司', null, null, 7300);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcf06070155', null, '王国俭', 'wanggj', '2828', null, null, '二分公司', null, null, 8828);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edcfc1960156', null, '龚学坤', 'gxk', '72g88', null, null, '二分公司', null, null, 8225);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd0063f0157', null, '沈学雷', 'sxl', '739787', null, null, '五分公司', null, null, 8086);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd082060158', null, '李国强', 'liguoq', '7188', null, null, '五分公司', null, null, 22147);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd0dcd70159', null, '周逢春', 'zfc', '571860', null, null, '五分公司', null, null, 8035);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd10bd6015a', null, '瞿林', 'qul', '7188', null, null, '二分公司', null, null, 20543);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd16918015b', null, '朱世平', 'zhusp', '2828', null, null, '五分公司', null, null, 13283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edd27ce7015c', null, '陈智勇', 'czy', '7188', null, null, '二分公司', null, null, 10506);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede0e7e3015d', null, '忻元来', 'xyl', '4217', null, null, '二分公司', null, null, 8082);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede2ea84015e', null, '朱祖国', 'zzg', '1234', null, null, '二分公司', null, null, 8722);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede47f89015f', null, '张静岚', 'zjl', 'zjlan', null, null, '二分公司', null, null, 8389);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede5378d0160', null, '孙博', 'shunbo', '702111', null, null, '二分公司', null, null, 19748);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede60a5c0161', null, '董清华', 'dqh', '7188', null, null, '二分公司', null, null, 21454);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede6bfdf0162', null, '张建鸣', 'zjm', '7088', null, null, '三分公司', null, null, 7083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede777560163', null, '陆勤', 'luqin', '7188', null, null, '三分公司', null, null, 8662);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede9380d0164', null, '陆镝鸣', 'ldm', '888666', null, null, '三分公司', null, null, 9042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ede9fc080165', null, '王兰英', 'wangly', '7188', null, null, '三分公司', null, null, 19883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edea90d40166', null, '宗耀华', 'zongyh', '7188', null, 'SUPER', '三分公司', null, null, 20067);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edeb4f020167', null, '虞加庆', 'yjq', '2708', null, null, '三分公司', null, null, 8847);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edec70000168', null, '张慧敏', 'zhhm', '7188', null, null, '三分公司', null, null, 14062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edefee530169', null, '潘才刚', 'pcg', '7188', null, null, '四分公司', null, null, 17344);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf1466e016a', null, '丁永晖', 'dyh', 'dyh2828', null, null, '四分公司', null, null, 7954);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf1857b016b', null, '范志烨', 'fzh', '7188', null, null, '五分公司', null, null, 19949);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf314e2016c', null, '徐靖峰', 'xujf', '7188', null, null, '五分公司', null, null, 19784);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf363cd016d', null, '丁炳国', 'dbg', '1565', null, null, '七分公司', null, null, 8103);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf365a1016e', null, '蒋臻', 'jiangz', '7188', null, null, '四分公司', null, null, 20483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf3f6d4016f', null, '许晓峰', 'xxf', '620204', null, 'SUPER', '劳务中心', null, null, 8127);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf445800170', null, '秦立标', 'qlb', '250922', null, 'SUPER', '七分公司', null, null, 8042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf4b2140171', null, '李家欣', 'ljx', '7251', null, null, '五分公司', null, null, 7766);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf4d5f80172', null, '唐登高', 'tangdg', '6978', null, null, '七分公司', null, null, 10563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf591f40173', null, '冯明', 'fming', '550112', null, null, '五分公司', null, null, 12682);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf610890174', null, '孙广发', 'sungf', '555555', null, null, '七分公司', null, null, 10951);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf6827c0175', null, '孙礼宏', 'slh', '7188', null, null, '七分公司', null, null, 21747);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf684510176', null, '王佳玮', 'wjw', '122412', null, null, '五分公司', null, null, 17842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf73a420177', null, '龙飞', 'longf', '123456', null, null, '五分公司', null, null, 8379);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf76b540178', null, '沈俊华', 'shenjh', '2828', null, null, '七分公司', null, null, 20019);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf7fbcb0179', null, '葛康星', 'gekx', '7188', null, null, '七分公司', null, null, 16362);
commit;
prompt 100 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf8caf1017a', null, '谢晨育', 'xiecy', '2828', null, null, '七分公司', null, null, 10003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf8fc03017b', null, '李国奇', 'lgq', '7188', null, null, '五分公司', null, null, 7855);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf9650d017c', null, '李勤明', 'lqm', '2222', null, null, '七分公司', null, null, 8098);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edf9997b017d', null, '秦娟', 'qinjuan', '576090', null, null, '五分公司', null, null, 9843);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edfa76ca017e', null, '闵四平', 'msp', '0129', null, 'SUPER', '七分公司', null, null, 7739);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edfb248d017f', null, '赵迎桃', 'zyt', '369', null, null, '七分公司', null, null, 8092);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edfd0ade0180', null, '王才军', 'wangcj', '2010', null, null, '七分公司', null, null, 17782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edfdb3710181', null, '严向明', 'yanxiangm', '2828', null, null, '七分公司', null, null, 10046);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edfea08e0182', null, '吴隽', 'wujuan', '7188', null, null, '七分公司', null, null, 18262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edff1d3f0183', null, '蔡勤智', 'cqz', '7188', null, null, '七分公司', null, null, 19867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129edffcd450184', null, '杨胜磊', 'yasl', '2012', null, null, '七分公司', null, null, 20003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ee01a9550185', null, '亓伟', 'qw', 'qw0807', null, null, '租赁公司', null, null, 8134);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ee022a8a0186', null, '树本宏', 'sbh', '44191884419', null, null, '租赁公司', null, null, 19403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ee02c7360187', null, '许晓彬', 'xxb', '7188', null, null, '租赁公司', null, null, 19404);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129ee0f396a01ae', null, '邵立人', 'slr', '2828', null, null, '三分公司', null, null, 12062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129eea1d34401b1', null, '成其', 'chengqi', '7188', null, null, '707', null, null, 9686);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f22f49e801b5', null, '孙海林', 'shl', '6204', null, 'SUPER', '公司', null, null, 7316);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2304be601b6', null, '蔡声斐', 'csf', '7188', null, 'SUPER', '公司', null, null, 19512);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f268284101b7', null, '孙荣', 'sr', '2828', null, null, '四分公司', null, null, 8913);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f26b05e301bb', null, '楼财江', 'loucj', '7188', null, null, '四分公司', null, null, 20391);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f26f1e5601c2', null, '宋荣华', 'srh', '001203', null, 'SUPER', '公司领导', null, null, 7238);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f272002e01c3', null, '王荣盛', 'wangrs', '5834', null, null, '四分公司', null, null, 7964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2812ed901c9', null, '赵士盛', 'zss', '7188', null, null, '四分公司', null, null, 19412);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f281c83b01ca', null, '吴永昌', 'wuyc', '7188', null, null, '四分公司', null, null, 19411);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f282202e01cb', null, '陆福弟', 'lufudi', '7188', null, null, '四分公司', null, null, 22087);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2829b4901cc', null, '杨明达', 'yangmd', '7188', null, null, '四分公司', null, null, 19409);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f283e69401cd', null, '丁海滨', 'dhb', '7188', null, null, '四分公司', null, null, 19410);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f29147f401dc', null, '顾根明', 'gugming', '7188', null, null, '四分公司', null, null, 22827);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2a802f801ed', null, '谈启新', 'tqx', '2828', null, null, '二分公司', null, null, 8964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2c97dc801f4', null, '史修胜', 'shixs', '7188', null, null, '三分公司', null, null, 15443);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2ca0d1701f5', null, '张豫', 'zhanyu', '7188', null, null, '三分公司', null, null, 20144);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2cb36b201f6', null, '潘志平', 'pzp', '7188', null, null, '三分公司', null, null, 7116);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2cbd70801f7', null, '郭金国', 'gjg', '54824460', null, null, '三分公司', null, null, 7443);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2cc47f201f8', null, '徐相平', 'xuxiangp', '7188', null, null, '三分公司', null, null, 15022);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2cf538901f9', null, '周立军', 'zlj', '2828', null, null, '三分公司', null, null, 7102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2cfd42301fa', null, '严国耀', 'ygy', '2828', null, null, '三分公司', null, null, 11012);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2d04cfc01fb', null, '王瑞清', 'wrq', '7188', null, null, '三分公司', null, null, 21185);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2d0d08301fc', null, '俞国平', 'ygp', '2828', null, null, '三分公司', null, null, 11007);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f2d14ebc01fd', null, '王华荣', 'whr', '2828', null, null, '三分公司', null, null, 11923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f37c464e0239', null, '晋楠', 'jn', '7188', null, null, '四分公司', null, null, 20025);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f37cc38c023a', null, '卞凯', 'bk', '7188', null, null, '四分公司', null, null, 20996);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3826eb80243', null, '唐有金', 'tangyj', '7188', null, null, '二分公司', null, null, 11467);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f38379ef0244', null, '汤一星', 'tyx', '7188', null, null, '二分公司', null, null, 22407);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f383e1920245', null, '李裕华', 'lyh', '2828', null, null, '二分公司', null, null, 20089);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f38497b30246', null, '钟力芸', 'zhly', '7188', null, 'SUPER', '二分公司', null, null, 21452);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3d08cd40257', null, '郑学麟', 'zhxl', '7188', null, null, '二分公司', null, null, 22830);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3db061a0258', null, '夏连明', 'xialm', '7188', null, null, '一分公司', null, null, 20363);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3db5ca70259', null, '何玮炯', 'hwj', '7188', null, null, '一分公司', null, null, 20423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3dc9843025a', null, '黄幸杰', 'hxj', '7188', null, null, '一分公司', null, null, 7957);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3dcd3c6025b', null, '黄强', 'hq', '7188', null, null, '一分公司', null, null, 7783);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3dd27d1025c', null, '胡小君', 'huxj', '7188', null, null, '一分公司', null, null, 19690);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3e1c5c4026e', null, '郑小川', 'zhengxc', '7188', null, null, '一分公司', null, null, 22831);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29ed43280129f3e20cfe026f', null, '龚辉', 'gonghui', '7188', null, null, '一分公司', null, null, 22832);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f7bf2c340007', null, '张志霞', 'zzxx', '7188', null, 'SUPER', '公司', null, null, 7375);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f811cbc10017', null, '薛文忠', 'xwz', '7188', null, null, '四分公司', null, null, 19408);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f81e54eb001e', null, '王劭丰', 'wangsf', '19811229', null, null, '三分公司', null, null, 11722);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91a1d09006c', null, '林昌世', 'lincs', '7188', null, null, '五分公司', null, null, 19945);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91a5c64006d', null, '徐夏强', 'xuxq', '7188', null, null, '五分公司', null, null, 19947);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91a98ff006e', null, '沈进浩', 'senjh', '7188', null, null, '五分公司', null, null, 19946);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91b5625006f', null, '杨春峰', 'ycf', '7188', null, 'SUPER', '五分公司', null, null, 22267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91c04a50070', null, '陈永康', 'cyk', '951202', null, null, '五分公司', null, null, 5037);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91cd8be0071', null, '周根生', 'zhougs', '7188', null, 'SUPER', '五分公司', null, null, 7938);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91e2d800077', null, '史修生', 'sxs', '7188', null, null, '三分公司', null, null, 7119);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129f91fb9310081', null, '许华民', 'xuhm', '7188', null, null, '三分公司', null, null, 19884);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fcb97fae00f5', null, '费晓斌', 'fxb', '7188', null, null, '三分公司', null, null, 22867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fccac29000fd', null, '陆华', 'luh', '19780710', null, null, '四分公司', null, null, 9964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fccb7c5b00fe', null, '施亚荣', 'syr', '7188', null, null, '四分公司', null, null, 17523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fccc7fc100ff', null, '李玉敏', 'liym', '1968925', null, null, '二分公司', null, null, 16984);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fd0fc82e011a', null, '陈松林', 'chensl', '7188', null, null, '四分公司', null, null, 17622);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fd3d88d40120', null, '顾明华', 'gmh', '1208', null, null, '七分公司', null, null, 9623);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fdecb1b50126', null, '包颖', 'by', '1818', null, 'SUPER', '公司', null, null, 7299);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fdf85a25012c', null, '瞿华明', 'qhm', '1116', null, 'SUPER', '二分公司', null, null, 7315);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fdfc1b250132', null, '陆启平', 'luqip', '7188', null, null, '一分公司', null, null, 12385);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe1199480138', null, '池敏华', 'chmh', '123', null, null, '七分公司', null, null, 10004);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe185826013e', null, '费志兴', 'fzx', '5401', null, null, '七分公司', null, null, 8109);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe19f1540144', null, '温作荣', 'wzr', '7188', null, null, '其分公司', null, null, 20323);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe897e36014a', null, '赵敖齐', 'zaq', '7422', null, 'SUPER', '公司', null, null, 7259);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe8bb3a4014b', null, '顾亚囝', 'guyn', '7288', null, 'SUPER', '公司', null, null, 18502);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe8c60fb014c', null, '周之峰', 'zzf', '123321', null, 'SUPER', '公司', null, null, 6367);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b29f76b820129fe8cb97b014d', null, '周蝶虎', 'zhoudh', '0713', null, 'SUPER', '公司', null, null, 7588);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a0bfc01012a0d0a416d0002', null, '陈惠民', 'chm', '6630', null, 'SUPER', '公司', null, null, 8383);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a19837f012a1c0161d80001', null, '张季平', 'zjp', '321', null, 'SUPER', '公司', null, null, 7313);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a1e6da2012a210a858f0001', null, '翁民昊', 'wengmh', '7188', null, null, '三分公司', null, null, 20828);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a1e6da2012a212599520009', null, '萧璐', 'xiaol', '7188', null, null, '三分公司', null, null, 21768);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a1e6da2012a219fdfef0012', null, '陈松青', 'chensongq', '7188', null, null, '四分公司', null, null, 22927);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a1e6da2012a231e53190019', null, '蔡保生', 'cbs', 'cbs65062500', null, 'SUPER', '公司', null, null, 7745);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a2e6522012a31cc782e0043', null, '潘文', 'panw', '2828', null, null, '大连', null, null, 10961);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a3d4ae1012a45050f580039', null, '王美华', 'wmh', '162636', null, 'SUPER', '公司', null, null, 6707);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a3d4ae1012a450624ee003a', null, '曹传智', 'ccz', 'ccz89101', null, 'SUPER', '公司', null, null, 7353);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a551259012a5ff125a90001', null, '丁杰', 'dingjie', '7188', null, null, '四分公司', null, null, 23107);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a6e8dbb012a6f8516650001', null, '李申展', 'lsz', '9090', null, 'SUPER', '公司领导', null, null, 8204);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2a92a8dc012a9c44035b0001', null, '陈晓峰', 'cxf', '9324', null, 'SUPER', '公司', null, null, 7343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae48b2ae96162012af9b32ecb0001', null, '唐鹏军', 'tangpj', '7188', null, 'SUPER', '劳务科', null, null, 8480);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cb91e69012cbfa040e9003e', null, '汪洋', 'wangyang', '7188', null, null, '五', null, null, 23934);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cb91e69012cbfa2b0430049', null, '陆磊', 'ray', '7188', null, null, '七', null, null, 20345);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cb91e69012cbfa7f9b70053', null, '夏德森', 'xiades', 'HUARUN504504', null, null, '四', null, null, 23935);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d157666012d2668a7d70001', null, '陆纪东', 'lujd', '7188', null, null, '三分', null, null, 8845);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae4522bb3f6b9012bb3f89ce90003', null, '夏寒', 'xh', '300200', null, 'SUPER', null, null, null, 7311);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae4522bb3f6b9012bb3f91ca80004', null, '钱云枫', 'qyunf', '8817', null, null, null, null, null, 18324);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae4522bb3f6b9012bb3f956750005', null, '柳大镛', 'ldy', '206', null, null, null, null, null, 7291);
commit;
prompt 200 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae4522bb3f6b9012bb3f97a490006', null, '谭淳', 'tc', '7188', null, null, null, null, null, 7312);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be10a26012be10ab3f30001', null, '孙燕', 'suny', '7188', null, null, '五分公司', null, null, 18082);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be10a26012be11474880008', null, '周军', 'zhouj', '702', null, null, null, null, null, 8463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be10a26012be1149cf00009', null, '周军', 'zjun', '0321', null, null, null, null, null, 8971);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bf5d203012bf5e724ae0019', null, '宗传贞', 'zcz', '7188', null, null, '七分公司', null, null, 23574);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bf5d203012bf5f2fc8b0028', null, '金灵芳', 'jlf', '7188', null, null, '七分公司', null, null, 23575);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bf5d203012bf5f79df70035', null, '秦栋盛', 'qds', '7188', null, null, '七分' || chr(13) || '' || chr(10) || '', null, null, 21158);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bf5d203012bf66f69720049', null, '张宏', 'zhanghong', '7188', null, null, '三分公司', null, null, 22527);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b69164a0008', null, '姚华龙', 'yhl', '1698', null, 'SUPER', '二分公司', null, null, 8405);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b6ab9f7000f', null, '杨春', 'yc', '82021523', null, null, null, null, null, 13562);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b6cf4950016', null, '季昕烨', 'jixy', '830309', null, null, null, null, null, 19662);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b707b5b0029', null, '陆怡佳', 'luyj', '7188', null, 'SUPER', '四分公司' || chr(13) || '' || chr(10) || '', null, null, 21428);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b71dcee0030', null, '高玲玲', 'gll', '860217', null, null, null, null, null, 13687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b742306003d', null, '李红', 'lh', '7188', null, null, null, null, null, 9263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c0b6700012c0b758bed0044', null, '陈惠', 'cenh', '916916', null, null, null, null, null, 19865);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c3dfabc012c3e5b2fa40002', null, '杨晓凤', 'yxf', '7188', null, null, 'yi fengongis', null, null, 21707);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c3dfabc012c3e608c04001e', null, '周永弟', 'zyd', '1958', null, null, null, null, null, 7356);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c3dfabc012c3eda179d0067', null, '梅新文', 'mxw', '196784', null, null, null, null, null, 8057);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c3dfabc012c4d7c0ef60094', null, '江永弟', 'jyd', '316', null, 'SUPER', null, null, null, 6293);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c3dfabc012c4d7cfe860096', null, '王连云', 'wly', 'wsxedc', null, 'SUPER', null, null, null, 6291);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c4e5cba012c4e62e255001b', null, '张广彬', 'zgb', '7188', null, null, null, null, null, 23088);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c874669012c8746b1750001', null, '朱驾宇', 'zjy', '8866', null, null, '公司' || chr(13) || '' || chr(10) || '', null, null, 7729);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c874669012c87483b03000b', null, '周燕萍', 'zhouyp', '011314', null, 'SUPER', '公司', null, null, 18284);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce778ca012ce778ea7e0001', null, '钱凤美', 'qfm', '7188', null, null, '七', null, null, 19674);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce778ca012ce7a56b510003', null, '陈逸民', 'chenyimin', 'wkxdcqj', null, null, '四', null, null, 20103);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ceca612012ceca643020001', null, '谢敬军', 'xjj', '6050', null, null, '公司', null, null, 7088);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ceca612012ceca774ea0003', null, '胡建华', 'hujh', '720128', null, null, '公司', null, null, 8122);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ceca612012ceca7d48f0004', null, '朱耀雄', 'zyx', '660211', null, null, '公司', null, null, 5003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ceca612012ceca8a1060007', null, '罗西干', 'lxg', '111111', null, null, '公司', null, null, 7355);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ceca612012cecaa7912000a', null, '夏国良', 'xgl', '797979', null, null, '公司', null, null, 6706);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cee0a47630007', null, '杨世翔', 'yangsx', '7188', null, null, null, null, null, 19365);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cf2d7482a0015', null, '沈愉', 'sy', '1206', null, null, null, null, null, 8110);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cf2d899750017', null, '徐晶', 'xujin', '7188', null, null, null, null, null, 22608);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cf2d8cb340018', null, '徐晶', 'xujing', '7188', null, null, null, null, null, 23954);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cf2f498910025', null, '彭力程 ', 'penglc', '7188', null, null, null, null, null, 16904);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cecfde2012cf2f774f20029', null, '姚奚刘', 'yaoxl', '851016', null, 'SUPER', '一分公司', null, null, 15468);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cf524e4012d0126c02e0027', null, '吴秀强', 'wuxq', '112211', null, null, '四', null, null, 7979);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cf524e4012d01511aa60029', null, '周葆康', 'zbk', '7188', null, null, '三分公司', null, null, 22648);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d157666012d26bd68020004', null, '是建明', 'sjm', '8871', null, null, '公司', null, null, 7347);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d2cefa0c30001', null, '管理员', 'ga', '781004', null, null, null, null, null, 1667);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d30b037970002', null, '黄庆华', 'hqh', '9960', null, null, '三', null, null, 7110);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34baf92c0006', null, '葛宏亮', 'ghl', '20010828', null, null, '二分公司', null, null, 8392);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34bd577f0009', null, '陆秋平', 'luqp', '702702', null, null, '二', null, null, 9525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34bf29af000b', null, '陈智骅', 'chenzh', '707518', null, null, '二', null, null, 15302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34bfccb5000d', null, '于昆', 'yuk', '109529', null, null, '二', null, null, 23287);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34cff54e0011', null, '陆德海', 'ldh', '0220', null, null, '租赁', null, null, 8264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2ceeef012d34d09c6b0013', null, '卫天笑', 'wtx', '7188', null, null, '租赁', null, null, 19406);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e3b5dd7650002', null, '倪婷', 'nit', '7188', null, null, null, null, null, 16803);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e3b61f2f80003', null, '金晶', 'jinj', '1205', null, null, null, null, null, 23347);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e3b6950580004', null, '郁雯雯', 'yuww', '1234', null, null, null, null, null, 16342);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e3b783ab4000c', null, '阴佳兴', 'yjx', '7188', null, null, null, null, null, 7824);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e3b7912c4000d', null, '顾莺莺', 'guyy', '771018', null, null, null, null, null, 7796);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e4611b0940011', null, '徐进华', 'xjh', '7188', null, null, null, null, null, 8106);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e369efd012e461210280012', null, '顾海燕', 'guhy', '2828', null, null, null, null, null, 10354);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e4c9430013', null, '王根伟', 'wgw', '369', null, null, null, null, null, 6705);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e67a6d0019', null, '梁其家', 'lqj', '2828', null, null, null, null, null, 7258);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e7a011001d', null, '刘佳涵', 'ljh', '744423', null, null, null, null, null, 7416);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e91c700021', null, '康智勇', 'kzy', '831224', null, null, null, null, null, 13642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e9ec530023', null, '邱俊', 'qj', '700703', null, null, null, null, null, 7263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2eb83cb0026', null, '曹丽琴', 'clq', '020913', null, null, null, null, null, 7378);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2ec77150028', null, '袁莉娜', 'yln', '123456', null, null, null, null, null, 7244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2ed1307002a', null, '王伟明', 'wwm', '123123', null, null, null, null, null, 8104);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2eea2ce002c', null, '吴杏弟', 'wuxd', '6248', null, null, null, null, null, 8423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2ef640b002e', null, '钱芸', 'qy', '7188', null, null, null, null, null, 6287);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f0997e0031', null, '尤雪春', 'yxc', '536902', null, null, null, null, null, 7297);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f131970033', null, '顾卓云', 'gzy', '950103', null, null, null, null, null, 7743);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f37ed30036', null, '秦伟敏', 'qwm', '547755', null, null, null, null, null, 6708);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f4752a0038', null, '朱立鸣', 'zlm', '5167', null, null, null, null, null, 7327);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f59f42003a', null, '倪锋', 'nf', '123400', null, null, null, null, null, 8489);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f64e8d003c', null, '李志军', 'lzjj', '7188', null, null, null, null, null, 7335);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2f797a70040', null, '方刚', 'fg', '2828', null, null, null, null, null, 8742);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012ec789b18a0044', null, '沈健敏', 'shenjm', '6605', null, 'SUPER', null, null, null, 21927);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f295435012f2954a4990001', null, '房立春', 'flc', '7188', null, 'SUPER', '一分公司', null, null, 24249);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f67b80c012f67b839810001', null, '梁吉铭', 'liangjm', '7188', null, 'SUPER', '公司1', null, null, 17802);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f67b80c012f719dee1b000e', null, '朱剑君', 'zjj', '852604z', null, 'SUPER', '七分公司', null, null, 8096);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f67b80c012f770f5e04001c', null, '金森平', 'jsp', '2425', null, 'SUPER', '公司', null, null, 8084);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f67b80c012f7726f5fe0021', null, '袁志毅', 'yuanzy', '040414', null, 'SUPER', '二分公司', null, null, 12386);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f9461ad012f946345c20001', null, '陈儒杰', 'crj', '7188', null, 'SUPER', '三分公司', null, null, 24152);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f9461ad012f95dff5d00002', null, '徐创和', 'xcha', '7188', null, 'SUPER', '二分公司 京西', null, null, 24341);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2f9461ad012f9aa7937a0003', null, '居春芳', 'jcf', '7188', null, 'SUPER', '一分公司', null, null, 7814);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda0130010547250007', null, '马佳斌', 'mjb', '7188', null, null, '七分公司劳务专管', null, null, 24156);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002e8a229001a', null, '俞玉林', 'yyl', '7189', null, null, null, null, null, 10182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002e8faa9001b', null, '沈辉', 'shenh', '7188', null, null, null, null, null, 16382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002e9a0cc001c', null, '黄锡钧', 'huangxj', 'hhh', null, 'SUPER', null, null, null, 8477);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002ee0d00001f', null, '丁俊涛', 'djt', '111111', null, null, null, null, null, 8509);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002f0bc700028', null, '陆启金', 'luqj', '7343', null, null, null, null, null, 8090);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002f35740002e', null, '潘荣', 'pr', '0918', null, null, null, null, null, 8508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002f5ca720030', null, '谈依文', 'tanyw', '6408', null, null, null, null, null, 8229);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda013002f6ecda0032', null, '徐勇彪', 'xyb', '7188', null, null, null, null, null, 8246);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda01300305664c0057', null, '蔡永平', 'cyp', '7188', null, null, null, null, null, 8241);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3000fbda0130030990460062', null, '陶华军', 'taohj', '7188', null, null, null, null, null, 11663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b300b3b0301300b3b64860001', null, '周卫云', 'zhwy', '7188', null, 'SUPER', '天津', null, null, 23795);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3029ddbf013029de0cae0001', null, '潘雄翔', 'pxx', '7188', null, 'SUPER', '二分公司', null, null, 24160);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3029ddbf01302af50723000c', null, '刘玉丽', 'liuyl', '7188', null, 'SUPER', '公司', null, null, 24483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b308bdbcd01308bdc01800001', null, '吴铱凡', 'wuyf', '426426', null, 'SUPER', '公司', null, null, 24744);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b308bdbcd01308bdcabba0002', null, '徐杰', 'xujie1', 'happys', null, 'SUPER', '公司', null, null, 24743);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b308bdbcd01308cd802510003', null, '谭黔兵', 'tqb', '7188', null, 'SUPER', '三分公司', null, null, 24164);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b308bdbcd013091398b4b0004', null, '薛霞霞', 'xuexx', '7188', null, 'SUPER', '公司', null, null, 17528);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b308bdbcd0130913bdf1e0007', null, '吴晓军', 'wuxj', '56156228', null, 'SUPER', '公司', null, null, 18425);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b30de4a8b0130de4bb2f90001', null, '周秀鸣', 'zxum', '7188', null, 'SUPER', '三分公司', null, null, 24303);
commit;
prompt 300 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b30de4a8b0130debabacd0002', null, '魏月琴', 'weiyq', '7188000', null, 'SUPER', '一分公司', null, null, 19078);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b30de4a8b0130deee78390003', null, '高骏', 'gjun', '7188', null, 'SUPER', '二分公司', null, null, 24221);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b311725230131172f2a680004', null, '杨洋', 'yyan', '7188', null, 'SUPER', '三分', null, null, 24259);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc8381fcb0005', null, '陈夏志', 'chengxz', '7188', null, 'SUPER', '一分公司', null, null, 7902);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc8388f3e0006', null, '黄金莲', 'hjl', '7188', null, null, null, null, null, 7819);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc839ead70007', null, '王沪生', 'whs', '7188', null, null, null, null, null, 7827);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc83b3d660008', null, '朱生勤', 'zsq', '7188', null, null, null, null, null, 14506);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc83bffad0009', null, '倪龙喜', 'nlx', '7188', null, null, '一分公司', null, null, 7806);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc83d7d06000a', null, '张君', 'zhangjn', '1225', null, null, null, null, null, 10954);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc83f7b95000b', null, '万国忠', 'wgz', '7188', null, null, null, null, null, 7856);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bc7da0c012bc842ecee000c', null, '陆恩翔', 'lex', '7188', null, null, null, null, null, 21712);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be6b3ed5a0001', null, '方申伸', 'fangss', '6408', null, null, null, null, null, 10092);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be6b65561000a', null, '夏国平', 'xgp', '58003977', null, null, null, null, null, 8115);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be6cde53e004c', null, '陆金法', 'ljf', '3333', null, null, null, null, null, 8099);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be6d1ae1d0053', null, '毛建军', 'mjj', '8888', null, null, null, null, null, 8481);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be6d3c0d0005b', null, '苏蓉华', 'surh', '1969', null, null, null, null, null, 8116);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be719751d0061', null, '陶洪海', 'thh', '7188', null, null, null, null, null, 12873);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be71c4237006a', null, '朱炜', 'zhuwei', '7188', null, null, null, null, null, 21157);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be71e3ca00071', null, '章信杰', 'zxj', '7188', null, null, null, null, null, 22427);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be71ef0110072', null, '柴鹤忠', 'chaihz', '7188', null, null, null, null, null, 21183);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be725324d007f', null, '陈中民', 'czm', '0805', null, null, null, null, null, 8627);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be72557b70080', null, '陈中民', 'chenzm', '2828', null, null, null, null, null, 8899);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be728fc170093', null, '金芝君', 'jzj', '7188', null, null, null, null, null, 17724);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be72d8f7a00a6', null, '姚建明', 'yaojm', '1982131', null, null, null, null, null, 13063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be7445c0600cd', null, '单忠会', 'szhui', '7188', null, null, null, null, null, 22488);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be745113c00ce', null, '何英', 'hy', '7890', null, null, null, null, null, 9924);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be746bae500cf', null, '徐文俊', 'xwj', '7188', null, 'SUPER', '四分公司', null, null, 19688);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75c7a38010c', null, '陈志其', 'chzq', '7188', null, null, null, null, null, 21450);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75cc3a4010d', null, '姚尧', 'yaoy', '7188', null, null, null, null, null, 22829);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75d1222010e', null, '万志明', 'wanzm', '7188', null, null, null, null, null, 17586);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75d57c6010f', null, '韩冬伟', 'handw', '7188', null, null, null, null, null, 22812);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75d980b0110', null, '高妙忠(北京）', 'gmz', '7188', null, 'SUPER', '二分公司', null, null, 7780);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be75dd4880111', null, '张令疆', 'zhanglj', '2828', null, null, null, null, null, 20083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be76ff94e0155', null, '华祖平', 'huazp', '582150', null, null, null, null, null, 7770);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be77043190156', null, '姚秉忠', 'yaobz', '7288', null, null, null, null, null, 7978);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be7744b050157', null, '胡海伟', 'hhw', '7188', null, null, null, null, null, 21628);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be775565a0158', null, '肖伟', 'xw', '2828', null, null, null, null, null, 13683);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be77a9c350167', null, '葛黎鸣', 'gelm', '7188', null, null, '三分', null, null, 23549);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be77cdee1017a', null, '陈聪彬', 'ccb', '860415', null, null, '三分', null, null, 19785);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be780f45a0181', null, '张燕', 'zhangy', '7188', null, null, '三分', null, null, 8387);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be7859d870198', null, '张弘', 'zhangh', '1219', null, null, '三分公司', null, null, 10242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be798a20f01b8', null, '张艳', 'zhangy703', '7188', null, null, '三分公司', null, null, 23551);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be79e1a2501cf', null, '佟宇辉', 'tongyh', '5590', null, null, '三分公司', null, null, 23552);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2be6916d012be7a4300101db', null, '张敏', 'l1qu1d', '7188', null, null, '三分公司', null, null, 23553);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ca45cd3012ca4958db20001', null, '张超', 'wangchao', '7188', null, null, '三分工', null, null, 23874);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ca45cd3012ca63adfab0017', null, '张华', 'zhanghua', '7188', null, null, null, null, null, 23914);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2caae251012caae29e190001', null, '陈广波', 'cgb', '7188', null, null, '租赁', null, null, 8982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cced838012cced8cd0a0001', null, '沈正荣', 'szr', 'shenzr', null, 'SUPER', '公司' || chr(13) || '' || chr(10) || '', null, null, 8468);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cced838012ccef06db90004', null, '费兰臻', 'flz', '200892', null, null, '公司', null, null, 18002);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce2dc43540001', null, '郝丹', 'haodan', '7188', null, null, '二分公司', null, null, 22815);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce36df8e70003', null, '涂新麟', 'txl', '7188', null, null, '四' || chr(13) || '' || chr(10) || '', null, null, 22067);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce36e69c20005', null, '余家琪', 'yujq', '7188', null, null, '四', null, null, 15202);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce370c93e0009', null, '张巍巍', 'zhangww', '7188', null, null, '四' || chr(13) || '' || chr(10) || '', null, null, 20063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce372b3e7000c', null, '朱王怡', 'zwy', '7188', null, null, '四' || chr(13) || '' || chr(10) || '', null, null, 8426);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce39dfdff000f', null, '叶青', 'yeq', '301103', null, null, '二分公司', null, null, 9462);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce2dc18012ce3bb6c8a0012', null, '花世宝', 'hsb', '1234', null, null, null, null, null, 7781);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2ce8ecd1012ce8ed07b90001', null, '徐敏', 'xumin', '2828', null, null, '总承包', null, null, 9644);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d0200a8012d077180e7003b', null, '王伟泉', 'wwq', '570213', null, null, '一分公司', null, null, 8141);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2db58e5c012db58ea80f0001', null, '鲍继泉', 'bjq', '2828', null, 'SUPER', '二', null, null, 20115);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2db58e5c012db5f3d29e0003', null, '史璟', 'shijing', '7188', null, null, '二分', null, null, 24034);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2db58e5c012dd9fac9a70009', null, '顾波', 'gub', '7188', null, null, '三', null, null, 20155);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012e980655510002', null, '崔晓强', 'cuixq', '7188', null, 'SUPER', null, null, null, 24194);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012e986fd2140016', null, '陈辉', 'chh', '600913', null, 'SUPER', null, null, null, 7336);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012e9d263a2a001a', null, '蒋纪龙', 'jjl', '7188', null, 'SUPER', '四分公司', null, null, 20023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3db0c73001e', null, '陈涛', 'ctao', 'chentao', null, 'SUPER', '三分公司', null, null, 24223);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3dbc60f0020', null, '王超', 'wch', '7188', null, 'SUPER', '三分公司', null, null, 24224);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3df1fba0022', null, '李鸿跃', 'lhy', '7188', null, null, null, null, null, 24225);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3e047af0025', null, '孙克坚', 'skj', '7188', null, null, null, null, null, 24216);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3e16d530027', null, '于国光', 'yuguoguang', '7188', null, null, null, null, null, 20109);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3e249c90029', null, '陆金泉', 'lujq', '2828', null, null, null, null, null, 8945);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e980258012ea3e323cd002c', null, '张大龙', 'zhangdl', '666366', null, null, null, null, null, 8437);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fb197ff012fb84af3660001', null, '杨晓蒙', 'yxm', '123456', null, 'SUPER', '七分公司', null, null, 24344);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fb197ff012fb84b4cc10002', null, '邬朝嵘(公司)', 'wucrgs', '7878', null, 'SUPER', 'gongsi', null, null, 18333);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fd023fa012fd324d8220002', null, '季琳珠', 'jlz', '7188', null, 'SUPER', '三分公司', null, null, 24350);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fd023fa012fe83bf4be0003', null, '建工', 'scgzcb', 'zcb8311', null, 'SUPER', '建工', null, null, 24362);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fd023fa012ff758a1e80004', null, '谢秋菊', 'xieqj', '7188', null, 'SUPER', '二分公司', null, null, 24382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2fd023fa012ffb8873e40005', null, '马骏康', 'mjk', '7188', null, 'SUPER', '七分公司', null, null, 8221);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f29d000001', null, '贡齐权', 'gqq', '7188', null, 'SUPER', '五分公司', null, null, 24165);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f308da0002', null, '顾酉伦', 'gyl', '7188', null, 'SUPER', '五分公司', null, null, 22548);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f376f50003', null, '陈永康705', 'chyk', '7188', null, 'SUPER', '五分公司', null, null, 24288);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f4050c0004', null, '顾鼎全', 'gudquan', '7188', null, 'SUPER', '五分公司', null, null, 22552);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f5239c0005', null, '姜斌', 'jb', '7188', null, 'SUPER', '五分公司', null, null, 24176);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f58a260006', null, '范裕彬', 'fyb', '7188', null, 'SUPER', '五分公司', null, null, 24178);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f601d60007', null, '吴耀辉', 'wyh', '7188', null, 'SUPER', '五分公司', null, null, 24287);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f6714a0008', null, '徐战新', 'xuzx', '7188', null, 'SUPER', '五分公司', null, null, 24663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f6e5dd0009', null, '曹柔杰', 'carj', '7188', null, 'SUPER', '五分公司', null, null, 24283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c44013071f74e3c000a', null, '朱明昌', 'zmc', '7188', null, 'SUPER', '五分公司', null, null, 24295);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c4401307c16c556000b', null, '李亚南', 'liyn', '7188', null, 'SUPER', '一分公司', null, null, 24723);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b306e4c4401307c48ba46000c', null, '王之超', 'wzic', '7188', null, 'SUPER', '一分公司', null, null, 24724);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3096b4da0130aa7e32a30003', null, '方文', 'fangw', '147896', null, 'SUPER', '劳务中心', null, null, 20107);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3096b4da0130aa8d8e760007', null, '陈波', 'chenbo', '197911270293', null, 'SUPER', '三分公司', null, null, 9485);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3101dd36013101ebbf360002', null, '韩瑞珑', 'hrl', '7188', null, 'SUPER', '劳动力服务', null, null, 25043);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b311725230131215868510005', null, '何斌', 'heb_4', '1331', null, 'SUPER', '四分', null, null, 8003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b3117252301313ac052540006', null, '许晓敏', 'xuxm', '7188', null, 'SUPER', '二分公司' || chr(13) || '' || chr(10) || '', null, null, 9225);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b314f608c01314f7f92720016', null, '田文中', 'twz', '7188', null, 'SUPER', '劳务中心', null, null, 24563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1CF3D62D70004964839BFAE117B7B838', null, '曾安平', 'zap', '62254843', null, null, null, null, null, 7302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EE0CB1160D1F49848808689E4C0BBE73', null, '王永福', 'wyf', '7188', null, null, null, null, null, 7303);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C43D6F6F8D7E4433BDB1DF28FB46DD49', null, '杨冬冬', 'ydd', '7988', null, null, null, null, null, 7305);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D18FBE5E0ECF4A48B1BA6BECB00E6F0F', null, '马爱民', 'mam', '940228', null, null, null, null, null, 7306);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5072307C058D4945B0FD3F81AEED1777', null, '夏爱华', 'xah', '955101', null, null, null, null, null, 7307);
commit;
prompt 400 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('106DC4339F58462BA2B887B67CF4F472', null, '王琰', 'wy', '720707', null, null, null, null, null, 7308);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0BDC90448404E6884883C389A9C7796', null, '董桂红', 'dgh', '58300220', null, null, null, null, null, 7309);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE4EADCB5A564106A8350DE4EB827804', null, '欧阳樱', 'oyy', '62527188', null, null, null, null, null, 7310);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CE155EB70C04414AA10D59330427A0FF', null, 'eee', 'eee', '7188', null, null, null, null, null, 7314);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A9B2166ED9014CEBA0C6DDF798B3F4E3', null, '王明荣', 'wmr', '7188', null, null, null, null, null, 7317);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe385f780057', null, '陈丽军', 'clj', '0685', null, null, '一分公司', null, null, 7891);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3973c60059', null, '韦伟', 'weiwei', '753836', null, null, '一分公司', null, null, 11023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3aab1d005c', null, '皮文静', 'piwj', 'dhc', null, null, '二分公司', null, null, 8080);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3b1ed6005d', null, '郁凯霞', 'yukx', '7188', null, null, '二分公司', null, null, 15642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3d7bf00060', null, '陈铭亮', 'cml', '831125', null, null, '三分公司', null, null, 19443);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3dd6840061', null, '郭家彬', 'guojiab', '7188', null, null, '三分公司', null, null, 10544);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3e39a30062', null, '周驷君', 'zsj', '7188', null, null, '三分公司', null, null, 20150);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3e9a800063', null, '张俊', 'zhangjun', '65202', null, null, '四分公司', null, null, 10644);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3eed050064', null, '王容', 'wr', '7188', null, null, '四分公司', null, null, 20997);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3f74840065', null, '陈永', 'cheny', '1208', null, null, '五分公司', null, null, 7913);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe3fd6f70066', null, '陆敏', 'lum', '7188', null, null, '五分公司', null, null, 19364);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe4042c10067', null, '顾春亚', 'gcy', '2518', null, null, '七分公司', null, null, 9142);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe409c890068', null, '童鑫海', 'txh', '7188', null, null, '七分公司', null, null, 19676);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bbdf874012bbe428483006e', null, '邓一珉', 'dym', '7188', null, null, '四分公司', null, null, 20426);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd112fcc00001', null, '魏丽君', 'wlj', '124421', null, null, '二分公司', null, null, 9463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd113a7b50002', null, '孙理', 'sunli', '7188', null, null, '三分公司', null, null, 19823);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd1146ae60003', null, '王斌', 'wangb', 'mm4321', null, null, '七分公司', null, null, 12212);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd114d41f0004', null, '顾静雯', 'gjw', '2013', null, null, '七分公司', null, null, 8094);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd1fb3e45000a', null, '准入证', 'zrz', '0', null, 'SUPER', '临时', null, null, 23507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2b986da0056', null, '黄文欢', 'huangwh', '2828', null, null, null, null, null, 7823);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2bc42030061', null, '诸伟麟', 'zhuwl', '7188', null, null, null, null, null, 7883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2bec6e9006b', null, '张雪林', 'zhangxl', '7188', null, null, null, null, null, 7854);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2c220a3007a', null, '宋祥斌', 'songxb', '7188', null, null, null, null, null, 7909);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2d1ba98008b', null, '方东杰', 'fdj', '6408', null, null, null, null, null, 8193);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2bd11260012bd2d4982d009a', null, '周军(707)', 'zhoujun', '7125', null, null, null, null, null, 8194);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c04c3d9012c04ed5bb9000a', null, '裘国栋', 'qgd', '7188', null, null, null, null, null, 23487);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c28efd1012c2a231830000e', null, '徐佳卿', 'xujq', '56788901', null, null, 'gongsi', null, null, 18064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c28efd1012c2a236e4f000f', null, '陈秀珍', 'cxz', '6511', null, null, 'gongsi', null, null, 7293);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c5cdd3b012c622d08f6000d', null, '周艳', 'zhouyan', '7788', null, null, null, null, null, 8364);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c5cdd3b012c630aef6b001a', null, '陆令麟', 'lll', '7188', null, null, null, null, null, 17530);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c5cdd3b012c630fdd330027', null, '宋炜卿', 'songweiqing', '7188', null, null, null, null, null, 7818);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c5cdd3b012c6316223e003a', null, '夏荣荣', 'xrr', '1202', null, null, null, null, null, 7304);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c5cdd3b012c63169868003b', null, '冯巍贻', 'fengyw', '7188', null, null, null, null, null, 20108);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c70e4af012c70eded8b0001', null, '胡汉荣', 'huhr', 'huhr', null, null, '天津三分公司', null, null, 23734);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c70e4af012c7198e781000a', null, '赵敏', 'zhaom', '6666', null, null, '培训中心', null, null, 8492);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c80d3f0012c817484220047', null, '裘国栋', 'gonggd', '7188', null, null, 'zulin', null, null, 23805);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c80d3f0012c82173a5f005c', null, '季汉荣', 'jihr', 'jihr', null, null, null, null, null, 23734);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c80d3f0012c8218af3c005d', null, '陆复贤', 'lufx', '7188', null, null, null, null, null, 20171);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c95ff5b012c9a5a52030018', null, '朱宏杰', 'zhuhj', '777777', null, null, null, null, null, 21528);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c95ff5b012c9a5ec8c60022', null, '龚荣庆', 'grq', '2828', null, 'SUPER', '公司', null, null, 9062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c95ff5b012c9afcf072002e', null, '高智骏', 'gzj', '235245', null, null, '公司', null, null, 7415);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2c95ff5b012c9b384d580039', null, '刘芳', 'liuf', '7188', null, null, '公司', null, null, 8385);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc8935a012cc893c2e30001', null, '王学东', 'wangxd', '7188', null, null, '租赁', null, null, 8130);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc9df37012cce901a91011f', null, '龚连发', 'glf', '2518', null, null, null, null, null, 7086);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc9df37012cce90815a0120', null, '郝卫清', 'hwq', '7188', null, null, null, null, null, 14902);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc9df37012cce9101a60121', null, '蔡建国', 'cjg', '6408', null, null, null, null, null, 8196);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc9df37012cce922dd20122', null, '暴旭东', 'baoxd', '830928', null, null, null, null, null, 16182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2cc9df37012cce92f73d0123', null, ' 何思漪', 'hsy', '7188', null, null, null, null, null, 18044);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d2c0352012d2c047c2b0001', null, '张虹', 'zhh', '146952', null, null, '三', null, null, 7730);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d538451012d5f8a072d0001', null, '郁佳斓', 'yjl', '770826', null, null, '劳务', null, null, 8209);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d7d12e3030005', null, '周峰', 'zhouf', '7188', null, null, null, null, null, 20166);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d7d15234e0008', null, '张贤樵', 'zxq', '703703', null, null, null, null, null, 13504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d7d1727d9000b', null, '徐俊', 'xujun', '1212', null, null, '三', null, null, 17162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d82279a790028', null, '黎敏英', 'lmy', '7878', null, 'SUPER', '一分公司', null, null, 8182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d8227ecbf0029', null, '黎敏英', 'limy', '7188', null, 'SUPER', '一分公司', null, null, 7768);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d7ce944012d8235bfcf002c', null, '陈晓霞', 'cxx', '091116', null, null, null, null, null, 19502);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012d9c29fd680010', null, '张锦绣', 'zhangjx', '7188', null, null, '二', null, null, 24094);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012d9c76898a0016', null, '丁俊', 'dingj', '0812', null, null, null, null, null, 12483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012d9c77cf290019', null, '余虹', 'yh', '888888', null, null, null, null, null, 8058);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012d9c789027001b', null, '沙乃勤', 'snq', '0809', null, null, null, null, null, 9262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012d9c78fa3b001c', null, '徐和平', 'xhp', '8950', null, null, null, null, null, 14802);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012da115ee830026', null, '徐春裕', 'xcy', '7188', null, null, null, null, null, 8309);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012da11bf685002b', null, '赵冠群', 'zgq', '7188', null, null, null, null, null, 22188);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012da11d743b002d', null, '方剑', 'fangj', '7188', null, null, null, null, null, 21887);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2d91fb20012da11ee6d6002e', null, '杨奕春', 'yyic', 'yyc123', null, null, null, null, null, 22049);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e73f5915d0008', null, '姚剑', 'yaojian', '7188', null, null, null, null, null, 23894);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759c9d99001c', null, '唐华罡', 'thg', '7188', null, null, null, null, null, 22447);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759d6b97001e', null, '张旭斌', 'zxb', '7188', null, null, null, null, null, 20304);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759e46a5001f', null, '王磊', 'wanglei', '28467732', null, 'SUPER', '二分公司', null, null, 8306);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759e6cfa0020', null, '王磊', 'wangl', '7188', null, 'SUPER', '二分公司', null, null, 24141);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759eb9e10021', null, '钱国师', 'qiangs', '7188', null, null, null, null, null, 20112);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759f09880022', null, '厉昭军', 'lizhaojun', '2828', null, null, null, null, null, 9849);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e759fcd070023', null, '王云志', 'wangyz', '760123', null, null, null, null, null, 7987);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e75a098b30024', null, '虞鹏', 'yupeng', '2828', null, null, null, null, null, 13322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e75a0bf850025', null, '虞鹏', 'yup', '815529', null, null, null, null, null, 9302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e790394f1002f', null, '姚振华', 'yaozh', '7188', null, 'SUPER', null, null, null, 8025);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7903c1120030', null, '姚振华(北京)', 'yzhbj', '7188', null, null, null, null, null, 18106);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7911b2390042', null, '赵磊', 'zhaolei', '7188', null, null, null, null, null, 23674);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7914bd950047', null, '周松林', 'zhousl', '7188', null, null, null, null, null, 7921);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7916da89004c', null, '苗发菊', 'mfj', '7188', null, 'SUPER', '一分公司', null, null, 24144);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e792a835f0050', null, '吴骏', 'wj', '7188', null, null, null, null, null, 8223);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e792f376a005b', null, '王来清(北京）', 'wlq', '7188', null, null, null, null, null, 8396);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e79304dfa005d', null, '王吉庆', 'wjq', '7188', null, null, null, null, null, 22411);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7930c8d7005e', null, '劳荣根', 'lrg', '7188', null, null, null, null, null, 19503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7931193a005f', null, '吴伟东', 'wwd', '7188', null, null, null, null, null, 20588);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e793377fa0062', null, '沈秀珍', 'shenxz', '2828', null, 'SUPER', '二分公司', null, null, 9536);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e793496c80063', null, '叶萍', 'yep', '2828', null, null, null, null, null, 20068);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e79355ebb0065', null, '张丽敏', 'Zhanglm', '2828', null, null, null, null, null, 9530);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e793581950066', null, '张丽敏', 'zhanglimin', '2828', null, null, null, null, null, 9562);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e793ab6f50071', null, '黄伟', 'hw', '0000', null, null, null, null, null, 7087);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f52d314007f', null, '余月强', 'yyq', '7188', null, null, null, null, null, 19866);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f551e0e0083', null, '徐惠敏', 'xhm', '9999', null, null, null, null, null, 7112);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f58d99f0087', null, '江仟长', 'jqc', '2626', null, null, null, null, null, 11002);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7799b10098', null, '于洋', 'yuyang', 'yuyang', null, null, null, null, null, 17582);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f79426f009c', null, '蒋萦牧', 'jym', '7188', null, null, null, null, null, 21172);
commit;
prompt 500 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7bd40700a1', null, '唐海卿', 'tanghj', '13386014827', null, null, null, null, null, 10353);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7d0ce500a6', null, '任宇翔', 'ryx', '7188', null, null, null, null, null, 17442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7e1d2c00a8', null, '张希', 'zhangxi', '7188', null, null, null, null, null, 20076);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7f2e0f00aa', null, '龚斌', 'gongb', '0401', null, null, null, null, null, 12442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('05A6B90E8BC94FA0B912E68D6B9F8281', null, '周吉', 'zhouji', '0101', null, null, null, null, null, 10729);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5C12138F82D543B4AB606AD020F44B03', null, '赵峰伟', 'zhaofw', '992388', null, null, null, null, null, 10730);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3AEF015EAC5847679528DCEE6DD2E1BF', null, '徐家雯', 'xujw', '4223051', null, null, null, null, null, 10882);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A47174AE3CC4E56A7263E4B2914053C', null, '李永明', 'lym', '7188', null, null, null, null, null, 10902);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6CF8F765E45E43468B7953AA6B12C0A3', null, '袁东平', 'yuandp', '7777', null, null, null, null, null, 10922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EED726F3EDE346F59F9BF447A8E22FBB', null, '谈水章', 'tansz', '2828', null, null, null, null, null, 10943);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF83E941D40249259E40ED968E285A5D', null, '蒋荣昌', 'jiangrc', '2828', null, null, null, null, null, 10944);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('45477169F79C49DC9F340054A330B345', null, '邱洪海', 'qhh', '123', null, null, null, null, null, 7319);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C9DBC8A986E479FB116AB31408AFB58', null, '王同乐', 'wtl', '5716', null, null, null, null, null, 7320);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33C691E3CDA346A0982E2A4B8A813D3D', null, '沈福海', 'shfh', '108', null, null, null, null, null, 7321);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20794C35BA5F48EEA2F0DAAF010BD931', null, '施似佑', 'ssy', '1127', null, null, null, null, null, 7322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E1893F6996274AF18AE17BFA13747EE9', null, '汤叶春', 'tyc', '7981', null, null, null, null, null, 7324);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('522F01D91D284CB38A84DD39F1BDE959', null, '张玉坚', 'zyj', '68120', null, null, null, null, null, 7325);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A35720DE11A4EAEA7DEBEF6219EFF46', null, '陈浩', 'ch', '7188', null, null, null, null, null, 7328);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('422B60B570D442A39753BD5AA25C474A', null, '叶万祥', 'ywx', '5678', null, null, null, null, null, 7329);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B2001187B2044FF5AE2C7D4DE636503E', null, '邱文奎', 'qwk', '713410', null, null, null, null, null, 7330);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3868EB0BC8AC4308A3ACCA7DBF78D284', null, '秦顺发', 'qsc', '7188', null, null, null, null, null, 7331);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C9ABF79567F44146BB147B6E3DD253D0', null, '王培昌', 'wpc', '511018', null, null, null, null, null, 7332);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('225357B8318A4366BED71B8A3AF0DDEE', null, '三管部项目材料员', 'scly', '7188', null, null, null, null, null, 7333);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('03707A082D4E494EAA7103F78D8CB3AC', null, '赵戴虹', 'zdh', '555555', null, null, null, null, null, 7334);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A46262E9CEE40E8A1FF799373D5E927', null, '徐以银', 'xyy', '7188', null, null, null, null, null, 7337);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D2066603FCE04F9D8468038D68A720D8', null, '王亚文', 'wyw', '7188', null, null, null, null, null, 7338);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5856E721FC80468BA860FA3F7366449D', null, '石宝福', 'sbf', '2828', null, null, null, null, null, 7339);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1FA6891AB5C1466481B95429FF5E6FBC', null, 'xxx', 'x', '7188', null, null, null, null, null, 7340);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DC20FFD0AEE94F47BA4AF29BAB2B0A80', null, '张金宝', 'zjb', '7188', null, null, null, null, null, 7341);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5BB7BEE192D347AC986AF5536BA2FBF9', null, '杨尧忠', 'yyz', '1234', null, null, null, null, null, 7342);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E29467314F7A40C2BA76364F38AF52CA', null, '张金荣', 'zjr', '9321', null, null, null, null, null, 7344);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('34AB2A5E0BB94217A931ECA35DEC23A7', null, '谷佳骅', 'gjh', 'gjh413', null, null, null, null, null, 7345);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A50AA1812125456BAA12C754B62E722C', null, '朱德华', 'zhdh', '7188', null, null, null, null, null, 7346);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('93D7846C1A524DA18A6339080927E9C0', null, '接道鸿', 'jdh', '5088', null, null, null, null, null, 7349);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('480485AC2ADA46B393B67D265E622A41', null, '胡见明', 'hjm', '64585968', null, null, null, null, null, 7350);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9165638EBED84079A740F3E311DE3C08', null, '孙敏', 'sm', '2828', null, null, null, null, null, 7351);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39D9E62D33654B6C9DF750AA56593B2F', null, '朱卫东', 'zhuwd', '6605', null, null, null, null, null, 7354);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('86CB5A3EDA9943A0BFCE7D44263CF4BB', null, '杨文强', 'ywq', '999999', null, null, null, null, null, 7357);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B154DFF784F64936B1D73768F703E071', null, '韦康福', 'wkf', '7188', null, null, null, null, null, 7359);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0BB6EED107C4F21B8D174B527F31565', null, '陈纪锋', 'cjf', 'asdf911', null, null, null, null, null, 7362);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B0C707E5BCE04A0C8C50A8CB1553B354', null, '王玉珍', 'wyz', '1221', null, null, null, null, null, 7364);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C65B79A5E1B4C49A5E40159C1520E36', null, '马连发', 'mlf', '7188', null, null, null, null, null, 7365);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F195EA5D9E44FFC82E440AB96DABE22', null, '吴鑫瑞', 'wxr', '7188', null, null, null, null, null, 7367);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5C6DCF4784674936A5DEBD480F9C34A3', null, '倪文豪', 'nwh', '7188', null, null, null, null, null, 7368);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E7A1693BF63741FAA645BFA216BBD5B0', null, '鲍先亮', 'pxl', '7188', null, null, null, null, null, 7369);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('99D0525C325E4450B906138A2A2C13E2', null, '孙洁芬', 'sjf', 'qj718888', null, null, null, null, null, 7371);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C3A4D4543EF34998B4B4BF1C56E2F4B2', null, '李逸进', 'lyj', '7188', null, null, null, null, null, 7372);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('21137D4F83A2452495B340D2582046C5', null, '钱秀珍', 'qxz', '7188', null, null, null, null, null, 7373);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('82C046C6F126435883874256EFEB8AD0', null, '唐寅康', 'tyk', '571013', null, null, null, null, null, 7376);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FCA9596B9705432DB34F2C55DE3DF545', null, '时仲良', 'szl', '200200', null, null, null, null, null, 7380);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FC19FC7023254481A52171B9484977BE', null, '何美芳', 'hmf', '6012044', null, null, null, null, null, 7381);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('381E52890C534A05A26D4E81958E4AF1', null, '张迪', 'zd', '6666', null, null, null, null, null, 7382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8CC75DDABE494CBFB139032751C22452', null, '王遵林', 'wzl', '666', null, null, null, null, null, 7384);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A93076741FB4F2BBAA78D3B1C19D239', null, '李刚阳', 'lgy', '13671590580', null, null, null, null, null, 7385);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('294D0CC0F2F44591A9099AFD3F1BCADC', null, '陈觅萍', 'cnp', '7188', null, null, null, null, null, 7386);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5CEF93385F634AE3AB36000E36B2A392', null, '周晓东', 'zxd', '550', null, null, null, null, null, 7388);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9C72353D311148849CD543BA449E98F3', null, '张轩', 'zx', '761110', null, null, null, null, null, 7390);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D0B23B8F17C445589D901EBEBA691C5', null, '88', '99', '778403ylyl', null, null, null, null, null, 7391);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3EF337F0684845BF8D649E87A8F95F96', null, '易先平', 'yxp', '077421', null, null, null, null, null, 7393);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AED6DAFA101E44288F4ADFDAD8F4A007', null, '殷婷', 'yt', '503', null, null, null, null, null, 7396);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('875A18F1C30C4DDA8426A7851E2000E9', null, '罗廷炯', 'ltj', '0054', null, null, null, null, null, 7398);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6060342CE6944649F030A4114785C18', null, '80', '80', '1212', null, null, null, null, null, 7399);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D0E3128EA08493AABD11DE0A96C4421', null, '王义德', 'wyd', '2828', null, null, null, null, null, 7401);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6B953937F2343CC9B58F74281BD35C5', null, '郑孝崇', 'zxc', '7188', null, null, null, null, null, 7403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE729FE83F92459195B00DE6973E544F', null, '吴福鑫', 'wfx', '2828', null, null, null, null, null, 7404);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('62CE0906F6F24386ADD8C562652B767B', null, '陈芸', 'cy', '2828', null, null, null, null, null, 7405);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3667FE3285084C13B91AF567045D072D', null, '彭康英', 'pky', '1111', null, null, null, null, null, 7407);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('213A0310EE794DD4A62EC9B05977647E', null, '刘春和', 'lch', '2828', null, null, null, null, null, 7408);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('178096B4553B4F23B1A0DB2E3F0D9881', null, '王浩年', 'whn', '781004', null, null, null, null, null, 7409);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0BD147E1FCA47898F8B88A114080F4C', null, '刘军丽', 'ljl', '2828', null, null, null, null, null, 7411);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('334FF80DA0F540B7B645C03C939535F1', null, '严明', 'ym', '789789', null, null, null, null, null, 7412);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3AB19E2AE01441378557F0850561E2EA', null, '巩东江', 'gdj', 'wsxqaz', null, null, null, null, null, 7413);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6D95F41048D4812B6FA653FC3536A3E', null, '倪劼', 'nj', '64870484', null, null, null, null, null, 7444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0D9E8BCD45D447ABF3642E2D54E07AE', null, '华士辉', 'hsh', '7188', null, null, null, null, null, 7505);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('383DAD9AFFD14A60B716D110A9DB0650', null, '张海康', 'zhk', '8275', null, null, null, null, null, 7507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77D6EE0C95004274870834CDE192076C', null, '曹晟光', 'ccg', '7188', null, null, null, null, null, 7508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('23170ED3BA21477EB2CAD361332E93D9', null, '王德华', 'wdh', '2828', null, null, null, null, null, 7540);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A470F71ABC2247A694AADED37596A591', null, '付晶晶(北京）', 'fjj', '1020', null, null, null, null, null, 7563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('486D5ECA9B234010B47839013CB4D093', null, '陶金', 'tj', '7188', null, null, null, null, null, 7564);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA385C05DA88416F83E7AA5355B7B989', null, '宋小红(北京）', 'songxh', '7188', null, null, null, null, null, 7712);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C625A2D2729E4813ABCB7027D15D76D2', null, '李鉴清', 'ljq', '4903', null, null, null, null, null, 7731);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2768597A96BF44BBA8EE83D1A296E571', null, '陈文忠', 'cwz', '791219', null, null, null, null, null, 7732);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54C8BBA68AB044158B0F3422C9DC2BFB', null, '陈敏睿', 'cmr', '900815', null, null, null, null, null, 7733);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CFC1ED6564374B5EBB4856BFA72D7A5C', null, '龚子真', 'gzz', '780118', null, null, null, null, null, 7734);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('57F39F5CBE414AA5838CABB3F8F47F80', null, '沈建荣', 'sjr', '7188', null, null, null, null, null, 7735);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7D7403740BF54E1488CE2412F65F0B2D', null, '朱新荣', 'zxr', '1234', null, null, null, null, null, 7738);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('61DE7F709F8345618D13BFCAB826A4EE', null, '周春年', 'zcn', '7188', null, null, null, null, null, 7740);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AD5FF05EE0304887BB62EAE1D1DC207B', null, '邬朝嵘', 'wucr', '7878', null, null, null, null, null, 7741);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F56D31D615604498B583421CACE5E23E', null, '王和林', 'whl', '1001', null, null, null, null, null, 7742);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02FA002C20244E73B0A048300163754B', null, '王正华', 'wzh', '720130', null, null, null, null, null, 7744);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0CB78D5E95A4DB198A6AA855ADEC841', null, '朱海麟', 'zhl', '7188', null, null, null, null, null, 7746);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6464020340624D54A810B76E97151244', null, '吴立新(安装）', 'wlx', '6404', null, null, null, null, null, 7747);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('605452B2838D4B41B5AD1F9DDA418F5B', null, '罗贤法', 'lxf', '7188', null, null, null, null, null, 7748);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26E306F228A94E3ABE372B0850F92A7F', null, '凌鉴达', 'ljd', '1234', null, null, null, null, null, 7756);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('97A00F0019F442958CB187D8B6FCECB8', null, '胡林章', 'hlz', 'dh3582', null, null, null, null, null, 7758);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02D07816ECE64C2C8B0DD77A03C064B9', null, '浦卫宗', 'pwz', '2026', null, null, null, null, null, 7759);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6FFDF0623C784FDBAA155B770F1357B1', null, '姚吉平', 'yjp', '5932', null, null, null, null, null, 7760);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0346AF5C0114BB7B32F52EA8B9F17CE', null, 'xx', 'oo', '0713', null, null, null, null, null, 7765);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('01C157E5E97E4376B19E61EBE8B958ED', null, '张良', 'zhli', '7188', null, null, null, null, null, 24278);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CBB1CC4074994C10B1D3BFD4E0E320A8', null, '吴苑', 'wuy', '19810215', null, null, null, null, null, 7877);
commit;
prompt 600 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('73BFCE4D10BD4F7B902856D41ED3CDC5', null, '陈湘', 'chengx', '7188', null, null, null, null, null, 7878);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07080673290C41FC9A8D2885FF723FFD', null, '李国祥', 'ligq', '7188', null, null, null, null, null, 7879);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('139393308BA949C983ABCE40BE3AC59D', null, '陈国平', 'cgp', '513151', null, null, null, null, null, 7880);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C0702A8B31324A958DE7CB358A582DB8', null, '钟卫星', 'zhongwx', '7188', null, null, null, null, null, 7881);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE1214A22D6B4B18A1EEE2A5F85BBCB3', null, '金庆龙', 'jql', '7188', null, null, null, null, null, 7882);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F935F2B4CA7461BBFC15F4C6B050C33', null, '蒋华', 'jh', '7188', null, null, null, null, null, 7884);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A5E7D3471A94DD89987FD4FD58B5BB2', null, '顾麟刚', 'gulg', '7188', null, null, null, null, null, 7885);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D27ABFD7E11344AC8C7FA258A56675C0', null, '孙浩昌', 'sjc', '7188', null, null, null, null, null, 7886);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EAA5A97E51104222A24A1E24E4644F0C', null, '叶永康', 'yeyk', '7188', null, null, null, null, null, 7887);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('856A9FEE52914E63B181555C4AC72B6E', null, '蔡宇', 'caiy', '7188', null, null, null, null, null, 7888);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9D0B11444E874B7AAB1667D3C8842F59', null, '陈良章', 'clz', '7188', null, null, null, null, null, 7889);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C655D70CC36C4ECEB3170233EF6FEAC2', null, '钱海龙', 'qhl', '7188', null, null, null, null, null, 7890);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F345E0A704B8432BAB73F25129272AD3', null, '钱良生', 'qls', '7188', null, null, null, null, null, 7892);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54C83F5E897D4F6E9D2B6C1CFBAA9878', null, '陶根发', 'tgf', '7188', null, null, null, null, null, 7893);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('355C9F147DF7432886FC4E3F2437C595', null, '曹国兴', 'cgx', '7188', null, null, null, null, null, 7894);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20199F6FD1354426AE1753BC8538C78E', null, '叶菊华', 'yejh', '7188', null, null, null, null, null, 7895);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('098015F172B64DF6AF3E6EDC1C590265', null, '郁惠文', 'yuhw', '010314', null, null, null, null, null, 7896);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('92351F188B2146F087F02DC4B49D4E44', null, '沈安平', 'sap', '7188', null, null, null, null, null, 7897);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('760D8CA09B33424F8A8BA110884FB5D3', null, '汪遵达', 'wzd', '7188', null, null, null, null, null, 7898);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('891B460C5B0E485C9919E9278659CB72', null, '谢军', 'xiej', '7188', null, null, null, null, null, 7899);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('351BF7E903F5409498C4B669B1D1F747', null, '顾荣宝', 'grb', '7188', null, null, null, null, null, 7900);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A58C65B9B6841E0A88AD5F9623FAC32', null, '冯益飞', 'fyf', '7188', null, null, null, null, null, 7901);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0CD6AE76BCA742E1A5F28777D7A9FECF', null, '李学功', 'lixg', '7188', null, null, null, null, null, 7903);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A858ACB66CAD49A8A90F1A6951CF4F4A', null, '周锡其', 'zhouxq', '7188', null, null, null, null, null, 7904);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AFC9607BF7964C0C88EFDD8C520AF8B3', null, '储中伟', 'chuzw', '19770317', null, null, null, null, null, 7906);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0587939A1F7A4F2F8A275934916494E7', null, '陈坤', 'chengk', '7188', null, null, null, null, null, 7908);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8464679C4B784837BE18B714BE2D1085', null, '蒋国方', 'jgf', '7188', null, null, null, null, null, 7911);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('530D408B0A394B11A35FD32890121BDC', null, '张维纲', 'zhangwg', '7188', null, null, null, null, null, 7914);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('184D930F8BEB45A8940E9F53D5EB5333', null, '王盛杰', 'wangsj', '7188', null, null, null, null, null, 7915);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7F590D27D6684101A8A8B5AA0D8E9282', null, '马鸣富', 'mmf', '7188', null, null, null, null, null, 7916);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0CD29E6A15244C0A993316837C9BC959', null, '乔伟国', 'qwg', '7188', null, null, null, null, null, 7917);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E89674C7B06491A85F320C6B41F430B', null, '彭大祥', 'pdx', '7188', null, null, null, null, null, 7919);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('67CDDF6901C8435C9CA8C6DFF1111456', null, '陆志斌', 'lzb', '7188', null, null, null, null, null, 7920);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A46796BA1BE2499498EF05FEFEC8D005', null, '邵培明', 'spm', '7188', null, null, null, null, null, 7922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0D747F4CF3C453194F66DE7F0325CD9', null, '董学衍', 'dxy', '11', null, null, null, null, null, 7924);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('28DE59874F66402BA585B8928E4D7E73', null, '徐慕华', 'xumh', '7188', null, null, null, null, null, 7925);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3EA9E2FD5561480EBA0B2E641450B103', null, '戴容芳', 'dairf', '7188', null, null, null, null, null, 7926);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('72DC101E9A46451D9A07DA527F592618', null, '吴妙龙', 'wuml', '7188', null, null, null, null, null, 7927);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('486B73D910F1402BABC969E597DCF407', null, '藏晋平', 'zangjp', '7188', null, null, null, null, null, 7929);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6359B5AFDD14C0FA2A7B2354493A0CF', null, '王银根', 'wangyg', '7188', null, null, null, null, null, 7930);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D1D78FF562AB4B8381D36969283CCBCC', null, '赵玲', 'zhaol', '7188', null, null, null, null, null, 7931);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6EF148ABC6274D77A20F405B75C97050', null, '诸少先', 'shusx', '7188', null, null, null, null, null, 7932);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7B74DDA666C047A8899D3CFF1179038C', null, '陆金根', 'ljg', '7188', null, null, null, null, null, 7934);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69048559349247C4B74B45D091906135', null, '华为夷', 'hwy', '7188', null, null, null, null, null, 7935);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('589222ED2A4C4B15B09ECE0B9D0B6CD1', null, '崔昌胜', 'cuics', '7188', null, null, null, null, null, 7936);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25C5481D5A73481F881748BD0DF9BC2D', null, '叶莉', 'yl', '7188', null, null, null, null, null, 7937);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('176CAC81DCDB46619648086D41C13E56', null, '杜龙根', 'dlg', '7188', null, null, null, null, null, 7939);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F2A90E1B0F614033B888CD32373C8CB9', null, '唐莉影', 'tly', '7188', null, null, null, null, null, 7940);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D687E0713464601A5E4EF2A79CB89F4', null, '陈佳颖', 'cjy', '7188', null, null, null, null, null, 7941);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20557A85922743DBBDF685FEDAEF3C12', null, '周敏', 'zhoum', '777777', null, null, null, null, null, 7942);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FBB3500B35FF4BA4A171F3DCC623C748', null, '朱培元', 'zhupy', '7188', null, null, null, null, null, 7944);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BA4C987909147F7A9A3B82A3BAFCEB2', null, '邵广起', 'sgq', '7188', null, null, null, null, null, 7945);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C7423A74E9B54575BECD8C474079EF79', null, '刘观铧', 'liugy', '7188', null, null, null, null, null, 7947);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('81E5F4A402E74B33870000A65E308323', null, '倪国祥', 'ngx', '7188', null, null, null, null, null, 7948);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A331BE2E6924473D98E2B40623D6C928', null, '周林', 'zhoul', '7188', null, null, null, null, null, 7949);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A7785D13F9B4403A917C23CF69E72E4', null, '张海宝', 'zhanghb', '7188', null, null, null, null, null, 7950);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('120BBD4AB7094E64AF712759878A1648', null, '王彩君', 'wcj', '7188', null, null, null, null, null, 7951);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F379D28C269843499F5765519D8E8E5D', null, '尤建峰', 'youjf', 'su98104994', null, null, null, null, null, 7952);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D45DC1FECB574455B10365EBEDAC3221', null, '孙德冉', 'sdr', '2004', null, null, null, null, null, 7953);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DCC6AC1EFA8B423692D8D547DB324016', null, '沈福林', 'sfl', '7188', null, null, null, null, null, 7955);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('90B4BC8FD0A248B6A710AF0A8DE98B59', null, '王建良', 'wjl', '7188', null, null, null, null, null, 7956);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C54E7F11B90F477F894004802A4CC455', null, '张惠萍', 'zhanghp', '7188', null, null, null, null, null, 7958);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E8115189EC914BED9ED718FF1D21246F', null, '王静', 'wangjing', '2828', null, null, null, null, null, 7963);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('66C8D8836577409A8BF35CF064DF4A71', null, '宗正华', 'zongzh', '7188', null, null, null, null, null, 7965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('866EE53115AD40218ED9AFABA452AC26', null, '朱祥富', 'zhuxiangf', '7188', null, null, null, null, null, 7966);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEAB03A175B14952A78F01EAD7B966D2', null, '须旦鸣', 'xudanm', '5711', null, null, null, null, null, 7967);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6AEB784123A947DC9D6E834FE2B37C55', null, '树成章', 'shucz', '144668', null, null, null, null, null, 7968);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8537B7B2B3A949A3905813DCAD28C88B', null, '甘列俊', 'ganlj', '8177', null, null, null, null, null, 7969);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B70E4B0FD8C44A5ABB2D18441265B6FC', null, '朱生泉(704)', 'zhusq', '1965', null, null, null, null, null, 7970);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CA6EA45F687047EC83BBD487301F0837', null, '李海明', 'lihm', 'elslhm', null, null, null, null, null, 7971);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09EEF2B704074F77B60EDA5002929861', null, '秦亚珍', 'qinyz', '1390162', null, null, null, null, null, 7972);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ED898353D7924BC8B3A0E661ED4BD7CD', null, '姚静忆', 'yjy', '3363', null, null, null, null, null, 8019);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5292852C26C74771971DFDA222440098', null, '金海滨', 'jinhb', '750408', null, null, null, null, null, 7975);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A745B895420A48949356352D2671338E', null, '李高生', 'ligs', '7288', null, null, null, null, null, 7976);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3135415693F447F7A7C7BC9EA62340F3', null, '钱兴红', 'qianxh', '64223064', null, null, null, null, null, 7977);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AB7DC416B56D477C863EC5F0A1A11BFD', null, '夏辉', 'xiah', '202', null, null, null, null, null, 7981);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2E1BD2957BBB4105BC4DB7E0EF8A8A9F', null, '贺淳', 'hechun', '7188', null, null, null, null, null, 7982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('195438874BF846C698F49E9E7BCCA0FE', null, '戴常红', 'daich', '0331', null, null, null, null, null, 7983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DC8A59DF4E054E38A46B999055A28A8E', null, '龚志琴', 'gongzq', '960120', null, null, null, null, null, 7984);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6401B4DF4B054AAD80880043ECB2CE02', null, '江伟达', 'jiangwd', '704', null, null, null, null, null, 7985);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('269E2C23795542D6A52609210012E0E6', null, '王国安', 'wangga', '7188', null, null, null, null, null, 7986);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7E5E98CD3E844472B5549CCF9017FC83', null, '史家定', 'shijd', '7188', null, null, null, null, null, 7997);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BD6D382365EC4FF194F65D86B52B8991', null, '郗海京', 'xihj', '0625', null, null, null, null, null, 7998);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AB1486AFAE1541E69F64AC4EAE3826AB', null, '伊桂芬', 'yigf', '7188', null, null, null, null, null, 7999);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B7EF7CBDA1FB47C490B1465A50869619', null, '张海宾', 'zhanghaib', '7188', null, null, null, null, null, 8000);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B1B47CB689344BC29A885C206C147BB8', null, '阮文忠', 'ruanwz', 'rwz1968', null, null, null, null, null, 8001);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('074A40F29474498D822F035D19BD6324', null, '徐军', 'xuj_4', '7188', null, null, null, null, null, 8002);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A4805944D2684FF9B1B4C5F78A2531CE', null, '陆强', 'luq', '1234', null, null, null, null, null, 8515);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('40DCC951C79D4C368283290491206FD5', null, '顾幽燕', 'gyy', '930905', null, null, null, null, null, 8523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F0AF26A5CA0C44E5B1BEDC5B7B28472F', null, '章旻', 'zhangm', '7188', null, null, null, null, null, 8525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B2EDA2A7352B4FD496B0698BE467C61C', null, '王跃明', 'wym', '7188', null, null, null, null, null, 8582);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEEDE87E9DCE4C8A9486BEA037104A63', null, '沈伟众', 'shenwz', '7188', null, null, null, null, null, 8603);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('28F1D93BD0BE4EEE8C459D71CC369DBB', null, '7', 'sss', '7188', null, null, null, null, null, 8604);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEAEE50CDE7445D497E7ADDDCCC0EB2C', null, '陈海荣', 'chenhr', '7188', null, null, null, null, null, 8605);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A4A41CB988BE47FB8E0559200DEE6FAD', null, '张辉', 'zh', '200309', null, null, null, null, null, 8622);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('99C51655B96D4E99998364086978808E', null, '金怡然', 'jyr', '002231', null, null, null, null, null, 8623);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6F69768DE1F349AEBF39CCFC2AC877D6', null, '叶民', 'yem', '7188', null, null, null, null, null, 8624);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('65415633A0C74757BDEC9D8856EE9910', null, '张建群', 'zjq', '961125', null, null, null, null, null, 8625);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9880A0D4894A4F38B6014106E76694C2', null, '冯骅', 'fengh', '7188', null, null, null, null, null, 8629);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D0499730608436EB3C9331E80FAE752', null, '沙汉涛', 'sht', '7188', null, null, null, null, null, 8630);
commit;
prompt 700 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1FFC328010744E65ADABF50C607209DC', null, '陈辉', 'chengh', '7188', null, null, null, null, null, 8632);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0040FCE3830846AD92FEE73826493AFE', null, '陈纪峰', 'chenjf', '7188', null, null, null, null, null, 8633);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('78C66916D58A4B4290988928015E57FB', null, '江洪', 'jiangh', '7188', null, null, null, null, null, 8634);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E5A5C5578129459C96D83DC1FABD6D44', null, '金常绿', 'jcl', '2828', null, null, null, null, null, 8643);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C96E67501B4A493394FD9FFF4E336F7B', null, '金岳云', 'jyy', '2828', null, null, null, null, null, 8644);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D37459448E404B26843D515D2E045FF1', null, '严秀红', 'yxh', '1893', null, null, null, null, null, 8645);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('10C9FC66493C4D31A2818AC9C1FF53FD', null, '周玉瑛', 'zyy', '4321', null, null, null, null, null, 8647);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('22DCE86A24664B268D1C6F35A38B0703', null, '夏秋芳', 'xqf', '123123', null, null, null, null, null, 8648);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('76AFBADEB2C94BFF88FBD6C1FDFDFA90', null, '张莉芳', 'zlf', '760123', null, null, null, null, null, 8684);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('21E8A6C8215B4DE9999A2CA604C98D54', null, '袁建雄', 'yuanjx', '2828', null, null, null, null, null, 8686);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58B73CB7FF0647E2A74DA53EB2D0C9F9', null, '黄林发', 'hlf', '2828', null, null, null, null, null, 8687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9D6FB9B8BD6C4A4EAE242BF976A4D3CC', null, '朱凯波', 'zhkb', '59616280', null, null, null, null, null, 8762);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BE31B2DF509450D8E4FC1B30D197676', null, '杨云霞', 'yangyx', '2828', null, null, null, null, null, 8785);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('80707A6EE64242B4B6A5848A53290443', null, '童红芳', 'thf', '123456', null, null, null, null, null, 8825);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('16D064BD5AB94229A9AE87F9F8893EEB', null, '王元启', 'wangyq', '2828', null, null, null, null, null, 8827);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DC7792A046F64AFBBDFBFED65654C919', null, '111', 'czr', '2828', null, null, null, null, null, 8829);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77BEDCDE633A499399002BBE448522F6', null, 'tttt', 'rrr', '2828', null, null, null, null, null, 8832);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6F13034CA0142CCBFC5AD3AC352A5F5', null, '林奇', 'linq', '258258', null, null, null, null, null, 8833);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A20C69044034473A8883A1F933489123', null, '魏志峰', 'wzf', '170034', null, null, null, null, null, 8844);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D99845584F98426BB63EA6154E2F06DF', null, '宋自杰', 'szj', '7755', null, null, null, null, null, 8851);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('15EFE51AEFDF4D9D87D2CF18DF3A122A', null, '戚建新', 'qjx', '5127', null, null, null, null, null, 8882);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1880CF59470C4891AD920BD40616F622', null, '李志敏', 'lzm', '2828', null, null, null, null, null, 8883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96CF1A2DEF234B588DA6A72058CAD698', null, '顾建新', 'gjx', '7188', null, null, null, null, null, 8887);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C647D40F928945719227309B409D5364', null, '唐明钜', 'tmj', '2828', null, null, null, null, null, 8888);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AD431CEAD2F4F8C8CD0F69865CA0E67', null, '陈敏睿', 'chenmr', '2828', null, null, null, null, null, 8890);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E8AE9246BE74DEABD4B17A1FDFF64FC', null, '叶民', 'yeming', '2828', null, null, null, null, null, 8895);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9AE0ED16CC9D4ACEA942457538FE2059', null, '干宏春', 'ganhc', '2828', null, null, null, null, null, 8897);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E8360A0C1836439CA18A6A4721689AEA', null, '许金根', 'xjg', '2828', null, null, null, null, null, 8902);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A6695808C9CC44CA8B5D83D60670711C', null, '杨东梅', 'ydm', '2828', null, null, null, null, null, 8903);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39320A07C33A4081BD17DD888E3BD4DB', null, '顾敏', 'gm', '2828', null, null, null, null, null, 8904);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0DA1E13037B452C9CF71495467AB719', null, '颜圣喻', 'ysy', '2828', null, null, null, null, null, 8908);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BBB01287AFA546F7B641FB93B4CF2D72', null, '陈笙昌', 'csc', '2828', null, null, null, null, null, 8909);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54DE19D62DE744DE91E7EC3417D3A95E', null, '王伟中', 'wwz', '2828', null, null, null, null, null, 8910);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FBD7EA71708B447E95EAE36B1BDD9941', null, '马进和', 'mjh', '2828', null, null, null, null, null, 8912);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('362D6A98005047EC85555A85D898108D', null, '刘琪昌', 'lqc', '2828', null, null, null, null, null, 8914);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26C263F7BB9D4E8F9F286BEBB5080262', null, '黄蕾', 'hl', '2828', null, null, null, null, null, 8917);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE8DCC21B1C1422F844CA64E6718C227', null, '唐纬', 'tw', '2828', null, null, null, null, null, 8918);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7FD480CA97F848188217008139B0367C', null, '温巨翔', 'wjx', '2828', null, null, null, null, null, 8920);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0A1CA304AEFA45B6A453004CF1DFE51F', null, '王宾仁', 'wbr', '2828', null, null, null, null, null, 8921);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('01853ABD1F284F1D8B351415B46F73E9', null, '曹军华', 'cjh', '2828', null, null, null, null, null, 8922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B97172419C304C9397C2AC8AA300AE6D', null, '陆云', 'luy', '2828', null, null, null, null, null, 8926);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0DD06E82B5AF471B8413FEA2EDC5828D', null, '严振刚', 'yzg', '2828', null, null, null, null, null, 8927);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F373AEECD99341F7B10ED1903D9ABF04', null, '周驰威', 'zcw', '2828', null, null, null, null, null, 8929);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E5FC34867EC4298AADF8865D3466065', null, '唐洪良', 'thl', '2828', null, null, null, null, null, 8930);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5573A3C1A59446C987F61D168C35B06', null, '王正琪', 'wangzq', '2828', null, null, null, null, null, 8932);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EC66B72F065F4453B0701F3B5D68E597', null, '吴江', 'wuj', '2828', null, null, null, null, null, 8935);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('64A8C5C28E8A4F189EAFDA059FF9285A', null, '黄哲宇', 'huangzy', '2828', null, null, null, null, null, 8937);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D9B17D4B0264EEE8C63EBEB85088DEF', null, '孙磊', 'sl', '2828', null, null, null, null, null, 8938);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1CE4872AEDFA4BFDA3229AD1FBBCAA7A', null, '徐卫东', 'xwd', '2828', null, null, null, null, null, 8939);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E1C76B950F054D0F82CA0173C24A433F', null, '顾大群', 'gdq', '2828', null, null, null, null, null, 8940);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8FFC766546DD4B72A915116279A981E8', null, '顾世平', 'gsp', '2828', null, null, null, null, null, 8941);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1350029B348E497EB8DE1DACE8E7F00F', null, '王春', 'wc', '2828', null, null, null, null, null, 8942);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('64EB5C54FB6D4B54B8D1CAAEB14EA647', null, '陈徐荠', 'cxq', '2828', null, null, null, null, null, 8943);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2CB9773BCB0444388A788CA672FAEA4', null, '季福民', 'jfm', '2828', null, null, null, null, null, 8946);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8119F4189CCA4FE29F122BC4763C366A', null, '欧阳纯', 'oyc', '2828', null, null, null, null, null, 8947);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2FD0842642CD4AA3B9A0BDD08A0F6B9A', null, '冯骅', 'fenghua', '2828', null, null, null, null, null, 8950);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7A178A2B8F75461FBE321E7B01CB7BC1', null, '邹杨', 'zouy', '2828', null, null, null, null, null, 8952);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6862A4915FFE4B21A35C825A88D6BF19', null, '朱萍萍', 'zhpp', '2828', null, null, null, null, null, 8957);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('474E1DC40F3A4670A6D5FA8A3F83DDC0', null, '吴春兴', 'wucx', '2828', null, null, null, null, null, 8960);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5B847639D944A4682580F60531E4DDB', null, '曹建中', 'cjz', '2828', null, null, null, null, null, 8963);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6967C4D6CA154F0CBCB467D38802DBDE', null, '陈沪珍', 'chz', '7188', null, null, null, null, null, 8965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('384476DAEEEE414EB3CA74F7895E016A', null, '陆星', 'lx', '2828', null, null, null, null, null, 8966);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AFA63328F35048E2887083A16F597E4E', null, '张良德', 'zld', '2828', null, null, null, null, null, 8969);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FAA364A82A0844BDA0C2D777B8C23777', null, '赵惊良', 'zhjl', '2828', null, null, null, null, null, 8970);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2E78929DE2254BBE91A094486210ADE1', null, '冯美珍', 'fmz', '7188', null, null, null, null, null, 9063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E18A18E5B01D4F93A4A08A4D61C0279D', null, '王国强', 'wanggq', '2828', null, null, null, null, null, 9064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('90BA3C035B6F4FB99EEF5765DC49FECA', null, '易翔欧', 'yxo', '801129', null, null, null, null, null, 9082);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3ADEE7BB9AFC4A51BD6D938F6EBC433D', null, '陈明达', 'chengmd', '1300', null, null, null, null, null, 9122);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('90ED9B24E3F6484AAF96358FE7C76276', null, '高水梁', 'gsl', '7188', null, null, null, null, null, 9162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('27CC35799F4643D7AAF75E1E5A727787', null, '严俊', 'yanj', '124719', null, null, null, null, null, 9222);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3CB81BC6C2BC4C518F839BD4BCFC6830', null, '徐叶丽 ', 'xuyl', '820526', null, null, null, null, null, 9224);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E65E136BB4644E8ABA257B97E0AC4CE', null, '朱文辉', 'zhuwh_4', 'hally', null, null, null, null, null, 8004);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CD8D97E60A354D48AFDB347838F2265C', null, '杨自立', 'yangzl', '480407', null, null, null, null, null, 8005);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9FBAFDE762A04CCF93F4EB4C254636BB', null, '付鹏', 'fp', '7188', null, null, null, null, null, 8006);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF77809B30EF407DAFA767F2C9FDFC47', null, 'xxx', 'xxx', '7188', null, null, null, null, null, 8020);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0708EC75106D464783FC63217F122605', null, 'xx', 'xx', '7188', null, null, null, null, null, 8022);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E41A0A86965748959236D5FBBE51B2F5', null, 'x', 'bgs', '7188', null, null, null, null, null, 8023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F9EEE0D0FBA449E49D8094E2117CE975', null, '何伯华', 'hbh', '7188', null, null, null, null, null, 8026);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('10CDF18273624435ADF0A186513E65B5', null, '唐秋良', 'tql', '7188', null, null, null, null, null, 8027);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0447229326F4C2FAC8BB58D3C28997C', null, '戴常江', 'dcj', '7188', null, null, null, null, null, 8028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('88C3350E49F74E74934F686FC8D09E18', null, '薛蓉芳', 'xrf', '92914', null, null, null, null, null, 8033);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E7DF110B04AA480D90A8AB103ECF0611', null, '周毅', 'zhouy', '5496', null, null, null, null, null, 8036);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D392632759544660971E16289BB67D48', null, '徐炳青', 'xbq', '139170', null, null, null, null, null, 8038);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8C9DE3510C974C0F849A3C25A556A5C5', null, '陈爱盛', 'cas', '7188', null, null, null, null, null, 8039);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('56C0EF7E4D024C8795210A82206F42D5', null, '唐连珍', 'tlz', '7572', null, null, null, null, null, 8040);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('78F634C04E8242D5A296F3B96204C5D4', null, '俞国庆(装饰）', 'ygq', '203501', null, null, null, null, null, 8043);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96DC25F680634F3B893E0C3AAF4DD04C', null, '金海清', 'jhq', '511688', null, null, null, null, null, 8044);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D12D409140841AFA5A40A668DFE8879', null, '顾建军', 'gjj', '7188', null, null, null, null, null, 8047);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7CB240C691C74B75B2E6C4079D0E3916', null, '777', '555', '0215', null, null, null, null, null, 8048);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A02B505B40D49819C402120828BE9DE', null, '陆国荣', 'lgr', '6188', null, null, null, null, null, 8049);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2F732641490497ABADA3EBD8F98F9BB', null, '翁芝祁', 'wzq', '7188', null, null, null, null, null, 8051);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4DD124E274294E82AB0502B5FD14AA36', null, '陈德斌', 'cdb', '6188', null, null, null, null, null, 8052);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5671E87EA56C4D449754E52CE2C6A2D2', null, '汤永兴', 'tangyx', '7188', null, null, null, null, null, 8054);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39903DC377E9424B91397629CFD2F1EB', null, '任志明', 'rzm', '6188', null, null, null, null, null, 8056);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6EE59E7C23C240BE90F931D65C528304', null, '王彦', 'wangy', '3772', null, null, null, null, null, 8061);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4F73F7A06F4649CBAC09BCB1CDD20695', null, '潘宝荣', 'pbr', '7188', null, null, null, null, null, 8062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B163892AC4AA4C6BAAD605D2562FC936', null, '郑福兴', 'zhengfx', '8178', null, null, null, null, null, 8064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C304A59C304A4A9AA1E778F692B252B2', null, '77', '777', 'qijian', null, null, null, null, null, 8066);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('355222B5E3264B8FABAD524F8CD37ABA', null, '朱振亚', 'zzy', '7188', null, null, null, null, null, 8067);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5DF70A6BD14468FAD7AF5F661DD049D', null, '张鸿民', 'zhm', '7188', null, null, null, null, null, 8068);
commit;
prompt 800 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50B7A782B39D444C881EBEA39F29824C', null, '沈国章', 'sgz', '7188', null, null, null, null, null, 8070);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5EAC554C4FB4439DB9273BAEED9AFBBE', null, '9663', '666', '7188', null, null, null, null, null, 8071);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('57ED4FDD5DDE45C8A66F08F9A5549F51', null, '陈绍家', 'csj', '7188', null, null, null, null, null, 8072);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE93B120C550491C8CD196D414C52C86', null, '章仪亮', 'zyl', '222', null, null, null, null, null, 8075);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6090A7A8D3DC4E5D93350E29DA4F81A5', null, '沈德康(702)', 'sdk', '5151', null, null, null, null, null, 8076);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6738820CE889430B8BAFDD0E25CC37F0', null, '沈金芳', 'shenjf', '7188', null, null, null, null, null, 8078);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CD09E1E83B784F20817CB54086EFDD7E', null, '方荣', 'fr', '702zly', null, null, null, null, null, 8081);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3469FCF757A04807ACD9BA57E2E09503', null, '赵敦良', 'zdl', '707518', null, null, null, null, null, 8083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BCE55AC642114971A4991E5ADB8DFC3A', null, '666', '633', '404595', null, null, null, null, null, 8085);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('514C1E58B00040D58C56516A46F33100', null, '钱伟康', 'qianwk', '7188', null, null, null, null, null, 8088);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE5BFCD25B544B72B83E2D9A0B841EFF', null, '赵志强(707)', 'zzq', '1300', null, null, null, null, null, 8093);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4363DA4E155B4FCF94E447789B80F777', null, '瞿莺华', 'qyh', '255365', null, null, null, null, null, 8097);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DB44419E4F0E4155A6E57D9651789D77', null, '张向东', 'zhangxd', '7188', null, null, null, null, null, 8101);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7BF523D306C24DB1AC15079A06FFAA0D', null, '周敏勇', 'zmy', '1234', null, null, null, null, null, 8102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D2959C31C8244D3BF53976CB4959CB4', null, '孙雯', 'sunw', '1122', null, null, null, null, null, 8105);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('550A2EBE48F64CC9A71B8F8EDBC0FCA4', null, '陈华', 'chenhua', '7188', null, null, null, null, null, 8107);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F2FAB5A7AD4B4EC094E7D6ADFFF315D8', null, '吴周纪', 'wzj', '661217', null, null, null, null, null, 8111);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E71628FF5BA646B7B539032FBE0D21BA', null, '倪凤官', 'nfg', '1234', null, null, null, null, null, 8112);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9DB04598451A43408210E50150EE4472', null, '淡水章', 'dsz', '1230', null, null, null, null, null, 8113);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6F261A3F85044E11A4D578AB4E41DA80', null, '张珺', 'zhangj', '1225', null, null, null, null, null, 8118);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('159B66B3EC4A443A9F37645C00191069', null, '浦卫祥', 'pwx', '7188', null, null, null, null, null, 8119);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FAA6CFF37952466B8E55B05D4DC54F79', null, '王道江', 'wdj', '2828', null, null, null, null, null, 8121);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C125EAEA25045A2B77DCFCF38556572', null, '王旭东', 'wxd', '1234', null, null, null, null, null, 8123);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C126AC3FB29147C5A1A65664FB6C7D97', null, '朱启新', 'zqx', '839967', null, null, null, null, null, 8124);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AF5DFA1F05A448219391152A1A133744', null, '徐兰芬', 'xlf', '1234', null, null, null, null, null, 8125);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3AC6AB0ABC0A4AC098FA1AD418BAA2ED', null, '蔡良鑫', 'clx', '2828', null, null, null, null, null, 8126);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77459BBF8F3542D39D95CF9807F20E18', null, '陈新江', 'cxj', '0414', null, null, null, null, null, 8129);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F1B8CBE8806B40F894FD00B5D198289F', null, '蔡根华', 'cgh', '4922', null, null, null, null, null, 8131);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A38AB244E6DE4E159F75A8B5D705536D', null, 'fei', 'fie', '7188', null, null, null, null, null, 8132);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2CC55FEFD29488BA9441DFA02BDDE4D', null, '何裕生', 'heys', '5186', null, null, null, null, null, 8133);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0708973A284D48B0BF5EBF4A282E33F1', null, '彭建萍', 'pjp', '0814', null, null, null, null, null, 8135);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('552B6CB115B84F3BB87899F3A03C7F5E', null, '陈树国', 'csg', '2101', null, null, null, null, null, 8136);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('139A81D1C0BC41AA93C9941517A706BD', null, '季明春', 'jmc', '720', null, null, null, null, null, 8137);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('911329F02AF6462296404E49FC44672F', null, '李安成', 'lac', '1909', null, null, null, null, null, 8138);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A51E7C7610354E108B9F179C0D658249', null, '蒋红泉(租赁）', 'jianghq', '0407', null, null, null, null, null, 8139);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D05A3CEB47B4945B01C5D167B9A7F0B', null, '洪惠民', 'hhm', '2828', null, null, null, null, null, 8140);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D8D308D11304A49893FC7416BA191B6', null, '李超群', 'lcq', '2828', null, null, null, null, null, 8303);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('40AB41638F0449D19FF56847E1C1B34F', null, '谢小奇(北京）', 'xxq', '7188', null, null, null, null, null, 8308);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FE0A7DF4CE05482FBFE1A31E252F1077', null, '王文奎', 'wwk', '7188', null, null, null, null, null, 8314);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f7fd6b300ac', null, '陆波', 'lubo', '7188', null, null, null, null, null, 21167);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f80970500ae', null, '李万东', 'liwd', '7188', null, null, null, null, null, 23227);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f81e3d800b2', null, '李海石', 'lihs', '7188', null, null, null, null, null, 23229);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2e6f1d51012e7f8315b100b6', null, '刘源', 'liuy', '7188', null, null, null, null, null, 8506);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e0d9630003', null, '何培德', 'hpd', '0706', null, null, null, null, null, 17702);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e260130009', null, '石刚', 'sg', '900311', null, null, null, null, null, 6290);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e3e098000f', null, '徐群雄', 'xqx', '1226', null, null, null, null, null, 6289);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b2eb2e037012eb2e4a5400012', null, '王根伟', 'lhcl', '7188', null, null, null, null, null, 5076);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('52A96BACE98C4602ACD077FF9BF6939E', null, '王安昌', 'wac', '7188', null, null, null, null, null, 8399);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('98FC7DF55015424EBA3073AA7A2FAEF2', null, '施忠(北京）', 'sz', '7188', null, null, null, null, null, 8403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FEB426648324447F9B16915B360959B3', null, '柴永国(北京）', 'cyg', '7188', null, null, null, null, null, 8407);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C183BB324A6471B8D6771738C0AF8FD', null, '陈金宝(北京）', 'chenjb', '7188', null, null, null, null, null, 8411);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5352F934FB714BBEB2C3C8F4E6E96FA7', null, '张裕珍', 'zyz', '5601', null, null, null, null, null, 8427);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8EBA300E230046F0AA97642F84C2F46B', null, '吴鹤松', 'wuhs', '1946', null, null, null, null, null, 8432);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D9D38EB3DB44CBE8CB4493B06D67FE3', null, '干宏春', 'ghc', '7188', null, null, null, null, null, 8626);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AAE77E7958514ABBB122040DF1356AD2', null, '朱卫兴', 'zwx', '7188', null, null, null, null, null, 8631);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('43615508B31049848856CCDDC8B839EA', null, '颜庭国', 'ytg', 'poilkm', null, null, null, null, null, 8642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('863C85CDE37443338D9D067E5A820CBB', null, '戴国珍', 'dgz', '8280', null, null, null, null, null, 8646);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CEE9669F057C4E6396EDFE042DF16643', null, '杜宝发', 'dbf', '7188', null, null, null, null, null, 8682);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6F37F0DF0BC8484095C3083F3B62C384', null, '顾宝发', 'gbf', '2828', null, null, null, null, null, 8702);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D62E2D8E4EBF4E4282159D12F2E5A36C', null, '张文军', 'zhangwj', '2828', null, null, null, null, null, 8784);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E7C453C2D6E343B49AC7C78388D4B0B9', null, '吴嘉健', 'wjj', '7188', null, null, null, null, null, 8850);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D3D97FBDC7FA4E288B5F060D5C223878', null, '陈文忠', 'chenwz', '2828', null, null, null, null, null, 8886);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6E5C502164842FE9BDB282D6A339289', null, '张建群', 'zhangjq', '2828', null, null, null, null, null, 8892);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3B4C35E500EB41A98E22AEFB0E143603', null, '张乐', 'zhangl', '7188', null, null, null, null, null, 8901);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A4097DDBF5434D71BA29EBFCB44CD357', null, '张斌', 'zhangbin', '2828', null, null, null, null, null, 8907);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1DC46BAE9D444C72A3AB7BDEAABE4335', null, '杨志勇', 'yzy', '2828', null, null, null, null, null, 8911);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7D6FC3AD58EA459A83F5F00AD7B63813', null, '钱力', 'ql', '2828', null, null, null, null, null, 8915);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('170573D9F8C147449A6CF8435E689C09', null, '秦申宝', 'qsb', '2828', null, null, null, null, null, 8919);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('15004E6A8A4B4B048399289CE1B4E3F9', null, '陈安兴', 'cax', '2828', null, null, null, null, null, 8923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EFDC4F8B728C417EB52AFB9443A8B5DE', null, '孙龙章', 'suz', '2828', null, null, null, null, null, 8928);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('708E0FD1BF154FB086824F317B494811', null, '555', '66', '2828', null, null, null, null, null, 8933);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83EF02DE1E444EA5923558531728EF58', null, '陈飞', 'chenfei', 'F117', null, null, null, null, null, 9508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6689934BF5BE418B9016122453EE9D9A', null, '于少强', 'yusq', '2828', null, null, null, null, null, 9529);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FAF9E34C5976473193679826F7EA5992', null, '沈娓', 'shenw', '2828', null, null, null, null, null, 9567);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47B7934A345342AB910DD87FB7B8BE41', null, '屠明康', 'tmk', '2828', null, null, null, null, null, 9586);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5028F8E0B67F4C86A3906EA47511A1D1', null, '陆林辉', 'lulh', 'hql1328', null, null, null, null, null, 9682);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA365131C7A24334BC8FD458B948CB97', null, '赵吉吉', 'zhjj', '2828', null, null, null, null, null, 9690);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E1693F57E1B246B7BE8919CB361286DD', null, '窦阿根', 'douag', '841123', null, null, null, null, null, 9802);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('44594938354A4A9096C0205C9410521D', null, '张焱', 'zhangyan', '2918', null, null, null, null, null, 9846);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2E956790D3E64202A72FF526F71814E7', null, '姚明华', 'yaominghua', '2828', null, null, null, null, null, 9850);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74D0F801E45B43EE923F8A4B1D48A1B4', null, '陈顺忠', 'chenshunzhong', '2828', null, null, null, null, null, 9854);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('29B125F4D52040519F848882F6669589', null, '徐中一', 'xuzhongyi', '2828', null, null, null, null, null, 9858);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54E41EA435F54267AAFDD501096E6DBF', null, '张永发', 'zhangyongfa', '2828', null, null, null, null, null, 9863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F3E76E183D13443C8FE024B1806F33DF', null, '宋春花', 'songch', 'angela', null, null, null, null, null, 10423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9C7CEBA5EABB40E29B48A8E7F5F1852C', null, '崔恒栋', 'chdong', '7188', null, null, null, null, null, 19444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('640CFC4305DE42AFBE4270A4E89F9A51', null, '孔祥音', 'kxy', '7188', null, null, null, null, null, 19462);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BB66990693EA4C3EB10167C7736E3FE1', null, '陈良', 'chenl', '7188', null, null, null, null, null, 19504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D1932C34536849F69C0CAA2D23F2693A', null, '华佳玮', 'hjw', '7188', null, null, null, null, null, 19505);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('29FF4216B4CC4382BDA49956817E83FE', null, '宋传欣', 'scx', '7188', null, null, null, null, null, 19506);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('14884794F8804A2CB7C034D6FED2D0E8', null, '康冬梅', 'kdm', '7188', null, null, null, null, null, 19543);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D13EC5D981D74341992AEAF1E0C4F67E', null, '施畅', 'sc', '7188', null, null, null, null, null, 19642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C7B2D15F818498095CE6B641270AAFF', null, '陈时效', 'csx', '7188', null, null, null, null, null, 19643);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02DEE914A9EF4662BDBC9D9CD16B5572', null, '戚云山', 'qys', '7188', null, null, null, null, null, 19663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('43EA2356A3AF43CD912D4E01CC58DCB4', null, '施银华', 'shiyh', '7188', null, null, null, null, null, 19664);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('596332146C8B4CBD81EE09B82EE97473', null, '刘虹', 'liuhong', '840823', null, null, null, null, null, 19665);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('08EB8266EAF44973A2ED7D1DC7D1FBC8', null, '朱陈新', 'zcx', '7188', null, null, null, null, null, 19666);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ADFE6FDFF98B4236AE32C55EF08B5B68', null, '孔世玉', 'ksy', '7188', null, null, null, null, null, 19667);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('01F63C73774A41E1B8F23D0C5A3161AD', null, '蒋迅民', 'jxm', '7188', null, null, null, null, null, 19668);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D27E5A238D544A7F8D3728433C7A9245', null, '许华栋', 'xhd', '7188', null, null, null, null, null, 19669);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDC807960F6B4D9EA789302D71CC7F3D', null, '唐为明', 'twm', '7188', null, null, null, null, null, 19670);
commit;
prompt 900 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8DF28B8F5D44A2B90D37B993730616D', null, '宋志刚', 'szg', '9643', null, null, null, null, null, 19671);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('91EA59DA5B01430EAF4219F64D4F3093', null, '王兴铭', 'wxm', '1021', null, null, null, null, null, 19672);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('43B4E05045ED4693962BBA4092682F28', null, '张汪杰', 'zwangj', '7188', null, null, null, null, null, 19673);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('95F1997CE7164C129C1C09AAA4B1661D', null, '邱湘伟', 'qxw', '59938940', null, null, null, null, null, 19675);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('82A1704D30DB4D80A6896776B7BCCA2A', null, '崔鑫海', 'cxh', '1410924098', null, null, null, null, null, 19677);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DCE1CFC6FA42401183009ABF579375C7', null, '陈捷', 'cj', 'cjjhq', null, null, null, null, null, 19678);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FFA4D6A7170C4EDE898C65FF4A61B5FE', null, '夏日芳', 'xiarf', '1212', null, null, null, null, null, 19679);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('55D5ECEF563C4534B1C228EAAA908455', null, '张则铭', 'zzm', '7188', null, null, null, null, null, 19680);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F66545EC08A45078965611D742B33C2', null, '周淳骜', 'zca', '7188', null, null, null, null, null, 19683);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('78A76891835444AF8FE621FFB016BCF5', null, '李建新', 'lijianx', '7188', null, null, null, null, null, 19684);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FD8B994E6D414A539CA6FB09F201079D', null, '朱彤云', 'zty', '1231', null, null, null, null, null, 19685);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0F2F9ADFF774F2686E664EE61E5F517', null, '卜智鸣', 'pzm', '7188', null, null, null, null, null, 19686);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('100C88B8A51F4FAC96EC1B0EC198790D', null, '陈继龙', 'cjil', '7188', null, null, null, null, null, 19687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB53690A491D4B9CA9CEC534B2CC43BB', null, '王澄', 'wangc', '7188', null, null, null, null, null, 19689);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('395C30F8B745421ABE75E780E73FECB0', null, '陈一辉', 'cyh', '1234', null, null, null, null, null, 19691);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3F60217BC7D544E486033E250B4EC309', null, '朱金牛', 'zjn', '7188', null, null, null, null, null, 19692);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69B98297E9E24453AE17095261128D75', null, '陈麒龙', 'cqil', '7188', null, null, null, null, null, 19693);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6DB2937575645E3B93546506213A75F', null, '李甲甲', 'lijj', '7188', null, null, null, null, null, 19702);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('992C5C5BB6684E61B7BC3476FE27D9C9', null, '90', '90', '7188', null, 'SUPER', null, null, null, 19749);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('071C6925D0D14E72BC9E88DF9DCBF8CD', null, '刘浩', 'liuhao', '7188', null, null, null, null, null, 19762);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('93E410ED38F64CF79EFBE5EA1FB9B276', null, '王者之', 'wzz', '7188', null, null, null, null, null, 19807);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('48BB8512AE3D4EEE87CB5600BB07F456', null, '李明', 'lim', '7188', null, null, null, null, null, 19863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7C61FFEDEF94562B09E6F04499A70DF', null, '陈晓岚', 'cxl', '7188', null, null, null, null, null, 19864);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8455FBD86188406A9C97D65F422AEF10', null, '张辉(五分)', 'zhah', '251430', null, null, null, null, null, 19948);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC8BA759E3B84F9B80DFAFA2B712667D', null, '陈忠良', 'czl', '7188', null, null, null, null, null, 19950);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C7950564CAD4AC89E319A4A109A4C03', null, '李欢', 'lih', '7188', null, null, null, null, null, 19951);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AEF8985FB3804719AD23E0182181502B', null, '张文军', 'zhwj', '7188', null, null, null, null, null, 19952);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C4BAB8A5F213457D954538AC95DF9C72', null, '陈喆', 'cenz', '7188', null, null, null, null, null, 19953);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('36F42747D80447CA998E79B4303C1328', null, '邓伟', 'denw', '7188', null, null, null, null, null, 19954);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C0D95695517A474386C0CBD20970BA45', null, '戴吉敏', 'djm', '7188', null, null, null, null, null, 19955);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AE1BE7BD8C8428487B9BE08BE0655B3', null, '黄小莉', 'hxl', '7188', null, null, null, null, null, 19956);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('665586C05583437A8F75417AF5B19384', null, '杨兴华', 'yxh984101', '704', null, null, null, null, null, 19957);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3835475008DB438F820617839E2CC6BB', null, '蔡建宇', 'caijy', '827912', null, null, null, null, null, 19965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('589D7A9A7176405D94A8001F97FAC3D3', null, '蔡竑旻', 'cai9712', '200335', null, null, null, null, null, 19966);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AF04CD205DC54905906395717BCBBD95', null, '张云峰', 'zhangyf', '7188', null, null, null, null, null, 19983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8B3B941FEB144F4CA29B4237070851DD', null, '李永靖', 'liyj', '7188', null, null, null, null, null, 20004);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0316C788E11D40179161DE8612C8106A', null, '陈志君', 'czj', '7188', null, null, null, null, null, 20005);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C218BB7A1E9442F4BB040594756FA26F', null, '李红伟', 'lhw', '7188', null, null, null, null, null, 20006);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('131B13E00FA54E7A922DF9D628402C3C', null, '诸剑锋', 'zujf', '7188', null, null, null, null, null, 20007);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('978648CAF5B04C14BCBF2F65E6933529', null, '汤力', 'tli', '7188', null, null, null, null, null, 20010);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E1DA61D11A2047758B9E945C0F278578', null, '陈寒光', 'cenhg', '7188', null, null, null, null, null, 20011);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9E1BF828B565474FBE4A700067F1DC11', null, '俞琴', 'yq', '7188', null, null, null, null, null, 20012);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9D4F85097E8B48CB88BE37C2809D085D', null, '许佩基', 'xpj', '7188', null, null, null, null, null, 20013);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('94FD8D14DD3B47F48B621B2F810FAB34', null, '蔡伟杰', 'cawj', '7188', null, null, null, null, null, 20014);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F61E6D3220ED43CA8DC228E42F64FFD0', null, '肖国营', 'xgy', '7188', null, null, null, null, null, 20015);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1B26759277DE4CD0A3D794CDDA60B059', null, 'ff', 'fgf', '1', null, null, null, null, null, 20017);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CBFEF76FC5224DF4ACF053056B525D99', null, '赵刚', 'zg', '1111', null, null, null, null, null, 7414);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('330691E3DB0446C18B22CB22CBD4B7EF', null, '吴坤生', 'wks', '7188', null, null, null, null, null, 8183);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C39509BA4D51400D8D3714D785CC40C6', null, '谭震川', 'tzc', '7188', null, null, null, null, null, 8184);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF038807C3324C56BFFE8EE0AB04DEEA', null, '王学忠', 'wxz', '5188', null, null, null, null, null, 8185);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4BE5692765D4FFE9115A5DF010CE975', null, '金铭', 'jm', '1111', null, null, null, null, null, 8186);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8CFE2E3858BF4C9C90C219511FE3A041', null, '王海军', 'whj', '7188', null, null, null, null, null, 8187);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2782581E28E345D0B3C4D0D338BFC713', null, '秦文高', 'qinwg', '7188', null, null, null, null, null, 8189);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7FE4E2CC46AB407784BA84B72666E2BA', null, '陈华', 'chenh', '7188', null, null, null, null, null, 8191);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BEC92C6E3864DE7945371A4EE17C84C', null, '萧其农', 'xqn', '6408', null, null, null, null, null, 8192);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1B21D040D2434284852D52481A65A88D', null, '11', '22', '7188', null, null, null, null, null, 8195);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('24245A8A77D647BEB0F446CA834663B1', null, '周晓明', 'zxm', '6408', null, null, null, null, null, 8197);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A6283E4149424FD1B18F7623C23D6B22', null, '孙伟云', 'swy', '7188', null, null, null, null, null, 8198);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('522E49BFC74E4493A5C9046FE30F994C', null, '顾文达', 'guwd', '2828', null, null, null, null, null, 10945);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC0294C65C074F1FABF3919B76618FC9', null, '张明勤', 'zhangmq', '2828', null, null, null, null, null, 10946);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('276E50579B464EC483EB88B5DA5292C0', null, '刘友萍', 'liuyp', '2828', null, null, null, null, null, 10948);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5590FF95EE554B52986F990DE4A3EAA3', null, '殷菊芳', 'yinjf', '2828', null, null, null, null, null, 10949);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B87B70AD4506408EA14A161F39CFB40A', null, '李兰兴', 'lilx', '2828', null, null, null, null, null, 10950);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96D601BCE11B441EA1DD24AF79F2139D', null, '朱旭东', 'zhuxd', 'jsk123', null, null, null, null, null, 10952);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DD8D6BA506E84D27B8A593766C3BDE93', null, '陈郁飞', 'chenyf', '2828', null, null, null, null, null, 10955);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1AC69FFB4BC54F2EB6DB8193900139C4', null, '张水海', 'zhangsh', '2828', null, null, null, null, null, 10957);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1A5F0AFC9AA942DA9B933348177FB884', null, '乔礼连', 'qiaoll', '2828', null, null, null, null, null, 10958);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('086CC29F75034A2CA88C356988FF8996', null, '金炳华', 'jinbh', '2828', null, null, null, null, null, 10959);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('181C2AC0EC554DCA8E8EA94E36A13B67', null, '宋启荣', 'songqr', '2828', null, null, null, null, null, 10960);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('05CD63595BAE4710941091A999B72C46', null, '潘世忠', 'psz', '2828', null, null, null, null, null, 10962);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AAF649C552284D21802D009D8A1BAABB', null, '周德国', 'zhoudg', '2828', null, null, null, null, null, 10963);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96163A53E44947A5A6F1FE87644F3355', null, '董冰', 'dongb', '2828', null, null, null, null, null, 10964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1361534BDA8646D6AD675A3C33D638FD', null, '赵锦', 'zhaoj', '2828', null, null, null, null, null, 10965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('30FE8F66B9024540B251BFD76EA63837', null, '马明春', 'mamc', '2828', null, null, null, null, null, 10966);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('12018A26AE3C4966BD65F9F82AC1448E', null, '吴海英', 'wuhaiy', '2828', null, null, null, null, null, 10967);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C6BBA4EA09754AE0B0A0C71A02DB6B74', null, '梁峰', 'liangf', '2828', null, null, null, null, null, 10982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E65D6E272E03435D9ADB2522F4801C15', null, '陈俭', 'chj', '2828', null, null, null, null, null, 10983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0106FBAFDF842A794CA363081977651', null, '倪根培', 'ngp', '2828', null, null, null, null, null, 11003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('412D2F2805674907B38171E3C9FD6270', null, '唐志华', 'tangzh', '2828', null, null, null, null, null, 11004);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0F367901A6434034B5B0844B81CF5E0F', null, '陈宾官', 'chenbg', '2828', null, null, null, null, null, 11005);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0F2F252E70C547389AC8CD2D926F653E', null, '凌德忠', 'ldz', '2828', null, null, null, null, null, 11006);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2A40DCB8C3B54245AAB43230CDDD6AF7', null, '姚志荣', 'yzr', '2828', null, null, null, null, null, 11008);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BF55A1A70A4C42BD870BEB63A71F50A6', null, '王明官', 'wmg', '2828', null, null, null, null, null, 11009);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('03A6A1FC8AFB4865BEBF20BB01256549', null, '黄伟明', 'hwm', '2828', null, null, null, null, null, 11010);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('67C8F707E4D34422B8F665EF27A54079', null, '张思泓', 'zsh', '2828', null, null, null, null, null, 11011);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9281404451BB48649636EBFDD1A1B7CB', null, '左武洪', 'zwh', '2828', null, null, null, null, null, 11062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2F8DB8AEE784B71A0B67E46C1A18FCB', null, '郭玉宝', 'gyb', '2828', null, null, null, null, null, 11063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E85E7F221013475CAB233D82561DB7DB', null, '钱人杰', 'qrj', '2828', null, null, null, null, null, 11064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F219A4B25A8E4E7884DBC905B7C337C4', null, '曹卫新', 'caowx', '2828', null, null, null, null, null, 11065);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58F53390CA4D46489F124A6059A43656', null, '黄杰', 'huangj', '2828', null, null, null, null, null, 11066);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D5ADB7F2C0D4AC0B33E1393999C21C9', null, '许勇', 'xuy', '2828', null, null, null, null, null, 11067);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C7640DC59E4486580DD87A8EE11CB19', null, '诸春风', 'zcf', '2828', null, null, null, null, null, 11068);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F623A83BAD8E4E41846107B2BF574F2D', null, '丁士兴', 'dsx', '2828', null, null, null, null, null, 11069);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BB0A80F6292E476FADF4D07C9D726ADB', null, '归端虎', 'gdh', '2828', null, null, null, null, null, 11070);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C6724EC1B2CB4FEAA9E95448475DA6F5', null, 'zhouyy', '周玉瑛', '2828', null, null, null, null, null, 11082);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FF3123559A8949739D42F81FDF3B76CF', null, '朱双波', 'zhusb', '05415137', null, null, null, null, null, 11143);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('11066C7E4C28414EAA9C23C45566E814', null, '吴忠华', 'wuzh', '2828', null, null, null, null, null, 11144);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7D319EABB506499F8B1CDB6961FBF6F8', null, '王明山', 'wangms', '2828', null, null, null, null, null, 11145);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('41CA916260284F829E1E385A69851188', null, '周秋峰', 'zhouqf', '2828', null, null, null, null, null, 11146);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EE83F4214EE049798F0D63C651EB3AF5', null, '吴浩', 'wuh', '2828', null, null, null, null, null, 11183);
commit;
prompt 1000 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6A9D047B62B42FE9E1567A81EA77264', null, '黄星富', 'hxf', '9526', null, null, null, null, null, 11202);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C53ACDC78BBF47DC9186E8BD0DEAA2E3', null, '杨金昌', 'yjc', '2828', null, null, null, null, null, 11203);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CFDAB2FE73864EFB8D3410070D91849F', null, '顾春霞', 'gcx', '2828', null, null, null, null, null, 11205);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B26094D6B32144ECA5F85AEBAE88633C', null, '王海卿', 'wanghq', '477577', null, null, null, null, null, 11206);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5A8E56BEEAD439B8715B608660AE13F', null, '季小山', 'jxs', '2828', null, null, null, null, null, 11207);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8BACB7A799984DE894822D54C0B2F90F', null, '施汉仁', 'shr', '2828', null, null, null, null, null, 11208);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B1C6C428852240ADB0C4FA3124631304', null, '富黎明', 'flm', '2828', null, null, null, null, null, 11209);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A46B879A34142EC91C8119EBDCCE5F5', null, '张银林', 'zhyl', '2828', null, null, null, null, null, 11210);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('85CF98CFF3D84AB692DAE1382D17617D', null, '陈光明', 'cgm', '2828', null, null, null, null, null, 11211);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('34B673C408DF44FDB0AD186D8D8F292C', null, '黄来官', 'hlg', '2828', null, null, null, null, null, 11212);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('24639D2810844899AA9F4E3C4EE14F26', null, '孙昌国', 'scg', '2828', null, null, null, null, null, 11213);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8AB7373E37D744ED9AE72DD29AC8A363', null, '李士兴', 'lisx', '2828', null, null, null, null, null, 17263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('71B235956ECC4FEDA940F356DBD9E267', null, '韩建强', 'hanjq', '3019', null, null, null, null, null, 17264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('34DCE5C5494F4A60B463FA08CB97D97E', null, '蒋建国', 'jjg', '2828', null, null, null, null, null, 17265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('292714AA43084CB99C53D2B86CED1E90', null, '刘晔', 'liuye7', '575757', null, null, null, null, null, 17363);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E365CCD1F5574D68A187AE94C25BA9BE', null, '陆铮杰', 'luzj', '7188', null, null, null, null, null, 17423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ED8E0C42EC0E4AB4B4926F2EECC803AB', null, '薄峥辉', 'bzhui', '7188', null, null, null, null, null, 17504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E3DED88880BE443B9DCFB32E6118827B', null, '王彦韬', 'wangyt', '7188', null, null, null, null, null, 17505);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58D2DF27D0CC4A098F21DBB68FD02E8E', null, '黄辛杰', 'huangxinj', '7188', null, null, null, null, null, 17508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A23BA96115C844B69B35A86B43B557F1', null, '汪宇峰', 'wangyf', '7188', null, null, null, null, null, 17511);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AD0C6B79CF584F6ABF8E273359F04BCF', null, '谢巍斌', 'xwb', '7188', null, null, null, null, null, 17512);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B335165FCD1A44B4AE2F464768A82CF3', null, '尤圣乐', 'ysl', '7188', null, null, null, null, null, 17513);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('366CD0B3D50948FB855AEC8F31E3035B', null, '陈剑亮', 'chenjl', '7188', null, null, null, null, null, 17514);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('28C14689A56C4BFE95D03DF57E2F344E', null, '陈宗伟', 'czw', '7188', null, null, null, null, null, 17515);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C189B5410D44943B85C8103BD2A7F4A', null, '查旻罡', 'cmg', '7188', null, null, null, null, null, 17516);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('248F971765A6460F84813A50D9F00DF5', null, '张磊', 'zhanglei', '7188', null, null, null, null, null, 17517);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C83EB7D370DA4BDCA3AE48385DEDE3E9', null, '赵鹤泉', 'zhq', '7188', null, null, null, null, null, 17518);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9DE957024B944033B708AE71BC34EF8C', null, '张飞', 'zhangfei', '7188', null, null, null, null, null, 17519);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('418522F4BF3B4D95A5214E512452BF0A', null, '窦铮', 'douz', '7188', null, null, null, null, null, 17520);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26009FABFBA74C9999AFB3483CE038EE', null, '赵伯年', 'zbn', '7188', null, null, null, null, null, 17521);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96916556D406433D8A69A697D31D8432', null, '李睿信', 'lrx', '7188', null, null, null, null, null, 17522);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('19133371E7554D568AAC7CAB822ED634', null, '吴玥侃', 'wuyk', '7188', null, null, null, null, null, 17524);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('022BE8C0052B4485982378E012267880', null, '张林', 'zhanglin', '7188', null, null, null, null, null, 17525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B46BDD29C7F74E859BBE085ED4AD83DE', null, '应明', 'yinming', '7188', null, null, null, null, null, 17526);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('66319E82C6F24FC78C0D5D9DE477AEA2', null, '李磊', 'lilei', '68310202', null, null, null, null, null, 17527);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('92FE2C5002F14A5895BDAEEC45BFF992', null, '马晓旎', 'mxn', '7188', null, null, null, null, null, 17529);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D2FB56F503BD41EEBACE511B42897420', null, '周磊', 'zhoulei', '7188', null, null, null, null, null, 17542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96EDD9605510428FA4A9DCD2A5BBF809', null, '陈伟飞', 'chenwf', '7188', null, null, null, null, null, 17543);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8B05AF9BE3E944CDBF602D6061EC8E1C', null, '叶天明', 'ytm', '7188', null, null, null, null, null, 17583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1F009794C45D4210BA811259EA1AF153', null, '沈连军', 'slj', '7188', null, null, null, null, null, 17584);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4AAA676027C4B238EBACC61B5461A7A', null, '黄谷华', 'hgh', '7188', null, null, null, null, null, 17587);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ACFAE06BC87D4A8AAF3A28EEEAB2B2E4', null, '周根华', 'zgh', '7188', null, null, null, null, null, 17588);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('36D023A63035401080B93DC00221E9D9', null, '郑建平', 'zhengjp', '7188', null, null, null, null, null, 17589);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02E2AAE9AA5D4034BAEF7F4D6297FDC4', null, '戎靖', 'rongj', '7188', null, null, null, null, null, 17592);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDCC9499818145FD84F2B0FB21301141', null, '蒋汉民', 'jhm', '7188', null, null, null, null, null, 17593);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54CA93E7AE10440CBF7B78A33BBCE8CD', null, '曾晖', 'cengh', '7188', null, null, null, null, null, 17594);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('589479FC57564934BAFFB3229435B86C', null, '缪光喜', 'mgx', '7188', null, null, null, null, null, 17602);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8E1C1E9D00B47BA8E175FB3D18F01F4', null, '陈世昌', 'chensc', '7188', null, null, null, null, null, 17642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39635CBEF59C479B9810BCC764290FBF', null, '许干先', 'xgx', '7188', null, null, null, null, null, 17683);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C9288DF46D340F9B41F1D9B83C202FB', null, '王晓颖', 'wangxiaoy', '7188', null, null, null, null, null, 17743);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8D8172C0528C4D2EA6E85B1A3283C20A', null, '黄立辉', 'hlh', '7188', null, null, null, null, null, 17744);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ED66D2478173450484068844DE7F827D', null, '施洪兴', 'shhx', '7188', null, null, null, null, null, 17764);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F6506BDBE16B4784AB81B583F9C3AFAC', null, '周炳华', 'zbh', '7188', null, null, null, null, null, 17766);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CB6A772F78E34E39B856FAD00322DB72', null, '朱培公', 'zpg', '7188', null, null, null, null, null, 17862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B16C04D182F1439395F1120EB24846EC', null, '赵群', 'zq', '7188', null, null, null, null, null, 17942);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7458551BC7EB42EF8903CB0E364D327B', null, '才政', 'czheng', '7188', null, null, null, null, null, 17982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4305252DC8094FE3A95D0B829332BB28', null, '费钰懿', 'feiyy', '821031', null, null, null, null, null, 18022);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2A832D0A2F2743E9971730EC41751A61', null, '窦铮', 'dz', '7188', null, null, null, null, null, 18062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('171D8F4E15AB4A068FB82A7F110E7DAA', null, '陈尤佳', 'cyj', '7188', null, null, null, null, null, 18063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('015E66BA033040F1BE4582B1B4680729', null, '夏斌', 'xb', '7188', null, null, null, null, null, 18083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('19B4D608C5F14A0F8D661D53526E44C5', null, '费钰懿', 'fyy', '7188', null, null, null, null, null, 18084);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B536CC93AAB34597BAA90B91E9AF9EEE', null, '吴琛', 'wuc', '771031', null, null, null, null, null, 18102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3EF6D57038954F2B9AFBEC09F09BC8A9', null, '奚皓然', 'xhr', '2404', null, null, null, null, null, 18105);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('581D12596936417193026358BEB557FC', null, '许仲', 'yuz', '7188', null, null, null, null, null, 18122);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6D022CA0B1B4334A3086EBAB121905C', null, '施洪兴', 'shx', '7188', null, null, null, null, null, 18143);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C8DFDAE7D73488F88483DEB07F2C2CA', null, '刘枫', 'liufeng', '7188', null, null, null, null, null, 18162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0477F0D0D22E443E8D21342AA42AFCCB', null, '付俪赉', 'fll', '7188', null, null, null, null, null, 8205);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('27C8BE5CFF7040D1BB837F05BF233175', null, '沈余龙', 'syl', '7188', null, null, null, null, null, 8206);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F4B65C094E854B379A8EAC4270F6C288', null, '狄秀英', 'dixy', '11', null, null, null, null, null, 8208);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9AB6608C54604D5B9F7370804605C57E', null, '王成明', 'wcm', '6999', null, null, null, null, null, 8210);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8DED5DBF6E314CD6A74D2CBF59E517FD', null, '汤静华', 'tjh', '99039903', null, null, null, null, null, 8211);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5BF725A7A29349C2806745FAF2B1489F', null, '蔡景斌', 'caijb', 'caijb', null, null, null, null, null, 8213);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('097C4E100D784BF7A817E94E8FF3D914', null, '金凤丽', 'jfl', '9156', null, null, null, null, null, 8214);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26D189D708BB4D96B07A3F1AC7BB4B09', null, '吴昌仁', 'wcr', '7188', null, null, null, null, null, 8215);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3662608ACF374285A070D6922B97A87D', null, '杨唯', 'yw', '7188', null, null, null, null, null, 8216);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25A99A72F9E144CA8B22EDB0392259FF', null, '任雅芳', 'ryf', '6199', null, null, null, null, null, 8217);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('68C57598D9CA4D0CA6D105CBD81A4188', null, '田励', 'tl', '7188', null, null, null, null, null, 8218);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('79780EC4D5EE49108DA30816232EE73D', null, '王作尧', 'wzy', '7188', null, null, null, null, null, 8219);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('770FFAC3FD874328A7CCE2B3086FBBF0', null, '金玉芳', 'jyf', '7188', null, null, null, null, null, 8220);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B9A44F108EC445F6971819751DDE947D', null, '张根生', 'zgs', '6408', null, null, null, null, null, 8222);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07BE1227629D47308C919ED1FF8339F0', null, '杨伟和', 'yangwh', '7188', null, null, null, null, null, 7767);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8006DBC04FC0478AA088A8F3FCA9C2E2', null, '朱莉瑛', 'zly', '312710', null, null, null, null, null, 7769);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1027ACA96864F6FB7CB0061970BCEC4', null, '干晓丹', 'gxd', '64752714', null, null, null, null, null, 7772);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0ECD0B45138E4407BB1EE4410BC71102', null, '沈增豪', 'szh', '7188', null, null, null, null, null, 7773);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E5A0CF77EEC45699A334FC55687A677', null, '唐颖琼', 'tyq', '7188', null, null, null, null, null, 7774);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7FA1668409F64D48A7FB9F7BAE21F3BF', null, '陈刚', 'cg', '780816', null, null, null, null, null, 7775);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1F25B9AD614B49D09FC222553C003E5B', null, '李雄茂', 'lixm', '731024', null, null, null, null, null, 7777);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('56896E07F2324E4DBECB75F14FF9CBDB', null, '姜忠玉', 'jzy', '7188', null, null, null, null, null, 7778);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('60124C025182448483C9BF6527623C08', null, '毛丽华', 'mlh', '7188', null, null, null, null, null, 7782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8D422D71865843B89747761B9AB083F0', null, '谢惠琴', 'xiehq', '620428', null, null, null, null, null, 7785);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2E6608EE6D5F462396F8C3445626C554', null, '陈其龙(701)', 'chql', 'ql7188', null, null, null, null, null, 7786);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DB260817638D41D6AB33F1F1ED18883C', null, '张品华（701）', 'zhangph', '6322', null, null, null, null, null, 7788);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('084FA210ABE54637B6C98B260DC721D7', null, '吴群英', 'wuqx', '7188', null, null, null, null, null, 7789);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DE2E56BC471942A18D1EC789050610B1', null, '浦士清', 'psq', '7188', null, null, null, null, null, 7790);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4C12ED97F58347598E73A7D2CCCA54C0', null, '王晓彬', 'wxb', '8177', null, null, null, null, null, 7791);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('38E1D2A0F56D4597BBCF940567C4F392', null, '张美芳', 'zhangmf', '7188', null, null, null, null, null, 7792);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BF3BBBC513140EB9AFAF9ADBDEA397D', null, '朱林', 'zhulin', '64754550', null, null, null, null, null, 7793);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0BE9EFEC6D5F4987B1776C5C6FD25815', null, '王俊', 'wangj', '64754550', null, null, null, null, null, 7795);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6478B2259D9D47EFB72904D1DDB694AF', null, '顾利康', 'gulk', '7188', null, null, null, null, null, 7800);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E93F93DE65474F8394012388D3DCEBBD', null, '胡洪海', 'hhh', '7188', null, null, null, null, null, 7801);
commit;
prompt 1100 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C2D88305C5BA453188ECC8E61D5F4DDF', null, '陆新辉', 'lxh', '7188', null, null, null, null, null, 7803);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA3CC557556A44A08D0CE3F3D24EFC2E', null, '缪龙麟', 'mll', '7188', null, null, null, null, null, 7805);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7BE359754D0F4632BFCC0FFD2C1245DE', null, '刘凤德', 'lfd', '7188', null, null, null, null, null, 7807);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BEC82C9F8A3D4036AC119A670A39EC97', null, '陈琼', 'chengq', '7188', null, null, null, null, null, 7808);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('327BA01DAD864A129E50689201CE7C1A', null, '朱福生', 'jfs', '7188', null, null, null, null, null, 7810);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2FDFE34E99E44A728FB0FA0868B45F74', null, '宋学标', 'sxb', '7188', null, null, null, null, null, 7811);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('71B0D37E8D0D47929A7B9E4A54EFA2D8', null, '周明军', 'zhuoumj', '7188', null, null, null, null, null, 7812);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7DB97E91C4D14AB0BBBE27BDD2A0E8F7', null, '盛国琪', 'shgq', '7188', null, null, null, null, null, 7813);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D375C23BB0864FE18F8DF8248D54E64D', null, '陈逸鸣', 'chengym', '7188', null, null, null, null, null, 7815);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AB58DDED136441FAB9C702448A1F1D3', null, '王能', 'wangn', '7188', null, null, null, null, null, 7816);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('074792AAAD6846EBA0D1B2B173B04F34', null, '王永春', 'wangyc', '7188', null, null, null, null, null, 7817);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0B75115986024F299A995A19D8849841', null, '徐涛', 'xut', '64841240', null, null, null, null, null, 7820);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C0CEB001CF1840AC9EF073F093DC5FE5', null, '顾培平', 'gpp', '7188', null, null, null, null, null, 7821);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C37D063772B94AEC9429E665DF6A2F38', null, '何德', 'hd', '7188', null, null, null, null, null, 7822);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AAC5523B03584879B9EEDDC7D1DD9C3F', null, '李伟平', 'liwp', '7188', null, null, null, null, null, 7825);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2C753D7494AB44C9AF8AE9F5CA570D92', null, '卢文云', 'lwy', '7188', null, null, null, null, null, 7826);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F74339E527D4268BF3B0B7801C829BF', null, '刘训麟', 'lxl', '7188', null, null, null, null, null, 7828);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('78D0157CBC834959860437BA0C23A1DE', null, '褚永华', 'chuyh', '2828', null, null, null, null, null, 7830);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('11A442E169F44382A1D160FFFCF7CB30', null, '施雄华', 'shxh', '7188', null, null, null, null, null, 7831);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('03DD9D99DA884F4A97F29E1871A01C8F', null, '汤勇', 'tangy', '62527188', null, null, null, null, null, 7832);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('896657EB84B44152A761592C64835271', null, '陈凯', 'ck', '7188', null, null, null, null, null, 7833);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69D4C369CA57433E94799A52AC16EEEE', null, '王敏华', 'wangmh', '7188', null, null, null, null, null, 7835);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('946DA735558542468B53CC119D5BC87F', null, '王飞飞', 'wff', '707719', null, null, null, null, null, 7836);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9CFB5E4C566E491EBCA768B6172794B1', null, '徐军', 'xuj', '7188', null, null, null, null, null, 7837);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4387E871AD1546F094BFEB6579D6D8D0', null, '奚永成', 'xiyc', '7188', null, null, null, null, null, 7838);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E5046BC414384FBD9C6FD856993461F3', null, '王强', 'wangq', '122921', null, null, null, null, null, 7840);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A353C5FE9A004C9589A4A0A7B495E468', null, '浦祖庆', 'pzq', '7188', null, null, null, null, null, 7841);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3F95657869E4451893E2553E3354A17F', null, '张洪胜', 'zhanghs', '7188', null, null, null, null, null, 7842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('943F609476BC4BFA952B71B6E99D3FC9', null, '张迪', 'zhangd', '718888', null, null, null, null, null, 7843);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA7526A6CF3A47758983CA24C8BD1EF1', null, '杨惠忠', 'yanghz', '7188', null, null, null, null, null, 7846);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F4736C4C40845B8A2E7585605E9AA9D', null, '陆常顺', 'lcx', '7188', null, null, null, null, null, 7847);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E740006BF5144D90BDA22FA2DE455A85', null, '茆德华', 'mdh', 'xx5556', null, null, null, null, null, 7848);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9C1F789106924DD4BABBB382BA987337', null, '翁锦发', 'wongjf', '7188', null, null, null, null, null, 7849);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDDE9A076A5B45CB961844E3A5DD3D24', null, '胡二网', 'hew', '7188', null, null, null, null, null, 7850);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3814E563E58A44B98EF8081E8EA0497C', null, '陈建梁', 'cjl', '7188', null, null, null, null, null, 7851);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0ABCBA2B531E46EA913B79EEA5054168', null, '谢裕范', 'xieyf', '7188', null, null, null, null, null, 7852);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FC8AF074F4594F12BD02307ABCFF98A2', null, '张莉敏', 'zhanglm', '7188', null, null, null, null, null, 7853);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4BB3199FF50B4855A5E3D80B48F5D3F3', null, '汤殿发', 'tangdf', '7188', null, null, null, null, null, 7857);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A8205CF586B4689A9228596C47577DA', null, '朱祥勇', 'zhuxy', '541026', null, null, null, null, null, 7858);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C00EB4547337401F98E67EF6618C30EF', null, '张拥军', 'zhyj', '7188', null, null, null, null, null, 7859);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('78FB15F67A4C45AEB92FC1052EDDF7EF', null, '沈松林', 'ssl', '7188', null, null, null, null, null, 7860);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('882E1581F6D34D59B5110CFD904DAD38', null, '芮扬', 'ruiy', '7188', null, null, null, null, null, 7861);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('12E92BC3A9974AB291E50BC803B8002D', null, '韩德银', 'hdy', '7188', null, null, null, null, null, 7862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('112B88E5E8FD48F88761ACA2D4AF1B63', null, '郭桂笙', 'ggg', '7188', null, null, null, null, null, 7863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0E94F2054D834CBC926371A339AA0E79', null, '赵卫国', 'zhaowg', '7188', null, null, null, null, null, 7864);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8CEB3E4A042D4AF0A98CB7AE620CB60D', null, '邵俊华', 'shaojh', '683279', null, null, null, null, null, 7865);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('383B92F749164EC4A1EBF512F5C72885', null, '计才云', 'jcy', '7188', null, null, null, null, null, 7866);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B67049F902A347188A88C0C160F7DCA5', null, '丁梦生', 'dms', '7188', null, null, null, null, null, 7867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C3E9C6555E346EA864E5E7494A26E19', null, '黄健华', 'hjh', '7188', null, null, null, null, null, 7868);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6A8C0880119F4E95A4B984D1BA174349', null, '曹如瑞', 'crr', '7188', null, null, null, null, null, 7869);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CC292A4378C04C4D9654A3190B33D874', null, '颜锋', 'yanf', '7188', null, null, null, null, null, 7870);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C001512BB8D34C4D937939F5177354B4', null, '胡国富', 'hgf', '7188', null, null, null, null, null, 7871);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AD1D264D6F7744A0A19307E9661CB842', null, '施耀章', 'shyz', '7188', null, null, null, null, null, 7872);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('46611B3F2D0240A78193413A08E6BE27', null, '范惠新', 'fhx', '7188', null, null, null, null, null, 7873);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('12C507B2A0E148AFA93B1D7B4DF6E527', null, '彭基敏', 'pjm', '7188', null, null, null, null, null, 7874);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6F4E2AA0E2BC43409D872F6D958580FD', null, '李文斌', 'liwb', '7188', null, null, null, null, null, 7875);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('154E85F65A284349A833F0E64A0995ED', null, '张建伟', 'zhangjw', '7188', null, null, null, null, null, 7876);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83E92B02F5AD4BCF92CAD819C23FA882', null, '99', '77', '7188', null, null, null, null, null, 5004);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDF3D3D6C3884FB09AB9774FA4B0067E', null, '潘文忠', 'panwz', '7188', null, null, null, null, null, 5023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F65CF20B7F4745B88EE4A7BCD3074BE4', null, '刑啸', 'xingx', '7188', null, null, null, null, null, 5024);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BB02EFBEC9A46B2BA3DE2E2393F0DF2', null, '朱海鹰', 'zhu_haiying', '7188', null, null, null, null, null, 5025);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CD6082820B7B40BEAD978664826CC925', null, '金励强', 'jinlq', '7188', null, null, null, null, null, 5026);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EC817701E84A4EDCBB70F3EB3654C870', null, '唐永辉', 'tangyh', '7188', null, null, null, null, null, 5027);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4CB7242B5805410289C4875CF9DD7DE0', null, '刘林祥', 'liulx', '7188', null, null, null, null, null, 5028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7BEA1F9F40B4459D9C147B088621C189', null, '王京平', 'wangjp', '7188', null, null, null, null, null, 5029);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCE9137D9642497E882EEA7737370F98', null, '吴海燕', 'wuhy', '7188', null, null, null, null, null, 5030);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('942BC7937B254E3786586D9CFA763404', null, '吴剑虹', 'wjh', '7188', null, null, null, null, null, 5031);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E34C5092503D487DB399963B81C7BD34', null, '刘志浩', 'liuzh', '7188', null, null, null, null, null, 5032);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A53061B4C583414AA30201FD8B02A08A', null, 'tt', 'tt', '897725', null, null, null, null, null, 5033);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8814F55709C1468589AF5E0DA52CC114', null, '胡永明', 'huym', '7188', null, null, null, null, null, 5035);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C870700B63F40FD8CA9BC96C7B3993B', null, '宋伟绮', 'songwq', '7188', null, null, null, null, null, 5036);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('625BE6D84A6D426BA936100B6355FC64', null, '王晓军', 'wangxj', '7188', null, null, null, null, null, 5038);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('42019DCCAC094274B7D6C965DFCBC8A0', null, '叶振环', 'ye_zhenhuan', '7188', null, null, null, null, null, 5039);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6B978E2D9F704771B6E9B55854E0A70E', null, '夏德才', 'xiadc', '7188', null, null, null, null, null, 5040);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5594AA3F188844EC82AA68E4046CFDC5', null, '张毅', 'zhang_yi', '7188', null, null, null, null, null, 5041);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D1726FC809364C5083F3237C8506C91F', null, '章宏维', 'zhanghw', '7188', null, null, null, null, null, 5043);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('75F1049580CA43F0ADED2AF3FE96FE7C', null, '邹德祥', 'zou_dexiang', '7188', null, null, null, null, null, 5063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FEE4ED051C5D48069E844006B34F453E', null, '颜宝珍', 'yanbz', '7188', null, null, null, null, null, 5065);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B86E6BE649384F1EB55F98455302E0C7', null, '陆绍机', 'lsj', '009678', null, null, null, null, null, 5066);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('71C2BC31406C41C79F8661DC86E7CC15', null, '经作平', 'jingzp', '7188', null, null, null, null, null, 5067);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B46537B579B443D6B42FDE4262B197E2', null, '李育芳', 'liyf', '7188', null, null, null, null, null, 5068);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1C95756BB2449418988C2739562B8C4', null, 'l', 'lm', '7188', null, null, null, null, null, 5069);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8074CBFFC2E04A75A1E7141808C3F743', null, '马纯华', 'mchh', '7188', null, null, null, null, null, 5071);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6484EF755FD4F808B15EA0CEDE8A099', null, '666', '56', '2828', null, null, null, null, null, 5075);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B47C2454585B4CC0B3D908F0F1F9EFAC', null, '金伟忠', 'jwz', '123456', null, null, null, null, null, 5083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3F0D7A047E624169A17D523BFF1970DF', null, '戴峥嵘', 'dzr', '730912', null, null, null, null, null, 5324);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2B52FEA9ED86445E80DEFD9FC40B2768', null, '花爱民', 'ham', '6605', null, null, null, null, null, 5883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33C897BA66AC4DC79A34F82202CB0600', null, '孙宇杰', 'syj', '112233', null, null, null, null, null, 6286);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F2776B0FA13944F38FE975F853542589', null, '蒋政权', 'jzq', '1360', null, null, null, null, null, 6292);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('82EC0C1DD17446AD905A1EB8CE3E80AF', null, '测试', 'test', '1122', null, null, null, null, null, 6704);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C6012AB7886D45F2A1D74C16BC37B4E7', null, '冷卫华', 'lwh', '7777', null, null, null, null, null, 7084);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('01E5C78C17644B6090234087044E15B1', null, '周卫东(703)', 'zwd', '1234', null, null, null, null, null, 7090);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F47C1ACA45974D598C5CB13F2220FEFB', null, '居建邦（双包）', 'jjb', '7778', null, null, null, null, null, 7092);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B1623563FDD54938AFFE748D48D50A8D', null, '茅怡丽', 'myl', '64870484', null, null, null, null, null, 7093);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A75AFAF356F42F0A6B39C36FB154BDC', null, '潘浩湛', 'phz', '7188', null, null, null, null, null, 7095);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('195BE4903BB9405AA8C52857806DB760', null, '汤永根', 'tyg', '7188', null, null, null, null, null, 7097);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7522C562393A41E2B04C3F9BD1CE6056', null, '胡建', 'hj', '7188', null, null, null, null, null, 7101);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C72A53D55034162A250BA0CDF3CBC5A', null, '沈军华', 'sjh', '781120', null, null, null, null, null, 7105);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA766F4F57054EB48A6B2F2EC8D53E87', null, '闻艳锋', 'fyh', '196681', null, null, null, null, null, 7106);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA25D63696FA473096ED54AD5B1565F7', null, '33', 'h2', '1111', null, null, null, null, null, 7107);
commit;
prompt 1200 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1A08B5042424934A7995B0F3E09220B', null, '王琰', 'wangyan', '7188', null, null, null, null, null, 7109);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B9282A23C2FB45FCBD230485E070E42F', null, '桂以文', 'gyw', '8888', null, null, null, null, null, 7111);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5B46FDCFA8504FFEAA4BD74C7C89D7B7', null, '李忠德', 'lzd', '7188', null, null, null, null, null, 7115);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4927D8178D864E76927705559874C09E', null, '朱小佩', 'zxp', '7188', null, null, null, null, null, 7117);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D42B5389E054AECB81934ECD09FF4CA', null, '刘永康', 'lyk', '7188', null, null, null, null, null, 7120);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9A67DD0F8E9469E9BEC856F425F9903', null, '施顺才', 'ssc', '7188', null, null, null, null, null, 7121);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9AEE091260CE4DE3BEF22A5CBB739168', null, '姚家桢', 'yjz', '3864', null, null, null, null, null, 7237);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2DF0A8F1ACB64E3A91FF60A8CC16F32C', null, '黄永生', 'hys', '7688', null, null, null, null, null, 7242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6715B477177401FA6E9270DF2D162A8', null, '张海龙', 'system', '1', null, 'SUPER', null, null, null, 7252);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3F12D1EAD649448BB95118F58576E5F5', null, '宋文俊', 'swj', '0416', null, null, null, null, null, 7260);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7957E4F9F05542BBBBED3B65274A96DC', null, '陈建宁', 'cjn', '64956156', null, null, null, null, null, 7261);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A50A802D259542758B2D8AD9B1AEB712', null, '99', '00', '7188', null, null, null, null, null, 7264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0831C0746A84117A42FD37D84475994', null, '袁秀琴', 'yxq', '6300', null, null, null, null, null, 7265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D90498BD8BDD4C44B856C418425E1E46', null, '蔡军', 'caij', '22222', null, null, null, null, null, 7267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F471BD3A32334682BBD8FD8A7B1C3DE1', null, '姚越', 'yy', '7188', null, null, null, null, null, 7268);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('538DFE6C5F514851B3536F9046BA7228', null, '周蕾', 'zl', '0811', null, null, null, null, null, 7269);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('60066775030C427682FFBD8DF3713F8A', null, '涂亦武', 'tyw', '7188', null, null, null, null, null, 7271);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1015063CA78B47AE83224B61A5FAF179', null, '王冰', 'wb', '111', null, null, null, null, null, 7272);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F47FEDEEE3164C3992F93F8BF8F38D15', null, '颜峰', 'yf', '21504', null, null, null, null, null, 7273);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('87AA3944FD54454F8D563E5D8651B532', null, '喻鹏', 'yp', '7188', null, null, null, null, null, 7275);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C202CCF2461742C789C182AD7AB6E622', null, '杨自洁', 'yzj', '7188', null, null, null, null, null, 7276);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C650C1FF9788498786DC7F21840C0FD6', null, '谢友芳', 'xyf', '7188', null, null, null, null, null, 7277);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7A695C5603504519847075367021BBAB', null, '彭伟炯', 'pwj', '787878', null, null, null, null, null, 7279);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F54385A798D348BAA607ADA4A72E6D00', null, '方思倩', 'fsq', 'wsxedc', null, null, null, null, null, 7280);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6F16448312864430A281F6A41E745630', null, '蒋亮', 'jl', '7188', null, null, null, null, null, 7281);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2087BA2E6454CC0BADD9F8C2E2F82CD', null, '戴家琳', 'djl', '7188', null, null, null, null, null, 7283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4905781C1F0D43B2BC80252BBFC1F24A', null, '王珏非', 'wjf', '7188', null, null, null, null, null, 7284);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('16B0E2D1874C4E55897C6A0BFFFEA0C7', null, '陈启乐', 'cql', '666666', null, null, null, null, null, 7285);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF2F604C509D4378810DEAF2BFBC6416', null, '奚骊', 'xl', '800825', null, null, null, null, null, 7287);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3076FC44FE414E44AADC7B44CE5724F6', null, '朱巧敏', 'zqm', '7188', null, null, null, null, null, 7288);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5C25CD01C794B52813E2A038CE0F12F', null, '朱广军', 'zgj', '123', null, null, null, null, null, 7289);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7920D0879E914FE6A0EDDB0E1B60429F', null, '方磊', 'fl', '821110', null, null, null, null, null, 7290);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1CAC2C14408D49089274EA61C5ED5955', null, '高宝红', 'gbh', '2525', null, null, null, null, null, 7292);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CA11815435214083A287FC2027860B1C', null, '朱原', 'zy', '759180', null, null, null, null, null, 7294);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6FDA7778A49C453C81241E1E21C62C4F', null, '陈伟炳', 'cwb', '7188', null, null, null, null, null, 7295);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1F963811F3E45EC9DE47DD7BD8D86CE', null, '张纪红', 'zjh', '7188', null, null, null, null, null, 7296);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50331469864C4CF2989DE5C0656061B9', null, '程金蓉', 'cjr', '0325', null, null, null, null, null, 7298);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EDCE1E2E5CEC4475838CA7A4E49B7BA7', null, '季方', 'jf', '760819', null, null, null, null, null, 7301);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEA10BDF8B674A89BD066CF03A47671F', null, '陆建君', 'ljj', '6408', null, null, null, null, null, 8224);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1AEC8976C04A4CC3A6574E288344B8DE', null, '罗志祥', 'lzx', '6408', null, 'SUPER', '三分公司', null, null, 8226);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('65B7C3EB10D744398483D8D3AB3791F3', null, '陈卫星', 'cwx', '6408', null, null, null, null, null, 8227);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B94B87FF5B7644528360CEE3CBEC12BD', null, '冯建民', 'fjm', '6408', null, null, null, null, null, 8230);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('04A98A6538964AC6868FD0468B0279F6', null, '张保其', 'zbq', '7188', null, null, null, null, null, 8231);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0ABEC72948D49DE8FB22F3A437C04B6', null, '韦有成', 'wyc', '7188', null, null, null, null, null, 8232);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4FA24B3526934038B9C2F118185A8063', null, '杨文东', 'ywd', '820609', null, null, null, null, null, 8233);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F08F4D054DED44F784870BF75EDDCD62', null, '陈金喜', 'cjx', '7188', null, null, null, null, null, 8234);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('46F7ADEC670648818093E531F7026810', null, '林益新', 'lyx', '7188', null, null, null, null, null, 8235);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D491649C135A43EF86F05730A1152C09', null, '包镇和', 'bzh', '7188', null, null, null, null, null, 8236);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('22E8DA79A79848AB9567E262E982FDC8', null, '张扬天', 'zhangyt', '7188', null, null, null, null, null, 8239);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('871C7CD85AE04B3E8D541AF19C74F8D5', null, '王焕', 'wh', '055066', null, null, null, null, null, 8240);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FA4A48D3193E493BAAEF6B9212881C57', null, '叶忠超', 'yzc', '7188', null, null, null, null, null, 8242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EAABBE4599C74F7AAF36BF46E2D2E0C4', null, '张征', 'zhangz', '7188', null, null, null, null, null, 8244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('51E4090734554E85ABAAA93AAC56D475', null, '董樑', 'dl', '6408', null, null, null, null, null, 8245);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8DDBF1FF6F74B468A7159FF7CE689B7', null, '殷浩', 'yinh', '9823035', null, null, null, null, null, 8248);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0AA3728014C24662A7F16241C79877BB', null, '田三强', 'tsq', '7188', null, null, null, null, null, 8249);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('52BAA7F302144DF8AC855927F2ABC9BC', null, '江金华', 'jiangjh', '7188', null, null, null, null, null, 8251);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35B57FC87F164C92B6845C0FEF662187', null, '傅云章', 'fuyz', '7188', null, null, null, null, null, 8253);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('308B9468174B457BA903E0A699B7B982', null, '张景春', 'zjc', '7188', null, null, null, null, null, 8254);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D5CA025089F343A3ABC39791B6300FD9', null, '朱斌', 'zb', '7188', null, null, null, null, null, 8255);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E61FB2AF0FD6442580B4011071E928AF', null, '薛轶', 'xy', '7188', null, null, null, null, null, 8256);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BD45961E28F9427EA40EA18B3F776252', null, '方忠心', 'fangzx', '7188', null, null, null, null, null, 8258);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('989A148930554624B48B11C4B90B04B8', null, '冯杰', 'fj', '7188', null, null, null, null, null, 8259);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2959D1664A264C308483B46B5C7815FE', null, '莫惠萍', 'mhp', '6666', null, null, null, null, null, 8260);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D686A87BA4C74C87A1E7CEA02A349F4E', null, '徐嘉庆', 'xjq', '7188', null, null, null, null, null, 8261);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('08D6926848F34F22ABDC5A78E0DD4382', null, '崔瑞东', 'crd', '6408', null, null, null, null, null, 8262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6AC2FA8AB9FC407E919D51C84224F2AF', null, '杨顺喜', 'ysx', '7188', null, null, null, null, null, 8263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('644C5B1DBB4A41D8BED5606957F9F605', null, '张淼', 'zm', '7188', null, null, null, null, null, 8265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('875F32D9351F4002AF24AD6247980FAC', null, '顾万华', 'gwh', '2038', null, null, null, null, null, 8266);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('366BE36ED73D4E9BA0A6A5C640A9270B', null, '俞成虎', 'ych', '7188', null, null, null, null, null, 8267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A50D14690978411AAF3CACDC3ED72102', null, '徐世仁', 'xsr', '1947', null, null, null, null, null, 8268);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('646F35CC0C8447ECB5DD89F682C6F7C5', null, '汪林宝', 'wlb', '1234', null, null, null, null, null, 8269);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25D3ACA935794F2BA484861C4483BA4E', null, '姚明亮', 'yml', '7188', null, null, null, null, null, 8270);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC48063A1F2F4D749F92B48685C5C59B', null, 'jj', 'wml', '1231', null, null, null, null, null, 8271);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F672CB95C455448585720B87E259BF21', null, 'll', 'xiajh', '750117', null, null, null, null, null, 8273);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35EA74ECADF24125B766EE125A54D39C', null, '鞠玉宝', 'jyb', '7188', null, null, null, null, null, 8274);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('982BD8B254CB4BAC856A3914548A86D3', null, '屠运灿', 'tuyc', '0300', null, null, null, null, null, 8276);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3E6900426E954EFA9FBE3C0F4B222756', null, '吴裕庆', 'wyq', '7188', null, null, null, null, null, 8277);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('89AB5A861A9E4824A042197189FDC577', null, '何伟勇', 'hewy', '7188', null, null, null, null, null, 8280);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('104F85A1F077446D8E243328D8F8E295', null, '娄志强', 'lzq', '7188', null, null, null, null, null, 8281);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7291865EBF3942E696CC325CBB8DA1B0', null, '沈大利(租赁）', 'sdl', '511', null, null, null, null, null, 8284);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0CA4B1BA682141AC8B62810F6C73E672', null, '白燕华', 'byh', '7188', null, null, null, null, null, 8285);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F070A182A4C4A3D8CE00E804E76E084', null, '何正耀', 'hzy', '120963', null, null, null, null, null, 8287);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE447F7B8C3E4392BE0B75BD6F043769', null, '卫芬', 'wf', '7188', null, null, null, null, null, 8288);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('55F18FAFEA654486A720DFAFC1954369', null, '沈勤初(北京）', 'sqc', '7188', null, null, null, null, null, 8289);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8C2C28E1E90D4F908C021B5F35673581', null, 'fei', 'fei', '7188', null, null, null, null, null, 8290);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3858F118982B47B8907A9DC4BCA49492', null, '陈荣', 'cr', '7188', null, null, null, null, null, 8292);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A151FC28548E4FE59C5599B75B2CF363', null, '王殿明(北京）', 'wdm', '7188', null, null, null, null, null, 8294);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('840BD588646444F4A9E0D7645F30CCA2', null, '季步根', 'jbg', '7188', null, null, null, null, null, 8302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BDDCC0455A104CB4A5468569646D979F', null, '裘尧强', 'qyq', '7188', null, null, null, null, null, 8304);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('409250247F74432DBB55BED0E02A999C', null, '谢祖德', 'xzd', '7188', null, null, null, null, null, 8305);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9F004591308D43679B5A3B1FDCFBCAD6', null, '张怀根', 'zhg', '7188', null, null, null, null, null, 8310);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('289B63F24D4248E280F159592599FC84', null, '金少华', 'jsh', '7188', null, null, null, null, null, 8311);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AD1240A4C6D64519A11B4F78D5631097', null, '陈剑', 'chenjian', '7188', null, null, null, null, null, 8313);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DD67C45E13EA4CF5B03C71268A83E1FC', null, '宗耀华', 'zyh', '7188', null, null, null, null, null, 8315);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C6BB9D3AD2DD423B9D0C79BFCA629CE7', null, '周德昌', 'zdc', '7188', null, null, null, null, null, 8316);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35666128F7E048148233706D07534641', null, '李丹', 'ld', '7188', null, null, null, null, null, 8317);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('814F63EAEF8C467FBCD63C22EDA10936', null, '袁明清', 'ymq', '7188', null, null, null, null, null, 8319);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('478D116DB08249D88EB628B5D06933B3', null, '王晔斌', 'wyb', '652539', null, null, null, null, null, 8321);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3270826D419D4CBCAC3F0D0673D699C0', null, '吴建国', 'wjg', '778104', null, null, null, null, null, 8342);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('27FEAB8DDBE742B6B3E2A9CC3BFEA00C', null, '王重庆', 'wcq', '7188', null, null, null, null, null, 8362);
commit;
prompt 1300 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2ECF3F4508D34354979C00F086937EF9', null, '刘塘', 'fancy', '759180', null, null, null, null, null, 8366);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CDC870F7FEBD49C98357F264D645917B', null, '李锋', 'lf', '123456', null, null, null, null, null, 8367);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8D4E9C8DAEE44AD5BBB0D11B1867CBD3', null, '蔡晓明', 'cxm', '7384', null, null, null, null, null, 8368);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('558AFEE741F04194A4B46CEBE32BBBB3', null, '顾社平', 'gusp', '7188', null, null, null, null, null, 8370);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0BAD8118B52436A911B3E2F3173C0FB', null, '冯慧', 'fh', '1950117', null, null, null, null, null, 8371);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('682012E9A8224E77A662FDEFC65AD70A', null, '沈（yun）', 'sheny', 'isay', null, null, null, null, null, 8373);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('61FE86F71C3C48CDAD01FD62A7646BE4', null, '季永', 'jy', '19810507', null, null, null, null, null, 8376);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C66ECB78D4C34E9395E809557115486D', null, '陈吉吉', 'chenji', '11998844', null, null, null, null, null, 8377);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('17AADE0948F84C2E9FDD7A2176BE7CA2', null, '朱晓宇', 'zxy', '6188', null, null, null, null, null, 8382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33D32A80DFD04859A9C51DD83733056C', null, '马凯(北京）', 'mk', '7188', null, null, null, null, null, 8388);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3977AE83944D4E9C9188A92C26F80079', null, '竺方祥(北京）', 'zfx', '7188', null, null, null, null, null, 8393);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('41C5CD5F4EC944D987656723D9E63E66', null, '钱海男(北京）', 'qhn', '7188', null, null, null, null, null, 8395);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C4E95BCAC542439FB539EB31B523C424', null, '吴棕超', 'wzc', '7188', null, null, null, null, null, 8397);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('61CDEBD170374339B4A50F42561FCA42', null, '唐志明(北京）', 'tzm', '7188', null, null, null, null, null, 8398);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B15118DA49414FC9A5082CCE13BABF22', null, '王倩(北京）', 'wq', '7188', null, null, null, null, null, 8400);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2CDCF64FC2184A1D9389BCD48E1FC68C', null, '金荣根(北京）', 'jrg', '7188', null, null, null, null, null, 8401);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4423F38011A44D7B88A884468F2F168A', null, '朱洪章(北京）', 'zhz', '7188', null, null, null, null, null, 8402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9E28E64DB05D448484E00CF110D9374E', null, '许春明', 'xcm', '7188', null, null, null, null, null, 8404);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5649D9A532DB42C8A31E9E94519D02D0', null, '施延平(北京）', 'syp', '7188', null, null, null, null, null, 8406);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('925A6539A4D2450BB5A133E43176E449', null, '刘泽耕(北京）', 'lzg', '7188', null, null, null, null, null, 8408);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20BF620EA3C640DAB69499CE4BC79922', null, '郭柏荣(北京）', 'gbr', '7188', null, null, null, null, null, 8409);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('316F7AF2159A4907A9E6B041E44C6CFC', null, '杨明德(北京）', 'ymd', '7188', null, null, null, null, null, 8410);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5769754DFD614A5081DA952D8BC7A9BA', null, '石宪洪(北京）', 'sxh', '7188', null, null, null, null, null, 8412);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9E5AFE741E6648AA84465AF12A8137CE', null, '罗维民(北京）', 'lwm', '7188', null, null, null, null, null, 8413);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C35395764964EC1A6D2D0FB79A66E24', null, '周联扬(北京）', 'zhouly', '7188', null, null, null, null, null, 8415);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA6CAADD3A774081B999846DADE60BBE', null, '孙德胜(北京）', 'sds', '7188', null, null, null, null, null, 8416);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E62BBB5F3B95488CBC2280057E55ABD5', null, '谈平江', 'tpj', '55621162', null, null, null, null, null, 8424);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA7805A16CBA49D7AE8188F455B2AF75', null, '金二有', 'jey', '8757', null, null, null, null, null, 8428);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1448254A7A2C4B67B2AF3094CBCD566F', null, '陈培清', 'cbq', '333', null, null, null, null, null, 8429);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FD44270C69F0473BA002B58BEF1853BE', null, '马志芳', 'mazf', '0929', null, null, null, null, null, 8430);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2B5CD8F7D6214B4F8DD1A9D896259120', null, '蒋丽文', 'jlw', '267100', null, null, null, null, null, 8433);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9A0273D6FE14128AF2F0D8F13E18B66', null, '顾雪良', 'gxl', '685470', null, null, null, null, null, 8434);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6B7F4BA337C64F3392C8795D6876AA51', null, '高微', 'gw', '771011', null, null, null, null, null, 8435);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C2DD6D4A238743CBB28236FEF8F4790C', null, '陈军', 'chenjun', '7188', null, null, null, null, null, 8440);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7F5246CE96EB4653B454F0DC86C268A3', null, '聂圣峰', 'nsf', '7188', null, null, null, null, null, 8441);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('822191C643724AE498F117C7F34947F7', null, '刘滨', 'lb', '8888', null, null, null, null, null, 8442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26DDB07F7D6D4928961C2295D9F4064D', null, '白德亮', 'bdl', '8888', null, null, null, null, null, 8464);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('034607A13CBB4CC38F405075580DE3F2', null, '刘正伯', 'liuzb', '8888', null, null, null, null, null, 8466);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8FB9758F2A3A494FAC225B229C39AB7D', null, '柯绍基', 'ksj', '8888', null, null, null, null, null, 8467);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AB0F25A52B3F4B8FAE169256852CB103', null, '夏有芳', 'xiayf', '8888', null, null, null, null, null, 8470);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C3CF631279FE48679E30A4583B55161E', null, '袁红华', 'yhh', '8888', null, null, null, null, null, 8471);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B36D43F3AC2C41A48490B7629B713CDC', null, '奚蓉蓉', 'xirr', '8888', null, null, null, null, null, 8473);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D91D2D59FC4941D78A94526EE432F203', null, '谢方', 'xf', '8888', null, null, null, null, null, 8474);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C109776422F74A8BBE9DB0A2C5E511E7', null, '范爱武', 'faw', '3663', null, null, null, null, null, 8475);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCC32EBC1D284F0393E492F6B6277EF5', null, '成玉琴', 'cyq', 'ccc', null, null, null, null, null, 8478);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C81BFA13F5A14C5CAA4998A1F7254B40', null, '乔正平', 'qzp', '8888', null, null, null, null, null, 8482);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FE331751D51949F7AB8C77033364F229', null, '沈叶梅', 'sym', '9001', null, null, null, null, null, 8483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A9D30EA7F334B35B4A85BFC101B23F3', null, '毛维萍', 'mwp', '8888', null, null, null, null, null, 8484);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E4AB455D371949169C4DC1283D226976', null, '张蓓', 'zhangb', '8888', null, null, null, null, null, 8486);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('67646874EFC04194AD440C56D848BB9D', null, '徐春', 'xc', '8888', null, null, null, null, null, 8487);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0705080214F490E81125208284F8359', null, '陈秀娣', 'cxd', '8888', null, null, null, null, null, 8488);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('092A5571AF08402BA1A00311289993BE', null, '袁顺明', 'ysm', '8888', null, null, null, null, null, 8490);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6271A62949C84152950E4C4F1AE94AAD', null, '陈望生', 'cws', '54707543', null, null, null, null, null, 8493);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D8B5D9AA8654BEDA5E91D235D4FADBF', null, '颜有才', 'yyc', '8888', null, null, null, null, null, 8494);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('40FDB1D6AB234D4D90399698AA2FE9F9', null, '王志良', 'wangzl', '7188', null, null, null, null, null, 8496);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E882A7C7B3A24304AF6B9D6D457A5706', null, '陆士桢', 'lusz', '7188', null, null, null, null, null, 8498);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5691D2C83EC415D809FB1D0ACF987D4', null, '冼家雄', 'xjx', '8888', null, null, null, null, null, 8499);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('03FE8DE7BDA9458BABEC0D358904D325', null, '李勇', 'ly', '147', null, null, null, null, null, 8500);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02155A93A5124B30825B6C1E91524A43', null, '魏美珍', 'wmz', '7777', null, null, null, null, null, 8501);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0F60C1199F484723A1274770C283C877', null, '彭新琴', 'pxq', '7777', null, null, null, null, null, 8502);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D433FFB518BC487A94514213764CC4DE', null, '金琪', 'jq', null, null, null, null, null, null, 8503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCCF814D536D4DBD97AA328BF999B425', null, '施海滨', 'shb', '7777', null, null, null, null, null, 8504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D4DED7EE9A434E61A911E1EC1C78A727', null, '倪小龙', 'nxl', '9632', null, null, null, null, null, 8505);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07A7B45452194E6481C4C9770EAB8019', null, '盛晓东', 'sxd', '1234', null, null, null, null, null, 8507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E1B1B1BAF3C145C0A356A8944379303B', null, '彭磊', 'pl', '135', null, null, null, null, null, 8510);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEBCC6FD728F466F881A1A64A568DE29', null, '郑杰', 'zhengj', '19781106', null, null, null, null, null, 8511);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B2C631DC29E64F44B84F62B65DE36588', null, '周剑颖', 'zhoujy', '19781103', null, null, null, null, null, 8513);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EA05F694A0234A21AFB547364E192EF2', null, '周正清', 'zhouzq', '7188', null, null, null, null, null, 10302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('546600A66C3949F1AAC7A49A24EF72E4', null, '彭烨平', 'pyp', '19780309', null, null, null, null, null, 10322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('95923CEE88FC4390861F9A83DF5058AB', null, '徐鑫华', 'xuxh', '2828', null, null, null, null, null, 10343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('36040B3E49DC4EA9B9DF8D050EFF7BF4', null, '王万森', 'wangws', '2828', null, null, null, null, null, 10344);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('128819514E204FE0A5DDAFDB0A37FC41', null, '戴根龙', 'daigl', '2828', null, null, null, null, null, 10345);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F807863DFC174F22A8EDFA9D5507F297', null, '赵喆', 'zhaoz', '491603', null, null, null, null, null, 10347);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FC84F1D13AF146EB8D4416FAF627CC6C', null, '李伟钢', 'liwg', '2828', null, null, null, null, null, 10348);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DB9E6E82617C429ABB4CA9D6B44EFF43', null, '姚锦森', 'yaojs', '2828', null, null, null, null, null, 10352);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1A38482D7EEC44E9BB0CB909D854315E', null, '吴梦才', 'wmc', '7188', null, null, null, null, null, 10403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('71545F5A2383414C97EAF98AADB7E8CE', null, '卜昌富', 'bcf', '19790127', null, null, null, null, null, 10422);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('713F3E76E90E43CE8912DFD827E2645B', null, '汪文彬', 'wwb', '6188', null, null, null, null, null, 10442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B2A0CE678D4A49A3A43D616C46F769EF', null, '翁彩雅 ', 'wency', '57282673', null, null, null, null, null, 10444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('342DEBD509C54346989FDCEE4FE14814', null, '欧阳晶晶', 'oyjj', '256390', null, null, null, null, null, 10504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E920B509845448958F4D96456F339673', null, '朱建珍', 'zjz', '7188', null, null, null, null, null, 10505);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C03BA419C8404B3EB52884DEEEB182E8', null, '梁培', 'liangp', '64870484', null, null, null, null, null, 10522);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7614FAD874A545C9B1CFECEDB99FE408', null, '盛辰', 'shengc', '7188', null, null, null, null, null, 10565);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4C49FC7726949D1BFDAFDD5A8302C8F', null, '虞锦堂', 'yjt', '7188', null, null, null, null, null, 10567);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3BC0E04F2B2B44CC9DC146B58420E75F', null, '李海', 'lihai', '7188', null, null, null, null, null, 10585);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6D32DE7F472A407CACCE5C12A398E072', null, '张秀芬', 'zhangxf', '123456', null, null, null, null, null, 10602);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5CB026D188F545C3B999D11C5CF7C22D', null, '严立君', 'ylj', '740911', null, null, null, null, null, 10705);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B70FB3FB0AD142D6B5109935B69A50B7', null, '陆陈华', 'luch', '2828', null, null, null, null, null, 10722);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0FFD9342628407587AD1DEE49C42B1B', null, '单冥', 'shanm', '2828', null, null, null, null, null, 10723);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5AD5E9A29313403D87A4287F2399C84F', null, '刘青', 'liuq', '702', null, null, null, null, null, 10724);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A796868424FB4DACBA0E08B9047363D4', null, '黄骞', 'huangq', '2828', null, null, null, null, null, 10725);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4C1961B4C734FD1B710650B47FFA02A', null, '徐伟杰', 'xuwj', '2828', null, null, null, null, null, 10727);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('118D2A0436A2492DA6760775D395DB88', null, '张志候', 'zzh', '7188', null, null, null, null, null, 8318);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D26FA7A26184486A1EDA0590687D49A', null, '徐才根', 'xcg', '8888', null, null, null, null, null, 8343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25D9BB7E6D0D461E9EE2699D1571D56C', null, '陈俊杰', 'cjj', '665140', null, null, null, null, null, 8365);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FC6A621708B34477A3D64A3BBE7FF1D8', null, '顾海平', 'ghp', '6188', null, null, null, null, null, 8369);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('448C06BB6A044B90B01A6A645972956D', null, '陈静', 'chenj', '89588348', null, null, null, null, null, 8375);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3212EE0DC1B64C6DBC929B2932690465', null, '储晓峰', 'chuxf', '08231456', null, null, null, null, null, 8381);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE881AAA34544E0F9BA36A13BAAA83DA', null, '范存昌(北京）', 'fcc', '7188', null, null, null, null, null, 8394);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4B76094DD2F499FBBF8D42441541F15', null, '匿名专家20', 'nmzj20', '123', null, null, null, null, null, 21388);
commit;
prompt 1400 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4BDDC1E33AE248CC883C2C8072F22BBA', null, '刘上龙', 'liusl', '7188', null, null, null, null, null, 21448);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FF8FE9B4A80048B58AE5773CAC5DB216', null, '徐冬', 'xud', '7188', null, null, null, null, null, 21449);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('504A94696F1F4940B27053170F411999', null, '虞伟', 'yuw', '7188', null, null, null, null, null, 21451);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0FF9B2D50AFE4BDBB845C0795B28014E', null, '涂金所', 'tjs', '7188', null, null, null, null, null, 21453);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('843F7112A02B4271A52650F411A8B15A', null, '黄彦韬', 'hyt', '7188', null, null, null, null, null, 21457);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74646DC703F74BA7B49DF83C1B46566C', null, '陆蔚', 'luw', '7188', null, null, null, null, null, 21507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5807610478EB4538BF4550CF6653B149', null, '郁玲莹', 'yly', '520lc1314yblq', null, null, null, null, null, 21529);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('71C245AD82F24AC0B27288AE3F6C067B', null, '邵俊晨', 'shaojc', '7188', null, null, null, null, null, 21547);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5FC7133479A6410DADE1156C0A0AA571', null, '高广峰', 'ggf', '7188', null, null, null, null, null, 21587);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A5AFC369F4B7499DBDFCE2FF7E4A264C', null, '刘杰', 'liujie', '7188', null, null, null, null, null, 21629);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('260FD79D34F944C8A26CF2F04146EC8A', null, '诸军', 'zhujun', '7188', null, null, null, null, null, 21667);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('308765ABA1B943E6A1A6C6C89AD214F8', null, '胡晓峰', 'huxf', '7188', null, null, null, null, null, 21668);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E750AF37C88E4C1B844E8F69858F4316', null, '王利军', 'wanglj', '7188', null, null, null, null, null, 21687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4AADA17D2E447A4A4F19ADC0221B1EE', null, '王勇', 'wangyong', '7188', null, null, null, null, null, 21708);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A1F1D97603C2416EBFC09A7B283B6E74', null, '郭超', 'guoc', '7188', null, null, null, null, null, 21709);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4609883FCDCC45D4A900ABAD9B0289F2', null, '丁祺晖', 'dinqh', '7188', null, null, null, null, null, 21710);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9CDEE4F08C82409FBB071A3CD25D2EF0', null, '陈逸', 'chenyi', '7188', null, null, null, null, null, 21711);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F306D4E2F17F4375997FBDB2E8AB9B8D', null, '王枫', 'wangfen', '7188', null, null, null, null, null, 21713);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D516A49614147BBB2FCFD8EC8B9524F', null, '刘佳', 'liujia', '7188', null, null, null, null, null, 21767);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1F1D9BF5ACC84B56A3657E507C497A8B', null, '彭安露', 'pal', '522522', null, null, null, null, null, 21828);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('687B19CB37BB4CF495A48589565DAE10', null, '柯铮', 'kez', '7188', null, null, null, null, null, 21847);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('573168EF9C0D464E9D2698FEC38D2687', null, '朱辉', 'zhuhui', '7188', null, null, null, null, null, 21867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FEC7A24DC2844E76BE0A10089930453A', null, '周桂明', 'zhougm', '7188', null, null, null, null, null, 21967);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3722BE0B2B424205AB8AAE2E86B2D00E', null, '朱锋', 'zhuf', '7188', null, null, null, null, null, 21968);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6A92406B213D45218476003DE061C679', null, '陈音智', 'cyz', '7188', null, null, null, null, null, 22107);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1FBA0C58C378443C8A53791703751299', null, '杨俊', 'yangj', '7188', null, null, null, null, null, 22209);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5757E03B34E4003AE886E1556E15BCB', null, '冯攀', 'fengp', '7188', null, null, null, null, null, 22227);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0AF9DE2D520D4EED9497AB3244861E6F', null, '邹秋峰', 'zhqf', '7188', null, null, null, null, null, 22288);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7E7D6B34C66A436DBF676D9E04F8408F', null, '曹志勇', 'caozy', '7188', null, null, null, null, null, 22290);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35537A6F35854E03B82DE694134923FE', null, '沈勇刚', 'syg', '2828', null, null, '实业', null, null, 22327);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('95DBD939E9C840E2A5BE1E9B7D0A677D', null, '葛德明', 'gdm', '7188', null, null, null, null, null, 22347);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('44460E1CC65F45DFBE5A2486EF2DF642', null, '李俊', 'lij', '7188', null, null, null, null, null, 22409);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E56DED9A92A449D85CAFDE69424E7F3', null, '沈志刚', 'shzg', '7188', null, null, null, null, null, 22410);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3132ED68DCA04DDD880422778860EFDC', null, '赵惠鈐', 'zhaohq', '7188', null, null, null, null, null, 22448);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5521766DDBE941B9BFB4B4134313FD6B', null, '屠轶涛', 'tyt', '7188', null, null, null, null, null, 22468);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('263A26C1878549579AA75E0156F1FB83', null, '张惠敏', 'zhanghuim', '7188', null, null, null, null, null, 22469);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0D34315562B44B5F9B6D271D53E6951A', null, '俞金华', 'yjh', '7188', null, null, null, null, null, 22487);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77A9014B0E934F5DA8A4E10101E0B9F8', null, '蔡淑屏', 'csp', '7188', null, null, null, null, null, 22489);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5CBE7AFFE1F74B7CAA7EBCB3CF94C98F', null, '阙国昌', 'qcg', '7188', null, null, null, null, null, 22490);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D398FD8D8441401F9B338279C0DCCDA5', null, '孙俭', 'sunjian', '7188', null, null, null, null, null, 22508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('68277A14B6B14D0B9619DFBF253ECDBD', null, '林怡生', 'lys', '7188', null, null, null, null, null, 22509);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E7916181F9284FA5BAEE0D14AD090C16', null, '柴宝云', 'cby', '7188', null, null, null, null, null, 22530);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F34800D67034A7DB2794FFAEAB5EEB6', null, '康建', 'kangj', '7188', null, null, null, null, null, 22531);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7CE46ED37A124AD48CA95C61EC5B8FFB', null, '朱镜欢', 'zhujh', '7188', null, null, null, null, null, 22549);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F6BC358E2B854CE6991968CAC4A54A96', null, '余华勇', 'yhy', '7188', null, null, null, null, null, 22583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7F06E6BA52774A0788A112F3FBE8C292', null, '陆良', 'lulian', '7188', null, null, null, null, null, 22587);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1CF6C3D0386C4189BB2780F6CCA69F62', null, '顾海欧', 'gho', '7188', null, null, null, null, null, 22588);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0CCEA4CA1ECF41FA8784068DE6E7340F', null, '翟一春', 'zyc', '7188', null, null, null, null, null, 22647);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D61A74A73A4A4A8286B11DCC3AB5450C', null, '王辉', 'wanghui', '7188', null, null, null, null, null, 22649);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D0A0C3EC151401A8884B900233B0D57', null, '赵泓赓', 'zhaohg', '7188', null, null, null, null, null, 22650);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6448F36BABBE404DAB082495A0354840', null, '吴嘉炜', 'wujw', '7188', null, null, null, null, null, 22667);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6D12C8C8D2C04E51B2778ED2F5A8A21E', null, '马靖宇', 'mjy', '7188', null, null, null, null, null, 22687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('46A0B7D613CF41A88FE1C33C0473A55B', null, '刘铭汉', 'liumingh', '7188', null, null, null, null, null, 22747);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3726A96BD18B4EFC8744F3867E09A31D', null, '叶建丽', 'yjli', '7188', null, null, null, null, null, 22787);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9605F616D6C43A4B4ED94577CA452FA', null, '王伟庆', 'wangwq', '7188', null, null, null, null, null, 22811);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('32D44B4D7C6C4954B26B737B54E80D8A', null, '陈立美', 'chlm', '7188', null, null, null, null, null, 22813);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('06A87F478AA84B9A81E95EC900BD7E74', null, '刘满平', 'lmp', '7188', null, null, null, null, null, 22816);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D9B20F26E6C470FAC8D35243D7A7559', null, '周洪宝', 'zhb', '7188', null, null, null, null, null, 22847);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D20D5F0BC7CF441AAF605082FFF59681', null, '李国齐', 'ligqi', '7188', null, null, null, null, null, 22848);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F247A6A6C5744D2A844866C7A63F3EA7', null, '张卫兵', 'zhangwb', '7188', null, null, null, null, null, 22907);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2474C6CD4F22466F973ABE619727EDB4', null, '张根明', 'zhanggm', '7188', null, null, null, null, null, 22908);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8915AB9C5B9447D59E5477F71E192EA4', null, '杨君', 'yangjun', '7188', null, null, null, null, null, 22909);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3B5B082E1EA94BED8187D3E2917B0706', null, '施良', 'shil', '7188', null, null, null, null, null, 22910);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5AA6C90E54F042B5BFCF611A0AD4C8D3', null, '及杨', 'jiy', '7188', null, null, null, null, null, 22911);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3A8C1FFA62734F5B8D70B700F11C5766', null, '李嘉炜', 'lijw', '7188', null, null, null, null, null, 22912);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('646FB7BE2C664A5A8272FEC24FD1B7B0', null, '曹梦劼', 'cmj', '7188', null, null, null, null, null, 22913);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FBFC1EEC3BF34491B153A332D3C5B174', null, '顾俊超', 'gjc', '7188', null, null, null, null, null, 23008);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C95CAC0A5FE34F2BBAFBF8FF08813A94', null, '陆桦杰', 'lhj', '7188', null, null, null, null, null, 23089);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('89F16294351340219F51CDDD29D559B4', null, '宋超', 'songc', '7188', null, null, null, null, null, 23090);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE129955DAC143469B0607DC09F9EEA4', null, '余兵松', 'ybs', '7188', null, null, null, null, null, 23091);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A358D4AF63F44069854633480977D3D', null, '沈士军', 'ssj', '7188', null, null, null, null, null, 23092);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('185A3B37D6394C4DA948D82B8385C647', null, '姜雪冲', 'jxc', '7188', null, null, null, null, null, 23093);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6D81431729A1491CA894FF67E21E33F3', null, '郝桂成', 'hgc', '7188', null, null, null, null, null, 23094);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7437D276061441C3A0B055F80FB5AB1C', null, '李印', 'liying', '7188', null, null, null, null, null, 23095);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9493CFB631B54578A9BFC4CF49539FB0', null, '鲍丹青', 'bdq', '7188', null, null, null, null, null, 23147);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AFEA95026BF844EE828F304E1C6BA9AE', null, '戴雅芳', 'dyf', '7188', null, null, null, null, null, 23148);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7CC4FD35411642F4BC769B521559E465', null, '谢振华', 'xiezhh', '7188', null, null, null, null, null, 23168);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D75D77E8619346C1885915D521048FD7', null, '沙聚福', 'sajf', '7188', null, null, null, null, null, 23228);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B48D27B3A9C14D9DA89040ACA27822F6', null, '迟静儒', 'cijr', '7188', null, null, null, null, null, 23230);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('03BDACE735F744CBB93A903DFF59F8DA', null, '朱宝华', 'zubh', '7188', null, null, null, null, null, 23231);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('13E344EA37094F5497A293369E4CC359', null, '陆宏晖', 'lhh', '7188', null, null, null, null, null, 23232);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A265D73F8A64488181C443FF864EDC24', null, '吴林', 'wul', '7188', null, null, null, null, null, 23233);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E85CB0B93FD9487A859F26E8D962DEF5', null, '杜汉卿', 'dhq', '7188', null, null, null, null, null, 23247);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C7F69E0E48E94657B8D4C905A2A444E4', null, '安国峰', 'agf', '7188', null, null, null, null, null, 23248);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CFC926E6013B494F9F2307B32E4E4B55', null, '王俊', 'jovi', '6280248', null, null, null, null, null, 23307);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('465584F467D1408D8377FA099C78E456', null, '朱旭犁', 'zxl', '7188', null, null, null, null, null, 23308);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('85F171447E48438BAFF0A438D88744FD', null, '程航', 'ryan', '123321', null, null, null, null, null, 23309);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3A2124B33DAE408B821844EBDC5D8E63', null, '赵敏', 'zhaoming', 'kkklll', null, null, null, null, null, 23310);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('510156636E6940678501934F62C14FD8', null, '冷喆祥', 'lengzx', '7188', null, null, null, null, null, 23312);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0A7B74DE03F2401EBD40993F2F2B5EA2', null, '张坚', 'zhjian', '7188', null, null, null, null, null, 23327);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50ABC1D373044941876D4C2F5113E362', null, '史雅琳', 'shiyl', '123456', null, null, null, null, null, 23428);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EAACB397DB1C4287A65296C5774F996D', null, '刘满', 'lman', '7188', null, null, null, null, null, 23429);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1996932545AB4FA4976D5BA85DAFD6F2', null, '谢俊敏', 'xjm', '6188', null, null, null, null, null, 23467);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D002583BC8E847BFAB78662A5C10922B', null, '彭轶凡', 'pyf', '7188', null, null, null, null, null, 23527);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A807331ABC94AFE8FA72650F96BF446', null, '闾蓉丽', 'lrl', '7188', null, null, null, null, null, 23547);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('97B642F169B14FD98499971517BDFE46', null, '袁海燕', 'yhyan', '7188', null, null, null, null, null, 23548);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5106883AFEF243B9AF5D1305B90F8B2B', null, '焦炜斌', 'jwb', '7188', null, null, null, null, null, 23614);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F71FACE2496343109029E1A8107A1A3E', null, '付志飞', 'fzf', '7188', null, null, null, null, null, 23615);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7D28EFDEAE464641BE6CC399D74D60B5', null, '刘万财', 'lwc', '7188', null, null, null, null, null, 23694);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7FE5E6BEF3B43AAAFB4D4D75EF809A7', null, '周金龙', 'zhoujl', '7188', null, null, null, null, null, 23714);
commit;
prompt 1500 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69871D9670BF48DE8726F7ACF1965571', null, '赵晓芹', 'zhaoxq', '7188', null, null, null, null, null, 23715);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('37C0FD3FFC5F492CBD5CEFAA2ED897CB', null, '毛蔚睿', 'mrw', '7188', null, null, null, null, null, 23716);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7C667D43A1E4848AD477355F6065D0F', null, '季汉荣', 'jihr', '7188', null, null, null, null, null, 23734);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5E1D18B826CA4C7EBBCE6C8D47D199E0', null, '徐招余', 'xzy', '7188', null, null, null, null, null, 23754);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6DAD14448F9149108F2B07AECE1D04C8', null, '孙俊华', 'sunjh', '7188', null, null, null, null, null, 23778);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CC4DE97CE35544D4AE39766A3537083E', null, '张梦鼐', 'zmd', '7188', null, null, null, null, null, 23794);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DCE324676AF942A8AE9342EAC1D4A8FE', null, '王经业', 'wjye', '7188', null, null, null, null, null, 23796);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D466FD0ABB324F70B4368D939D62184E', null, '韩晓星', 'hxx', '7188', null, null, null, null, null, 23797);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('444F68A10D104260B5396CA35AAF6CF8', null, '史博文(天津)', 'sbw', '861207', null, null, null, null, null, 23798);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3E3EDE48EB1C455F82A70764A7EA62B1', null, '唐亮', 'tangl', '7188', null, null, null, null, null, 18182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4911B1C896E44723BA87745C93D249F6', null, '李家席', 'lijx', '7188', null, null, null, null, null, 18202);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('81C04DF47AEE4FE7AA69BCB6B37998D2', null, '祁铭锋', 'qmf', '7188', null, null, null, null, null, 18242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4F658596AC5047FC92208F1E67AF08BE', null, '丁桂芳', 'dinggf', '112046', null, null, null, null, null, 18283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B83CDA274AC84E328E6A4C8B0A39739C', null, '顾宝森', 'goubs', '7188', null, null, null, null, null, 18285);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4F39A0FBB73A4F2193B62BE2EC20D22C', null, '张晓惠', 'zxh', '7188', null, null, null, null, null, 18326);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9B08CFC5202D4127A314D24EFB5179BE', null, '朱婵祎', 'zcy', '7188', null, null, null, null, null, 18327);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('19794B62695F4803B6A6D17BFBF360D2', null, '张春金', 'zcj', '7188', null, null, null, null, null, 18328);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A3A8BF07D73F41C4B95966473BDB535D', null, '黄冠', 'hg', '7188', null, null, null, null, null, 18329);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09CB94380ADC461A831B7C2ECC68DB6F', null, '陈俊杰', 'chenjj', '99', null, null, null, null, null, 18331);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4304B11C10AB4CA2AF4B39353F39D535', null, '吴立新(公司)', 'wlxgs', '7188', null, null, null, null, null, 18332);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('08BE4ED9E713464D8FE9BC846705E88D', null, '郁春明', 'yucm', '7188', null, null, null, null, null, 18424);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('36EF12B831944B07BA1AF05EDA3DA5CC', null, '邢承良', 'xcl', '1105', null, null, null, null, null, 18442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74445FD0849C470ABDA75A428C04A50F', null, '沈奇', 'sq', '7188', null, null, null, null, null, 18463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FA55D5103AFC49EB8244E9EC52756EE3', null, '张家民', 'zhangjm', '7188', null, null, null, null, null, 18562);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A608092F415F4682B2B727152FD8D7AD', null, '鲁寅', 'luyin', '7288', null, null, null, null, null, 18743);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E4E7AA5A2AB04293A3B4AB6C20B75CFA', null, '石晓锋', 'sxf', '7188', null, null, null, null, null, 18782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('14D9146888074405960E95E5D58180CF', null, '顾滨海', 'gubh', '7188', null, null, null, null, null, 18783);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5EF585F1B8964EE5A3321D63C3790340', null, '单斌', 'shanb', '7188', null, null, null, null, null, 18784);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E44A0C1B791C41A3917E7A2635AD935A', null, '钮习士', 'nxs', '7188', null, null, null, null, null, 18785);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D166A8C8ECDD48FBB515753BE8864F20', null, '郑峥', 'zhen', '7188', null, null, null, null, null, 18786);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1AAF7F3F9D44106BC76671D3831D5DA', null, '张军', 'zhang-jun', '7188', null, null, null, null, null, 18805);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B9B1C2BC7F824B14A44BB296DDD014B3', null, '吴海强', 'wuhq', '7188', null, null, null, null, null, 18922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('944F94BCC2E746749533D2FBD186BC0C', null, '徐军', 'xunjun', '7288', null, null, null, null, null, 18923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9742C55B9448401C90F354A46DFF82B3', null, '徐军(总包)', 'xu_jun', '7288', null, null, null, null, null, 18942);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0106285634F84A91A3F5D3BE19310ABA', null, '徐耀亮', 'xuyaol', '7188', null, null, null, null, null, 19023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0B9F6A88423548659B89689B9090DCF1', null, '顾丰妮', 'gufn', '7188', null, null, null, null, null, 19054);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('488E8A371204418BAFF115B10BBA6431', null, '陈军701', 'chenjun701', '7188', null, null, null, null, null, 19058);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('328ACE72D4B148FD93ABFF42D2C0DA44', null, '娄嘉立', 'loujl', '7188', null, null, null, null, null, 19059);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('32C7CE7031BF4E09B0B9882D3EB623FC', null, '董梁', 'dliang', '7188', null, null, null, null, null, 19060);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('823FB3EE2D124CF3834E311789E7479E', null, '王梅艳', 'wmy', '7188', null, null, null, null, null, 19061);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A2825F9E67747FEB541F3852D754ABF', null, '方定勇', 'fdy', '7188', null, null, null, null, null, 19062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6BA5506D48444FCB457FC0FD5509990', null, '蔡啸', 'caixiao', '7188', null, null, null, null, null, 19063);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('615A61E3E13D40DE9FB66CD11310C6E7', null, '顾建平', 'gujp', '7188', null, null, null, null, null, 19064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D7FB7B08F224ECF8F780F68240AE5B0', null, '王智毅', 'wzyi', '7188', null, null, null, null, null, 19077);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6FFFABB5C02A4D7F88DBFD2D05194375', null, '张永斌', 'zyb', '7188', null, null, null, null, null, 19079);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('374C472FF09A495984E314B6A5754AB5', null, '张鋆峰', 'zjf', '7188', null, null, null, null, null, 19080);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F14125063F847179102E325EAD611EF', null, '资文进', 'zwj', '58430827', null, null, null, null, null, 19183);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('62F9E41760F3454EBFADA725434AC550', null, '曹路', 'caolu', '7188', null, null, null, null, null, 19242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('367AF132FDEC4626B91FDEE661BB660B', null, '贾伟伟', 'jww', '496481', null, null, null, null, null, 19382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('51DF13F8E0394E6BB30056BABAE80572', null, '屈洋', 'quyang', '1231', null, null, null, null, null, 19383);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A5EAAFF08A094B24A3F4276189C0CF5C', null, '李海丽', 'lhl', '7188', null, null, null, null, null, 19384);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0B99BE9C11144948E985511C7787826', null, '陈骁俊', 'cxiaoj', '1985211', null, null, null, null, null, 19402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C417EF93B5349D8A7BD3DFC1991E065', null, '徐晔', 'xuye', '7188', null, null, null, null, null, 19405);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('519C6296196D4385842D709538911D15', null, '孙旭方', 'sxuf', '7188', null, null, null, null, null, 19407);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('51FD6990B87148F88174CDF96105FBA2', null, '王者三', 'wangzhes', '7188', null, null, null, null, null, 20020);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('49CEFB3D80C547AEBC137C375F0BA3A7', null, '石晓峰', 'sxfen', '7188', null, null, null, null, null, 20021);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('341A33E844F749B5A81BE3C907E9238B', null, '姚俊', 'yaoj', '7188', null, null, null, null, null, 20024);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FB50A97776C14C1786D4CBD43C106C03', null, '柏国利', 'baigl', '7188', null, null, null, null, null, 20027);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7979E3697421493E83FF2DAB57DCFE52', null, '余锦琳', 'yujl', '841217', null, null, null, null, null, 20028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('310A05345DE34E8FA8979B54FABF43CC', null, '吴老虎', 'wulaohu', '7188', null, null, null, null, null, 20029);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('309BB2FDD404493D9CC7C3A9981DAE49', null, '应瑛', 'yingy', '7188', null, null, null, null, null, 20043);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6AE84272C2DE45B7835C14F9B79A44BF', null, '张颖珺', 'zyjun', '7188', null, null, null, null, null, 20044);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AF3D5A2718B140AA99D822FE7B5190EA', null, '庄志华', 'zhuangzh', '7188', null, null, null, null, null, 20064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3CE875951FBF40F2B976D262C1644E52', null, '陈超', 'chenchao', '7188', null, null, null, null, null, 20065);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6AD780A60284177A956851E90BB4305', null, '邵铜元', 'sty', '2828', null, null, null, null, null, 20069);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EDD19A0034D2435F82A18061AE581995', null, '赵慧钦', 'zhanghy', '7188', null, null, null, null, null, 20070);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3826DACFBE4143A1856F507536500E70', null, '林宝华', 'linbh', '7188', null, null, null, null, null, 20071);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('05793C9473E446FEA9ECF07D5AD26883', null, '柳志华', 'liuzhh', '7188', null, null, null, null, null, 20072);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02784ADFF65A463E88262217D4FDC939', null, '王明文', 'wangmw', '7188', null, null, null, null, null, 20073);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('68F2CAE4A21440F8A8E59692C94C53B9', null, '陆庆', 'luqing', '7188', null, null, null, null, null, 20075);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5BB66EE9AB274895843B6F5CC6DDADBD', null, '童凯', 'tongk', '7188', null, null, null, null, null, 20079);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E02C6080C88841229B970F2A054D667F', null, '王立民', 'wanglm', '2828', null, null, null, null, null, 20080);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CA5B709F7C37485783FE4E32666EDE76', null, '刘民本', 'lmb', '2828', null, null, null, null, null, 20081);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B60BD57545BD45348D47B0B2D47D8877', null, '张凤妹', 'zhangfm', '2828', null, null, null, null, null, 20084);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0D37DEEE4F2D4F9DB9B605D893807F30', null, '程安兴', 'chenax', '7188', null, null, null, null, null, 20086);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74FA9C74739248B38C109A441F0BFB47', null, '姜根德', 'jgd', '2828', null, null, null, null, null, 20087);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B53EF62634D14F24BD221DCA67ED5680', null, '陆晓东', 'luxd', '2828', null, null, null, null, null, 20088);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4AF5B8601F264A68A7203DA2E168D299', null, '陈子斌', 'czb', '2828', null, null, null, null, null, 20090);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69AF8F4E7C69413FA7C4F5440D0523D6', null, '胡珂', 'huke', '7188', null, null, null, null, null, 20091);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('322FF3C9054F40789192241F21A454C4', null, '徐洁', 'xuji', '1126', null, null, null, null, null, 20104);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A774197EAF614790B8B118B54942C5BD', null, '蒋艺', 'jiangyi', '7188', null, null, null, null, null, 20105);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4C04606153644237A4B2CB1C9CB31FCD', null, '钟国春', 'zhonggc', '7188', null, null, null, null, null, 20106);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9005325CD63E4BD5A2F173107C2D61B2', null, '朱体翰', 'zhuth', '7188', null, null, null, null, null, 20110);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('16D0B37213D64F459572E3A7943828D2', null, '梁荣忠', 'liangrz', '7188', null, null, null, null, null, 20111);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D58F983C8362403A9250A524E8A8FAC1', null, '宗克俭', 'zkj', '2828', null, null, null, null, null, 20113);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EC24DBFF53384DE7A8AE1E2AF55CE42B', null, '丰申', 'fengs', '2828', null, null, null, null, null, 20114);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4E87E29E4F804DC6A75E11B85431C0F9', null, '陈清山', 'cqs', '7188', null, null, null, null, null, 20124);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('991B7DA0B26640BEA94760146A3F2B27', null, '刘荣康', 'lrk', '7188', null, null, null, null, null, 20143);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7FE5D21FB4154BFCA4D48C3C099340D1', null, '李琦', 'liqi', '7188', null, null, null, null, null, 20145);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4F204EA35CC6444EA1E0C9935A86762E', null, '曹华岗', 'caohg', '7188', null, null, null, null, null, 20146);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E54E0F149E2D45E49473A19A7A0DADC9', null, '戴秋祥', 'dqx', '7188', null, null, null, null, null, 20147);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D6EF28F54AE47CBBF3174E7E4B35AD5', null, '王颖臻', 'wyiz', '7188', null, null, null, null, null, 20148);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ACD631226411450F9ED2D204F9A9F0C2', null, '陆蓉', 'lur', '7188', null, null, null, null, null, 20149);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7CE8D153AFCA4BCEAE11B35E09CFB9E3', null, '蔡传清', 'ccq', '1103', null, null, null, null, null, 20151);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E2680CF4CEF34669A775480704D6BC89', null, '顾佳伟', 'gujw', '7188', null, null, null, null, null, 20152);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39130CAEB55541A2BD37B5C9CF3D2A65', null, '薛峰', 'xuef', '7188', null, null, null, null, null, 20154);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A526A89511D24AC9A3E0938F68C1C98A', null, '陆瑾', 'luj', '7188', null, null, null, null, null, 20158);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('41F3BC0A75914481BD82AB881B8DC58B', null, '吴俊炜', 'wujunw', '7188', null, null, null, null, null, 20160);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E8BB99BDF8854DD3A0D0960D5A909683', null, '杨帅', 'yangshuai', '7188', null, null, null, null, null, 20163);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('745A925527944AD7BB78BAD0DD9B1DEC', null, '施飞', 'sf', '7188', null, null, null, null, null, 20167);
commit;
prompt 1600 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A9B5A0AE81FC4CB38A8EBC96FD578A7E', null, '陈松', 'cs', '7188', null, null, null, null, null, 20168);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A26D9DE419A466BA87EFA1105F53ED2', null, '李珺俊', 'ljunj', '7188', null, null, null, null, null, 20169);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9C9F915B9B664CF6A0EC2EA9BE984BF4', null, '黄静', 'huangjin', '7188', null, null, null, null, null, 20170);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C02DDF8F3191473A84BEEB4E63B9074A', null, '叶昕炜', 'yxw', '7188', null, null, null, null, null, 20172);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6E471298173A4F0FA8C985B0FB0A589C', null, '唐洁', 'tangj', '7188', null, null, null, null, null, 20173);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0DEC7E6DFDE43D8B0D669FE9E2D1108', null, '董自成', 'dzc', '7188', null, null, null, null, null, 20174);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C75ABC4835124AD1A00780C7A9CCDF4E', null, '吴吉', 'wuji', '7188', null, null, null, null, null, 20263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('014ED89B09C346A188855A1C43EFD8B7', null, '顾海峰', 'ghf', '7188', null, null, null, null, null, 20264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('73061798AB5A4B148CCAF395F63F7909', null, '唐红兵', 'thb', '7188', null, null, null, null, null, 20265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47E0C8D6653D407B8D05AB546A225A3F', null, '夏杰', 'xiajie', '7188', null, null, null, null, null, 20283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83CA8F9C50CD45FFACD415814086DADE', null, '丁伟宝', 'dwb', '7188', null, null, null, null, null, 20305);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3E1B55ECA9DC411297FDFD1344CA3C43', null, '王骁骏', 'wxj', '7188', null, null, null, null, null, 20343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA5EEF2FC6C0469281E2141EAE50C732', null, '王岱峰', 'wdf', '7188', null, null, null, null, null, 20344);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F7FCC3C1EB764F6683D5E069FC443A40', null, '叶黎年', 'yeln', '7188', null, null, null, null, null, 20384);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47B0BD5BDD144299B319E9E96F7C52FC', null, '叶锦祥', 'yejx', '7188', null, 'SUPER', '四', null, null, 20389);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8E59FF6B7C6B4087A4C01E29FFC5C537', null, '张建洲', 'zhjz', '7188', null, null, null, null, null, 20390);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83257EB2358C4894BCF9E4C3A4350A8D', null, '杨翠敏', 'ycm', '7188', null, null, null, null, null, 20403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('011715BD5DFB4CDC81FCDBE8863A4DA1', null, '张进龙', 'zhangjl', '7188', null, null, null, null, null, 20424);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0C593EA6DA064CDD9AD5A48D0B8F3B1C', null, '鲍鑫', 'baox', '7188', null, null, null, null, null, 20425);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8639AAD7A8F84DD5856719DFAF688C6F', null, '金富强', 'jfq', '7188', null, null, null, null, null, 20427);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0104A07244ED461E9084D712DD9B694E', null, '陆洪发', 'lhf', '7188', null, null, null, null, null, 20428);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDD594A44C5A4A9EA2BA083ADDDA48E5', null, '黄欢', 'huangh', '7188', null, 'SUPER', null, null, null, 20443);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C568DB55F42F4A0A9BEA2DB0866EC023', null, '董军毅', 'dongjy', '7188', null, null, null, null, null, 20503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6D39A276BC934F8D88BA43B1EF883765', null, '陈晓俊', 'chxj', '7188', null, null, null, null, null, 20523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA995DF75D6B4697A9B3D84E23DAD85B', null, '马晓侵', 'mxq', '7188', null, null, null, null, null, 20524);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('52520BDD4D4941E4B523493DED34196C', null, '吴建钧', 'wujj', '7188', null, null, null, null, null, 20525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('79DD76BC93284C90BAA94CAD05249AB6', null, '赵光启', 'zhaogq', '7188', null, null, null, null, null, 20526);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C78E1C30C07447BEA7E079DEB14CE72A', null, '朱玮松', 'zws', '7188', null, null, null, null, null, 20544);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6E5D5AE55DE44831A2732B4A4C8C8329', null, '魏金元', 'wjy', '7188', null, null, null, null, null, 20545);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('42A62D13A5574FCF9539BF413A48887B', null, '余文杰', 'ywj', '7188', null, null, null, null, null, 20546);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC7FE9C3002E446397FC319665BA2EB2', null, '孙震', 'sunz', 'sunz', null, null, null, null, null, 20584);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E47EA8D9C0C74C569C01342D58ED0E25', null, '蒋振明', 'jzenm', '7188', null, null, null, null, null, 20585);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCDA438BD13C475D929B1D55ECDB0C9E', null, '叶金驹', 'yjj', '7188', null, null, null, null, null, 20586);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5E5AA839B88944A483566B86AF06C016', null, '陆孝明', 'lxm', '7188', null, null, null, null, null, 20587);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('309CE9C2A516437D82BE294D6E29CA1D', null, '蔡琼', 'caiq', '7188', null, null, null, null, null, 20589);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('212C9CF3F2784ADBB4445CC5BC77CF95', null, '甘中迪', 'gzd', '7188', null, null, null, null, null, 20604);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35758CB1FD17424CA338FC1F87FB3FC7', null, '蔡粼', 'cail', '123', null, null, null, null, null, 20605);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35C20BFC8E1D4B7C9B2F64491AE3760D', null, '高长友', 'gaocy', '7188', null, null, null, null, null, 20626);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('14A11F559F9141C6A2D7418575BD8BE2', null, '吴国祥', 'wugx', '1683chy1683', null, null, null, null, null, 20728);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF928E654D2E4E66B9ACC546AB1576D2', null, '陆一璐', '616', 'qjmm616', null, null, null, null, null, 20729);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6991E8673E06451AA8D7B72BC53AD25B', null, '徐杰', 'xujie', '7188', null, null, null, null, null, 20730);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D3169775FEF482DA79D3409CCF9A79F', null, '徐美芳', 'xumf', '518598', null, null, null, null, null, 20767);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D18506EB18314DB1A720AFFDD13B0DD2', null, '小白', 'bai', '7188', null, null, null, null, null, 20787);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50FC9C3A34D141529DACE830F67C990F', null, '潘溢滔', 'panyt', '7188', null, null, null, null, null, 20807);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9CF3899C31B2448CA0510903B2D83CEC', null, '张国民', 'zgm', '7188', null, null, null, null, null, 20827);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AB199F1D5A8486FB3CC6773B069D99A', null, '沈希连', 'shxl', '2828', null, null, null, null, null, 11214);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F37CFE6234E4927A0C35C9B37227C66', null, '李来兴', 'llx', '2828', null, null, null, null, null, 11215);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D8F6A04C57824CD9AB7DF48FB9E6A7B6', null, '翁国兴', 'wgx', '1683chy1683', null, null, null, null, null, 11242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02E491B9D6AC46269FF3EE7B80F2DDD3', null, '陈惠善', 'chs', '2828', null, null, null, null, null, 11263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('476FE5EE79644D468F573037491F972F', null, '鲁文政', 'lwz', '2828', null, null, null, null, null, 11264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B25D9848E5C94565A201AF23F00DDDC0', null, '林增应', 'lzy', '2828', null, null, null, null, null, 11265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FD0D84ED628B424DB0B7074900072AF0', null, '林居龙', 'linjl', '2828', null, null, null, null, null, 11267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BEAC7918B883471EA84D8B53F3C0477C', null, '任德武', 'rdw', '2828', null, null, null, null, null, 11268);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('95AB78855DD0430DA894E8F83E96B488', null, '李伏祥', 'lfx', '2828', null, null, null, null, null, 11269);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('34ECC6A7E90F407CB38392342DEB769C', null, '陈棋光', 'cqg', '2828', null, null, null, null, null, 11270);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7FA0E8F399D14A1799754DF81B02E57C', null, '陈为财', 'cwc', '2828', null, null, null, null, null, 11272);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('98E018B44A3A4C15B3CA7BD48AE47693', null, '陈贻财', 'cyc', '2828', null, null, null, null, null, 11273);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9D63E55D2A3A485FAA30C42440DA00D2', null, '秦毅', 'qiny', '0000', null, null, null, null, null, 11283);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('80F37682E31448F18A953FD3A9AFD5A2', null, '孙晓明', 'sxm', '2828', null, null, null, null, null, 11303);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2FE51F456F4341E7B2B3E2AE6D2F4DBF', null, '罗艳蓉', 'luoyr', '8282', null, null, null, null, null, 11305);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47C48632BB0D47C6A2BF1F16C57E229D', null, '张新初', 'zhxc', '2828', null, null, null, null, null, 11323);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('239EF46006B543578A7F66C7D2FF8909', null, '王永青', 'wyongq', '7188', null, null, null, null, null, 11382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('026ADDAF92A0432B892EA844E7A74027', null, '莫瑾', 'mj', '751223', null, null, null, null, null, 11402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('244834FB55344FAA8F79A82F74E8D36E', null, '苏林兴', 'sulx ', '6470', null, null, null, null, null, 11442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9990B3FDA804E94B848D11FE8145583', null, '陈军(安装)', 'chenjun ', '6470', null, null, null, null, null, 11444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74613961FADC47AB908E321BCA4BB1EB', null, '周桂宝', 'zhgb', '7188', null, null, null, null, null, 11463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6A6A0E0E473E4A99AAF5BB389DCA9A1C', null, '瞿永明', 'quym', '7188', null, null, null, null, null, 11464);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('60F2462CF70841918641BE6CE922161B', null, '单刚强', 'shangq', '7188', null, null, null, null, null, 11466);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('76F4C5055F144D688FE1A57CB3AAAE7E', null, '陈晓帆', 'chxf', '2828', null, null, null, null, null, 11522);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('009F318C5B89447D8D6E407EB1470501', null, '蒋秀强', 'jxq', '2828', null, null, null, null, null, 11524);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9119A736847648EE85D8975CD0DDB506', null, '汪辉', 'wangh', '2828', null, null, null, null, null, 11525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09662BD956DC459FBC1EA67BF9343B7E', null, '陈明生', 'cms', '2828', null, null, null, null, null, 11526);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CE2D8258D7814D73817DD1D9E99E4339', null, '付小杰', 'fuxj', 'fxjfxj', null, null, null, null, null, 11542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('724130D2D9D74127814CFE3098A8CA4E', null, '方才章', 'fangcz', '7188', null, null, null, null, null, 11564);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('82E521C9C93A401C97CADDA188E470CB', null, '姚和生', 'yhs', '2828', null, null, null, null, null, 11583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6E2E4C3F74B04181A0D716AA2E717870', null, '陈嵘', 'chenr', '2828', null, null, null, null, null, 11603);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4BA2FEBA8C8E4C1A8B6BADEB9D2D37C4', null, '孙光权', 'sungq', '7188', null, null, null, null, null, 11664);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F89A5AF057274BEEAED767E5E8767111', null, '钱敏', 'qianm', '7188', null, null, null, null, null, 11682);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25E7C702ACA84EF9AB3D7992A4A04E85', null, '曹惠德', 'chd', '2828', null, null, null, null, null, 11763);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F09ADC778F6F4650BB956F4919D6753A', null, '黄家祺', 'hjq', '3019', null, null, null, null, null, 11764);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6D8CD84ECC0D4E0C80FE969D2716C987', null, '陆思理', 'lusl', '7188', null, null, null, null, null, 11822);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1DAB7B58BF2747B9AEF316EC7ABD4337', null, '唐建锋', 'tjf', '2828', null, null, null, null, null, 11903);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D70F34089C6840AA93083C918CC6260F', null, '张东银', 'zdy', '2828', null, null, null, null, null, 11922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6C63D29D3FDC43E193B94E03FAD50F1F', null, '方震', 'fangz', '19900829fz', null, null, null, null, null, 11924);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EF3F476FD99548FA8B71DE8CF214CEE8', null, '项目经理部相关人员', 'B1', '7188', null, null, null, null, null, 11964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F752B5313C26455BBCD8927E6DE8D2AC', null, '项目经理部经理', 'C', '7188', null, null, null, null, null, 11965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CC5546808AED44B9847CC5A0B7085EB9', null, '工管部施工组织设计管理员', 'D', '7188', null, null, null, null, null, 11966);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('40B6CAD9C17140BDB656E8DB1988E71B', null, '工管部相关科室', 'E', '7188', null, null, null, null, null, 11967);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('399824F343B143019EA6177E9AD964A2', null, '公司施工组织设计管理员', 'G', '7188', null, null, null, null, null, 11969);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F6A557F2F10B49759BB9514FD359FE02', null, '公司施工策划大纲编制人', 'H', '7188', null, null, null, null, null, 11970);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2C60F4D848AA4AF8978596833F9E6A02', null, '公司相关科室1', 'H1', '7188', null, null, null, null, null, 11971);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('689C564A9FF54AAD8BC108D304F20665', null, '总工程师', 'I', '7188', null, null, null, null, null, 11973);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EEBB74EE24014B36AFE44F70C19B92AB', null, '项目经理部相关人', 'B2', '7188', null, null, null, null, null, 11974);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('48CFB72429DC413BAE46AA46CAFF7435', null, '傅培卿', 'fpq', '2828', null, null, null, null, null, 11982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9CCFDED294AD482ABCE0A509DD2E0585', null, '张巍', 'zhangw', '7188', null, null, null, null, null, 12042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B221A5D006F34633A97770E621884387', null, '徐国海', 'xugh', '7188', null, null, null, null, null, 12103);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9F210F537044F5F87A50BBBF2C6C64B', null, '顾志林 ', 'guzl', '1212', null, null, null, null, null, 12143);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9747CD6723EC4CAF87FAB42BD8E85FBA', null, '周继东', 'zhoujd', '7188', null, null, null, null, null, 7089);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9BDB4859B89C42E996C440FACCE74E43', null, '陆水良', 'lsl', '7188', null, null, null, null, null, 7104);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('37B889D9A5434D139168EB17E0C874CA', null, '黄忠敏', 'hzm', '600082', null, null, null, null, null, 7108);
commit;
prompt 1700 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A4795362E74D4DF9AF1D3F266F9FD4DF', null, '王国有', 'wgy', '7188', null, null, null, null, null, 7113);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F50774D962C3470385E38A00B8E13E12', null, '劳志君', 'lzj', '1122', null, null, null, null, null, 7118);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58CBCF90EC7E48E1B0E1464DCE9312C2', null, '周冠夫', 'zgf', '4010', null, null, null, null, null, 7262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EC3EE09A60D74D4C8D1D38D23D85FDBB', null, '杜国生', 'dgs', '5188', null, null, null, null, null, 7266);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33E19DF3FBE2486998E7E22BF38BD168', null, '张宝珍', 'zbz', '700703', null, null, null, null, null, 7270);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8F61AD97212E494594B152AAC7AB2BBF', null, '周柏荣', 'zbr', '7188', null, null, null, null, null, 7274);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1405764640BD4382B76BC3C1CE24BF29', null, '李筛成', 'lsc', '7188', null, null, null, null, null, 7278);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EEC7315C663C497BBA22B753108D0D96', null, '杜冠卿', 'DGQ', '7188', null, null, null, null, null, 7282);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E17FC4F8C12D4184BCF6D2B89D3E8752', null, '赵珏', 'zj', '2828', null, null, null, null, null, 7286);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F9918D3885CD4C19B06DD2F03B4A21FD', null, '桑伟', 'sw', '303361', null, null, null, null, null, 7348);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0222CE672B134C21BC8302E0273995F2', null, '陈和根', 'chg', '6605', null, null, null, null, null, 7352);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6A25146A081C4796BD4F815799E793D8', null, '田皓', 'th', 'lkjh', null, null, null, null, null, 7361);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('15DE7549D1054180B600DA67C913F58E', null, '周植新', 'zzx', '7188', null, null, null, null, null, 7366);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8FE53F6383E84F7CB401F50D6CFC9AFF', null, '杜伯雄', 'dbx', '7188', null, null, null, null, null, 7370);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6402ABD43F4047B9B5989A8F8B9FD37C', null, '陈君滨', 'cjb', '0815', null, null, null, null, null, 7374);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9ECAA5623414EB09A83D777CA37E3EA', null, '徐薇薇', 'xww', '1379', null, null, null, null, null, 7379);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('396FA3BBA71C4D87A6B727D0DC91EA77', null, '吴心怡', 'wxy', '743457', null, null, null, null, null, 7383);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0B06BF7966B049B9B25B436C1674CBC7', null, '童颖', 'tongy', '1234', null, null, null, null, null, 7387);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('95A980D924E34819B84DC62EF80B3511', null, '莫一峰', 'myf', '7188', null, null, null, null, null, 7392);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E036BAC66B1145169ADB18382FE861FD', null, '蒋继凤', 'jjf', '601231', null, null, null, null, null, 7397);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A56B6E5929CB4D65BA41339397740B49', null, '吴树人', 'wsr', '7188', null, null, null, null, null, 7402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F026758BD2084DA1B0645D7161DF18F6', null, '戴玉喜', 'dyx', '5988', null, null, null, null, null, 7406);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C36404AFA9364A06BD0CEA23AAC61A3F', null, '朱桂珍', 'zgz', '2588', null, null, null, null, null, 7410);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5A3F4BB21B347C1AE8F48A8CA311D11', null, '朱政', 'zz', '1234', null, null, null, null, null, 7445);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B1FD912B3D644FA8A99431F3BC080294', null, '陈心宇', 'cxy', '7188', null, null, null, null, null, 7509);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D94945EFE1740FCB709F9338126B279', null, '顾辉妹', 'ghm', '600558', null, null, null, null, null, 7585);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D19EF7A75104403DAC4714E9AF1FF9B4', null, '何军妹', 'hejm', '62527188', null, null, null, null, null, 7794);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A6F750B07CF04DABA9BB605BF6B10B1A', null, '阎有明', 'yanym', '7188', null, null, null, null, null, 7799);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C7D6EABEC7F4485A971ED9DA5B81A341', null, '樊福根', 'ffg', '7188', null, null, null, null, null, 7809);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5774A852F7F742E59791E9D6C74DEE7D', null, '夏建峰', 'xjf', '7128', null, null, null, null, null, 7829);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A3FEA1C237D540498115EDE714EBA743', null, '陆银荣', 'lyr', '7188', null, null, null, null, null, 7834);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FE5B2607574F4621A16FC888364B1787', null, '张国强', 'zhanggq', '7188', null, null, null, null, null, 7839);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A5E15FABFF184C3E936941BE6F683B59', null, '邬汇群', 'whq', '7188', null, null, null, null, null, 7844);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D7E18AECA414B3E8E23AF94748B2428', null, '王春霞', 'wangcx', '7188', null, null, null, null, null, 7907);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1244DBB3F08F44FB865260899E6AAC61', null, '杨文华', 'yangwenhua', '7188', null, null, null, null, null, 7912);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D46773A8D6145F6B7D47319DF588A19', null, '吴人伟', 'wurw', '7188', null, null, null, null, null, 7918);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('075150DD21EB480E8371BAFE86D0A000', null, '王金宏', 'wangjh', '7188', null, null, null, null, null, 7923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AA42565427714A6C8A47019D5A34EA91', null, '龚建荣', 'gjr', '7188', null, null, null, null, null, 7928);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('89678F00C02649DE8D4479CAA99B4453', null, '周银宝', 'zhougb', '7188', null, null, null, null, null, 7933);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4AB0452FD6914AD5B8BCD0AB2361D0E4', null, '潘哲', 'panz', '7188', null, null, null, null, null, 7943);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4350E6084CE74AFCA0106251689E265A', null, '吴春艳', 'wcy', '7572', null, null, null, null, null, 8037);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('59819BA38E9D432EBAC3EA2DA3FF4EEB', null, '赵伟中', 'zwz', '7188', null, null, null, null, null, 8041);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('799D757B73EE4333B520FC1C4733F3EE', null, '戴荣鑫', 'drx', '881808', null, null, null, null, null, 8045);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A926CBC48B248D9A2D7A179BF67A2FB', null, '王玮', 'ww', 'wt5972', null, null, null, null, null, 8050);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8AE9FFACD6A47A8A800AED8D04071EC', null, '刘光辛', 'lgx', '620906', null, null, null, null, null, 9282);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AEA5078E2D32425FA9127844F0CD0257', null, '毕大同', 'bdt', '2828', null, null, null, null, null, 9322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('89787A253C714B8D84AEF3486C34E375', null, '邵君雅', 'shjy', '0812', null, null, null, null, null, 9362);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D29F8C63E35644F0A30D3A51565D4DD5', null, '虞汉明', 'yuhm', '1979619', null, null, null, null, null, 9363);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FB845AE9D24445BAB7115154991D4928', null, '沈杰', 'sj', '704', null, null, null, null, null, 9364);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('494A1CADCA5C4F7EAC142B8DDDEEED05', null, '沈斌', 'shenb', '704', null, null, null, null, null, 9367);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('69ABAA71F72D40CCAEB16D4049BDF2E6', null, '高磊', 'gaol', 'gao704', null, null, null, null, null, 9368);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4FF6C43949FF48D397EA57FDC0B4298A', null, '石新军', 'sxj', '7188', null, null, null, null, null, 9382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D218617635C74C2BA899D61D51FD7C8B', null, '计忠明', 'jzm', '64870484', null, null, null, null, null, 9402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCDD15E68CE94187B04E018638BCC32F', null, '梁军', 'lj', '2828', null, null, null, null, null, 9442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6092B657790E4FA29A8A9E1F8C3A0F81', null, '王晓晨', 'wxc', '6487', null, null, null, null, null, 9464);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDF49A80BE7146DAA96F0EFB0CA0ED6F', null, '朱毅', 'zhuyi', '2828', null, null, null, null, null, 9483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1927E51F24CA4E6FA7207266CF72574C', null, '陈美忠', 'chenmz', '2828', null, null, null, null, null, 9484);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7404E8AEC7494300803EA5127209E217', null, '王祥云', 'wangxy', '7188', null, null, null, null, null, 9503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4B2DF5D53ED1420E8A9A99B6481036A1', null, '汪文斌', 'wangwb', '2828', null, null, null, null, null, 9504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2F3BE171847F4864985ED5867DE914B1', null, '周炎', 'zhy', '2828', null, null, null, null, null, 9507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A03BE74D4E84455184921F0E7D38D533', null, '王智利', 'wangzhili', '2828', null, null, null, null, null, 9523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C30D1E0E0E8480F8C582DDEC8B1D794', null, '吴俊萍', 'wujp', '2828', null, null, null, null, null, 9524);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('393E9FC033CD4E3DB17AC4E122A46165', null, '方玲珍', 'fanglz', '2828', null, null, null, null, null, 9526);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('49104038D4B3494A8A4430C5859D13B4', null, '吴丽梅', 'wulm', '2828', null, null, null, null, null, 9528);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('15119C327FB2422B9E5F64095322E8FB', null, '刘叶', 'liuye', '099200', null, null, null, null, null, 9531);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CEAC531B2B404EEEAC62D243B1F5A8C4', null, '叶歧', 'yeqi', '2828', null, null, null, null, null, 9535);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5881294430FD4137998652076151FD1F', null, '吴赟', 'wuyun', 'cheryl', null, null, null, null, null, 9542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8E752CCABA949679F7B404E9774DB12', null, '钱根妹', 'qgm', '2828', null, null, null, null, null, 9566);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8720D9DA262A4CE294B0A8E857028131', null, '赵建康', 'zjk', '2828', null, 'SUPER', null, null, null, 9583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AF5BB470DEA74FC2A2576BE4A22613D2', null, '向蓓莉', 'xbl', '2828', null, null, null, null, null, 9584);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ED7DFE0A6FB545C29F6DE6CF7E1A8CF0', null, '蒋明云', 'jmy', '2828', null, null, null, null, null, 9585);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('469520C66F12434EAA00F296955FB976', null, '刑澄', 'xingcheng', '2828', null, null, null, null, null, 9588);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('111AAC33A67D4E7BA3A590EA32C8E298', null, '王志敏', 'wzm', '2828', null, null, null, null, null, 9589);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1E164D3827DB4207A05CFBACF7DDB6B4', null, '胡继东', 'hjd', '2828', null, null, null, null, null, 9590);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50D2AA065300451584B3E9BA4FD5E41A', null, '杨重阳', 'ycy', '8177', null, null, null, null, null, 9604);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('62BF4E22A2944005B0E153EC8F978787', null, '李建民', 'ljm', '1565', null, null, null, null, null, 9624);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('35A3D8B909AA409292FA7E9C687435DE', null, '武佩勤 ', 'wpq', '8222', null, null, null, null, null, 9663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A9AF5BE98EEE4D8197FD471B8F697F01', null, '杨玉成', 'yangyc', '620y.', null, null, null, null, null, 9664);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FBAF5EA5137F4B2BB95A4C7D323380CD', null, '徐海忠', 'xhz', '8888', null, null, null, null, null, 9687);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C649A6D7A0C24BECADE1F806AB9B6870', null, '赵夏', 'zhx', 'zhaoaix', null, null, null, null, null, 9688);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BBBD24A6BBC24494BFB39CE86C00EF8D', null, '盛晓东', 'chengxd', '2828', null, null, null, null, null, 9689);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('183BCEC3BEA34C5684BC626383093BED', null, '孙洪刚', 'sunhg', '2828', null, null, null, null, null, 9691);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E13740E8112846388DB83B6F55C5EDAA', null, '吴国纪', 'wugj', '2828', null, null, null, null, null, 9692);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('75471054DA9747C2B431D24CBFC837D8', null, '赵夏', 'zhaox', '1100', null, null, null, null, null, 9693);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6741243E3E24333BF3D2A639E27EC67', null, '蔡娥', 'ce', '7188', null, null, null, null, null, 9743);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B487FC84B1FB4D48A4E7451D7934BDFE', null, '于健', 'yujian', '1948', null, null, null, null, null, 9762);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB1344A6E24E4ED9A32FA4894F263A13', null, '钱海龙', 'qianhl', '2828', null, null, null, null, null, 9782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('559C9D7AF3B54941956699A55CA157D8', null, '倪峰雄', 'nfx', '710702', null, null, null, null, null, 9822);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('388D16866F1C49799F5384DDF28C823B', null, '全云', 'quanyun', '2828', null, null, null, null, null, 9844);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CA3F531DF80649EEAC1A2811B010FBAF', null, '龚鹰', 'gongying', '36636', null, null, null, null, null, 9845);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C2B7BED5871437AA92E0F30D4E60F0C', null, '陆春蓝', 'luchunlan', '2828', null, null, null, null, null, 9847);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('42A30641750D461BBDBB972D128C0D8C', null, '朱国强', 'zhuguoqiang', '2828', null, null, null, null, null, 9848);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('579C8AA3FC8E4A2DBE35BD27F3790CA7', null, '翁飞峰', 'wengfeifeng', '2828', null, null, null, null, null, 9851);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('55DDE0D76042481FA623C5FBD684054E', null, '官鸿炳', 'guanhongbing', '2828', null, null, null, null, null, 9852);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D81A721FF6FE4A2DAFD619DFEF9D48F7', null, '陆继请', 'lujiqing', '973655', null, null, null, null, null, 9853);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('51A6C9FFE82D4166AE5BB8CB54FA9FEF', null, '张秋根', 'zhangqiugen', '2828', null, null, null, null, null, 9855);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('567EB81BD9D24CF5B23A50AF75C81BA5', null, '周友明', 'zym', '8888', null, null, null, null, null, 9856);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('38BA18A29504465793209F0BAFD5CFBB', null, '何卓然', 'hezhuoran', '2828', null, null, null, null, null, 9857);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA9F33E4235B4CDD9F18C25846A1A6C2', null, '胡志强', 'huzhiqiang', '2828', null, null, null, null, null, 9859);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0801D0B8228413CB3C422BB53B8BF6D', null, '李永明', 'liyongming', '2828', null, null, null, null, null, 9860);
commit;
prompt 1800 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B0B7D358C1A2436BBB2E44B7E0E7CFAB', null, '孙君荣', 'sunjunrong', '2828', null, null, null, null, null, 9861);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('23209BC795ED4C6FB0427DB52C8E7E72', null, '郭卫国', 'guoweiguo', '2828', null, null, null, null, null, 9862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C062C97EBDC94C16A3E450A4C62506FF', null, '曹彬', 'caobin', '97324014', null, null, null, null, null, 9864);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0A4186B06EB4EC19C45DEC462125A66', null, '张淼', 'zhangmiao', '919191', null, null, null, null, null, 9865);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9D31B41274FA47DC99B39A74DAEFCE61', null, '顾唯珏', 'guweijue', '2828', null, null, null, null, null, 9866);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7FA74234DBB4F22B866B91AC839CD91', null, '董利春', 'dlc', '310112', null, null, null, null, null, 9904);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8D4B0323BBD44C1A9B08F04D88943818', null, '应国华', 'ygh', '7188', null, null, null, null, null, 9905);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4DC300C172C04FE1946A0ABFD992AE50', null, '叶晖', 'yehui', '200085', null, null, null, null, null, 9943);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A4F2EECF5BB04F14BB6867C1C0BCB87A', null, '王薇', 'wangw', '7188', null, null, null, null, null, 9963);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A1ED74FF8BFC4A3DB967CA0C7CD69D29', null, '陆昌水', 'lcs', '2828', null, null, null, null, null, 9982);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('735A65B2F4B34388A3E0C9D71E0738F6', null, '董保龙', 'dbl', '2828', null, null, null, null, null, 10023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58DA75C107AD475C932D6978AFE61FA2', null, '沈石兵', 'ssb', '2828', null, null, null, null, null, 10024);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8853558D5D024C4AA640FAF2ACC1ABEF', null, '朱志刚', 'zhuzhg', '2828', null, null, null, null, null, 10026);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1DBF411660D546868F972CA07EE56460', null, '潘溢波', 'pyb', '2828', null, null, null, null, null, 10027);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D7AD08AF50754EDA855BA26A0B21DCB8', null, '赵明德', 'zhmd', '2828', null, null, null, null, null, 10028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8D6F4B3BC27D4BD0A1603FEEF888862B', null, '徐林昌', 'xulch', '2828', null, null, null, null, null, 10042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8C9DF988022042E98C15065305F62E6B', null, '瞿德明', 'qudemin', '2828', null, null, null, null, null, 10043);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9480CD2390D54827A20C93D374311F66', null, '许民杰', 'xuminjie', '2828', null, null, null, null, null, 10044);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DFFF236D2F894311A85B7B2B37B84BE2', null, '吴卫忠', 'wuweizhong', '2828', null, null, null, null, null, 10045);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E86560D493434213BE2DBF2AA7D5986B', null, '66', '988', '7188', null, null, null, null, null, 10062);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B6668307804F4086AAFD88F726613BA9', null, '梁玉麟', 'liangyl', '2828', null, null, null, null, null, 10082);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B06B891A5DD84A30A91897790345388B', null, '王健春', 'wangjc', '7188', null, null, null, null, null, 10083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A6BECCB393A343408F859C37B1DE915A', null, '金钟煌', 'jzh', '7188', null, null, null, null, null, 10084);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77FF0035F8CE44319B8CCABC908ABC3F', null, '11', '11anzhhuang', '2828', null, null, null, null, null, 10085);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('89A770D0F0B946989CF853DBCF7E9A3E', null, '张鋆峰', 'zhangjf', '2828', null, null, null, null, null, 10086);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0E71DF2565D46268FFFEC3DB11BC0EE', null, '吴  勇', 'wuyong', '2828', null, null, null, null, null, 10087);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6DEEF9C72E684889A09B2D3BB5AE3FDB', null, '蔡韵', 'caiyun', '141213', null, null, null, null, null, 10089);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4B9C089D696042058BA0DA94C280603F', null, '金伟华', 'jinwh', '830528', null, null, null, null, null, 10090);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F14E4CB0A3884059BD4E5BE4E08EC5F9', null, '杨文东', 'yangwd', '2828', null, null, null, null, null, 10091);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EE95DB2663AD44AC98E9F7EEF7BF1332', null, '徐勇彪', 'xuyb', '2828', null, null, null, null, null, 10093);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AA52DE7340A445FAE8A20A1B6F87895', null, '严伟江', 'yanwj', '2828', null, null, null, null, null, 10095);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CBFD7B9F4DED4434BBB63B78E9D40F47', null, '董', 'dongl', '2828', null, null, null, null, null, 10096);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20F640FBA429476F9C55D07B78FF936F', null, '222', '33', '2828', null, null, null, null, null, 10097);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5F75D9C362A4757B415A9053C16965F', null, '张永斌', 'zhangyb', '2828', null, null, null, null, null, 10098);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3DD390DAFD0644718CCC5DF5FF6A74D8', null, '周同庆', 'zhoutq', '1350', null, null, null, null, null, 10102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ACD2648AB9124ADEA20EE89CCCE10562', null, '顾春元', 'gucy', '7188', null, null, null, null, null, 10162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0C65D029D08D47B7B8985EF0653A7FF2', null, '蔡峰', 'caif', '7188', null, null, null, null, null, 10243);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B3D814DEB0ED410B8CD0001E62276EB0', null, '耿洪生', 'ghs', '7188', null, null, null, null, null, 10244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EF79FC84D8314EA597ABF789E5DC3984', null, '焦长发', 'jiaocf', '2828', null, null, null, null, null, 10245);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1D2D0B9268E049DDA732DE0E2F51F181', null, '杨云霞', 'yyx', '8888', null, null, null, null, null, 8055);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C6C7D1C31C7E423B9ACA072DA034A71A', null, '刘庆', 'lq', '6967', null, null, null, null, null, 8059);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3250F360C292445E9A9C895286FCF326', null, '刘玉超', 'lyc', '9359', null, null, null, null, null, 8065);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('943BD75F676B45EF8E48EEAF7512667B', null, '李葳', 'lw', '7788', null, null, null, null, null, 8069);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('57F4EC21B7414B1DB2863BEC5C0F5E86', null, '朱云发', 'zyf', '510930', null, null, null, null, null, 8073);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('25BE31D9A628452D9242343DE40B5299', null, '沈军星', 'sjx', '7112', null, null, null, null, null, 8091);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9CC191209565478A867151406577EE80', null, '裘荣华', 'qrh', '555559', null, null, null, null, null, 8095);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2E440B378D19435AB1CCC7B4F50433A4', null, '陈益弟', 'cyd', '8596', null, null, null, null, null, 8100);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83606E4DA0BA459C99EA10660F734C5F', null, '郭家彬', 'guojb', '5224', null, null, null, null, null, 10542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FD3EB426D86B412BB5946FC03E06AC47', null, '潘四忠', 'pansz', '7188', null, null, null, null, null, 10566);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCC60B224BBC4EEBB59F40384EE312DE', null, '周增', 'zhouz', '7188', null, null, null, null, null, 10586);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('913E9DC387BE44DBA82CA939701DFC85', null, '钱莉', 'qianl', '7188', null, null, null, null, null, 10706);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B74B301EB0B94DD784A4E081AB400BA7', null, '张仁平', 'zhangrp', '2828', null, null, null, null, null, 10726);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DC362325257047DE97601424AA641CF1', null, '马国馨', 'magx', '2828', null, null, null, null, null, 10731);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB63343742AB4167844584E2893DC329', null, '耿正荣', 'genzr', '2828', null, null, null, null, null, 10942);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('241111C4921D46089B8EFC4A198B5D1A', null, '张建国', 'zhangjg', '2828', null, null, null, null, null, 10947);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('457B5DA318474642BFC458A112E4F8CE', null, '姚双兵', 'yaosb', '2828', null, null, null, null, null, 10956);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E9D921420C55403E99FCF42AFF028BE2', null, '陈宏简', 'chhj', '2828', null, null, null, null, null, 11266);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('372787EC4C30403EA2F4E307654E8FE5', null, '陈学忠', 'chxz', '2828', null, null, null, null, null, 11271);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BFE8BA92FBCF40369B5345438B4A84E8', null, '戴春雄', 'dcx', '2828', null, null, null, null, null, 11302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2CD8B8F386D7463093DA89FB269ACF66', null, '黄圣娟', 'hsj', '2828', null, null, null, null, null, 11324);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CB89385C2D544623B7535248312C51F0', null, '周炜明', 'zhouwm ', '6470', null, null, null, null, null, 11443);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BD54FB61DCAD465A8DFB1DCA7D0C7275', null, '向子源', 'xiangzy', '7188', null, null, null, null, null, 11465);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BA7648CFF5CE491BB73F7B08C517FD96', null, '杨贤', 'yx', '2828', null, null, null, null, null, 11523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('756DE5797F1343D7AB58AD9BE1E33C7B', null, '陆凤林', 'lufl', '7188', null, null, null, null, null, 11563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DCBE8D22EB86400984D0593EC82F473F', null, '吕银宝', 'lyb', '1559', null, null, null, null, null, 11643);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('457EF68B94864D7AA501C094D871A88D', null, '施工组织设计大纲管理员', 'A', '7188', null, null, null, null, null, 11962);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F15FC0A369A84F48A8186B18F8ED497D', null, '主任工程师', 'F', '7188', null, null, null, null, null, 11968);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0E3AAB00BECC4FCCA5D001D1B57CB569', null, '公司有关科室', 'H2', '7188', null, null, null, null, null, 11972);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E0E67B9DB34A4CA3B5892216048793FC', null, '管理', 'gl', 'guanli', null, null, null, null, null, 12022);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('19DB4C14811E4756981655A46CF5AF45', null, '郑富高', 'zfg', '2828', null, null, null, null, null, 12203);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0262B8E8375B4F7CA39389959B0ED30F', null, '徐晓骏', 'xxj', '98104982', null, null, null, null, null, 12204);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9FB0F42E41274F80A7B81460D3B2949A', null, '龚巍巍', 'gww', '2828', null, null, null, null, null, 12205);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D1DA7E45EC84989A107A50F506F3C01', null, '赵如青', 'zrq', '2828', null, null, null, null, null, 12206);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0C88ECE10CF944F98DB60166CF57623C', null, '胡建舫', 'hjf', '2828', null, null, null, null, null, 12207);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2BBAE033BE2240B0AC2EA3EB49984EE5', null, '龚德军', 'gongdj', '2828', null, null, null, null, null, 12208);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EE4312D1B7D44A33982C4B749A01ED78', null, '徐亚忠', 'xyz', '2828', null, null, null, null, null, 12209);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('88AF663B44C14CF5A295694DE6D4C1C0', null, '周耀东', 'zhouyd', '2828', null, null, null, null, null, 12211);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BBBA3E7561BE4AADAAF6C93D2C69D70A', null, '王永克', 'wyk', '2828', null, null, null, null, null, 12214);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2EFAB51A2C244402869B01FBA617FD2E', null, '夏育华', 'xyh', '2828', null, null, null, null, null, 12215);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5ADEF8601094DD6B1EC152F01D6679F', null, '施建昌', 'shijc', '2828', null, null, null, null, null, 12218);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C72D17C766F84D1EBD4B697CF1DAA7DA', null, '刘智勇', 'liuzy', '708556', null, null, null, null, null, 12222);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('15BDAFBB1EA640D1980A3C907EF11719', null, '蒋惠忠', 'jianghz', '7188', null, null, null, null, null, 12262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9C4616A706F74F0996991984839684AD', null, '孔明月', 'kongmy', '000', null, null, null, null, null, 12282);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ACDBB46CA6414E9183861A499E8FD062', null, '袁森山', 'yss', '2828', null, null, null, null, null, 12365);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7C8BC08152344B7BBF9E58431C1B65BB', null, '袁秀琴', 'xiuq', '7188', null, null, null, null, null, 12402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A8535D9EC1243E7A8FFB20A7AF79702', null, '朱小华', 'zhuxh', '7188', null, null, null, null, null, 12403);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AF20C825E8874FBA8E3FAEEFEC392388', null, '李薇', 'liwei', '7188', null, null, null, null, null, 12422);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1387DBED3747443F800F01DA774D08DA', null, '孙兴凌', 'sunxl', '2828', null, null, null, null, null, 12542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BB3A6C7960114E00B16844A9F84316DB', null, '杨向东', 'yxd', '1452', null, null, null, null, null, 12562);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D3A73DAE92F34C06B558F36C237C9F57', null, '王倩', 'wangqian', '2828', null, null, null, null, null, 12602);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8076F524D7B74202B894AD34BC0AAF57', null, '技术科', '704jsk', '7188', null, null, null, null, null, 12622);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FF8F082E85344406B48B75B5FF4E68A7', null, '费召余', 'fzy', '369', null, null, null, null, null, 12702);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('986D0BFE384E41EE824208EE0A3E7498', null, '朱振东', 'zzd', '2208', null, null, null, null, null, 12723);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3E86EFB38DF0404681883A87AB871FAA', null, '张裕', 'zhangyu', '7188', null, null, null, null, null, 12744);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('50F7419B1033464BB15ADC85740E5A85', null, '周宗安', 'zza', '7188', null, null, null, null, null, 12762);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D42A0B1AA4449FBBDA9B6868BA3838E', null, '成长华', 'cch', '2828', null, null, null, null, null, 12822);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5AFBA053E4314001AAC9519F577A1B65', null, '金翔鹰', 'jxy', '769300', null, null, null, null, null, 12842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C2A259BD7F1D4168A4DFA9F1A42EF908', null, '贲伦晓', 'blx', '7188', null, null, null, null, null, 12843);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1CB59ECA491E4BD0BDEC084E132104F2', null, '李青', 'liq', '7188', null, null, null, null, null, 12844);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AB5210C08E104CC59BF3379162058D8F', null, '李道琴', 'ldq', '7188', null, null, null, null, null, 12845);
commit;
prompt 1900 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02065CA5FF2B4C448E6B350F89EE4425', null, '郭海', 'gh', '1818', null, null, null, null, null, 12862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A5A66456BE54D8195AA166C6F8BBF4E', null, '章国轩', 'zgx', '7188', null, null, null, null, null, 12863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B2D425C50410406A832BC35D1616563D', null, '潘洪达', 'phd', '7188', null, null, null, null, null, 12864);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CED432BD405B4F35BAF8F85296F73C28', null, '金华', 'jinh', '7188', null, null, null, null, null, 12865);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7054B8993CC347F2AACA463E825790ED', null, '顾来明', 'glm', '7188', null, null, null, null, null, 12866);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D4DB048A5C5416592128E31C42110D8', null, '乔连祥', 'qlx', '7188', null, null, null, null, null, 12867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FDF105150F904504AB2AB47A67B62832', null, '秦正军', 'qzj', '7188', null, null, null, null, null, 12868);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('97FAC4C90D434CF1BF349A208CFF51DE', null, '崔恒德', 'cuihd', '7188', null, null, null, null, null, 12870);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3163C814ADB94F5F907C36F4E39D68A1', null, '翁士文', 'wsw', '7188', null, null, null, null, null, 12871);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7BEB1C17FBC6432691ECD404B93C9C9A', null, '陈林', 'cl', '7188', null, null, null, null, null, 12872);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('06D86B63E94A4BCB8CE1D5E4D198CAFE', null, '徐林华', 'xlh', '7188', null, null, null, null, null, 12874);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0E10300B2F9548F1838CCEA8B41ACD3D', null, '俞建伟', 'yjw', '7188', null, null, null, null, null, 12875);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C9F8AEFDF311426590FE0450B828860F', null, '杨卫忠', 'ywz', '2828', null, null, null, null, null, 12923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C1813F178CAC4360B632F3F0F4D0C308', null, '庾国良', 'yugl', '7188', null, null, null, null, null, 12962);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('736EF749E2C249CC888F4ECAB5740B8A', null, '任凤霞', 'rfx', '2828', null, null, null, null, null, 12983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DD0D0092F3604F32A57C199A10EBCEF4', null, '王全根', 'wangqg', '7188', null, null, null, null, null, 13102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7D9E22F18BE54C9FB84A98BADB1996A5', null, '陆俊俊', 'lujj', '83991014', null, null, null, null, null, 13142);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39700A386FC344F38E6E0C52CDD32EAD', null, '4', '4', '2828', null, null, null, null, null, 13202);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('38176922A50842ED94E1C45DD9ECA8DF', null, '唐亚男', 'tangyn', '2828', null, null, null, null, null, 13242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FFE40109FBD54610B3CE7DEDFF902777', null, '蔡耀华', 'caiyh', '2828', null, null, null, null, null, 13302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('962F06F6D790437183C6334E70C87297', null, '徐明', 'xm', '2828', null, null, null, null, null, 13343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D9440AAA8EF14174B8E8C3EC356F385B', null, '何加明', 'hejiam', '1954', null, null, null, null, null, 13383);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9726FB457581418F84C65BC5EE5F1ADA', null, '成文俊', 'cwj', '2828', null, null, null, null, null, 13483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A874DF70AA8845C686154C233120C9EF', null, '沈益峰', 'syf', '2828', null, null, null, null, null, 13502);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4580C3756E094AD58AF637EF28E9596B', null, '盛建春', 'shjc', '2828', null, null, null, null, null, 13503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C76E03155E7846E7BB4ADD80D374C2DB', null, '刘敏', 'lium', '050801', null, null, null, null, null, 13682);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D86D647511F746568EB3F204A6BBF068', null, '周叶', 'zhouye', '821013', null, null, null, null, null, 13684);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D6F6C442050E4FB38161AD613CC271A8', null, '施柳燕', 'sly', '2828', null, null, null, null, null, 13685);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EE5993C28B234C9FBE7B904077DE63F2', null, '李功超', 'lgc', '2828', null, null, null, null, null, 13686);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8781C751F6784DDEAEA1F10481EB674E', null, '陆鸳', 'luyuan', '6999', null, null, null, null, null, 13688);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A603AEB8ACD14AD4B0113703046B21E7', null, '叶飞翔', 'yefx', '7188', null, null, null, null, null, 13742);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B117A18264014A958B4D33CD13FE78F6', null, '王娟', 'wangjuan', '7188', null, null, null, null, null, 13782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('975B7E8D069C4F31A7D0C9016F7EF331', null, '闻燕峰', 'wenyf', '196681', null, null, null, null, null, 13862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCC37AB25B7B4EB98E91F64FE6933071', null, '张乾坤', 'zqk', '7188', null, null, null, null, null, 13962);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FFA83CA2990A43F4B6534D25807A9D25', null, '沈希龙', 'shenxl', '7188', null, null, null, null, null, 14142);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6849C48150CF4F00A00D9DFA59CB2C44', null, 'shengc', '盛辰', '7188', null, null, null, null, null, 14143);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C4EA31AF8A254F938761FD54AD321F6E', null, '段应杰', 'duanyj', '7188', null, null, null, null, null, 14502);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9338CE2E772F4E848AACC1B583C62BA0', null, '徐海', 'xuehai', '7188', null, null, null, null, null, 14503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D78E7212A844455294C491FD02A79702', null, '冷聪', 'lenzx', '7188', null, null, null, null, null, 14504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D13D01B03E3D469F909CF4AFA69C2194', null, '马辉', 'mahui', '5435', null, null, null, null, null, 14507);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B245D187D68E4640BAE2EA969963502F', null, '吴建中', 'wujz', '7188', null, null, null, null, null, 14508);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('996048BE6CE84025B3FB92E8BE13D1CD', null, '陆金荣', 'lujr', '7188', null, null, null, null, null, 14509);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8101B985EA7C401A9290232338E62FA8', null, '方定勇', 'fangdy', '7188', null, null, null, null, null, 14510);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('712CE77B521646C1946979F8DED501A1', null, '陈学弟', 'chxd', '7188', null, null, null, null, null, 14584);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA8436914DED4045A4EE9D82713E9E9F', null, '许静', 'xj', '7188', null, null, null, null, null, 14585);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CD65A61A88A84F879B52D9AB8C82A1EF', null, '测试xin', 'liu', 'shqj8828', null, null, null, null, null, 14624);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09A929C91FF8470EAB1B2787C415DBFB', null, '测试88', 'liu2', '7188', null, null, null, null, null, 14625);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0146E952DDEF4A6D9B0842151927287D', null, '测试', 'liu3', '7188', null, null, null, null, null, 14626);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('84A9D77C96AB49BBA466D3C8A947C548', null, '测试', 'liu4', 'shqj8828', null, null, null, null, null, 14627);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA3CA2EFEB9347FAB499FD4B7DF92C71', null, '测试', 'liu5', 'shqj8828', null, null, null, null, null, 14628);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3918DD87EA0D4D4F9185C3E0F1196559', null, '测试', 'liu8', 'shqj8828', null, null, null, null, null, 14629);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('92D8D08C18A04B52AE750C74FDBCBAC0', null, '测试', 'liu6', 'shqj8828', null, null, null, null, null, 14642);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B8D2138A6C6644F89B011EFDE337794F', null, '徐军', 'xuj_3', '7188', null, null, null, null, null, 14662);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1365E10E3D0D4CDA819898D3DDF8F1BC', null, '熊志强', 'xzq', '7188', null, null, null, null, null, 14742);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8B0DCB42A7DB4963810CC8B58F8237DF', null, '黄骞', 'huangqian', '7188', null, null, null, null, null, 14744);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('70938B0B28D64BB487C2EDD81EC67B59', null, '费春', 'feic', '7188', null, null, null, null, null, 14746);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E151A67D614442E99776A8FB06C2CDA8', null, '冯斌', 'fengb', '7188', null, null, null, null, null, 14748);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ECE3807D9B7F4AA59A5FD580B4655C20', null, '王家东', 'wjd', '19771226', null, null, null, null, null, 14862);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6C551F545AD04A98BF3E57AF037999A3', null, '史选忠', 'sxz', '7188', null, null, null, null, null, 14922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C85AAD7E79C743799FA09AC042780B4E', null, '潘忠', 'panzh', '7188', null, null, null, null, null, 14924);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF41C0BC0573436EB2F28FB616594AD5', null, '秦德明', 'qdm', '7188', null, null, null, null, null, 14925);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9EC7C2C4891E41A08D157BA1DF816B39', null, '杨金弟', 'yjd', '7188', null, null, null, null, null, 14926);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B635CBDCF886474AA247E8702C4E0BD0', null, '龚学坤 ', 'gongxk', '7188', null, null, null, null, null, 15083);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A5A62A08CEC44E428E59A853DE3908CA', null, '方玉麟', 'fangyl', '369369', null, null, null, null, null, 15104);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D85604F23CB848AAB75E9052395584AA', null, '张明华', 'zhangmh', '7188', null, null, null, null, null, 15162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DB2B7D9751C341A19B302CF7EBBD13E6', null, '顾学伟', 'guxw', '7188', null, null, null, null, null, 15182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5E477C99EE349A4B08E2F5211ADF7C5', null, '宋正华', 'songzh', '7188', null, null, null, null, null, 15242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B13B15BA072C49D8868FDBCCA524143F', null, '杨敏', 'yangm', '7188', null, null, null, null, null, 15243);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('37E9A08466064C9C91ADC7216D8A3EEF', null, '朱佩兰', 'zhupl', '7188', null, null, null, null, null, 15244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6AFCF2EB11434EA1B1B508E3E9C2CB21', null, '尤佳', 'youj', '214289', null, null, null, null, null, 15262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F984EA4B5D1F4B5DBA409653480F0E6C', null, '陈铭', 'chenm', '7188', null, null, null, null, null, 15263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('158974407BAE495183660541AB27EF85', null, '成茗', 'chengm', '7188', null, null, null, null, null, 15322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('24FEE755FCF542F093D7FB82DBF48B9E', null, '顾海联', 'guhl', '7288', null, null, null, null, null, 15342);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A1E7C6051B34DBCBEFBD836A2ACD0A8', null, '林金龙', 'lingjl', '7188', null, null, null, null, null, 15382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('91522E7F60CD4795B1E3DEB10BEB7F55', null, '范建平', 'fanjp', '7188', null, null, null, null, null, 15402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D098A12679F4BFF818B024B58205E85', null, '成忠玉', 'chengzy', '7188', null, null, null, null, null, 15423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('835F134FD6A34ABBBC17C24629DAAC03', null, '金方君', 'jinfj', '7188', null, null, null, null, null, 15442);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07EE569EB656403CA664A6420D093AFC', null, '张艳丽', 'zhangyl', '7188', null, null, null, null, null, 15444);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8EED8299453F40C4A4EBB7CDCAE563C9', null, '褚春风', 'chucf', '7188', null, null, null, null, null, 15462);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8065DF5B827F40EA969F95076767677D', null, '严永昌', 'yanyc', '7188', null, null, null, null, null, 15463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DE9F751A7959496D8254C033C931A93C', null, '刘光幸', 'liugx', '620906', null, null, null, null, null, 15464);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0DB6BEB797CF45018893611614859679', null, '袁惠祥', 'yuanhx', '7188', null, null, null, null, null, 15465);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F15BD3D8D7A84AD2B2DB1084B3195A0D', null, '杨锦昌', 'yangjc', '7188', null, null, null, null, null, 15466);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('239D4F0078E14F0E859CB4DCD138004B', null, '范杜星', 'fandx', '7188', null, null, null, null, null, 15467);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20ED0D907E7E48859DD449CC2B4ADDF8', null, '杨志民 ', 'yangzm', '731002', null, null, null, null, null, 15482);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DFC6C03C7F6E471D8BE8FC9F0838A9EE', null, '陈辉', 'chenhui', '2828', null, null, null, null, null, 15503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('26F8E46688584F4B9076F0F98871BEFD', null, '余玉林', 'yuyl', '1811', null, null, null, null, null, 15542);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7F22A1DA6AC42D8AF8823A3C1D63F4A', null, '潘国强', 'pangq', '7188', null, null, null, null, null, 15562);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('20B64FFCF82241DFA79E0AB392BBF89B', null, '郑福兴 ', 'zhenfx', '7188', null, null, null, null, null, 15563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('64ED81864F024ADCB68AAA6AEE9051EC', null, '成钢', 'chengg', '7188', null, null, null, null, null, 15603);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4BDF2395D6E44B7FB25B1BB585B02721', null, '孙晓明', 'sunxm', '1811', null, null, null, null, null, 15604);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('827310EAFB444074B8E0F463155C1777', null, '江丽琼', 'jianglq', '561156', null, null, null, null, null, 15622);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0096D8963ABD4F50AB3B4E311F41204F', null, '季才桦', 'jicy', '2828', null, null, null, null, null, 15742);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('100F89CB7E164C9D8245AFF9F6D602C4', null, '刘晖', 'liuh', '2828', null, null, null, null, null, 15922);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('799C85AA53CB4130A623CD5847790F7F', null, '许华东', 'xuhd', '7188', null, null, null, null, null, 15962);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7747B74B19D348BDAE4E86E2059DFADB', null, '陈必明', 'chenbm', '7188', null, null, null, null, null, 16002);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('05086EA05E524753A79F0F7C474018AA', null, '李北', 'libei', '7188', null, null, null, null, null, 16042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC27218FEE6C4485A5E2017F7FB48C64', null, '范伟', 'fanw', '7188', null, null, null, null, null, 16103);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C22F619A94D542279FD4556B46A20299', null, '何海强', 'hehq', '7188', null, null, null, null, null, 16104);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F2403136EC2C4C71803B4435771E0EDD', null, '黄圣娟', 'huangsj', '7188', null, null, null, null, null, 16142);
commit;
prompt 2000 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E7E83D51077443D0AB5EACF5C9E0CC27', null, '施建昌', 'shjch', '7188', null, null, null, null, null, 16162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D37C3C5D194A4B36839E7C2E0A050507', null, '周富洪', 'zhoufh', '1313', null, null, null, null, null, 16202);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DEFFE94C8727450E8DFCCA84093E3F63', null, '姜建芳', 'jiangjf', '7188', null, null, null, null, null, 16242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C9F36A7B543242CF8728AB6B29A50974', null, '沈骏', 'shenj', '7188', null, null, null, null, null, 16302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB8325FADD684BA2842507614D6EE2E7', null, '戴利明', 'dailm', '7188', null, null, null, null, null, 16322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('73F02A5D9698448680A8F1A83C53431C', null, '周根寿', 'zhougshou', '7188', null, null, null, null, null, 16325);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F7105822997545D5BE5BECECC82934FB', null, '张俭', 'zhangjian', '7188', null, null, null, null, null, 16402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('39C154185FFA4F489BF32AC3E2D2A950', null, '程建洋', 'chengjy', '7188', null, null, null, null, null, 16422);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9EB115C3EF6B4BB68E559BD3C1C856E8', null, '陈敏明', 'chenmm', '7188', null, null, null, null, null, 16464);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('24C1B45D6E8E4B03B75917A14843D530', null, 'lwt', '陆雯婷', '7188', null, null, null, null, null, 16622);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D4E62258007E4118B5B426735D35BA53', null, '陆雯婷', 'lwt', '7188', null, null, null, null, null, 16623);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('10E1B3C68FC449EAB0D0C66A555791F3', null, '陆薇', 'luwei', '2828', null, null, null, null, null, 16662);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('53D6641DAB624CE1B923BC2B697155D6', null, '康健', 'kangjian', '000000', null, null, null, null, null, 16663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('024907B430974C1AB22F534B45AF16A3', null, '林颖', 'linying', '7188', null, null, null, null, null, 16702);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('67D6662191FE49AD8C2D894C6EA3F122', null, '张海龙', 'zhanghl', '7188', null, null, null, null, null, 16722);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2829726CBB5047DD84547F995C6EDA18', null, '梅英宝', 'meiyb', '750227', null, null, null, null, null, 16782);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4E7738F9A1A246E497A324FF189E083D', null, '潘犇', 'panb', '7188', null, null, null, null, null, 16842);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E5D2BC5F152D448A9E574D618581DD50', null, '冯晓', 'fengx', 'woaitingting', null, null, null, null, null, 16884);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE631C11CE294F0E9BA5B3A815E30A4D', null, '杨伟', 'yangwei', '7188', null, null, null, null, null, 16903);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D3A0C0DE9C554FC49BEFC40245E79DA9', null, '黄国华', 'huanggh', '7188', null, null, null, null, null, 16905);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('27C9A7417AA84545A5860270414A9646', null, '朱建民', 'zhujm', '7188', null, null, null, null, null, 16906);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D91530D66E52414F9B85DB33BA6945A5', null, '沈希龙', 'shenxil', '7188', null, null, null, null, null, 16923);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A5CBE06A7E934889AB00B5ACCAFF14D2', null, '顾思翰', 'gush', '0726', null, null, null, null, null, 16964);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E92EBFF5BD9A4C46BEBC7772B0B37150', null, '屠巍', 'tuw', '7188', null, null, null, null, null, 17042);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('783735949D2D448DB0AEC4F97BD829E7', null, '蔡耀华', 'caiyaoh', '2828', null, null, null, null, null, 17064);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3C0EF298D0D04FE99F59BD597B722766', null, '朱培', 'zhup', '7188', null, null, null, null, null, 17102);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3ED26C64AA0747B3BE34FF40E8509558', null, '陈旭', 'chenxu', '6912', null, null, null, null, null, 17122);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('446CFF18139C4B8DB737CE12F3B55540', null, '刘晔', 'liuye8', '7188', null, null, null, null, null, 17184);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('93B4997B912C47ED93EB0C3F63A729E0', null, '谢天云', 'xiety', '7188', null, null, null, null, null, 17185);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('841790A8E7D04A32BCB4F02692752DFD', null, '储祥华', 'shuxh', '7188', null, null, null, null, null, 17204);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CCC1D5E9D78E4BFB8694561B1E7B97AA', null, '周犇', 'zhoub', '7188', null, null, null, null, null, 17223);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1A2BC6B472C04EA78DE1D3DAFCAB47D4', null, '竺万祥', 'zhuwx', '7188', null, null, null, null, null, 17262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47E960F17D914D1DA56B84A00BA6D10B', null, '陈艳', 'chy', '7188', null, null, null, null, null, 25504);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C574B64C14254F0994D862F49C685301', null, '张灵芝', 'zhlzh', '7188', null, null, null, null, null, 25524);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6DB4111925A04502891E1EC1FA4A43C1', null, '陈志新', 'chzx', '7188', null, null, null, null, null, 25525);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('176C3E595E694FA4BA2F8E838041959B', null, '陈海林', 'chhl', '7188', null, null, null, null, null, 25526);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6A9DE45996104FC78913BAF54127EB29', null, '牛志忠', 'nzz', '7188', null, null, null, null, null, 25527);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('28209BF4245F4142A6D6C26A90B2C95D', null, '严晓峰', 'yanxiaof', '7188', null, null, null, null, null, 25530);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D68E78853C9450B984319E8BE37B6C9', null, '张荣', 'zhr', '7188', null, null, null, null, null, 25532);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8E0CF50931334FB59D0B641E2F8F48E8', null, '王雷', 'wanglei2011', '7188', null, null, null, null, null, 25536);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9E9F11F76C774DCFACE1A70DCEEEF657', null, '吴丽娜', 'wln', '7188', null, 'SUPER', '二分公司', null, null, 25537);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96D38870667644B4A16D332B150B6A1F', null, '缪苗', 'miaomiao', '820131', null, null, null, null, null, 25543);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A7EE41164FC54465820FEC2184D1325D', null, '祁亚军', 'qyj', '7188', null, null, null, null, null, 24985);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('54A110A9E5874F739970A2B17B4A9D5B', null, '陈昌军', 'chcj', '7188', null, null, null, null, null, 25483);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9704EC8744524B6CAEB28BC436B08024', null, '朱健康', 'zhjk', '7188', null, null, null, null, null, 25523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FAA54D4ED6784296AB6FE0A36A204955', null, '张永合', 'zhyh', '7188', null, null, null, null, null, 25528);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F500C2F03E144542ABE36E3C05C73D07', null, '施圣伟', 'shsw', '7188', null, null, null, null, null, 25531);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F69F7B6709C94A4D83744ED04367DA1C', null, '何以良', 'heyiliang', '7188', null, null, null, null, null, 25563);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('725A3AC0E9434D7F881D00BDA82A0B40', null, '李季', 'liji', '7188', null, null, null, null, null, 24511);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D76D55450BC74D30B6AB379562C36934', null, 'luyf', '陆亚峰', '7188', null, null, null, null, null, 25003);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2D868CCC75C64CFD950CB6173C4FA5E1', null, '陆亚峰', 'luyf', '7188', null, null, null, null, null, 25023);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('617C525103C54AB9AFD7B0441656EB94', null, '刘逸峰', 'liuyifeng', '7188', null, null, null, null, null, 25583);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4B787331BDD346BEB3AFA0EAEE594FDA', null, '陈侃', 'chenkan', '7188', null, null, null, null, null, 25603);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3A45208236DE4F6E85EA9EC8C09D0C67', null, '赵伟刚', 'zwg', '7188', null, null, null, null, null, 24883);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('55EDB070DCC14C7D8319A3B234BB9885', null, '游犇', 'youben', '7188', null, null, null, null, null, 25203);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EBFA2CBAA0BC491EA391EC89DEF7D157', null, '天津', 'tianjin', '7288', null, null, null, null, null, 25843);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3D428D55A2CD408FB5142836C762E5C3', null, '许山明', 'xsm', '7188', null, null, null, null, null, 25863);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6EFB02324F4468AA0CB6966FCEDDFDC', null, '张路', 'zhanglu', '537300', null, null, null, null, null, 24217);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('224F09CFA5F94723B94CD1BC61D6F08C', null, '沈杭佳', 'shj', '7188', null, null, null, null, null, 24218);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07302799BB634125AE23DC4C4A9A8579', null, '庄丽', 'zli', '7188', null, null, null, null, null, 24219);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D19F862E91AF470FBFA80CE1E9B9B857', null, '顾晨飞', 'gcf', '7188', null, null, null, null, null, 24220);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E18D54060F9249DB90D418CCC7B0413A', null, '赵宝祥', 'zbx', '7188', null, null, null, null, null, 24222);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A0C8F4E84C04973AB9D5273284C6149', null, '毛新明', 'mxm', '7188', null, null, null, null, null, 24238);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BC33A6C0F73E4CEA874AA5AF45E91651', null, '朱国军', 'zugj', '7188', null, null, null, null, null, 24322);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('27AB45954C75446A9DF4748C4A414301', null, '徐晶', 'xujinhua', '7188', null, null, null, null, null, 24324);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2C309E8C9E4E4E3AAB4A600698D08BF4', null, '曹鸿基', 'caohj', '7188', null, null, null, null, null, 24325);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('18AD0C8FE9AF4BAF8F959EDCD8E0592F', null, '焦杨', 'jiaoy', '7188', null, null, null, null, null, 24326);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F26E6E5BB1AD48ADA3679C338487BE99', null, '张元', 'zyuan', '7188', null, null, null, null, null, 24327);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8B81F6C865B9422283A1A36D5CE9A2DE', null, '储龙官', 'clg', '7188', null, null, null, null, null, 24333);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('851F9871BAD3402EA552D4846CC79CD5', null, '康在东', 'kzd', '7188', null, null, null, null, null, 24334);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1F15A0AC05FE44E194735656CA88A296', null, '周萍', 'zup', '7188', null, null, null, null, null, 24335);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FF3AAC3325174AFDB70B1BD2D9DAA7B9', null, '李文', 'liwen', '7188', null, null, null, null, null, 24336);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BABCA2BC81DC45BC9EBB2FDAEC659EB2', null, '王薇', 'wwei', '780313', null, null, null, null, null, 24340);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A1FA974BC2D94DDD8968C482C9E3226D', null, '王相彬', 'wxbi', '7188', null, null, null, null, null, 24342);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('620A7E76FDB540F785CBF3EF8F297F3B', null, '朱晓宁', 'zxn', 'zxn1985531', null, null, null, null, null, 24343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('58CB1577666943EEA7027E299B09C0AE', null, '顾飞武', 'gfw', '7188', null, null, null, null, null, 24349);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FFC21507B9FF44159C44C481EDF39304', null, '侯建栋', 'houjd', '7188', null, null, null, null, null, 24351);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07F47A73923F462C8024AFC9C8F4D2EF', null, '陆嘉明', 'lujm', '7188', null, null, null, null, null, 24352);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('45444D8901BC4EDBB1E3300D2BDD15CB', null, '荀博', 'xbo', '7188', null, null, null, null, null, 24353);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('544B0A81A9FC4D49A94E27C1842A8795', null, '查询', 'chaxun', '7188', null, null, null, null, null, 24354);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D54C6C5014D346C38CB4F6F98CE0456A', null, '陆怡', 'luyi', '7188', null, null, null, null, null, 24355);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ECB3008E5B364149B4DF5702C4233FB6', null, '王金华', 'wjhua', '7188', null, null, null, null, null, 24356);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EEE0B414D12848148A00DFBE3101AC49', null, '杨培明', 'ypm', '7188', null, null, null, null, null, 24357);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EC750C1F7F82443AB9C5BED5467233C7', null, '李海峰', 'lihf', '7188', null, null, null, null, null, 24151);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CBFDE376443849DBB1006D878F3FE40B', null, '党鹏', 'dp', '7188', null, null, null, null, null, 24214);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BF37ACC9838E44D38607AC9A46B644E8', null, '代心想', 'dxx', '7188', null, null, null, null, null, 24215);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8101579D3A5F474CB91803AEE32B9435', null, '毕研朋', 'byp', '7188', null, null, null, null, null, 24261);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0BA63AA5EDBE4C08B52D4AA79F1BBB1C', null, '殷永朝', 'yyca', '7188', null, null, null, null, null, 24263);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BD6AC88C1AFD4751B8AA04D67DC79376', null, '吴忠强', 'wuzq', '7188', null, null, null, null, null, 20829);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F53AA0892FAB43C5A3B29150F4AF9DB2', null, '冷永明', 'linym', '7188', null, null, null, null, null, 20867);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9397B820CFA7402EAAC6DF380B8A916F', null, '高潜', 'gaoq', '7188', null, null, null, null, null, 20868);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B1243439875C4475A63C814070C14067', null, '杨振祥', 'yzx', '7188', null, null, null, null, null, 20869);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0AE516D24B2D4BF1A17F8F58AE59E064', null, '焦龙', 'jiaol', '7188', null, null, null, null, null, 20870);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE13E41F5AF241C6B6272DCB3D146B98', null, '陆群', 'luqun', '7188', null, null, null, null, null, 20927);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C365BB7B1F17442C9789538D885F5466', null, '谈宏堃', 'thk', '7188', null, null, null, null, null, 20928);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('90910F0FAF1F41AD9FB08A73B2E74D5C', null, '钱峰', 'qianf', '7188', null, null, null, null, null, 20929);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DFC7C3D95F874DB0B4F7F0E2269EEFA0', null, '须桢慧', 'xzh', '7188', null, null, null, null, null, 20947);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('32A9711FF4B345B7981DBB41B1857C24', null, '郑良正', 'zlz', '7188', null, null, null, null, null, 20987);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('96CEFE8DF7044EC5AB2D58E190FF8030', null, '许根保', 'xgb', '7188', null, null, null, null, null, 20988);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A87D45AD9983450A9781976DD1B0F2F6', null, '朱大刚', 'zdg', '7188', null, null, null, null, null, 20989);
commit;
prompt 2100 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BBEE5E57DA284D55983E9BA35820CBBE', null, '周书武', 'zsw', '7188', null, null, null, null, null, 20990);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F9E1D1B6277E4CF495D3373061C9F8EB', null, '李陆康', 'llk', '7188', null, null, null, null, null, 20991);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B76035E10B294533AEFBA62AB8DB398A', null, '颜志荣', 'yanzr', '7188', null, null, null, null, null, 20992);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7B3243BF8AA64DFC89C919F82447629B', null, '吕彤', 'lutong', '7188', null, null, null, null, null, 20993);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D2A619711144407A955C97B99FE39A55', null, '刘观洪', 'lgh', '7188', null, null, null, null, null, 20994);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('850A334451514617A2D54372A48076E8', null, '薛国跃', 'xuegy', '7188', null, null, null, null, null, 20995);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2B3069ADFF6B49ADBD3DC4B9D906E10D', null, '史静怡', 'sjy', '818818', null, null, null, null, null, 21027);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0502C48680CA456EB3BF334003BCF7E9', null, '储林章', 'chulz', '7188', null, null, null, null, null, 21028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE480FEC50694F4591218D89DE44AE50', null, '金明', 'jinming', '7188', null, null, null, null, null, 21087);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FA8B4B93EDF04E518F1BD3B842314CC0', null, '陈琪', 'chenqi', '7188', null, null, null, null, null, 21154);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FC905AEEA47047DC8C3B4C59CEC02510', null, '聂杨平', 'nyp', '7188', null, null, null, null, null, 21155);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2BF65F897352427FA00095B525BFD4E4', null, '姚秀军', 'yxj', '7188', null, null, null, null, null, 21156);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('347E9314E9444B76AFEA095EA623A885', null, '严东明', 'yandm', '7188', null, null, null, null, null, 21162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F5DCCDC89C0A4C4AA449F0973921BA95', null, '王楠', 'wangnan', '7188', null, null, null, null, null, 21163);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0CFA8D6670424C8AA822E5E17C985E34', null, '丁漪', 'dinyi', '7188', null, null, null, null, null, 21165);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F15C14C008CF46C9A8BB4248337B63B2', null, '任运涛', 'ryt', '7188', null, null, null, null, null, 21166);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F6F41F2E069485ABAAF3CF1978974A8', null, '任琪', 'renqi', '7188', null, null, null, null, null, 21168);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0AB2B81B27C045C78E4DDAEA6F45EB12', null, '陆永兴', 'luyx', '7188', null, null, null, null, null, 21169);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8498F06ABE9747BB8FCF9136EBC3E76F', null, '冯小安', 'fxa', '7188', null, null, null, null, null, 21170);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('85ED244406BC4E469E291146A15374FD', null, '陈伟', 'chenwei', '7188', null, null, null, null, null, 21171);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('673E35754B11488B84D043C802831EA7', null, '王来官', 'wanglg', '7188', null, null, null, null, null, 21174);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('231F9653DF324CE39F3CAA845FB52D85', null, '张福根', 'zhangfg', '7188', null, null, null, null, null, 21175);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E490DB5B62894B078A7854525E5434BC', null, '徐玲昌', 'xlc', '7188', null, null, null, null, null, 21176);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('265CFC3EFC7B4C368229539336C7D02F', null, '张文兴', 'zhangwx', '7188', null, null, null, null, null, 21177);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F9A1E46ABDA742C1804AAA5DCE3E4BA7', null, '赵旭', 'zhaoxu', '7188', null, null, null, null, null, 21178);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('47AA76B925B24CBC8DEE6290E3732ADE', null, '丁龙华', 'dlh', '7188', null, null, null, null, null, 21179);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E212367D3F6548478F886342483E14D1', null, '陆欣琛', 'lxc', '7188', null, null, null, null, null, 21180);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8A87F520547744FD9B2EAC21E96DAA10', null, '汪松青', 'wsq', '7188', null, null, null, null, null, 21181);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB6DD12A75E540F6B15414899CDA5F53', null, '梁超', 'liangc', '7188', null, null, null, null, null, 21182);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B39AC7080D2F4BF393C02BE061BC1C72', null, '张荣祖', 'zhangrz', '7188', null, null, null, null, null, 21184);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5B46172E35B143C5BF0D03FC0836029C', null, '顾顺兴', 'gsx', '7188', null, null, null, null, null, 21186);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9F8518720ADC4F1F9747B10413C12AA1', null, '姜琴明', 'jqm', '7188', null, null, null, null, null, 21187);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3B5D010C02AA450CAEE416E4037C3381', null, '金波', 'jinbo', '7188', null, null, null, null, null, 21188);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CA6FBC3937C841B88B7CE314C74C3765', null, '张云祥', 'zhangyx', '7188', null, null, null, null, null, 21189);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7AFCEAC927324B5D94D9D3096A4546D0', null, '陈曦', 'chenxi', '7188', null, null, null, null, null, 21190);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AD3CE3B174B94D00A50B248BD5AA9950', null, '商鹏', 'shangp', '7188', null, null, null, null, null, 21191);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A788AE83517E41389B96B5D4B8C6C6AF', null, '赵芯', 'zaox', '7188', null, null, null, null, null, 21192);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('76746E5CCAC94928B9DF28046B35711B', null, '朱至竑', 'zhuzh', '7188', null, null, null, null, null, 21193);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33C0813EE0294DE481761FBD995EC053', null, '张宏苗', 'zhanghm', '7188', null, null, null, null, null, 21228);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('52C211F6FE444691A7677D2358CCF45B', null, '99', '88', '7188', null, null, null, null, null, 21247);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A23C651F9B8D4F22BFFDB30704B620AE', null, 'b', 'b', '7188', null, null, null, null, null, 21347);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B4CA0579A1D74323B1F8E70382FC8FFF', null, '匿名专家1', 'nmzj1', '123', null, null, null, null, null, 21368);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D0CC91AE78F943219684D355E35E76E5', null, '测试', '测试用户', '123', null, null, null, null, null, 21355);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('92645CF874BB4F5D892315547B89779E', null, 'TEST', 'TEST', 'test', null, null, null, null, null, 21356);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('915B12D0C8B34887B4481D87D868B280', null, '匿名专家6', 'nmzj6', '123', null, null, null, null, null, 21374);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F83DB236A49B491A810EA9CF7B4225FF', null, '321321', '1321', '321', null, null, null, null, null, 21359);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8AB07B414C854997818521741FF166A6', null, '匿名专家2', 'nmzj2', '123', null, null, null, null, null, 21369);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0316347BEFD24901A8B02226C226D598', null, '匿名专家3', 'nmzj3', '123', null, null, null, null, null, 21370);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('319676A512EF4531B2298192D9AFEBE9', null, '匿名专家4', 'nmzj4', '123', null, null, null, null, null, 21372);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A51E4D7DC0E44B2B93EC0B5FCE20B64D', null, '匿名专家5', 'nmzj5', '123', null, null, null, null, null, 21373);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7700B469D9EF4AE59F091026451BB8FC', null, '匿名专家7', 'nmzj7', '123', null, null, null, null, null, 21375);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('06CA1CDFF3F642F4831F8999506142FB', null, '匿名专家8', 'nmzj8', '123', null, null, null, null, null, 21376);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('244AFEF296784DBC988B502BAE61A1E0', null, '匿名专家9', 'nmzj9', '123', null, null, null, null, null, 21377);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4DEEA2AEE4B345A5A36E1F47F9B075AC', null, '匿名专家10', 'nmzj10', '123', null, null, null, null, null, 21378);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('04013C9E49F14F24A4F21A983D079E48', null, '匿名专家11', 'nmzj11', '123', null, null, null, null, null, 21379);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('990DE2BE15CD4FAE97DA10C1DDC257B6', null, '匿名专家12', 'nmzj12', '123', null, null, null, null, null, 21380);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6461ED7052BB4EA383CF51C940E0547E', null, '匿名专家13', 'nmzj13', '123', null, null, null, null, null, 21381);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0BBACEA43FBE406A86EE61B7FC027146', null, '匿名专家14', 'nmzj14', '123', null, null, null, null, null, 21382);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7EB78C628222466C9B0D5EE9F990DD4A', null, '匿名专家15', 'nmzj15', '123', null, null, null, null, null, 21383);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('07A767117EBA4A049C3976E3C874C007', null, '匿名专家16', 'nmzj16', '123', null, null, null, null, null, 21384);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1C625FFF1B1D46ACA6BA35C44A980675', null, '匿名专家17', 'nmzj17', '123', null, null, null, null, null, 21385);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CE22B15E58F6409B893671CD24A40867', null, '匿名专家18', 'nmzj18', '123', null, null, null, null, null, 21386);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('792B67B839BE4B64AC2F6D840BDC2051', null, '匿名专家19', 'nmzj19', '123', null, null, null, null, null, 21387);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad535f5357e0135f53ab4870009', null, '高杰', 'gaoj', 'gaoj', null, null, '一', null, null, 1614113);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b333ddd9001333de98e11001c', null, '王慈雨', 'wangcy', 'wangcy', null, null, null, null, null, 26244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b33746c72013386f4b232000a', null, '董恩', 'donge', 'donge', null, 'SUPER', '一分公司', null, null, 26343);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad53565a0bd013565a1135b0001', null, '李洁', 'lijie', 'lijie', null, 'SUPER', '科技网', null, null, 1610828);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad535a2f2e00135a8ec1dea002f', null, '邢文辉', 'xingwh', 'xingwh', null, null, null, null, null, 1629676);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad535559a1d013555a862a50011', null, '刑建华', 'xingjianh', 'xingjianh', null, null, '四', null, null, 1606965);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a8ae49b33ce3b5b0133ce3bb4c70001', null, '刘燕', 'liuyan', 'liuyan', null, null, '七分公司', null, null, 26423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad5357596a701357a3fd6a3001e', null, '高杰', 'gaojie', 'gaojie', null, null, '一', null, null, 1614267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7A5D0C6F43624F148F1A1F753DA831CE', null, '孙迅非', 'sunsf', '7188', null, null, null, null, null, 23799);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9518DA58310E44119B3631FFC70B05C5', null, '吴卫东', 'wuwd', '7188', null, null, null, null, null, 23814);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0974AAD8E51543CEB0E18F1FD40EFCDD', null, '黄荣', 'huangr', '7188', null, null, null, null, null, 24028);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E119FFBC90FC472893C1196CAB1F73C2', null, '王凌', 'wling', '7188', null, null, null, null, null, 24114);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4D0BCA99B7E54E47B8D2FC89D5029698', null, '江伟', 'jwei', '7188', null, 'SUPER', '七分公司', null, null, 24115);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BF83799B38EF438CB2E988F331A5FCB5', null, '傅俪赉', 'flb', '7188', null, null, null, null, null, 24154);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3A4E1EACC29C4481B2E6F4B0954780EF', null, '史雯', 'shiw', '7188', null, null, null, null, null, 24155);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC236E2FC77B48B8A9E4E9E29771F2F3', null, '谭曙梅', 'tsm', '7188', null, null, null, null, null, 24157);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A814E3C97F3340B597F193A529771861', null, '陈雅根', 'chenyg', '7188', null, null, null, null, null, 24158);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('410E25CF57E64DAC9F1FD2EA5DD3752E', null, '陈建江', 'chjj', '7188', null, null, null, null, null, 24159);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B78B52D15AC849C8900BA117DA8DC32F', null, '李铭', 'limin', '7188', null, null, null, null, null, 24161);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('75E347EE9CB8485FBAA3ADE036CDFF28', null, '杨小军', 'yanxj', '7188', null, null, null, null, null, 24162);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('97A2D5E5DAF9435B9A0F9F1B3C5F4E01', null, '龚海', 'gonh', '7188', null, null, null, null, null, 24163);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4BBF42B067174DFB932AB65659600A02', null, '吴兴华', 'wxh', '7188', null, null, null, null, null, 24166);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2B622B1F3B2349798FF089E4B29BFB21', null, '麻彩强', 'mcq', '7188', null, null, null, null, null, 24181);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AAB2E27880FB40D5A4FDA79706DA6B3C', null, '赵顺忠', 'zhaosz', '7188', null, null, null, null, null, 24193);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5AA9E01A97CB4A1F984C79C23210BA17', null, '毛沣峰', 'mff', '7188', null, null, null, null, null, 24227);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3185B3B780EF479898A8A283EAA3EDD2', null, '张强', 'zqiang', '7188', null, null, null, null, null, 24228);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('04E6C2951A794EA7AEAA4FA06AD8C7D2', null, '王曦捷', 'wyj', '7188', null, null, null, null, null, 24229);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DA37242BFF69432B9F908436BE1CB091', null, '杨进昌', 'yanjc', '7188', null, null, null, null, null, 24230);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FCA4A0390D4D460997A4293230C4FE06', null, '许晴', 'xuq', '7188', null, null, null, null, null, 24232);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1AE308C75DC146FA865984214E8BE1AA', null, '尹明官', 'ymg', '7188', null, null, null, null, null, 24233);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('992B1B2474BA4C3F81C2FEE0256AE085', null, '沈益峰', 'shenyf', '7188', null, null, null, null, null, 24267);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('76F4C3E4070843D185A9055871B7078B', null, '杨朝晖', 'yach', '7188', null, null, null, null, null, 24269);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9FF7B8A56D524C659D557136CD540204', null, '郭玲', 'guol', '7188', null, null, null, null, null, 24272);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A51DA7B63C224C5194C5AB9A4AA97827', null, '严吉峰', 'yjf', '7188', null, null, null, null, null, 24273);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('094763E7DEF64C90BDA7CF9515E36272', null, '张祥', 'zhanx', '7188', null, null, null, null, null, 24275);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7A1167AFCF9A46529D76D1207D97315A', null, '李斌', 'lbin', '7188', null, null, null, null, null, 24276);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1693CF4B035D4EF1A0956276F9F2B5AD', null, '施文俊', 'siwj', '7188', null, null, null, null, null, 24277);
commit;
prompt 2200 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('29DFE2BA8A914999BC95C050064F5F35', null, '毛春芳', 'mcf', '7188', null, null, null, null, null, 24280);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D8D7ED6AFCDB426393243D5867F8A8C8', null, '赵才学', 'zhcx', '7188', null, null, null, null, null, 24281);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F33093A4E7514765BB4114ABBF0BB87F', null, '杨会臣', 'yhc', '7188', null, null, null, null, null, 24282);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('11BF3F6148364595B78FD941028EDA11', null, '陈惠忠', 'chhz', '7188', null, null, null, null, null, 24284);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9B4DF5A5FE0B4125AC84297EBF3BA04B', null, '林作胜', 'lzs', '7188', null, null, null, null, null, 24285);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A1AD316CC23B47DDA37A5F148BB2CFA7', null, '徐炜', 'xvw', '7188', null, null, null, null, null, 24286);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('77AD9A5E0D4D4F6484248B2C6F2C5615', null, '陈荣705', 'chr', '7188', null, null, null, null, null, 24289);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0D2D3DA4FF7740D5B5D6510BABD711C5', null, '傅渊博', 'fuyb', '7188', null, null, null, null, null, 24290);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0B0896C0AE3E4B25BF567C159EDFC756', null, '宋龙', 'slo', '7188', null, null, null, null, null, 24291);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('01665165EF53461AA34F3B16914CBB82', null, '李玉正', 'lyz', '7188', null, null, null, null, null, 24292);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8EA3C8F695FC4C21A2F770C3D0446872', null, '陈韩盛', 'chhs', '7188', null, null, null, null, null, 24293);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DD9C386C291C4152AC818003DE1AA35E', null, '黄晔', 'huh', '7188', null, null, null, null, null, 24294);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B339CA22C3914028A86D01A1FCBD3034', null, '季军', 'jij', '666666', null, null, null, null, null, 24296);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('753196B5BDB649AB86E3C4E912CB6F58', null, '乐志龙', 'lzl', '7188', null, null, null, null, null, 24297);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5BB351C8465F489DB4B28A9C49E5DA5D', null, '刁伟俊', 'dwj', '7188', null, null, null, null, null, 24298);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('458DE1F20C9E45EB89B0A38F6432585A', null, '郭东杰', 'godj', '7188', null, null, null, null, null, 24299);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DAFC40F626C646168218244529AC7475', null, '王建明', 'wjm', '7188', null, null, null, null, null, 24302);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4A2FA4D240084B2DB85308993879C343', null, '贾舫', 'jiaf', '7188', null, null, null, null, null, 24304);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E6D2C3C905504AF4A7989AA473FC48D2', null, '张军烈', 'zhangjunlie', '7188', null, null, null, null, null, 24307);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1FF240D47D7F4163B8EECFD9912A609F', null, '市场部', 'scb', '7188', null, null, null, null, null, 24309);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9A7EFFAE60A545299D9DEB931CA0A038', null, '外经科', 'wjk', '7188', null, null, null, null, null, 24310);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F3471B317FB4F49909DB9AFB90879E8', null, '合约部', 'hyb', '7188', null, null, null, null, null, 24311);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('02FCD604C963470E8121CCA6850B41C8', null, '吕新宇', 'lxy', '7188', null, null, null, null, null, 24384);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0B599BEF4ED40A0A5C76230E10DA3AA', null, '梁海峰', 'lhaif', '7188', null, null, null, null, null, 24385);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A3212A0DA56B43F3BDD7D2E34D987B75', null, '米运之', 'myz', '7188', null, null, null, null, null, 24386);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2F300118BB124470895B9E7D3E5A5CEE', null, '陶今才', 'tjc', '7188', null, null, null, null, null, 24234);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4CF7022BE5474AC1B64E57735EEE687E', null, '吴纪章', 'wjz', '7188', null, null, null, null, null, 24235);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F04FA93D6B9D4E509D81B49A48F7B305', null, '姚尚俊', 'ysj', '7188', null, null, null, null, null, 24236);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1DE4A9E404CA44B8B1CB2F19773A59C9', null, '陆少华', 'lsh', '7188', null, null, null, null, null, 24237);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB9872266D034EFCB07AF273ED8FD260', null, '施浩良', 'sihl', '7188', null, null, null, null, null, 24239);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('82906E59B5D24CE89BB089F4057648A2', null, '刘明汉', 'lmh', '7188', null, null, null, null, null, 24145);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EB1CDAADEC214FD99F2B871ED244CD96', null, '孙宜荣', 'sunyr', '7188', null, null, null, null, null, 24146);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('589DE096754E4E17BCE229B32B62BA83', null, '沈卫佳', 'swjia', '7188', null, null, null, null, null, 24148);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('133F8DED7E2745898B3D5D177BABD6FB', null, '俞康', 'yukang', '7188', null, null, null, null, null, 24149);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('637F4ED5AE964C9D8DEAC15E0DA46B26', null, '侯艳芳', 'hyf', '7188', null, null, null, null, null, 24150);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('00B10A6515E94FF09E47498152969073', null, '宋晓燕', 'sxy', '7188', null, null, null, null, null, 24167);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('438024410171411DB8E111B03D6A7720', null, '陶天祥', 'ttx', '7188', null, null, null, null, null, 24168);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('79400FAEA3BF41D7AFBB400B96169DC7', null, '叶孜超', 'yezc', '7188', null, null, null, null, null, 24169);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5E267F8EAE34461ABE3C09EC2A902748', null, '刘静松', 'ljs', '7188', null, null, null, null, null, 24170);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('815182AACA7F4394936EA034E08FF2D4', null, '张炜金', 'zweij', '7188', null, null, null, null, null, 24171);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('88805310BD5848C59E32DC515CA3482B', null, '杨勇', 'yangy', '7188', null, null, null, null, null, 24172);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('C5E94D038D8D407DA69F20AAC7C46279', null, '卢锡龙', 'luxl', '7188', null, null, null, null, null, 24173);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CF242DFBD9524FC5B2BCFB781C482AF9', null, '石程章', 'scz', '7188', null, null, null, null, null, 24174);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('32C6CEA0AF04461DBD0EE920165645F4', null, '潘瑞敏', 'prm', '7188', null, null, null, null, null, 24175);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CE852B4090B6411785CC1B07F5927DD4', null, '任钱泉', 'rqq', '7188', null, null, null, null, null, 24177);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F718CB8DB5D5400A9F5BEF223EA3BAA2', null, '季东雷', 'jdl', '7188', null, null, null, null, null, 24179);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5F186482C8B44C23A9226AC7145D299C', null, '潘卫星', 'pawx', '7188', null, null, null, null, null, 24180);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('695991A6E8374CEC8EA61B2DE20846CB', null, '郑高峰', 'zgfe', '7188', null, null, null, null, null, 24185);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5B0F32A7AC41400AAC538A0E221A1DC4', null, '邱兆琰', 'qzy', '7188', null, null, null, null, null, 24186);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('85FFB67977A549A9BE25080F7299D378', null, '葛伟伟', 'geww', '7188', null, null, null, null, null, 24187);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7EBC4E317A9C474A9334C62A0EF02735', null, '张涵', 'zhha', '7188', null, null, null, null, null, 24188);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6CB9E913DF06420792BA729E4BBCAABF', null, '陈达文', 'cdw', '7188', null, null, null, null, null, 24189);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BE71008C16AC4E19ABA70C1D7DC8DC9E', null, '戴联民', 'dlm', '7188', null, null, null, null, null, 24190);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E3F278157AFA4049B8753C35440DD7C3', null, '马荣伟', 'marw', '7188', null, null, null, null, null, 24191);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('E81653F624AD4DC9B47AA73948D3C90C', null, '杨良成', 'yanglc', '7188', null, null, null, null, null, 24192);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EF4A1556C79E472EA0D3F80FE537BD38', null, '顾永亮', 'guyl', '7188', null, null, null, null, null, 24242);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('ED8E660A9061460AB57B28EF38F0C0EB', null, '闫友明', 'yym', '7188', null, null, null, null, null, 24243);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5D149DC4501B40F0B6F71C3EBACC26EE', null, '王幸杰', 'wxij', '7188', null, null, null, null, null, 24244);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('185E876DA1274EE3B3020AF340B36101', null, '赵大鹏', 'zdp', '7188', null, null, null, null, null, 24245);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('83A07746D1FA47ABB6BA0AABBA2E14BD', null, '郑长帆', 'zecf', '7188', null, null, null, null, null, 24248);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09C1C0EDF99E44EAB5E2830DA563122E', null, '张勇', 'zyon', '7188', null, null, null, null, null, 24250);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D4C65967BE9E4335921C150F87157C11', null, '范小荣', 'fxr', '7188', null, null, null, null, null, 24251);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('4E511B18FAE346D39EA7B5E8DC1FC7A2', null, '瞿华', 'quh', '7188', null, null, null, null, null, 24252);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('98ECDCAFBBCC48AB9E84C63FF7985188', null, '张水云', 'zsy', '7188', null, null, null, null, null, 24253);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('21B659409ACF4BF6BAF0D755BABEC5F6', null, '张宝正', 'zhbz', '7188', null, null, null, null, null, 24255);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EA2E19FEE6AF43F08B5D82E65474453C', null, '王文清', 'wawq', '7188', null, null, null, null, null, 24256);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DF80717E2E2241F1A01535C35969EDC0', null, '刘文静', 'lwj', '7188', null, null, null, null, null, 24257);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('BBF0125EFCCE4882BF74B4321A9767DD', null, '刘阳', 'lya', '7188', null, null, null, null, null, 24258);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2472C5D897244DEAAF31D3970427EAEA', null, '蔡俊', 'cjun', '7188', null, null, null, null, null, 24260);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('9EA110484E2F4788B1513B2386FBD6BA', null, '陆勇', 'lyon', '7188', null, null, null, null, null, 24262);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('FA0704A38B854773806BE16071E3D13E', null, '凌晨', 'lich', '7188', null, null, null, null, null, 24264);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('7F0B103220A349D09394DE2FA51267FE', null, '王超（小）', 'wcao', '7188', null, null, null, null, null, 24265);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('09D22F8B49424D5DBB105431CD44D9E0', null, '程丽萍', 'clp', '818160', null, null, null, null, null, 24266);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('88F491BA60884FE0AFDC9E8BDF15B63C', null, '马俊', 'majun', '7188', null, null, null, null, null, 24363);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('5A36E1847D854DF88E195CB6CFD06391', null, '钱爱兴', 'qax', '7188', null, null, null, null, null, 24402);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('1007F25363A5450098B0F72B565A8752', null, '管晓轶', 'guanxy', '7188', null, null, null, null, null, 24423);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('882ACE18B7FC4197BD20EA3C4832C338', null, '陈庆霞', 'chqx', '7188', null, null, null, null, null, 24463);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A0AE77306B2E47EA9CAFE510E2CC6CE7', null, '孙兆斌', 'szb', '7188', null, null, null, null, null, 24509);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F577104065AD4C4190DA9074D3ADF1E5', null, '高麒峰', 'gaolf', '7188', null, null, null, null, null, 24510);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('98CB3150097642598ADC295739A627EC', null, '陈强', 'chenq', '7188', null, null, null, null, null, 24523);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('14885B2904EE480BAD240E0CAB8342BD', null, '方芸', 'fangyun', '7188', null, null, null, null, null, 24564);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('A458B3A980664596958B7A3F44BB00EB', null, '陈安琪', 'chenaq', '7188', null, null, null, null, null, 24703);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('2B2EEE059EEF4C70BC509439B1F3307E', null, '佘文杰', 'sewj', '7188', null, null, null, null, null, 24763);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('6DA35C0593764FD28DE36582521D8113', null, '庄晓兰', 'zxlan', '7188', null, null, null, null, null, 24783);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AFBC680979434B038A6891615729CC54', null, '李邱', 'liqiu', '7188', null, null, null, null, null, 24784);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('268B27F9CF0640C7A5D99044CB96F860', null, '戴晖', 'daihui', '7188', null, null, null, null, null, 24803);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AB8C00D39C48425B8CF93B76A4B9F9E8', null, '陈宝圆', 'chby', '7188', null, null, null, null, null, 24903);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('194A11D4443F43B6AAFC043E0209496E', null, '姚振', 'yaoz', '7188', null, null, null, null, null, 24943);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('CAE5E3C4AE73457D93894FDAD40D1BB8', null, '赵冬', 'zhaod', '7188', null, null, null, null, null, 24963);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AE9C81F12F1E4C4EA7070B2BE42BB62E', null, '周浩翔', 'zhxi', '7188', null, null, null, null, null, 24983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8AE202F5F5EE4A278B7519FE2BF59DEC', null, '朱匡基', 'zhkj', '7188', null, null, null, null, null, 24984);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('74AE11DE221A4CCE9AF5C60CB4138E70', null, '王成', 'wangch', '878280', null, null, null, null, null, 25623);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('3456FC7F0E71458B964D650EF7B0E651', null, '娄洪伟', 'lonhw', '594266', null, null, null, null, null, 25643);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('B92A235F7A324408BB011D55840A772F', null, '郁清', 'yuq', '7188', null, null, null, null, null, 25663);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('D32E00A514CF4A4FAB57A8BA9A1DF426', null, '陈华', 'chenhua704', '7188', null, null, null, null, null, 25685);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('33D29FF35FDB48C8A67287AFD7852840', null, '王瑛', 'wying', '7188', null, 'SUPER', null, null, null, 25703);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('F6F84B1343F047A7AE49F27797C8D2CF', null, '孙华伟', 'shw', '7188', null, null, null, null, null, 25723);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('184BBD237F714C139BD9275AA8BD6CE6', null, '王飞龙', 'wfl', '369369', null, null, null, null, null, 25724);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('EDA27DA67E78411196882411E0106FDD', null, '刘抗', 'liuk', '7188', null, null, null, null, null, 25725);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('0B6DDDB9AC944E9AADE60F3B7E2EB411', null, '董国樑', 'donggl', '7288', null, null, null, null, null, 25743);
commit;
prompt 2300 records committed...
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('22F1A5C7C57A452695E56BA67155955B', null, '李超', 'lcao', '7188', null, null, null, null, null, 25763);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('AC2E1148779C4EE2B695017149CC7E63', null, '沈忆辰', 'syc', '7188', null, null, null, null, null, 25783);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('DD2AD68B79FF43AEA89C4008E6F4362D', null, '宋杰', 'songjie', '7188', null, null, null, null, null, 25823);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad5359d7f2c01359d7f65a40001', null, '陆卫忠', 'luweizhong', 'luweizhong', null, null, null, null, null, 26503);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad535e0bb250135e582eb8a0015', null, '王玲玲', 'wll', 'wll', null, null, '一分公司', null, null, 25983);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad535e0bb250135e597077d0020', null, '江很春', 'jhc', 'jhc', null, null, '一分公司', null, null, 1631689);
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('8a898ad5373ae75301375356640700a0', null, '刘功良', 'lgl', 'lgl', null, null, '705', null, null, 1714505);
commit;
prompt 2307 records loaded
prompt Loading USERMAPROLEINFO...
prompt Table is empty
prompt Enabling foreign key constraints for ASSETMAINTAINDETAIL...
alter table ASSETMAINTAINDETAIL enable constraint FK_ASSETMAINTAINDETAIL_MAINID;
prompt Enabling foreign key constraints for ASSETMOVEDETAIL...
alter table ASSETMOVEDETAIL enable constraint FK_ASSETMOVEDETAIL_MOVEID;
prompt Enabling foreign key constraints for ASSETREMOVEDETAIL...
alter table ASSETREMOVEDETAIL enable constraint FK_ASSETREMOVEDETAIL_MOVEID;
prompt Enabling foreign key constraints for ASSETSETUPDETAIL...
alter table ASSETSETUPDETAIL enable constraint FK_ASSETSETUPDETAIL_SETUPID;
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
prompt Enabling triggers for ASSETMAINTAINDETAIL...
alter table ASSETMAINTAINDETAIL enable all triggers;
prompt Enabling triggers for ASSETMOVE...
alter table ASSETMOVE enable all triggers;
prompt Enabling triggers for ASSETMOVEDETAIL...
alter table ASSETMOVEDETAIL enable all triggers;
prompt Enabling triggers for ASSETREMOVE...
alter table ASSETREMOVE enable all triggers;
prompt Enabling triggers for ASSETREMOVEDETAIL...
alter table ASSETREMOVEDETAIL enable all triggers;
prompt Enabling triggers for ASSETSETUPINFO...
alter table ASSETSETUPINFO enable all triggers;
prompt Enabling triggers for ASSETSETUPDETAIL...
alter table ASSETSETUPDETAIL enable all triggers;
prompt Enabling triggers for ASSETSUPPLIER...
alter table ASSETSUPPLIER enable all triggers;
prompt Enabling triggers for BACCOUNT...
alter table BACCOUNT enable all triggers;
prompt Enabling triggers for CODERULE...
alter table CODERULE enable all triggers;
prompt Enabling triggers for LB_FGS...
alter table LB_FGS enable all triggers;
prompt Enabling triggers for LB_FGS_XMT...
alter table LB_FGS_XMT enable all triggers;
prompt Enabling triggers for MENUITEM...
alter table MENUITEM enable all triggers;
prompt Enabling triggers for PROCUREMENTCONTRACT...
alter table PROCUREMENTCONTRACT enable all triggers;
prompt Enabling triggers for PROCUREMENTCONTRACTDETAIL...
alter table PROCUREMENTCONTRACTDETAIL enable all triggers;
prompt Enabling triggers for PROCUREMENTSCHEDULEHEAD...
alter table PROCUREMENTSCHEDULEHEAD enable all triggers;
prompt Enabling triggers for PROCUREMENTSCHEDULEDETAIL...
alter table PROCUREMENTSCHEDULEDETAIL enable all triggers;
prompt Enabling triggers for ROLEINFO...
alter table ROLEINFO enable all triggers;
prompt Enabling triggers for ROLEPERMISSION...
alter table ROLEPERMISSION enable all triggers;
prompt Enabling triggers for SUBCOMPANYINFO...
alter table SUBCOMPANYINFO enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for USERMAPROLEINFO...
alter table USERMAPROLEINFO enable all triggers;
set feedback on
set define on
prompt Done.
create or replace view v_storage_address as
select 'Supplier' StorageTitle ,to_char(supplierid) as StorageId,to_char(suppliername) as StorageName,'' as SubCompanyId,'' as subcompanyname
from assetsupplier
union
select 'Subcompany' StorageTitle ,to_char(subcompanyid) as StorageId,to_char(subcompanyname) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname
from subcompanyinfo
union
select 'Project' StorageTitle ,to_char(xmtid) as StorageId,to_char(xmt) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname
from lb_fgs_xmt,subcompanyinfo
where fgsid=subcompanyid