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
order by fgssortid asc