grant select any table to asset;
create or replace public synonym LB_FGS
  for LABOR.LB_FGS;
create or replace public synonym LB_FGS_XMT
  for LABOR.LB_FGS_XMT;
create or replace public synonym T_USER
for LABOR.T_USER;
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('admin', null, '管理员', 'admin', 'admin', null, null, '705', null, null, null);
commit;
create or replace public synonym H_CBS
for IDEAL_OA.H_CBS;
create or replace public synonym H_CONTRACT
for IDEAL_OA.H_CONTRACT;
create or replace public synonym H_CONTRACT_DETAIL
for IDEAL_OA.H_CONTRACT_DETAIL;
create or replace public synonym H_LISTINFO
for IDEAL_OA.H_LISTINFO;
create or replace public synonym H_LISTITEM
for IDEAL_OA.H_LISTITEM;
drop table assetsupplier;
create or replace view assetsupplier as
select to_char(INSTANCEID) as supplierid,CBS as suppliername
from h_cbs
where iszr=1;
create or replace view v_storage_address as
select 'Supplier' StorageTitle ,to_char(supplierid) as StorageId,to_char(suppliername) as StorageName,'' as SubCompanyId,'' as subcompanyname
from assetsupplier
union
select 'Subcompany' StorageTitle ,to_char(subcompanyid) as StorageId,to_char(subcompanyname) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname
from subcompanyinfo
union
select 'Project' StorageTitle ,to_char(xmtid) as StorageId,to_char(xmt) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname
from lb_fgs_xmt,subcompanyinfo
where fgsid=subcompanyid and ISUSE=1;
update asset 
set supplierid=999990001
where supplierid=01;
update asset 
set supplierid=999990002
where supplierid=02;
update asset 
set supplierid=999990003
where supplierid=03;
UPDATE menuitem
SET menuaddress='~/admin/New_Contract_List.aspx',menuname='设备导入',parentmenuid='002'
WHERE MENUID='001002'
commit;
