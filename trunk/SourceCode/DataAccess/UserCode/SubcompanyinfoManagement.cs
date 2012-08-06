/********************************************************************
* File Name:SubcompanyinfoManagement
* Copyright (C) 2012 Bruce.Huang 
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
        #region RetrieveSubcompanyinfoBySubcompanyid
        public Subcompanyinfo RetrieveSubcompanyinfoBySubcompanyid(decimal subcompanyid)
        {
            try
            {
                this.Database.AddInParameter(":SUBCOMPANYID", subcompanyid);
                string sqlCommand = @"SELECT * FROM SUBCOMPANYINFO WHERE  SUBCOMPANYID=:SUBCOMPANYID";
                return this.Database.ExecuteToSingle<Subcompanyinfo>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveSubcompanyinfoBySubcompanyid
        public List<Subcompanyinfo> RetrieveSubcompanyinfoBySubcompanyid(List<decimal> Subcompanyids)
        {
            try
            {
                if(Subcompanyids.Count==0){ return new List<Subcompanyinfo>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""SUBCOMPANYINFO"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""SUBCOMPANYID"" DESC");
                return this.Database.ExecuteToList<Subcompanyinfo>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveSubcompanyinfosPaging
        public List<Subcompanyinfo> RetrieveSubcompanyinfosPaging(SubcompanyinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""SUBCOMPANYINFO"".""SUBCOMPANYID"",""SUBCOMPANYINFO"".""SUBCOMPANYNAME"",""SUBCOMPANYINFO"".""FGSSORTID"",""SUBCOMPANYINFO"".""SUBCOMPANYCODE""
                     FROM ""SUBCOMPANYINFO"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Subcompanyname))
                {
                    this.Database.AddInParameter(":Subcompanyname",DbType.AnsiString,"%"+info.Subcompanyname+"%");
                    sqlCommand.AppendLine(@" AND ""SUBCOMPANYINFO"".""SUBCOMPANYNAME"" LIKE :Subcompanyname");
                }
                if (!string.IsNullOrEmpty(info.Fgssortid))
                {
                    this.Database.AddInParameter(":Fgssortid",DbType.AnsiString,"%"+info.Fgssortid+"%");
                    sqlCommand.AppendLine(@" AND ""SUBCOMPANYINFO"".""FGSSORTID"" LIKE :Fgssortid");
                }
                if (!string.IsNullOrEmpty(info.Subcompanycode))
                {
                    this.Database.AddInParameter(":Subcompanycode",DbType.AnsiString,"%"+info.Subcompanycode+"%");
                    sqlCommand.AppendLine(@" AND ""SUBCOMPANYINFO"".""SUBCOMPANYCODE"" LIKE :Subcompanycode");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""SUBCOMPANYINFO"".""FGSSORTID"" ASC");
                return this.ExecuteReaderPaging<Subcompanyinfo>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
