/********************************************************************
* File Name:AssetsetupdetailManagement
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
    public partial class AssetsetupdetailManagement:BaseManagement
    {
        #region RetrieveAssetsetupdetailByDetailid
        public Assetsetupdetail RetrieveAssetsetupdetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM ASSETSETUPDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Assetsetupdetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsetupdetailByDetailid
        public List<Assetsetupdetail> RetrieveAssetsetupdetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Assetsetupdetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETSETUPDETAIL"" WHERE 1=1");
                if(Detailids.Count==1)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""DETAILID""=:Detailid0");
                }
                else if(Detailids.Count>1&&Detailids.Count<=2000)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""DETAILID""=:Detailid0");
                    for (int i = 1; i < Detailids.Count; i++)
                    {
                    this.Database.AddInParameter(":Detailid"+i.ToString(),Detailids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""DETAILID""=:Detailid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Assetsetupdetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsetupdetailsPaging
        public List<Assetsetupdetail> RetrieveAssetsetupdetailsPaging(AssetsetupdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETSETUPDETAIL"".""DETAILID"",""ASSETSETUPDETAIL"".""SETUPID"",""ASSETSETUPDETAIL"".""ASSETNO"",""ASSETSETUPDETAIL"".""PLANSETUPDATE"",""ASSETSETUPDETAIL"".""ACTUALSETUPDATE"",
                     ""ASSETSETUPDETAIL"".""SETUPCONTENT""
                     FROM ""ASSETSETUPDETAIL"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                if (!string.IsNullOrEmpty(info.Setupid))
                {
                    this.Database.AddInParameter(":Setupid",DbType.AnsiString,"%"+info.Setupid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPDETAIL"".""SETUPID"" LIKE :Setupid");
                }
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPDETAIL"".""ASSETNO"" LIKE :Assetno");
                }
                if (!string.IsNullOrEmpty(info.Setupcontent))
                {
                    this.Database.AddInParameter(":Setupcontent", "%"+info.Setupcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPDETAIL"".""SETUPCONTENT"" LIKE :Setupcontent");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETSETUPDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<Assetsetupdetail>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
