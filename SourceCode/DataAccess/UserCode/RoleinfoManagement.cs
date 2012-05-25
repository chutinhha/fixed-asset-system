/********************************************************************
* File Name:RoleinfoManagement
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
    public partial class RoleinfoManagement:BaseManagement
    {
        #region RetrieveRoleinfoByRoleid
        public Roleinfo RetrieveRoleinfoByRoleid(string roleid)
        {
            try
            {
                this.Database.AddInParameter(":ROLEID", roleid);
                string sqlCommand = @"SELECT * FROM ROLEINFO WHERE  ROLEID=:ROLEID";
                return this.Database.ExecuteToSingle<Roleinfo>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveRoleinfoByRoleid
        public List<Roleinfo> RetrieveRoleinfoByRoleid(List<string> Roleids)
        {
            try
            {
                if(Roleids.Count==0){ return new List<Roleinfo>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ROLEINFO"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""ROLEID"" DESC");
                return this.Database.ExecuteToList<Roleinfo>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveRoleinfosPaging
        public List<Roleinfo> RetrieveRoleinfosPaging(RoleinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ROLEINFO"".""ROLEID"",""ROLEINFO"".""ROLENAME"",""ROLEINFO"".""ROLESTATE""
                     FROM ""ROLEINFO"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Roleid))
                {
                    this.Database.AddInParameter(":Roleid",DbType.AnsiString,"%"+info.Roleid+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""ROLEID"" LIKE :Roleid");
                }
                if (!string.IsNullOrEmpty(info.Rolename))
                {
                    this.Database.AddInParameter(":Rolename", "%"+info.Rolename+"%");
                    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""ROLENAME"" LIKE :Rolename");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ROLEINFO"".""ROLEID"" DESC");
                return this.ExecuteReaderPaging<Roleinfo>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
