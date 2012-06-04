/********************************************************************
* File Name:MenuitemManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 7;
        public MenuitemManagement()
        { }
        public MenuitemManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateMenuitem
        public Menuitem CreateMenuitem(Menuitem info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""MENUITEM"" (""MENUID"",""MENUNAME"",""PARENTMENUID"",""MENUADDRESS"",""ORDERBY"",""FUNCTIONID"",""BUTTONID"") VALUES (:Menuid,:Menuname,:Parentmenuid,:Menuaddress,:Orderby,:Functionid,:Buttonid)";
                this.Database.AddInParameter(":Menuid", info.Menuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuname", info.Menuname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Parentmenuid", info.Parentmenuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuaddress", info.Menuaddress);//DBType:VARCHAR2
                this.Database.AddInParameter(":Orderby", info.Orderby);//DBType:NUMBER
                this.Database.AddInParameter(":Functionid", info.Functionid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Buttonid", info.Buttonid);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateMenuitemByMenuid
        public Menuitem UpdateMenuitemByMenuid(Menuitem info)
        {
            try
            {
                this.Database.AddInParameter(":Menuid", info.Menuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuname", info.Menuname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Parentmenuid", info.Parentmenuid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Menuaddress", info.Menuaddress);//DBType:VARCHAR2
                this.Database.AddInParameter(":Orderby", info.Orderby);//DBType:NUMBER
                this.Database.AddInParameter(":Functionid", info.Functionid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Buttonid", info.Buttonid);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""MENUITEM"" SET  ""MENUNAME""=:Menuname , ""PARENTMENUID""=:Parentmenuid , ""MENUADDRESS""=:Menuaddress , ""ORDERBY""=:Orderby , ""FUNCTIONID""=:Functionid , ""BUTTONID""=:Buttonid WHERE  ""MENUID""=:Menuid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteMenuitemByMenuid
        public void DeleteMenuitemByMenuid(string Menuid)
        {
            try
            {
                this.Database.AddInParameter(":Menuid", Menuid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""MENUITEM"" WHERE  ""MENUID""=:Menuid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteMenuitemByMenuid
        public void DeleteMenuitemByMenuid(List<string> Menuids)
        {
            try
            {
                if(Menuids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""MENUITEM"" WHERE 1=1");
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
