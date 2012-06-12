prompt PL/SQL Developer import file
prompt Created on 2012��5��28�� by Bruce.Huang
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
  is '�豸���';
comment on column ASSET.ASSETCATEGORYID
  is '�豸���';
comment on column ASSET.ASSETNAME
  is '�豸����';
comment on column ASSET.STORAGE
  is '��ŵص�';
comment on column ASSET.STATE
  is '�豸״̬';
comment on column ASSET.DEPRECIATIONYEAR
  is '�۾�����';
comment on column ASSET.UNITPRICE
  is '����';
comment on column ASSET.BRAND
  is 'Ʒ��';
comment on column ASSET.MANAGEMODE
  is '����ģʽ���й�:0�Թ�:1';
comment on column ASSET.FINANCECATEGORY
  is '�������(A��:0B��:1)';
comment on column ASSET.SUPPLIERID
  is '��Ӧ��';
comment on column ASSET.PURCHASEDATE
  is '��������';
comment on column ASSET.EXPIREDDATE
  is '�۾ɵ�������';
comment on column ASSET.ASSETSPECIFICATION
  is '�豸���';
comment on column ASSET.STORAGEFLAG
  is '��ŵص��ʶ��Դ';
comment on column ASSET.SUBCOMPANY
  is '�ֹ�˾';
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
  is 'ά����Ϣ';
comment on column ASSETMAINTAIN.ASSETMAINTAINID
  is '�豸ά��ID';
comment on column ASSETMAINTAIN.MAINTAINTYPE
  is '������Դ��(��Ŀ�塢�Լ졢�¼�)';
comment on column ASSETMAINTAIN.APPLYDATE
  is '����ά������';
comment on column ASSETMAINTAIN.APPLYUSERID
  is '������';
comment on column ASSETMAINTAIN.APPLYCONTENT
  is '��������';
comment on column ASSETMAINTAIN.SUBCOMPANY
  is '�ֹ�˾';
comment on column ASSETMAINTAIN.SUBCOMPANYCONTACTORID
  is '�ֹ�˾��ϵ��';
comment on column ASSETMAINTAIN.CREATOR
  is '������';
comment on column ASSETMAINTAIN.CREATEDDATE
  is '��������';
comment on column ASSETMAINTAIN.PROJECTCONTACTORID
  is '��Ŀ����ϵ��';
comment on column ASSETMAINTAIN.PROJECTCONTACTORPHONE
  is '��Ŀ����ϵ�绰';
comment on column ASSETMAINTAIN.PLANMAINTAINDATE
  is '�ƻ�ά������';
comment on column ASSETMAINTAIN.ACTUALMAINTAINDATE
  is 'ʵ��ά������';
comment on column ASSETMAINTAIN.REJECTREASON
  is '�ܾ�����';
comment on column ASSETMAINTAIN.APPROVEUSER
  is '�����';
comment on column ASSETMAINTAIN.APPROVEDATE
  is '�������';
comment on column ASSETMAINTAIN.APPROVERESULT
  is '��˽��(ͬ��,�ܾ�)';
comment on column ASSETMAINTAIN.ASSETCATEGORYID
  is '(ϵͳ)�豸����';
comment on column ASSETMAINTAIN.MAINTAINCONTENT
  is '��ά����ϸ';
comment on column ASSETMAINTAIN.CONFIRMDATE
  is 'ȷ������';
comment on column ASSETMAINTAIN.CONFIRMUSER
  is 'ȷ����';
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
  is '��ϸId';
comment on column ASSETMAINTAINDETAIL.ASSETMAINTAINID
  is '�豸ά��ID';
comment on column ASSETMAINTAINDETAIL.ASSETNO
  is '�豸���';
comment on column ASSETMAINTAINDETAIL.PLANMAINTAINDATE
  is '�ƻ�ά������';
comment on column ASSETMAINTAINDETAIL.ACTUALMAINTAINDATE
  is 'ʵ��ά������';
comment on column ASSETMAINTAINDETAIL.MAINTAINCONTENT
  is 'ά��˵��';
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
  is '�ƻ���Ϣ';
comment on column ASSETMOVE.ASSETMOVEID
  is '�ƻ�����';
comment on column ASSETMOVE.APPLYDATE
  is '�����ƻ�����';
comment on column ASSETMOVE.APPLYUSERID
  is '������';
comment on column ASSETMOVE.APPLYCONTENT
  is '��������';
comment on column ASSETMOVE.SUBCOMPANY
  is '�ֹ�˾';
comment on column ASSETMOVE.SUBCOMPANYCONTACTORID
  is '�ֹ�˾��ϵ��';
comment on column ASSETMOVE.CREATOR
  is '������';
comment on column ASSETMOVE.CREATEDDATE
  is '��������';
comment on column ASSETMOVE.PROJECTCONTACTORID
  is '��Ŀ����ϵ��';
comment on column ASSETMOVE.PROJECTCONTACTORPHONE
  is '��Ŀ����ϵ�绰';
comment on column ASSETMOVE.PLANMOVEDATE
  is '�ƻ��ƻ�����';
comment on column ASSETMOVE.ACTUALMOVEDATE
  is 'ʵ���ƻ�����';
comment on column ASSETMOVE.REJECTREASON
  is '�ܾ�����';
comment on column ASSETMOVE.APPROVEUSER
  is '�����';
comment on column ASSETMOVE.APPROVEDATE
  is '�������';
comment on column ASSETMOVE.APPROVERESULT
  is '��˽��(ͬ��,�ܾ�)';
comment on column ASSETMOVE.ASSETCATEGORYID
  is '(ϵͳ)�豸����';
comment on column ASSETMOVE.MOVEDCONTENT
  is '���ƻ���ϸ';
comment on column ASSETMOVE.CONFIRMDATE
  is 'ȷ������';
comment on column ASSETMOVE.CONFIRMUSER
  is 'ȷ����';
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
  is '��ϸId';
comment on column ASSETMOVEDETAIL.ASSETMOVEID
  is '�ƻ�����';
comment on column ASSETMOVEDETAIL.ASSETNO
  is '�豸���';
comment on column ASSETMOVEDETAIL.PLANMOVEDATE
  is '�ƻ��ƻ�����';
comment on column ASSETMOVEDETAIL.ACTUALMOVEDATE
  is 'ʵ���ƻ�����';
comment on column ASSETMOVEDETAIL.MOVEDCONTENT
  is '�ƻ�˵��';
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
  is '�����Ϣ';
comment on column ASSETREMOVE.ASSETREMOVEID
  is '�������';
comment on column ASSETREMOVE.APPLYDATE
  is '����������';
comment on column ASSETREMOVE.APPLYUSERID
  is '������';
comment on column ASSETREMOVE.APPLYCONTENT
  is '��������';
comment on column ASSETREMOVE.SUBCOMPANY
  is '�ֹ�˾';
comment on column ASSETREMOVE.SUBCOMPANYCONTACTORID
  is '�ֹ�˾��ϵ��';
comment on column ASSETREMOVE.CREATOR
  is '������';
comment on column ASSETREMOVE.CREATEDDATE
  is '��������';
comment on column ASSETREMOVE.PROJECTCONTACTORID
  is '��Ŀ����ϵ��';
comment on column ASSETREMOVE.PROJECTCONTACTORPHONE
  is '��Ŀ����ϵ�绰';
comment on column ASSETREMOVE.PLANREMOVEDATE
  is '�ƻ��������';
comment on column ASSETREMOVE.ACTUALREMOVEDATE
  is 'ʵ�ʲ������';
comment on column ASSETREMOVE.REJECTREASON
  is '�ܾ�����';
comment on column ASSETREMOVE.APPROVEUSER
  is '�����';
comment on column ASSETREMOVE.APPROVEDATE
  is '�������';
comment on column ASSETREMOVE.APPROVERESULT
  is '��˽��(ͬ��,�ܾ�)';
comment on column ASSETREMOVE.ASSETCATEGORYID
  is '(ϵͳ)�豸����';
comment on column ASSETREMOVE.REMOVEDCONTENT
  is '��ά����ϸ';
comment on column ASSETREMOVE.CONFIRMDATE
  is 'ȷ������';
comment on column ASSETREMOVE.CONFIRMUSER
  is 'ȷ����';
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
  is '��ϸId';
comment on column ASSETREMOVEDETAIL.ASSETREMOVEID
  is '�ƻ�����';
comment on column ASSETREMOVEDETAIL.ASSETNO
  is '�豸���';
comment on column ASSETREMOVEDETAIL.PLANREMOVEDATE
  is '�ƻ��������';
comment on column ASSETREMOVEDETAIL.ACTUALREMOVEDATE
  is 'ʵ�ʲ������';
comment on column ASSETREMOVEDETAIL.REMOVEDCONTENT
  is '�ƻ�˵��';
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
  is '���뵥��';
comment on column ASSETSETUPINFO.APPLYSETUPDATE
  is '���밲װ����';
comment on column ASSETSETUPINFO.APPLYDATE
  is '��������';
comment on column ASSETSETUPINFO.APPLYUSERID
  is '������';
comment on column ASSETSETUPINFO.CONTACTPHONE
  is '��ϵ�绰';
comment on column ASSETSETUPINFO.PROJECTCONTACTORID
  is '��Ŀ����ϵ��';
comment on column ASSETSETUPINFO.PROJECTCONTACTORPHONE
  is '��Ŀ����ϵ�绰';
comment on column ASSETSETUPINFO.PLANSETUPDATE
  is '�ƻ���װ����';
comment on column ASSETSETUPINFO.ACTUALSETUPDATE
  is 'ʵ�ʰ�װ����';
comment on column ASSETSETUPINFO.APPLYCONTENT
  is '��������';
comment on column ASSETSETUPINFO.SUBCOMPANY
  is '�ֹ�˾';
comment on column ASSETSETUPINFO.REJECTREASON
  is '�ܾ�����';
comment on column ASSETSETUPINFO.APPROVEUSER
  is '�����';
comment on column ASSETSETUPINFO.APPROVEDATE
  is '�������';
comment on column ASSETSETUPINFO.APPROVERESULT
  is '��˽��(ͬ��,�ܾ�)';
comment on column ASSETSETUPINFO.CREATEDDATE
  is '��������';
comment on column ASSETSETUPINFO.SUBCOMPANYCONTACTORID
  is '�ֹ�˾��ϵ��';
comment on column ASSETSETUPINFO.CREATOR
  is '������';
comment on column ASSETSETUPINFO.ASSETCATEGORYID
  is '(ϵͳ)�豸����';
comment on column ASSETSETUPINFO.SETUPCONTENT
  is '�Ѱ�װ��ϸ';
comment on column ASSETSETUPINFO.CONFIRMDATE
  is 'ȷ������';
comment on column ASSETSETUPINFO.CONFIRMUSER
  is 'ȷ����';
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
  is '��ϸId';
comment on column ASSETSETUPDETAIL.SETUPID
  is '��װ����';
comment on column ASSETSETUPDETAIL.ASSETNO
  is '�豸���';
comment on column ASSETSETUPDETAIL.PLANSETUPDATE
  is '�ƻ���װ����';
comment on column ASSETSETUPDETAIL.ACTUALSETUPDATE
  is 'ʵ�ʰ�װ����';
comment on column ASSETSETUPDETAIL.SETUPCONTENT
  is '�Ѱ�װ��ϸ';
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
  is '��Ӧ��';
comment on column ASSETSUPPLIER.SUPPLIERID
  is '��Ӧ�̱��';
comment on column ASSETSUPPLIER.SUPPLIERNAME
  is '��Ӧ��';
comment on column ASSETSUPPLIER.REMARK
  is '��ע';
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
  is 'B����Ϣ';
comment on column BACCOUNT.ASSETNO
  is '�豸���';
comment on column BACCOUNT.ASSETNAME
  is '�豸���ƣ������ֶΣ�';
comment on column BACCOUNT.ACCOUNTEDDATE
  is '��������';
comment on column BACCOUNT.ACCOUNTEDUSER
  is '������';
comment on column BACCOUNT.CREATEDDATE
  is '����ʱ��';
comment on column BACCOUNT.CREATEDUSER
  is '������';
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
  is '��������';
comment on column CODERULE.CODEPREFIX
  is '����ǰ׺';
comment on column CODERULE.RULENAME
  is '��������';
comment on column CODERULE.ISNEEDCODEPREFIX
  is '�Ƿ���Ҫ����ǰ׺';
comment on column CODERULE.ISDEFAULT
  is '�Ƿ�Ĭ�Ϲ���';
comment on column CODERULE.STARTNUMBER
  is '��ʼ���';
comment on column CODERULE.NUMBERWIDTH
  is '���λ��';
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
  is '�˵���';
comment on column MENUITEM.MENUID
  is '���';
comment on column MENUITEM.MENUNAME
  is '�˵���';
comment on column MENUITEM.PARENTMENUID
  is '���˵����';
comment on column MENUITEM.MENUADDRESS
  is '���ӵ�ַ';
comment on column MENUITEM.ORDERBY
  is '����';
comment on column MENUITEM.FUNCTIONID
  is '����Id';
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
  is '�ɹ���ͬ';
comment on column PROCUREMENTCONTRACT.CONTRACTID
  is '��ͬ���';
comment on column PROCUREMENTCONTRACT.CONTENT
  is '��Ҫ����';
comment on column PROCUREMENTCONTRACT.CREATEDDATE
  is '��������';
comment on column PROCUREMENTCONTRACT.CONTRACTDATE
  is 'ǩ������';
comment on column PROCUREMENTCONTRACT.SUPPLIER
  is '��Ӧ��';
comment on column PROCUREMENTCONTRACT.OPERATOR
  is '��ͬ������';
comment on column PROCUREMENTCONTRACT.SUBCOMPANY
  is '�ֹ�˾';
comment on column PROCUREMENTCONTRACT.CREATOR
  is '������';
comment on column PROCUREMENTCONTRACT.PSID
  is '�ƻ��ɹ�����          ';
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
  is '��ͬ��ϸ';
comment on column PROCUREMENTCONTRACTDETAIL.CONTRACTDETAILID
  is '��ϸId';
comment on column PROCUREMENTCONTRACTDETAIL.CONTRACTID
  is '��ͬ���';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETCATEGORYID
  is '�豸���';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETNAME
  is '�豸����';
comment on column PROCUREMENTCONTRACTDETAIL.ASSETSPECIFICATION
  is '�豸���';
comment on column PROCUREMENTCONTRACTDETAIL.UNITPRICE
  is '����';
comment on column PROCUREMENTCONTRACTDETAIL.PROCURENUMBER
  is '�ɹ�����';
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
  is '�ɹ��ƻ���';
comment on column PROCUREMENTSCHEDULEHEAD.PSID
  is '����';
comment on column PROCUREMENTSCHEDULEHEAD.PROCUREMENTSCHEDULEDATE
  is '�ƻ��ɹ�����';
comment on column PROCUREMENTSCHEDULEHEAD.REASON
  is '�ɹ�����';
comment on column PROCUREMENTSCHEDULEHEAD.SUBCOMPANY
  is '�ֹ�˾';
comment on column PROCUREMENTSCHEDULEHEAD.APPLYUSER
  is '������';
comment on column PROCUREMENTSCHEDULEHEAD.APPLYDATE
  is '��������';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVEUSER
  is '�����';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVEDATE
  is '�������';
comment on column PROCUREMENTSCHEDULEHEAD.APPROVERESULT
  is '��˽��(ͬ��,�ܾ�)';
comment on column PROCUREMENTSCHEDULEHEAD.REJECTREASON
  is '�ܾ�����';
comment on column PROCUREMENTSCHEDULEHEAD.CREATEDDATE
  is '��������';
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
  is '��ϸId';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETCATEGORYID
  is '�豸���';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETNAME
  is '�豸����';
comment on column PROCUREMENTSCHEDULEDETAIL.ASSETSPECIFICATION
  is '�豸���';
comment on column PROCUREMENTSCHEDULEDETAIL.UNITPRICE
  is '����';
comment on column PROCUREMENTSCHEDULEDETAIL.PLANNUMBER
  is '�ƻ��ɹ�����';
comment on column PROCUREMENTSCHEDULEDETAIL.PSID
  is '�ƻ��ɹ���Id';
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
  is '��ɫ��';
comment on column ROLEINFO.ROLEID
  is '��ɫID';
comment on column ROLEINFO.ROLENAME
  is '��ɫ��';
comment on column ROLEINFO.ROLESTATE
  is '��ɫ״̬';
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
  is '��ɫȨ�ޱ�';
comment on column ROLEPERMISSION.ROLEID
  is '��ɫ���';
comment on column ROLEPERMISSION.MENUID
  is '�˵����';
comment on column ROLEPERMISSION.REMARK
  is '��ע';
comment on column ROLEPERMISSION.LASTMODIFIEDDATE
  is '����޸�ʱ��';
comment on column ROLEPERMISSION.LASTMODIFIEDBY
  is '����޸���';
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
  is '�ֹ�˾��Ϣ��';
comment on column SUBCOMPANYINFO.SUBCOMPANYID
  is '�ֹ�˾���';
comment on column SUBCOMPANYINFO.SUBCOMPANYNAME
  is '�ֹ�˾����';
comment on column SUBCOMPANYINFO.FGSSORTID
  is '�ֹ�˾����ID';
comment on column SUBCOMPANYINFO.SUBCOMPANYCODE
  is '�ֹ�˾����(700,701,702)';
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
  is '�û���ɫ��';
comment on column USERMAPROLEINFO.USERID
  is '�û�ID';
comment on column USERMAPROLEINFO.ROLEID
  is '��ɫID';
comment on column USERMAPROLEINFO.LASTMODIFIEDDATE
  is '����޸�ʱ��';
comment on column USERMAPROLEINFO.LASTMODIFIEDBY
  is '����޸���';
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
values ('ZR70101010001', '0101', '�豸����', '�豸����', 2, 10, 1, '�豸����', 0, 0, '02', to_date('04-05-2012', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), '�豸����', null, '6609');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR70401010001', '0101', '�豸����', '�豸����', 2, 10, 11, '�豸����', 0, 0, '02', to_date('03-05-2012', 'dd-mm-yyyy'), to_date('03-05-2022', 'dd-mm-yyyy'), '�豸����', null, '6613');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR660903010001', '0301', 'NewEquipment', 'NewEquipment', 2, 10, 1, 'NewEquipment', 0, 0, '03', to_date('04-05-2012', 'dd-mm-yyyy'), to_date('04-05-2022', 'dd-mm-yyyy'), 'NewEquipment', null, '6609');
insert into ASSET (ASSETNO, ASSETCATEGORYID, ASSETNAME, STORAGE, STATE, DEPRECIATIONYEAR, UNITPRICE, BRAND, MANAGEMODE, FINANCECATEGORY, SUPPLIERID, PURCHASEDATE, EXPIREDDATE, ASSETSPECIFICATION, STORAGEFLAG, SUBCOMPANY)
values ('ZR660902010001', '0201', '�豸����', '�豸����', 2, 9, 1, '�豸����', 0, 0, '02', to_date('20-03-2012', 'dd-mm-yyyy'), to_date('20-03-2021', 'dd-mm-yyyy'), '�豸����1', null, '6609');
commit;
prompt 4 records loaded
prompt Loading ASSETCATEGORY...
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('01', null, '�ֽ�', null, null, null, '01');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('02', null, '�Ƽ���', null, null, null, '02');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('03', null, '����', null, null, null, '03');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0101', '01', '����', null, null, null, '01');
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0102', '01', 'բ��', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0103', '01', 'LED��ʾ��', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0104', '01', '������', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0201', '02', '������', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0301', '03', 'DVR����', null, null, null, null);
insert into ASSETCATEGORY (ASSETCATEGORYID, ASSETPARENTCATEGORYID, ASSETCATEGORYNAME, REMARK, CREATEDATE, CREATOR, CATEGORYVALUE)
values ('0302', '03', 'DVS����', null, null, null, null);
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
values ('01', '�ֽ�', null);
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK)
values ('02', '�Ƽ���', null);
insert into ASSETSUPPLIER (SUPPLIERID, SUPPLIERNAME, REMARK)
values ('03', '����', null);
commit;
prompt 3 records loaded
prompt Loading BACCOUNT...
prompt Table is empty
prompt Loading CODERULE...
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PCONTRACT', null, 1, 1, 1, 4, 0, 6, 'PCONTRACT201205280006');
insert into CODERULE (CODEPREFIX, RULENAME, ISNEEDCODEPREFIX, ISDEFAULT, STARTNUMBER, NUMBERWIDTH, YEARWIDTH, CURRENTNO, CURRENTSERIALNUMBER)
values ('PSH', '�ɹ��ƻ���', 1, 1, 1, 4, 0, 12, 'PSH201205260012');
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
values ('PSH201205260001', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260002', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260003', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:21:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260004', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260005', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260006', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260007', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '6612', '�ֹ�˾', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 18:22:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('PSH201205260010', to_date('26-05-2012', 'dd-mm-yyyy'), '�ɹ�����: * ', '6613', '�ɹ�����: * ', to_date('26-05-2012', 'dd-mm-yyyy'), null, to_date('27-05-2012 11:01:09', 'dd-mm-yyyy hh24:mi:ss'), 2, '12121', to_date('26-05-2012 21:29:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into PROCUREMENTSCHEDULEHEAD (PSID, PROCUREMENTSCHEDULEDATE, REASON, SUBCOMPANY, APPLYUSER, APPLYDATE, APPROVEUSER, APPROVEDATE, APPROVERESULT, REJECTREASON, CREATEDDATE)
values ('201205260001', to_date('29-05-2012', 'dd-mm-yyyy'), '�ɹ�����', '7542', '�ɹ�����', to_date('29-05-2012', 'dd-mm-yyyy'), null, null, 0, null, to_date('26-05-2012 17:42:59', 'dd-mm-yyyy hh24:mi:ss'));
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
values ('6a71e85a91ec47c09b67a2829a3b1ad2', '0101', '�豸����', '�豸����', 1, 1, 'PSH201205260012');
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
values (6609, 'һ�ֹ�˾', '001', '701');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6611, '���ֹ�˾', '002', '702');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6612, '���ֹ�˾', '003', '703');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (6613, '�ķֹ�˾', '004', '704');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (7542, '�߷ֹ�˾', '007', '707');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (15103, '��ֹ�˾', '005', '705');
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (7544, '�豸����', '029', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (20153, '���ֹ�˾', '788', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (8320, '�����ֹ�˾', '999', null);
insert into SUBCOMPANYINFO (SUBCOMPANYID, SUBCOMPANYNAME, FGSSORTID, SUBCOMPANYCODE)
values (8321, '�ܹ�˾', '700', '700');
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
