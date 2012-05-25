/********************************************************************
* File Name:UsermaproleinfoManagement
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
    public partial class UsermaproleinfoManagement:BaseManagement
    {
        #region RetrieveUsermaproleinfoByUseridRoleid
        public Usermaproleinfo RetrieveUsermaproleinfoByUseridRoleid(string userid,string roleid)
        {
            try
            {
                this.Database.AddInParameter(":USERID", userid);
                this.Database.AddInParameter(":ROLEID", roleid);
                string sqlCommand = @"SELECT * FROM USERMAPROLEINFO WHERE  USERID=:USERID AND ROLEID=:ROLEID";
                return this.Database.ExecuteToSingle<Usermaproleinfo>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveUsermaproleinfoByUseridRoleid
        public List<Usermaproleinfo> RetrieveUsermaproleinfoByUseridRoleid(List<string> Userids,List<string> Roleids)
        {
            try
            {
                if(Userids.Count==0&&Roleids.Count==0){ return new List<Usermaproleinfo>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""USERMAPROLEINFO"" WHERE 1=1");
                if(Userids.Count==1)
                {
                    this.Database.AddInParameter(":Userid"+0.ToString(),Userids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""USERID""=:Userid0");
                }
                else if(Userids.Count>1&&Userids.Count<=2000)
                {
                    this.Database.AddInParameter(":Userid"+0.ToString(),Userids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""USERID""=:Userid0");
                    for (int i = 1; i < Userids.Count; i++)
                    {
                    this.Database.AddInParameter(":Userid"+i.ToString(),Userids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""USERID""=:Userid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

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

                sqlCommand.AppendLine(@" ORDER BY ""USERID"" DESC,""ROLEID"" DESC");
                return this.Database.ExecuteToList<Usermaproleinfo>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveUsermaproleinfosPaging
        public List<Usermaproleinfo> RetrieveUsermaproleinfosPaging(UsermaproleinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""USERMAPROLEINFO"".""USERID"",""USERMAPROLEINFO"".""ROLEID"",""USERMAPROLEINFO"".""LASTMODIFIEDDATE"",""USERMAPROLEINFO"".""LASTMODIFIEDBY""
                     FROM ""USERMAPROLEINFO"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Userid))
                {
                    this.Database.AddInParameter(":Userid",DbType.AnsiString,"%"+info.Userid+"%");
                    sqlCommand.AppendLine(@" AND ""USERMAPROLEINFO"".""USERID"" LIKE :Userid");
                }
                if (!string.IsNullOrEmpty(info.Roleid))
                {
                    this.Database.AddInParameter(":Roleid",DbType.AnsiString,"%"+info.Roleid+"%");
                    sqlCommand.AppendLine(@" AND ""USERMAPROLEINFO"".""ROLEID"" LIKE :Roleid");
                }
                if (info.StartLastmodifieddate.HasValue)
                {
                    this.Database.AddInParameter(":StartLastmodifieddate",info.StartLastmodifieddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""USERMAPROLEINFO"".""LASTMODIFIEDDATE"" >= :StartLastmodifieddate");
                }
                if (info.EndLastmodifieddate.HasValue)
                {
                    this.Database.AddInParameter(":EndLastmodifieddate",info.EndLastmodifieddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""USERMAPROLEINFO"".""LASTMODIFIEDDATE"" <= :EndLastmodifieddate");
                }
                if (!string.IsNullOrEmpty(info.Lastmodifiedby))
                {
                    this.Database.AddInParameter(":Lastmodifiedby",DbType.AnsiString,"%"+info.Lastmodifiedby+"%");
                    sqlCommand.AppendLine(@" AND ""USERMAPROLEINFO"".""LASTMODIFIEDBY"" LIKE :Lastmodifiedby");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""USERMAPROLEINFO"".""USERID"" DESC,""USERMAPROLEINFO"".""ROLEID"" DESC");
                return this.ExecuteReaderPaging<Usermaproleinfo>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
