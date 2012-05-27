/********************************************************************
* File Name:SubcompanyinfoManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-27
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
    public partial class SubcompanyinfoManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 4;
        public SubcompanyinfoManagement()
        { }
        public SubcompanyinfoManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateSubcompanyinfo
        public Subcompanyinfo CreateSubcompanyinfo(Subcompanyinfo info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""SUBCOMPANYINFO"" (""SUBCOMPANYID"",""SUBCOMPANYNAME"",""FGSSORTID"",""SUBCOMPANYCODE"") VALUES (:Subcompanyid,:Subcompanyname,:Fgssortid,:Subcompanycode)";
                this.Database.AddInParameter(":Subcompanyid", info.Subcompanyid);//DBType:NUMBER
                this.Database.AddInParameter(":Subcompanyname", info.Subcompanyname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgssortid", info.Fgssortid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Subcompanycode", info.Subcompanycode);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateSubcompanyinfoBySubcompanyid
        public Subcompanyinfo UpdateSubcompanyinfoBySubcompanyid(Subcompanyinfo info)
        {
            try
            {
                this.Database.AddInParameter(":Subcompanyid", info.Subcompanyid);//DBType:NUMBER
                this.Database.AddInParameter(":Subcompanyname", info.Subcompanyname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgssortid", info.Fgssortid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Subcompanycode", info.Subcompanycode);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""SUBCOMPANYINFO"" SET  ""SUBCOMPANYNAME""=:Subcompanyname , ""FGSSORTID""=:Fgssortid , ""SUBCOMPANYCODE""=:Subcompanycode WHERE  ""SUBCOMPANYID""=:Subcompanyid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteSubcompanyinfoBySubcompanyid
        public void DeleteSubcompanyinfoBySubcompanyid(decimal Subcompanyid)
        {
            try
            {
                this.Database.AddInParameter(":Subcompanyid", Subcompanyid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""SUBCOMPANYINFO"" WHERE  ""SUBCOMPANYID""=:Subcompanyid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteSubcompanyinfoBySubcompanyid
        public void DeleteSubcompanyinfoBySubcompanyid(List<decimal> Subcompanyids)
        {
            try
            {
                if(Subcompanyids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""SUBCOMPANYINFO"" WHERE 1=1");
                if(Subcompanyids.Count==1)
                {
                    this.Database.AddInParameter(":Subcompanyid"+0.ToString(),Subcompanyids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""SUBCOMPANYID""=:Subcompanyid0");
                }
                else if(Subcompanyids.Count>1&&Subcompanyids.Count<=2000)
                {
                    this.Database.AddInParameter(":Subcompanyid"+0.ToString(),Subcompanyids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""SUBCOMPANYID""=:Subcompanyid0");
                    for (int i = 1; i < Subcompanyids.Count; i++)
                    {
                    this.Database.AddInParameter(":Subcompanyid"+i.ToString(),Subcompanyids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""SUBCOMPANYID""=:Subcompanyid"+i.ToString());
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
