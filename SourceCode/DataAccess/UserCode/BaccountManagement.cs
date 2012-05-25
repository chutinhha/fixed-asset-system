/********************************************************************
* File Name:BaccountManagement
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
    public partial class BaccountManagement:BaseManagement
    {
        #region RetrieveBaccountByAssetno
        public Baccount RetrieveBaccountByAssetno(string assetno)
        {
            try
            {
                this.Database.AddInParameter(":ASSETNO", assetno);
                string sqlCommand = @"SELECT * FROM BACCOUNT WHERE  ASSETNO=:ASSETNO";
                return this.Database.ExecuteToSingle<Baccount>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveBaccountByAssetno
        public List<Baccount> RetrieveBaccountByAssetno(List<string> Assetnos)
        {
            try
            {
                if(Assetnos.Count==0){ return new List<Baccount>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""BACCOUNT"" WHERE 1=1");
                if(Assetnos.Count==1)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETNO""=:Assetno0");
                }
                else if(Assetnos.Count>1&&Assetnos.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETNO""=:Assetno0");
                    for (int i = 1; i < Assetnos.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetno"+i.ToString(),Assetnos[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETNO""=:Assetno"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETNO"" DESC");
                return this.Database.ExecuteToList<Baccount>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveBaccountsPaging
        public List<Baccount> RetrieveBaccountsPaging(BaccountSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""BACCOUNT"".""ASSETNO"",""BACCOUNT"".""ASSETNAME"",""BACCOUNT"".""ACCOUNTEDDATE"",""BACCOUNT"".""ACCOUNTEDUSER"",""BACCOUNT"".""CREATEDDATE"",
                     ""BACCOUNT"".""CREATEDUSER""
                     FROM ""BACCOUNT"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""ASSETNO"" LIKE :Assetno");
                }
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%"+info.Assetname+"%");
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""ASSETNAME"" LIKE :Assetname");
                }
                if (info.StartAccounteddate.HasValue)
                {
                    this.Database.AddInParameter(":StartAccounteddate",info.StartAccounteddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""ACCOUNTEDDATE"" >= :StartAccounteddate");
                }
                if (info.EndAccounteddate.HasValue)
                {
                    this.Database.AddInParameter(":EndAccounteddate",info.EndAccounteddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""ACCOUNTEDDATE"" <= :EndAccounteddate");
                }
                if (!string.IsNullOrEmpty(info.Accounteduser))
                {
                    this.Database.AddInParameter(":Accounteduser",DbType.AnsiString,"%"+info.Accounteduser+"%");
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""ACCOUNTEDUSER"" LIKE :Accounteduser");
                }
                if (!string.IsNullOrEmpty(info.Createduser))
                {
                    this.Database.AddInParameter(":Createduser",DbType.AnsiString,"%"+info.Createduser+"%");
                    sqlCommand.AppendLine(@" AND ""BACCOUNT"".""CREATEDUSER"" LIKE :Createduser");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""BACCOUNT"".""ASSETNO"" DESC");
                return this.ExecuteReaderPaging<Baccount>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
