create or replace public synonym LB_FGS
  for LABOR.LB_FGS;
create or replace public synonym LB_FGS_XMT
  for LABOR.LB_FGS_XMT;
create or replace public synonym T_USER
for LABOR.T_USER;
insert into T_USER (ID, USERCODE, USERNAME, LOGINID, USERPASSWORD, ISLOCK, ADMINFLAG, NOTE, EMAIL, EXT1, OAID)
values ('admin', null, 'π‹¿Ì‘±', 'admin', 'admin', null, null, '705', null, null, null);
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

