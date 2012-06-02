/********************************************************************
* File Name:TuserManagement
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
    public partial class TuserManagement:BaseManagement
    {
        #region RetrieveTuserById
        public Tuser RetrieveTuserById(string id)
        {
            try
            {
                this.Database.AddInParameter(":ID", id);
                string sqlCommand = @"SELECT * FROM T_USER WHERE  ID=:ID";
                return this.Database.ExecuteToSingle<Tuser>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        public Tuser RetrieveTuserByLoginid(string Loginid)
        {
            try
            {
                this.Database.AddInParameter(":Loginid", Loginid);
                string sqlCommand = @"SELECT * FROM T_USER WHERE  Loginid=:Loginid";
                return this.Database.ExecuteToSingle<Tuser>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveTuserById
        public List<Tuser> RetrieveTuserById(List<string> Ids)
        {
            try
            {
                if(Ids.Count==0){ return new List<Tuser>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""T_USER"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""ID"" DESC");
                return this.Database.ExecuteToList<Tuser>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveTusersPaging
        public List<Tuser> RetrieveTusersPaging(TuserSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""T_USER"".""ID"",""T_USER"".""USERCODE"",""T_USER"".""USERNAME"",""T_USER"".""LOGINID"",""T_USER"".""USERPASSWORD"",
                     ""T_USER"".""ISLOCK"",""T_USER"".""ADMINFLAG"",""T_USER"".""NOTE"",""T_USER"".""EMAIL"",""T_USER"".""EXT1"",
                     ""T_USER"".""OAID""
                     FROM ""T_USER"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Id))
                {
                    this.Database.AddInParameter(":Id",DbType.AnsiString,"%"+info.Id+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""ID"" LIKE :Id");
                }
                if (!string.IsNullOrEmpty(info.Usercode))
                {
                    this.Database.AddInParameter(":Usercode",DbType.AnsiString,"%"+info.Usercode+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""USERCODE"" LIKE :Usercode");
                }
                if (!string.IsNullOrEmpty(info.Username))
                {
                    this.Database.AddInParameter(":Username",DbType.AnsiString,"%"+info.Username+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""USERNAME"" LIKE :Username");
                }
                if (!string.IsNullOrEmpty(info.Loginid))
                {
                    this.Database.AddInParameter(":Loginid",DbType.AnsiString,"%"+info.Loginid+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""LOGINID"" LIKE :Loginid");
                }
                if (!string.IsNullOrEmpty(info.Userpassword))
                {
                    this.Database.AddInParameter(":Userpassword",DbType.AnsiString,"%"+info.Userpassword+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""USERPASSWORD"" LIKE :Userpassword");
                }
                if (!string.IsNullOrEmpty(info.Islock))
                {
                    this.Database.AddInParameter(":Islock",DbType.AnsiString,"%"+info.Islock+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""ISLOCK"" LIKE :Islock");
                }
                if (!string.IsNullOrEmpty(info.Adminflag))
                {
                    this.Database.AddInParameter(":Adminflag",DbType.AnsiString,"%"+info.Adminflag+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""ADMINFLAG"" LIKE :Adminflag");
                }
                if (!string.IsNullOrEmpty(info.Note))
                {
                    this.Database.AddInParameter(":Note",DbType.AnsiString,"%"+info.Note+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""NOTE"" LIKE :Note");
                }
                if (!string.IsNullOrEmpty(info.Email))
                {
                    this.Database.AddInParameter(":Email",DbType.AnsiString,"%"+info.Email+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""EMAIL"" LIKE :Email");
                }
                if (!string.IsNullOrEmpty(info.Ext1))
                {
                    this.Database.AddInParameter(":Ext1",DbType.AnsiString,"%"+info.Ext1+"%");
                    sqlCommand.AppendLine(@" AND ""T_USER"".""EXT1"" LIKE :Ext1");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""T_USER"".""ID"" DESC");
                return this.ExecuteReaderPaging<Tuser>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
