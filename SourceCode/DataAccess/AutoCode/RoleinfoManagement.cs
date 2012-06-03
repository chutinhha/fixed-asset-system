/********************************************************************
* File Name:RoleinfoManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 4;
        public RoleinfoManagement()
        { }
        public RoleinfoManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion

        #region CreateRoleinfo
        public Roleinfo CreateRoleinfo(Roleinfo info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ROLEINFO"" (""ROLEID"",""ROLENAME"",""ROLESTATE"",""DESCRIPTION"") VALUES (:Roleid,:Rolename,:Rolestate,:Description)";
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Rolename", info.Rolename);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Rolestate", info.Rolestate);//DBType:NUMBER
                this.Database.AddInParameter(":Description", info.Description);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateRoleinfoByRoleid
        public Roleinfo UpdateRoleinfoByRoleid(Roleinfo info)
        {
            try
            {
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Rolename", info.Rolename);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Rolestate", info.Rolestate);//DBType:NUMBER
                this.Database.AddInParameter(":Description", info.Description);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ROLEINFO"" SET  ""ROLENAME""=:Rolename , ""ROLESTATE""=:Rolestate , ""DESCRIPTION""=:Description WHERE  ""ROLEID""=:Roleid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteRoleinfoByRoleid
        public void DeleteRoleinfoByRoleid(string Roleid)
        {
            try
            {
                this.Database.AddInParameter(":Roleid", Roleid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ROLEINFO"" WHERE  ""ROLEID""=:Roleid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteRoleinfoByRoleid
        public void DeleteRoleinfoByRoleid(List<string> Roleids)
        {
            try
            {
                if (Roleids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ROLEINFO"" WHERE 1=1");
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

                this.Database.ExecuteNonQuery(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
