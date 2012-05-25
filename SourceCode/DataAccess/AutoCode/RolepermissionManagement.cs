/********************************************************************
* File Name:RolepermissionManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 5;
        public RolepermissionManagement()
        { }
        public RolepermissionManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateRolepermission
        public Rolepermission CreateRolepermission(Rolepermission info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ROLEPERMISSION"" (""ROLEID"",""MENUID"",""REMARK"",""LASTMODIFIEDDATE"",""LASTMODIFIEDBY"") VALUES (:Roleid,:Menuid,:Remark,:Lastmodifieddate,:Lastmodifiedby)";
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuid", info.Menuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Lastmodifieddate", info.Lastmodifieddate);//DBType:DATE
                this.Database.AddInParameter(":Lastmodifiedby", info.Lastmodifiedby);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateRolepermissionByRoleidMenuid
        public Rolepermission UpdateRolepermissionByRoleidMenuid(Rolepermission info)
        {
            try
            {
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuid", info.Menuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Lastmodifieddate", info.Lastmodifieddate);//DBType:DATE
                this.Database.AddInParameter(":Lastmodifiedby", info.Lastmodifiedby);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""ROLEPERMISSION"" SET  ""REMARK""=:Remark , ""LASTMODIFIEDDATE""=:Lastmodifieddate , ""LASTMODIFIEDBY""=:Lastmodifiedby WHERE  ""ROLEID""=:Roleid AND ""MENUID""=:Menuid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteRolepermissionByRoleidMenuid
        public void DeleteRolepermissionByRoleidMenuid(string Roleid,string Menuid)
        {
            try
            {
                this.Database.AddInParameter(":Roleid", Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuid", Menuid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ROLEPERMISSION"" WHERE  ""ROLEID""=:Roleid AND ""MENUID""=:Menuid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteRolepermissionByRoleidMenuid
        public void DeleteRolepermissionByRoleidMenuid(List<string> Roleids,List<string> Menuids)
        {
            try
            {
                if(Roleids.Count==0&&Menuids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ROLEPERMISSION"" WHERE 1=1");
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
