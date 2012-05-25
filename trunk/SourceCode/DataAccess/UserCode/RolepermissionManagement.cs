/********************************************************************
* File Name:RolepermissionManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Create Explain:
* Description:DataBase Access Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using FixedAsset.Domain;

namespace FixedAsset.DataAccess
{
    public partial class RolepermissionManagement:BaseManagement
    {
        #region RetrieveRolepermissionByRoleidMenuid
        public Rolepermission RetrieveRolepermissionByRoleidMenuid(string roleid,string menuid)
        {
            try
            {
                this.Database.AddInParameter(":ROLEID", roleid);
                this.Database.AddInParameter(":MENUID", menuid);
                string sqlCommand = @"SELECT * FROM ROLEPERMISSION WHERE  ROLEID=:ROLEID AND MENUID=:MENUID";
                return this.Database.ExecuteToSingle<Rolepermission>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveRolepermissionByRoleidMenuid
        public List<Rolepermission> RetrieveRolepermissionByRoleidMenuid(List<string> Roleids,List<string> Menuids)
        {
            try
            {
                if(Roleids.Count==0&&Menuids.Count==0){ return new List<Rolepermission>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ROLEPERMISSION"" WHERE 1=1");
                if(Roleids.Count==1)
                {
                    this.Database.AddInParameter(":Roleid"+0.ToString(),Roleids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ROLEID""=:Roleid0");
                }
                else if(Roleids.Count>1&&Roleids.Count<=2000)
                {
                    this.Database.AddInParameter(":Roleid"+0.ToString(),Roleids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ROLEID""=:Roleid0");
                    for (int i = 1; i < Roleids.Count; i++)
                    {
                    this.Database.AddInParameter(":Roleid"+i.ToString(),Roleids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ROLEID""=:Roleid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                if(Menuids.Count==1)
                {
                    this.Database.AddInParameter(":Menuid"+0.ToString(),Menuids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""MENUID""=:Menuid0");
                }
                else if(Menuids.Count>1&&Menuids.Count<=2000)
                {
                    this.Database.AddInParameter(":Menuid"+0.ToString(),Menuids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""MENUID""=:Menuid0");
                    for (int i = 1; i < Menuids.Count; i++)
                    {
                    this.Database.AddInParameter(":Menuid"+i.ToString(),Menuids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""MENUID""=:Menuid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ROLEID"" DESC,""MENUID"" DESC");
                return this.Database.ExecuteToList<Rolepermission>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveRolepermissionsPaging
        public List<Rolepermission> RetrieveRolepermissionsPaging(RolepermissionSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ROLEPERMISSION"".""ROLEID"",""ROLEPERMISSION"".""MENUID"",""ROLEPERMISSION"".""REMARK"",""ROLEPERMISSION"".""LASTMODIFIEDDATE"",""ROLEPERMISSION"".""LASTMODIFIEDBY""
                     FROM ""ROLEPERMISSION"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Roleid))
                {
                    this.Database.AddInParameter(":Roleid",DbType.AnsiString,"%"+info.Roleid+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""ROLEID"" LIKE :Roleid");
                }
                if (!string.IsNullOrEmpty(info.Menuid))
                {
                    this.Database.AddInParameter(":Menuid",DbType.AnsiString,"%"+info.Menuid+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""MENUID"" LIKE :Menuid");
                }
                if (!string.IsNullOrEmpty(info.Remark))
                {
                    this.Database.AddInParameter(":Remark", "%"+info.Remark+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""REMARK"" LIKE :Remark");
                }
                if (info.StartLastmodifieddate.HasValue)
                {
                    this.Database.AddInParameter(":StartLastmodifieddate",info.StartLastmodifieddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""LASTMODIFIEDDATE"" >= :StartLastmodifieddate");
                }
                if (info.EndLastmodifieddate.HasValue)
                {
                    this.Database.AddInParameter(":EndLastmodifieddate",info.EndLastmodifieddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""LASTMODIFIEDDATE"" <= :EndLastmodifieddate");
                }
                if (!string.IsNullOrEmpty(info.Lastmodifiedby))
                {
                    this.Database.AddInParameter(":Lastmodifiedby",DbType.AnsiString,"%"+info.Lastmodifiedby+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEPERMISSION"".""LASTMODIFIEDBY"" LIKE :Lastmodifiedby");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ROLEPERMISSION"".""ROLEID"" DESC,""ROLEPERMISSION"".""MENUID"" DESC");
                return this.ExecuteReaderPaging<Rolepermission>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
