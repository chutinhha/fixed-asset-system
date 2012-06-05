prompt PL/SQL Developer import file
prompt Created on 2012年6月5日 by Bruce.Huang
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
  is '功能编号';
comment on column MENUITEM.BUTTONID
  is '按钮编号（以逗号分割）';
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
comment on column ROLEPERMISSION.RIGHTCODE
  is '权限编码(以逗号的方式分割)';
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
values ('001', '采购合同', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001001', '采购计划单管理', '001', '~/admin/ProcurePlanList.aspx', 2, '001001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001002', '采购合同管理', '001', '~/admin/ContractList.aspx', 3, '001002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005', '系统设置', '000', null, 1, '005', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005001', '用户角色分配', '005', '~/admin/user_list.aspx', 2, '005001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('005002', '角色管理', '005', '~/admin/Role_List.aspx', 3, '005002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002', '验收登记', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002001', '设备管理', '002', '~/admin/EquipmentList.aspx', 2, '002001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002002', '设备状态统计', '002', '~/admin/Report_AssetState.aspx', 3, '002002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002003', '存放地点统计', '002', '~/admin/Report_AssetStorageAddress.aspx', 2, '002003', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('002004', '资产类别统计', '002', '~/admin/Report_AssetCategory.aspx', 3, '002004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003', '安装运行', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003001', '安装', '003', '~/admin/InstallList.aspx', 2, '003001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003002', '维修', '003', '~/admin/RepairList.aspx', 3, '003002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003003', '移机', '003', '~/admin/MoveList.aspx', 2, '003003', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('003004', '拆机', '003', '~/admin/RemoveList.aspx', 3, '003004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004', '清产', '000', null, 1, '004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004001', 'B帐', '004', '~/admin/B_Account.aspx', 2, '004001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('004002', '报废', '004', '~/admin/Asset_Scrapped.aspx', 3, '004002', null);
commit;
prompt 19 records loaded
prompt Loading ROLEPERMISSION...
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '002004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003003', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '003004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '004002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '005002', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001', null, to_date('05-06-2012 13:48:51', 'dd-mm-yyyy hh24:mi:ss'), '王玲玲', null);
commit;
prompt 19 records loaded
prompt Enabling triggers for MENUITEM...
alter table MENUITEM enable all triggers;
prompt Enabling triggers for ROLEPERMISSION...
alter table ROLEPERMISSION enable all triggers;
set feedback on
set define on
prompt Done.
