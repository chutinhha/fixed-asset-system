/********************************************************************
* File Name:UsermaproleinfoManagement
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
    public partial class UsermaproleinfoManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 4;
        public UsermaproleinfoManagement()
        { }
        public UsermaproleinfoManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateUsermaproleinfo
        public Usermaproleinfo CreateUsermaproleinfo(Usermaproleinfo info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""USERMAPROLEINFO"" (""USERID"",""ROLEID"",""LASTMODIFIEDDATE"",""LASTMODIFIEDBY"") VALUES (:Userid,:Roleid,:Lastmodifieddate,:Lastmodifiedby)";
                this.Database.AddInParameter(":Userid", info.Userid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
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

        #region UpdateUsermaproleinfoByUseridRoleid
        public Usermaproleinfo UpdateUsermaproleinfoByUseridRoleid(Usermaproleinfo info)
        {
            try
            {
                this.Database.AddInParameter(":Userid", info.Userid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Roleid", info.Roleid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Lastmodifieddate", info.Lastmodifieddate);//DBType:DATE
                this.Database.AddInParameter(":Lastmodifiedby", info.Lastmodifiedby);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""USERMAPROLEINFO"" SET  ""LASTMODIFIEDDATE""=:Lastmodifieddate , ""LASTMODIFIEDBY""=:Lastmodifiedby WHERE  ""USERID""=:Userid AND ""ROLEID""=:Roleid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteUsermaproleinfoByUseridRoleid
        public void DeleteUsermaproleinfoByUseridRoleid(string Userid,string Roleid)
        {
            try
            {
                this.Database.AddInParameter(":Userid", Userid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Roleid", Roleid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""USERMAPROLEINFO"" WHERE  ""USERID""=:Userid AND ""ROLEID""=:Roleid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteUsermaproleinfoByUseridRoleid
        public void DeleteUsermaproleinfoByUseridRoleid(List<string> Userids,List<string> Roleids)
        {
            try
            {
                if(Userids.Count==0&&Roleids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""USERMAPROLEINFO"" WHERE 1=1");
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
