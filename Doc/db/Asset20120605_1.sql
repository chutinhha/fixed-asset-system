prompt PL/SQL Developer import file
prompt Created on 2012��6��5�� by Bruce.Huang
set feedback off
set define off
prompt Creating MENUITEM...
create table MENUITEM
(
  MENUID       VARCHAR2(40) not null,
  MENUNAME     NVARCHAR2(50),
  PARENTMENUID VARCHAR2(40),
  MENUADDRESS  VARCHAR2(100),
  ORDERBY      NUMBER(1),
  FUNCTIONID   VARCHAR2(50),
  BUTTONID     VARCHAR2(200)
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
  is '���ܱ��';
comment on column MENUITEM.BUTTONID
  is '��ť��ţ��Զ��ŷָ';
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

prompt Creating ROLEPERMISSION...
create table ROLEPERMISSION
(
  ROLEID           VARCHAR2(40) not null,
  MENUID           VARCHAR2(40) not null,
  REMARK           NVARCHAR2(400),
  LASTMODIFIEDDATE DATE,
  LASTMODIFIEDBY   VARCHAR2(40),
  RIGHTCODE        VARCHAR2(400)
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
comment on column ROLEPERMISSION.RIGHTCODE
  is 'Ȩ�ޱ���(�Զ��ŵķ�ʽ�ָ�)';
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

prompt Disabling triggers for MENUITEM...
alter table MENUITEM disable all triggers;
prompt Disabling triggers for ROLEPERMISSION...
alter table ROLEPERMISSION disable all triggers;
prompt Loading MENUITEM...
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001', '�ɹ���ͬ', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001001', '�ɹ��ƻ�������', '001', '~/admin/ProcurePlanList.aspx', 2, '001001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001002', '�ɹ���ͬ����', '001', '~/admin/ContractList.aspx', 3, '001002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005', 'ϵͳ����', '000', null, 1, '005', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005001', '�û���ɫ����', '005', '~/admin/user_list.aspx', 2, '005001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005002', '��ɫ����', '005', '~/admin/Role_List.aspx', 3, '005002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002', '���յǼ�', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002001', '�豸����', '002', '~/admin/EquipmentList.aspx', 2, '002001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002002', '�豸״̬ͳ��', '002', '~/admin/Report_AssetState.aspx', 3, '002002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002003', '��ŵص�ͳ��', '002', '~/admin/Report_AssetStorageAddress.aspx', 2, '002003', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002004', '�ʲ����ͳ��', '002', '~/admin/Report_AssetCategory.aspx', 3, '002004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003', '��װ����', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003001', '��װ', '003', '~/admin/InstallList.aspx', 2, '003001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003002', 'ά��', '003', '~/admin/RepairList.aspx', 3, '003002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003003', '�ƻ�', '003', '~/admin/MoveList.aspx', 2, '003003', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003004', '���', '003', '~/admin/RemoveList.aspx', 3, '003004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004', '���', '000', null, 1, '004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004001', 'B��', '004', '~/admin/B_Account.aspx', 2, '004001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004002', '����', '004', '~/admin/Asset_Scrapped.aspx', 3, '004002', null);
commit;
prompt 19 records loaded
prompt Loading ROLEPERMISSION...
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '������', null);
commit;
prompt 19 records loaded
prompt Enabling triggers for MENUITEM...
alter table MENUITEM enable all triggers;
prompt Enabling triggers for ROLEPERMISSION...
alter table ROLEPERMISSION enable all triggers;
set feedback on
set define on
prompt Done.
