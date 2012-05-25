/********************************************************************
* File Name:TuserManagement
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
    public partial class TuserManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 11;
        public TuserManagement()
        { }
        public TuserManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateTuser
        public Tuser CreateTuser(Tuser info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""T_USER"" (""ID"",""USERCODE"",""USERNAME"",""LOGINID"",""USERPASSWORD"",""ISLOCK"",""ADMINFLAG"",""NOTE"",""EMAIL"",""EXT1"",""OAID"") VALUES (:Id,:Usercode,:Username,:Loginid,:Userpassword,:Islock,:Adminflag,:Note,:Email,:Ext1,:Oaid)";
                this.Database.AddInParameter(":Id", info.Id);//DBType:VARCHAR2
                this.Database.AddInParameter(":Usercode", info.Usercode);//DBType:VARCHAR2
                this.Database.AddInParameter(":Username", info.Username);//DBType:VARCHAR2
                this.Database.AddInParameter(":Loginid", info.Loginid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Userpassword", info.Userpassword);//DBType:VARCHAR2
                this.Database.AddInParameter(":Islock", info.Islock);//DBType:VARCHAR2
                this.Database.AddInParameter(":Adminflag", info.Adminflag);//DBType:VARCHAR2
                this.Database.AddInParameter(":Note", info.Note);//DBType:VARCHAR2
                this.Database.AddInParameter(":Email", info.Email);//DBType:VARCHAR2
                this.Database.AddInParameter(":Ext1", info.Ext1);//DBType:VARCHAR2
                this.Database.AddInParameter(":Oaid", info.Oaid);//DBType:NUMBER
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateTuserById
        public Tuser UpdateTuserById(Tuser info)
        {
            try
            {
                this.Database.AddInParameter(":Id", info.Id);//DBType:VARCHAR2
                this.Database.AddInParameter(":Usercode", info.Usercode);//DBType:VARCHAR2
                this.Database.AddInParameter(":Username", info.Username);//DBType:VARCHAR2
                this.Database.AddInParameter(":Loginid", info.Loginid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Userpassword", info.Userpassword);//DBType:VARCHAR2
                this.Database.AddInParameter(":Islock", info.Islock);//DBType:VARCHAR2
                this.Database.AddInParameter(":Adminflag", info.Adminflag);//DBType:VARCHAR2
                this.Database.AddInParameter(":Note", info.Note);//DBType:VARCHAR2
                this.Database.AddInParameter(":Email", info.Email);//DBType:VARCHAR2
                this.Database.AddInParameter(":Ext1", info.Ext1);//DBType:VARCHAR2
                this.Database.AddInParameter(":Oaid", info.Oaid);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""T_USER"" SET  ""USERCODE""=:Usercode , ""USERNAME""=:Username , ""LOGINID""=:Loginid , ""USERPASSWORD""=:Userpassword , ""ISLOCK""=:Islock , ""ADMINFLAG""=:Adminflag , ""NOTE""=:Note , ""EMAIL""=:Email , ""EXT1""=:Ext1 , ""OAID""=:Oaid WHERE  ""ID""=:Id";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteTuserById
        public void DeleteTuserById(string Id)
        {
            try
            {
                this.Database.AddInParameter(":Id", Id);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""T_USER"" WHERE  ""ID""=:Id";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteTuserById
        public void DeleteTuserById(List<string> Ids)
        {
            try
            {
                if(Ids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""T_USER"" WHERE 1=1");
                if(Ids.Count==1)
                {
                    this.Database.AddInParameter(":Id"+0.ToString(),Ids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ID""=:Id0");
                }
                else if(Ids.Count>1&&Ids.Count<=2000)
                {
                    this.Database.AddInParameter(":Id"+0.ToString(),Ids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ID""=:Id0");
                    for (int i = 1; i < Ids.Count; i++)
                    {
                    this.Database.AddInParameter(":Id"+i.ToString(),Ids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ID""=:Id"+i.ToString());
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
