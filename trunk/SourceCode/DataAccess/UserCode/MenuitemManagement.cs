/********************************************************************
* File Name:MenuitemManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-06-05
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
    public partial class MenuitemManagement:BaseManagement
    {
        #region RetrieveMenuitemByMenuid
        public Menuitem RetrieveMenuitemByMenuid(string menuid)
        {
            try
            {
                this.Database.AddInParameter(":MENUID", menuid);
                string sqlCommand = @"SELECT * FROM MENUITEM WHERE  MENUID=:MENUID";
                return this.Database.ExecuteToSingle<Menuitem>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveMenuitemByMenuid
        public List<Menuitem> RetrieveMenuitemByMenuid(List<string> Menuids)
        {
            try
            {
                if(Menuids.Count==0){ return new List<Menuitem>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""MENUITEM"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""MENUID"" DESC");
                return this.Database.ExecuteToList<Menuitem>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveMenuitemsPaging
        public List<Menuitem> RetrieveMenuitemsPaging(MenuitemSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""MENUITEM"".""MENUID"",""MENUITEM"".""MENUNAME"",""MENUITEM"".""PARENTMENUID"",""MENUITEM"".""MENUADDRESS"",""MENUITEM"".""ORDERBY"",
                     ""MENUITEM"".""FUNCTIONID"",""MENUITEM"".""BUTTONID""
                     FROM ""MENUITEM"" 
                     WHERE 1=1");
                #region ±àºÅ
                if (!string.IsNullOrEmpty(info.Menuid))
                {
                    this.Database.AddInParameter(":Menuid",DbType.AnsiString,"%"+info.Menuid+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""MENUID"" LIKE :Menuid");
                }
                #endregion

                #region ²Ëµ¥Ãû
                if (!string.IsNullOrEmpty(info.Menuname))
                {
                    this.Database.AddInParameter(":Menuname", "%"+info.Menuname+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""MENUNAME"" LIKE :Menuname");
                }
                #endregion

                #region ¸¸²Ëµ¥±àºÅ
                if (!string.IsNullOrEmpty(info.Parentmenuid))
                {
                    this.Database.AddInParameter(":Parentmenuid",DbType.AnsiString,"%"+info.Parentmenuid+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""PARENTMENUID"" LIKE :Parentmenuid");
                }
                #endregion

                #region Á´½ÓµØÖ·
                if (!string.IsNullOrEmpty(info.Menuaddress))
                {
                    this.Database.AddInParameter(":Menuaddress",DbType.AnsiString,"%"+info.Menuaddress+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""MENUADDRESS"" LIKE :Menuaddress");
                }
                #endregion

                #region ¹¦ÄÜ±àºÅ
                if (!string.IsNullOrEmpty(info.Functionid))
                {
                    this.Database.AddInParameter(":Functionid",DbType.AnsiString,"%"+info.Functionid+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""FUNCTIONID"" LIKE :Functionid");
                }
                #endregion

                #region °´Å¥±àºÅ£¨ÒÔ¶ººÅ·Ö¸î£©
                if (!string.IsNullOrEmpty(info.Buttonid))
                {
                    this.Database.AddInParameter(":Buttonid",DbType.AnsiString,"%"+info.Buttonid+"%");
                    sqlCommand.AppendLine(@" AND ""MENUITEM"".""BUTTONID"" LIKE :Buttonid");
                }
                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""MENUITEM"".""MENUID"" DESC");
                return this.ExecuteReaderPaging<Menuitem>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
