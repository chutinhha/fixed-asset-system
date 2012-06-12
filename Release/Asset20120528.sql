prompt PL/SQL Developer import file
prompt Created on 2012年5月28日 by Bruce.Huang
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
  SUBCOMPANY         VARCHAR2(50)
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
  APPROVERESULT         NUMBER(1),
  CREATEDDATE           DATE,
  SUBCOMPANYCONTACTORID VARCHAR2(40),
  CREATOR               VARCHAR2(40),
  ASSETCATEGORYID       VARCHAR2(40),
  SETUPCONTENT          NVARCHAR2(500),
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
  SUPPLIERID   NVARCHAR2(40) not null,
  SUPPLIERNAME NVARCHAR2(40),
  REMARK       NVARCHAR2(1000)
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
  PROCURENUMBER      NUMBER(18)
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
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR70101010001', '0101', '设备名称', '设备名称', 2, 10, 1, '设备名称', 0, 0, '02', to_date('04-05-2012', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), '设备名称', null, '6609');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR70401010001', '0101', '设备名称', '设备名称', 2, 10, 11, '设备名称', 0, 0, '02', to_date('03-05-2012', 'dd-mm-yyyy'), to_date('03-05-2022', 'dd-mm-yyyy'), '设备名称', null, '6613');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR660903010001', '0301', 'NewEquipment', 'NewEquipment', 2, 10, 1, 'NewEquipment', 0, 0, '03', to_date('04-05-2012', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 'NewEquipment', null, '6609');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR660902010001', '0201', '设备名称', '设备名称', 2, 9, 1, '设备名称', 0, 0, '02', to_date('20-03-2012', 'dd-mm-yyyy'), to_date('20-03-2021', 'dd-mm-yyyy'), '设备名称1', null, '6609');
commit;
prompt 4 records loaded
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
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK)
values ('01', '浦江', null);
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK)
values ('02', '科技网', null);
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK)
values ('03', '光显', null);
commit;
prompt 3 records loaded
prompt Loading BACCOUNT...
prompt Table is empty
prompt Loading CODERULE...
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PCONTRACT', null, 1, 1, 1, 4, 0, 6, 'PCONTRACT201205280006');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PSH', '采购计划单', 1, 1, 1, 4, 0, 12, 'PSH201205260012');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR7010101', null, 1, 0, 1, 4, 0, 1, 'ZR70101010001');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR7040101', null, 1, 0, 1, 4, 0, 1, 'ZR70401010001');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090301', null, 1, 0, 1, 4, 0, 1, 'ZR660903010001');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PS', null, 1, 1, 1, 4, 0, 4, 'PS201205280004');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090101', null, 1, 1, 1, 4, 0, 2, 'ZR66090101201205270002');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('ZR66090201', null, 1, 0, 1, 4, 0, 1, 'ZR660902010001');
commit;
prompt 8 records loaded
prompt Loading MENUITEM...
prompt Table is empty
prompt Loading PROCUREMENTCONTRACT...
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205280005', null, to_date('28-05-2012', 'dd-mm-yyyy'), to_date('28-05-2012', 'dd-mm-yyyy'), '02', null, '6613', null, null);
insert into PROCUREMENTCONTRACT (CONTRACTID, CONTENT, CREATEDDATE, CONTRACTDATE, SUPPLIER, OPERATOR, SUBCOMPANY, CREATOR, PSID)
values ('PCONTRACT201205280006', null, to_date('28-05-2012', 'dd-mm-yyyy'), to_date('31-05-2012', 'dd-mm-yyyy'), '02', null, '15103', null, null);
commit;
prompt 2 records loaded
prompt Loading PROCUREMENTCONTRACTDETAIL...
insert into PROCUREMENTCONTRACTDETAIL (CONTRACTDETAILID, CONTRACTID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PROCURENUMBER)
values ('3e2da6a023764bfba5564b1e90c19e08', 'PCONTRACT201205280006', '0101', '1', '1', 1, 1);
commit;
prompt 1 records loaded
prompt Loading PROCUREMENTSCHEDULEHEAD...
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205280003', to_date('28-05-2012', 'dd-mm-yyyy'), '111', '7542', '11', to_date('28-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('28-05-2012 21:06:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PS201205280004', to_date('15-05-2012', 'dd-mm-yyyy'), '111', '7542', '111', to_date('28-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('28-05-2012 21:06:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260001', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260002', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260003', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260004', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260005', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260006', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260007', to_date('29-05-2012', 'dd-mm-yyyy'), '采购事由', '6612', '分公司', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
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
commit;
prompt 15 records loaded
prompt Loading PROCUREMENTSCHEDULEDETAIL...
insert into PROCUREMENTSCHEDULEDETAIL (DETAILID, ASSETCATEGORYID, ASSETNAME, ASSETSPECIFICATION, UNITPRICE, PLANNUMBER, PSID)
values ('ed982b65320040d583e6847c1f2e087a', '0103', '1', '1', 1, 1, 'PSH201205260007');
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
commit;
prompt 10 records loaded
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
prompt Enabling triggers for USERMAPROLEINFO...
alter table USERMAPROLEINFO enable all triggers;
set feedback on
set define on
prompt Done.
