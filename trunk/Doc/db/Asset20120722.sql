delete from menuitem where menuid='001';
delete from menuitem where menuid='001001';
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001', '̨��', '000', null, 1, '001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001001', '�ʲ��Ǽ�̨��', '001', '~/admin/Report_AssetRegister.aspx', 3, '001001', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001002', '��װ��̨��', '001', '~/admin/Report_AssetIntall.aspx', 3, '001002', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001003', '�ƻ���̨��', '001', '~/admin/Report_AssetMove.aspx', 3, '001003', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001004', '�����̨��', '001', '~/admin/Report_AssetRemove.aspx', 3, '001004', null);
insert into MENUITEM (MENUID, MENUNAME, PARENTMENUID, MENUADDRESS, ORDERBY, FUNCTIONID, BUTTONID)
values ('001005', 'ά�޵�̨��', '001', '~/admin/Report_AssetRepair.aspx', 3, '001005', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001001', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001002', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001003', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001004', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
insert into ROLEPERMISSION (ROLEID, MENUID, REMARK, LASTMODIFIEDDATE, LASTMODIFIEDBY, RIGHTCODE)
values ('adminRole', '001005', null, to_date('22-07-2012 23:08:55', 'dd-mm-yyyy hh24:mi:ss'), '����Ա', null);
commit;