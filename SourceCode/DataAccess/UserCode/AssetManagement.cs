/********************************************************************
* File Name:AssetManagement
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
    public partial class AssetManagement : BaseManagement
    {
        #region RetrieveAssetByAssetno
        public Asset RetrieveAssetByAssetno(string assetno)
        {
            try
            {
                this.Database.AddInParameter(":ASSETNO", assetno);
                string sqlCommand = @"SELECT * FROM ASSET WHERE  ASSETNO=:ASSETNO";
                return this.Database.ExecuteToSingle<Asset>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetByAssetno
        public List<Asset> RetrieveAssetByAssetno(List<string> Assetnos)
        {
            try
            {
                if (Assetnos.Count == 0) { return new List<Asset>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSET"" WHERE 1=1");
                if (Assetnos.Count == 1)
                {
                    this.Database.AddInParameter(":Assetno" + 0.ToString(), Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETNO""=:Assetno0");
                }
                else if (Assetnos.Count > 1 && Assetnos.Count <= 2000)
                {
                    this.Database.AddInParameter(":Assetno" + 0.ToString(), Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETNO""=:Assetno0");
                    for (int i = 1; i < Assetnos.Count; i++)
                    {
                        this.Database.AddInParameter(":Assetno" + i.ToString(), Assetnos[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSETNO""=:Assetno" + i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETNO"" DESC");
                return this.Database.ExecuteToList<Asset>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsPaging
        public List<Asset> RetrieveAssetsPaging(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"" AS ASSETCATEGORYID,""ASSET"".""ASSETNAME"",""ASSET"".""STORAGE"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""UNITPRICE"",""ASSET"".""BRAND"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",
                     ""ASSET"".""SUPPLIERID"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE"",""ASSET"".""ASSETSPECIFICATION"",""ASSET"".""STORAGEFLAG"",
                     ""ASSET"".""SUBCOMPANY""
                     FROM ""ASSET"" ,""ASSETCATEGORY"" 
                     WHERE ""ASSET"".""ASSETCATEGORYID""=""ASSETCATEGORY"".""ASSETCATEGORYID""");
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, "%" + info.Assetno + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNO"" LIKE :Assetno");
                }

                #region 资产分类
                if (!string.IsNullOrEmpty(info.FirstLevelCategoryId))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid", DbType.AnsiString,  info.FirstLevelCategoryId);
                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"" = :Assetparentcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETCATEGORYID"" = :Assetcategoryid");
                }
                #endregion

                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%" + info.Assetname + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNAME"" LIKE :Assetname");
                }
                if (!string.IsNullOrEmpty(info.Storage))
                {
                    this.Database.AddInParameter(":Storage", "%" + info.Storage + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""STORAGE"" LIKE :Storage");
                }
                if (!string.IsNullOrEmpty(info.Brand))
                {
                    this.Database.AddInParameter(":Brand", "%" + info.Brand + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""BRAND"" LIKE :Brand");
                }
                if (!string.IsNullOrEmpty(info.Supplierid))
                {
                    this.Database.AddInParameter(":Supplierid", "%" + info.Supplierid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""SUPPLIERID"" LIKE :Supplierid");
                }
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
                if (!string.IsNullOrEmpty(info.Assetspecification))
                {
                    this.Database.AddInParameter(":Assetspecification", "%" + info.Assetspecification + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETSPECIFICATION"" LIKE :Assetspecification");
                }
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", "%" + info.Storageflag + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""STORAGEFLAG"" LIKE :Storageflag");
                }
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany", DbType.AnsiString, "%" + info.Subcompany + "%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                if (info.States.Count > 0)
                {
                    this.Database.AddInParameter(":State", info.States[0]);
                    sqlCommand.AppendLine(@" AND (""ASSET"".""STATE""=:State");
                    for (int i = 1; i < info.States.Count; i++)
                    {
                        this.Database.AddInParameter(":State" + i.ToString(), info.States[i]);
                        sqlCommand.AppendLine(@" OR ""ASSET"".""STATE""=:State" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                if (info.FinanceCategories.Count > 0)
                {
                    this.Database.AddInParameter(":FINANCECATEGORY", info.FinanceCategories[0]);
                    sqlCommand.AppendLine(@" AND (""ASSET"".""FINANCECATEGORY""=:FINANCECATEGORY");
                    for (int i = 1; i < info.FinanceCategories.Count; i++)
                    {
                        this.Database.AddInParameter(":FINANCECATEGORY" + i.ToString(), info.FinanceCategories[i]);
                        sqlCommand.AppendLine(@" OR ""ASSET"".""FINANCECATEGORY""=:FINANCECATEGORY" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                if (info.ManageModes.Count > 0)
                {
                    this.Database.AddInParameter(":MANAGEMODE", info.ManageModes[0]);
                    sqlCommand.AppendLine(@" AND (""ASSET"".""MANAGEMODE""=:MANAGEMODE");
                    for (int i = 1; i < info.States.Count; i++)
                    {
                        this.Database.AddInParameter(":MANAGEMODE" + i.ToString(), info.ManageModes[i]);
                        sqlCommand.AppendLine(@" OR ""ASSET"".""MANAGEMODE""=:MANAGEMODE" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSET"".""ASSETNO"" DESC");
                return this.ExecuteReaderPaging<Asset>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion 

        #region RetrieveAssetsUsed
        public List<Asset> RetrieveAssetsUsed(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"" AS ASSETCATEGORYID,""ASSET"".""ASSETNAME"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",""ASSET"".""SUPPLIERID"",""ASSET"".""STORAGEFLAG"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE""
                     FROM ""ASSET"" ,""ASSETCATEGORY"" 
                     WHERE ""ASSET"".""ASSETCATEGORYID""=""ASSETCATEGORY"".""ASSETCATEGORYID"" AND (""ASSET"".""STATE""= 1 OR ""ASSET"".""STATE""= 2) AND ""ASSET"".""EXPIREDDATE""<= Sysdate ");
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
                if (info.FinanceCategories.Count > 0)
                {
                    this.Database.AddInParameter(":FINANCECATEGORY", info.FinanceCategories[0]);
                    sqlCommand.AppendLine(@" AND (""ASSET"".""FINANCECATEGORY""=:FINANCECATEGORY");
                    for (int i = 1; i < info.FinanceCategories.Count; i++)
                    {
                        this.Database.AddInParameter(":FINANCECATEGORY" + i.ToString(), info.FinanceCategories[i]);
                        sqlCommand.AppendLine(@" OR ""ASSET"".""FINANCECATEGORY""=:FINANCECATEGORY" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
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
                sqlCommand.AppendLine(@"  ORDER BY ""ASSET"".""EXPIREDDATE"" DESC");
                return this.ExecuteReaderPaging<Asset>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion 

        #region RetrieveAssetscrappedsRecord
        public List<Asset> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"",""ASSET_SCRAPPED"".""SCRAPPEDDATE"",""ASSET_SCRAPPED"".""SCRAPPEDUSER"",""ASSET_SCRAPPED"".""APPROVEUSER"",
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
                sqlCommand.AppendLine(@"  ORDER BY ""ASSET"".""EXPIREDDATE"" DESC");
                return this.ExecuteReaderPaging<Asset>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion
    }
}
