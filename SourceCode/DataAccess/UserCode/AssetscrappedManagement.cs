/********************************************************************
* File Name:AssetscrappedManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    public partial class AssetscrappedManagement : BaseManagement
    {
        #region RetrieveAssetscrappedByAssetscrappedid
        public Assetscrapped RetrieveAssetscrappedByAssetscrappedid(string assetscrappedid)
        {
            try
            {
                this.Database.AddInParameter(":ASSET_SCRAPPED_ID", assetscrappedid);
                string sqlCommand = @"SELECT * FROM ASSET_SCRAPPED WHERE  ASSET_SCRAPPED_ID=:ASSET_SCRAPPED_ID";
                return this.Database.ExecuteToSingle<Assetscrapped>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetscrappedByAssetscrappedid
        public List<Assetscrapped> RetrieveAssetscrappedByAssetscrappedid(List<string> Assetscrappedids)
        {
            try
            {
                if (Assetscrappedids.Count == 0) { return new List<Assetscrapped>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSET_SCRAPPED"" WHERE 1=1");
                if (Assetscrappedids.Count == 1)
                {
                    this.Database.AddInParameter(":Assetscrappedid" + 0.ToString(), Assetscrappedids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED_ID""=:Assetscrappedid0");
                }
                else if (Assetscrappedids.Count > 1 && Assetscrappedids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Assetscrappedid" + 0.ToString(), Assetscrappedids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSET_SCRAPPED_ID""=:Assetscrappedid0");
                    for (int i = 1; i < Assetscrappedids.Count; i++)
                    {
                        this.Database.AddInParameter(":Assetscrappedid" + i.ToString(), Assetscrappedids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSET_SCRAPPED_ID""=:Assetscrappedid" + i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSET_SCRAPPED_ID"" DESC");
                return this.Database.ExecuteToList<Assetscrapped>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetscrappedsPaging
        public List<Assetscrapped> RetrieveAssetscrappedsPaging(AssetscrappedSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"",""ASSET_SCRAPPED"".""SCRAPPEDDATE"",""ASSET_SCRAPPED"".""SCRAPPEDUSER"",""ASSET_SCRAPPED"".""ASSETNO"",""ASSET_SCRAPPED"".""APPROVEUSER"",
                     ""ASSET_SCRAPPED"".""APPROVEDATE"",""ASSET_SCRAPPED"".""REJECTREASON"",""ASSET_SCRAPPED"".""CREATEDDATE"",""ASSET_SCRAPPED"".""CREATOR"",""ASSET_SCRAPPED"".""APPROVEDSTATE""
                     FROM ""ASSET_SCRAPPED"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Assetscrappedid))
                {
                    this.Database.AddInParameter(":Assetscrappedid", DbType.AnsiString, "%" + info.Assetscrappedid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"" LIKE :Assetscrappedid");
                }
                if (info.StartScrappeddate.HasValue)
                {
                    this.Database.AddInParameter(":StartScrappeddate", info.StartScrappeddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""SCRAPPEDDATE"" >= :StartScrappeddate");
                }
                if (info.EndScrappeddate.HasValue)
                {
                    this.Database.AddInParameter(":EndScrappeddate", info.EndScrappeddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""SCRAPPEDDATE"" <= :EndScrappeddate");
                }
                if (!string.IsNullOrEmpty(info.Scrappeduser))
                {
                    this.Database.AddInParameter(":Scrappeduser", "%" + info.Scrappeduser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""SCRAPPEDUSER"" LIKE :Scrappeduser");
                }
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, "%" + info.Assetno + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""ASSETNO"" LIKE :Assetno");
                }
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%" + info.Approveuser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""APPROVEUSER"" LIKE :Approveuser");
                }
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate", info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate", info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""APPROVEDATE"" <= :EndApprovedate");
                }
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%" + info.Rejectreason + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""REJECTREASON"" LIKE :Rejectreason");
                }
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator", "%" + info.Creator + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED"".""CREATOR"" LIKE :Creator");
                }
                if (info.Approvedstates.Count > 0)
                {
                    this.Database.AddInParameter(":Approvedstate", info.Approvedstates[0]);
                    sqlCommand.AppendLine(@" AND (""ASSET_SCRAPPED"".""APPROVEDSTATE""=:Approvedstate");
                    for (int i = 1; i < info.Approvedstates.Count; i++)
                    {
                        this.Database.AddInParameter(":Approvedstate" + i.ToString(), info.Approvedstates[i]);
                        sqlCommand.AppendLine(@" OR ""ASSET_SCRAPPED"".""APPROVEDSTATE""=:Approvedstate" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"" DESC");
                return this.ExecuteReaderPaging<Assetscrapped>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetscrappedsRecord
        public List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"",""ASSET_SCRAPPED"".""SCRAPPEDDATE"",""ASSET_SCRAPPED"".""SCRAPPEDUSER"",""ASSET_SCRAPPED"".""ASSETNO"",""ASSET_SCRAPPED"".""APPROVEUSER"",
                     ""ASSET_SCRAPPED"".""APPROVEDATE"",""ASSET_SCRAPPED"".""REJECTREASON"",""ASSET_SCRAPPED"".""CREATEDDATE"",""ASSET_SCRAPPED"".""CREATOR"",""ASSET_SCRAPPED"".""APPROVEDSTATE"",""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"" AS ASSETCATEGORYID,""ASSET"".""ASSETNAME"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",""ASSET"".""SUPPLIERID"",""ASSET"".""STORAGEFLAG"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE""
                     FROM ""ASSET_SCRAPPED"",""ASSET"" 
                     WHERE ""ASSET"".""ASSETNO""=""ASSET_SCRAPPED"".""ASSETNO""");

                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, "%" + info.Assetno + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNO"" LIKE :Assetno");
                }
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%" + info.Assetname + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNAME"" LIKE :Assetname");
                }
                #region 资产分类
                if (!string.IsNullOrEmpty(info.FirstLevelCategoryId))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid", DbType.AnsiString, info.FirstLevelCategoryId);
                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"" = :Assetparentcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETCATEGORYID"" = :Assetcategoryid");
                }
                #endregion

                if (info.StartPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPurchasedate", info.StartPurchasedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""PURCHASEDATE"" >= :StartPurchasedate");
                }
                if (info.EndPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPurchasedate", info.EndPurchasedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET"".""PURCHASEDATE"" <= :EndPurchasedate");
                }
                if (info.StartExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":StartExpireddate", info.StartExpireddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""EXPIREDDATE"" >= :StartExpireddate");
                }
                if (info.EndExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":EndExpireddate", info.EndExpireddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET"".""EXPIREDDATE"" <= :EndExpireddate");
                }           
                //sqlCommand.AppendLine(@"  ORDER BY ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"" DESC");
                sqlCommand.AppendLine(@"  ORDER BY ""ASSET"".""EXPIREDDATE"" DESC");
                return this.ExecuteReaderPaging<Assetscrapped>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion
    }
}
