/********************************************************************
* File Name:RoleinfoManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-06-03
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
    public partial class RoleinfoManagement : BaseManagement
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

        #region RetrieveRoleinfoByRoleName
        public Roleinfo RetrieveRoleinfoByRoleName(string Rolename)
        {
            try
            {
                this.Database.AddInParameter(":Rolename", Rolename);
                string sqlCommand = @"SELECT * FROM ROLEINFO WHERE  Rolename=:Rolename";
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
                if (Roleids.Count == 0) { return new List<Roleinfo>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ROLEINFO"" WHERE 1=1");
                if (Roleids.Count == 1)
                {
                    this.Database.AddInParameter(":Roleid" + 0.ToString(), Roleids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ROLEID""=:Roleid0");
                }
                else if (Roleids.Count > 1 && Roleids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Roleid" + 0.ToString(), Roleids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ROLEID""=:Roleid0");
                    for (int i = 1; i < Roleids.Count; i++)
                    {
                        this.Database.AddInParameter(":Roleid" + i.ToString(), Roleids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ROLEID""=:Roleid" + i.ToString());
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
        public List<Roleinfo> RetrieveRoleinfosPaging(RoleinfoSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ROLEINFO"".""ROLEID"",""ROLEINFO"".""ROLENAME"",""ROLEINFO"".""ROLESTATE"",""ROLEINFO"".""DESCRIPTION"",""ROLEINFO"".""ALLOWEDIT"",
                     ""ROLEINFO"".""CREATEDDATE"",""ROLEINFO"".""CREATOR"",""ROLEINFO"".""LASTMODIFIEDDATE"",""ROLEINFO"".""LASTMODIFIEDBY""
                     FROM ""ROLEINFO"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Roleid))
                {
                    this.Database.AddInParameter(":Roleid", DbType.AnsiString, "%" + info.Roleid + "%");
                    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""ROLEID"" LIKE :Roleid");
                }
                if (!string.IsNullOrEmpty(info.Rolename))
                {
                    this.Database.AddInParameter(":Rolename", "%" + info.Rolename + "%");
                    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""ROLENAME"" LIKE :Rolename");
                }
                if (info.Rolestates.Count > 0)
                {
                    this.Database.AddInParameter(":Rolestate", info.Rolestates[0]);
                    sqlCommand.AppendLine(@" AND (""ROLEINFO"".""ROLESTATE""=:Rolestate");
                    for (int i = 1; i < info.Rolestates.Count; i++)
                    {
                        this.Database.AddInParameter(":Rolestate" + i.ToString(), info.Rolestates[i]);
                        sqlCommand.AppendLine(@" OR ""ROLEINFO"".""ROLESTATE""=:Rolestate" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                if (!string.IsNullOrEmpty(info.Description))
                {
                    this.Database.AddInParameter(":Description", "%" + info.Description + "%");
                    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""DESCRIPTION"" LIKE :Description");
                }
                //if (!string.IsNullOrEmpty(info.Creator))
                //{
                //    this.Database.AddInParameter(":Creator", "%" + info.Creator + "%");
                //    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""CREATOR"" LIKE :Creator");
                //}
                //if (info.StartLastmodifieddate.HasValue)
                //{
                //    this.Database.AddInParameter(":StartLastmodifieddate", info.StartLastmodifieddate.Value.Date);
                //    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""LASTMODIFIEDDATE"" >= :StartLastmodifieddate");
                //}
                //if (info.EndLastmodifieddate.HasValue)
                //{
                //    this.Database.AddInParameter(":EndLastmodifieddate", info.EndLastmodifieddate.Value.Date.AddDays(1).AddSeconds(-1));
                //    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""LASTMODIFIEDDATE"" <= :EndLastmodifieddate");
                //}
                //if (!string.IsNullOrEmpty(info.Lstmofifiedby))
                //{
                //    this.Database.AddInParameter(":Lstmofifiedby", "%" + info.Lstmofifiedby + "%");
                //    sqlCommand.AppendLine(@" AND ""ROLEINFO"".""LSTMOFIFIEDBY"" LIKE :Lstmofifiedby");
                //}
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
