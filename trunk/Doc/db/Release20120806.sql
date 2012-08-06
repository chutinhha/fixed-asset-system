create or replace view v_storage_address as
select 'Supplier' StorageTitle ,to_char(supplierid) as StorageId,to_char(suppliername) as StorageName,'' as SubCompanyId,'' as subcompanyname,to_char(supplierid) as fgssortid
from assetsupplier
union
select 'Subcompany' StorageTitle ,to_char(subcompanyid) as StorageId,to_char(subcompanyname) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname,fgssortid
from subcompanyinfo 
union
select 'Project' StorageTitle ,to_char(xmtid) as StorageId,to_char(xmt) as StorageName,to_char(subcompanyid) as SubCompanyId,to_char(subcompanyname) as subcompanyname,to_char(xmtid) as fgssortid
from lb_fgs_xmt,subcompanyinfo
where fgsid=subcompanyid and ISUSE=1
order by fgssortid asc;
alter table assetmaintain
add reason nvarchar2(200);
comment on column ASSETMAINTAIN.REASON
  is '修复原因';
insert into ASSET_CONFIG (CONFIGID, CATEGORYID, CATEGORYNAME, CONFIGNAME, CONFIGVALUE, CREATEDDATE, CREATOR)
values ('RepairReason1', 'RepairReason', '修复原因', '其他', '其他', null, null);
commit;