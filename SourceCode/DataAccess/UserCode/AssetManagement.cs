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
using System.Linq;
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
        public Asset RetrieveTopAssetByAssetnoPrefix(string assetNo)
        {
            try
            {
                this.Database.AddInParameter(":Assetno", assetNo + "%");
                string sqlCommand = @"SELECT * FROM ASSET WHERE  ASSETNO LIKE :Assetno AND ROWNUM<2 ORDER BY ASSETNO DESC";
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
                var sqlCommand = new StringBuilder();
                for (int i = 0; i < Assetnos.Count; i++)
                {
                    if (i > 0) {sqlCommand.Append(" UNION");}
                    sqlCommand.AppendFormat(@" SELECT *  FROM  ASSET WHERE ASSETNO=:Assetno{0}",i).AppendLine();
                    this.Database.AddInParameter(":Assetno" + i.ToString(), Assetnos[i]);//DBType:VARCHAR2
                }
                var list=this.Database.ExecuteToList<Asset>(sqlCommand.ToString());
                list = (from p in list orderby p.Assetno descending select p).ToList();
                return list;
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
                     ""ASSET"".""SUBCOMPANY"",""ASSET"".""CONTRACTID""
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
                #region 设备状态
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
                var sqlCommand = new StringBuilder(@" SELECT ""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"" AS ASSETCATEGORYID,""ASSET"".""ASSETNAME"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",""ASSET"".""SUPPLIERID"",""ASSET"".""STORAGEFLAG"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE""
                     FROM ""ASSET"" ,""ASSETCATEGORY"" 
                     WHERE ""ASSET"".""ASSETCATEGORYID""=""ASSETCATEGORY"".""ASSETCATEGORYID"" AND ""ASSET"".""EXPIREDDATE""<= Sysdate ");

                #region 设备状态
                //WHERE ""ASSET"".""ASSETCATEGORYID""=""ASSETCATEGORY"".""ASSETCATEGORYID"" AND (""ASSET"".""STATE""= 1 OR ""ASSET"".""STATE""= 2) AND ""ASSET"".""EXPIREDDATE""<= Sysdate ");
                info.States.Add(AssetState.InUse);
                info.States.Add(AssetState.NoUse);
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
                #endregion

                #region 资产分类
                if (!string.IsNullOrEmpty(info.FirstLevelCategoryId))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid", DbType.AnsiString, info.FirstLevelCategoryId);
                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"" = :Assetparentcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                    sqlCommand.AppendLine(@" AND (""ASSET"".""ASSETCATEGORYID"" = :Assetcategoryid");
                    sqlCommand.AppendLine(@" OR ""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"" = :Assetcategoryid ) ");
                }
                #endregion  

                #region 资产编号
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
                #endregion

                #region 资产存放地点
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    sqlCommand.AppendLine(@" AND ASSET.STORAGEFLAG = :Storagetitle AND c.STORAGE = :Storageid");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storageflag);
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storage);
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

                #region 购入日
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
                #endregion

                #region 过期日期
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
                #endregion

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
        public List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSET_SCRAPPED"".""ASSET_SCRAPPED_ID"",""ASSET_SCRAPPED"".""SCRAPPEDDATE"",""ASSET_SCRAPPED"".""SCRAPPEDUSER"",""ASSET_SCRAPPED"".""APPROVEUSER"",
                     ""ASSET_SCRAPPED"".""APPROVEDATE"",""ASSET_SCRAPPED"".""REJECTREASON"",""ASSET_SCRAPPED"".""CREATEDDATE"",""ASSET_SCRAPPED"".""CREATOR"",""ASSET_SCRAPPED"".""APPROVEDSTATE"",""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"" AS ASSETCATEGORYID,""ASSET"".""ASSETNAME"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",""ASSET"".""SUPPLIERID"",""ASSET"".""STORAGEFLAG"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE""
                     FROM  ""ASSET"" LEFT JOIN ""ASSET_SCRAPPED"" ON ""ASSET"".""ASSETNO""=""ASSET_SCRAPPED"".""ASSETNO""
                     WHERE 1=1");
                #region 设备状态
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
                #endregion

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
                return this.ExecuteReaderPaging<Assetscrapped>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        public List<Asset> RetrieveAllAsset()
        {
            string sqlCommand = @"SELECT * FROM ASSET ";
            return this.Database.ExecuteToList<Asset>(sqlCommand);
        }

        #region RetrieveAssetRegisterReport
        public List<AssetRegisterReport> RetrieveAssetRegisterReport(AssetRegisterSearch info)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" select c.STORAGEFLAG as Storagetitle,c.STORAGE as Storageid, c.assetcategoryid as Assetcategoryid,
                                                        count(c.assetno) as Currentcount
                                                       from asset c ");

                #region 项目体ID或分公司ID)
                if (info.Storagetitle == Vstorageaddress.RootCompany)
                {
                    sqlCommand.AppendLine(@" where (c.STORAGEFLAG = :Storagetitle Or c.STORAGEFLAG = :Storagetitle2)  ");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Subcompany);
                    this.Database.AddInParameter(":Storagetitle2", DbType.AnsiString, Vstorageaddress.Supplier);
                }
                else if (info.Storagetitle == Vstorageaddress.Project)
                {
                    sqlCommand.AppendLine(@" where c.STORAGEFLAG = :Storagetitle AND c.STORAGE = :Storageid");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Project);
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                }
                else if (info.Storagetitle == Vstorageaddress.Subcompany)
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Subcompany);
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                    sqlCommand.AppendLine(@" where ((c.STORAGEFLAG= :Storagetitle AND c.STORAGE = :Storageid )");
                    if (info.ProjectIds.Count > 0)
                    {
                        this.Database.AddInParameter(":Storagetitle0", DbType.AnsiString, Vstorageaddress.Project);
                        this.Database.AddInParameter(":Storageid0", DbType.AnsiString, info.ProjectIds[0]);
                        sqlCommand.AppendLine(@" OR (c.STORAGEFLAG = :Storagetitle0  AND (c.STORAGE = :Storageid0 ");
                        for (int i = 1; i < info.ProjectIds.Count; i++)
                        {
                            this.Database.AddInParameter(":Storageid" + i.ToString(), info.ProjectIds[i]);
                            sqlCommand.AppendLine(@" OR c.STORAGE=:Storageid" + i.ToString());
                        }
                        sqlCommand.Append(")");
                        sqlCommand.Append(")");
                    }
                    sqlCommand.Append(")");
                }
                else if (info.Storagetitle == Vstorageaddress.Supplier)
                {
                    sqlCommand.AppendLine(@" where c.STORAGEFLAG = :Storagetitle AND c.STORAGE = :Storageid");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Supplier);
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                }
                else
                {
                    return new List<AssetRegisterReport>();
                }
                #endregion

                #region 购入日期
                //if (info.StartRegisterDate.HasValue)
                //{
                //    this.Database.AddInParameter(":StartRegisterDate", info.StartRegisterDate.Value.Date);
                //    sqlCommand.AppendLine(@" AND c.PURCHASEDATE >= :StartRegisterDate");
                //}
                //if (info.EndRegisterDate.HasValue)
                //{
                //    this.Database.AddInParameter(":EndRegisterDate", info.EndRegisterDate.Value.Date.AddDays(1).AddSeconds(-1));
                //    sqlCommand.AppendLine(@" AND c.PURCHASEDATE <= :EndRegisterDate");
                //}
                #endregion

                sqlCommand.AppendLine(@"  group by c.STORAGEFLAG,c.STORAGE , c.assetcategoryid");
                return this.Database.ExecuteToList<AssetRegisterReport>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region ReportAssetCategory
        public List<ReportAssetCategory> ReportAssetCategory()
        {
            try
            {
                var sqlCommand = new StringBuilder(@" select c.assetcategoryid as Assetcategoryid,
                                                        count(c.assetno) as Currentcount
                                                       from asset c ");
                sqlCommand.AppendLine(@"  group by c.assetcategoryid");
                return this.Database.ExecuteToList<ReportAssetCategory>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region ReportAssetState
        public List<AssetStateReport> ReportAssetState()
        {
            try
            {
                var sqlCommand = new StringBuilder(@" select c.STATE,
                                                        count(c.assetno) as Currentcount
                                                       from asset c ");
                sqlCommand.AppendLine(@"  group by c.STATE");
                return this.Database.ExecuteToList<AssetStateReport>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetRegisterReport
        public List<AssetStorageReport> RetrieveAssetStorageReport()
        {
            try
            {
                var sqlCommand = new StringBuilder(@" select c.STORAGEFLAG as Storagetitle,c.STORAGE as Storageid, 
                                                        count(c.assetno) as Currentcount
                                                       from asset c ");                                                                                    
                sqlCommand.AppendLine(@"  group by c.STORAGEFLAG,c.STORAGE");
                return this.Database.ExecuteToList<AssetStorageReport>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetRegisterReportDetailInfoPaging
        public List<Asset> RetrieveAssetRegisterReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@"   select c.*  from asset c");

                #region (系统)设备大类
                count = 0;
                if (string.IsNullOrEmpty(info.Assetcategoryid)) { return new List<Asset>(); }
                sqlCommand.AppendLine(@" where c.ASSETCATEGORYID = :Assetcategoryid and c.STORAGEFLAG = :Storagetitle AND c.STORAGE = :Storageid");
                this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                #endregion

                //#region 实际完成日期
                //if (info.StartActualDate.HasValue)
                //{
                //    this.Database.AddInParameter(":StartActualDate", info.StartActualDate.Value.Date);
                //    sqlCommand.AppendLine(@" AND b.ACTUALMOVEDATE >= :StartActualDate");
                //}
                //if (info.EndActualDate.HasValue)
                //{
                //    this.Database.AddInParameter(":EndActualDate", info.EndActualDate.Value.Date.AddDays(1).AddSeconds(-1));
                //    sqlCommand.AppendLine(@" AND b.ACTUALMOVEDATE <= :EndActualDate");
                //}
                //#endregion

                sqlCommand.AppendLine(@"  ORDER BY assetno DESC");
                return this.ExecuteReaderPaging<Asset>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsPagingForZongheSearch
        /// <summary>
        /// 综合查询
        /// </summary>
        /// <param name="info"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public List<Asset> RetrieveAssetsPagingForZongheSearch(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"",""ASSET"".""ASSETNAME"",""ASSET"".""STORAGE"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""UNITPRICE"",""ASSET"".""BRAND"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",
                     ""ASSET"".""SUPPLIERID"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE"",""ASSET"".""ASSETSPECIFICATION"",""ASSET"".""STORAGEFLAG"",
                     ""ASSET"".""SUBCOMPANY"",""ASSET"".""CONTRACTID"",""ASSET"".""CONTRACTDETAILID""
                     ,c.StorageName,c.subcompanyname AS subcompanyname
                     ,b.""SUPPLIERNAME""
                     ,d.""SUBCOMPANYNAME"" AS Subcompanyfullname
                     ,f.ASSETCATEGORYNAME || '-'||e.ASSETCATEGORYNAME AS Categoryallpathname
                     FROM ""ASSET"" 
                     INNER JOIN  v_storage_address c on c.StorageTitle=ASSET.STORAGEFLAG and c.StorageId=ASSET.STORAGE 
                     LEFT JOIN  ASSETSUPPLIER b on b.SUPPLIERID=ASSET.SUPPLIERID 
                     INNER JOIN  SUBCOMPANYINFO d on d.SUBCOMPANYID=ASSET.SUBCOMPANY
                     INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=asset.ASSETCATEGORYID 
                     INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID 
                    ");
                var condition = new List<string>();

                #region 设备编号
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, "%" + info.Assetno + "%");
                    condition.Add(@" ""ASSET"".""ASSETNO"" LIKE :Assetno");
                }
                #endregion

                #region 资产分类
                if (!string.IsNullOrEmpty(info.FirstLevelCategoryId))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid", DbType.AnsiString, info.FirstLevelCategoryId);
                    condition.Add(@"  e.ASSETPARENTCATEGORYID = :Assetparentcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                    condition.Add(@"  ASSET.ASSETCATEGORYID = :Assetcategoryid");
                }
                #endregion

                #region 设备名称
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%" + info.Assetname + "%");
                    condition.Add(@" ""ASSET"".""ASSETNAME"" LIKE :Assetname");
                }
                #endregion

                #region 存放地点
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", info.Storageflag);
                    this.Database.AddInParameter(":Storage", info.Storage);
                    condition.Add(@" ""ASSET"".""STORAGEFLAG"" = :Storageflag");
                    condition.Add(@" ""ASSET"".""STORAGE"" = :Storage");
                }
                #endregion

                #region 设备状态
                if (info.States.Count > 0)
                {
                    this.Database.AddInParameter(":State", info.States[0]);
                    var content = new StringBuilder();
                    content.AppendLine(@"  (""ASSET"".""STATE""=:State");
                    for (int i = 1; i < info.States.Count; i++)
                    {
                        this.Database.AddInParameter(":State" + i.ToString(), info.States[i]);
                        content.AppendLine(@" OR ""ASSET"".""STATE""=:State" + i.ToString());
                    }
                    content.AppendLine(@" )");
                    condition.Add(content.ToString());
                }
                #endregion

                #region 品牌
                if (!string.IsNullOrEmpty(info.Brand))
                {
                    this.Database.AddInParameter(":Brand", "%" + info.Brand + "%");
                    condition.Add(@" ""ASSET"".""BRAND"" LIKE :Brand");
                }
                #endregion

                #region 供应商
                if (!string.IsNullOrEmpty(info.Supplierid))
                {
                    this.Database.AddInParameter(":Supplierid", info.Supplierid);
                    condition.Add(@" ""ASSET"".""SUPPLIERID"" = :Supplierid");
                }
                #endregion

                #region 购入日期
                if (info.StartPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPurchasedate", info.StartPurchasedate.Value.Date);
                    condition.Add(@"  ""ASSET"".""PURCHASEDATE"" >= :StartPurchasedate");
                }
                if (info.EndPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPurchasedate", info.EndPurchasedate.Value.Date.AddDays(1).AddSeconds(-1));
                    condition.Add(@" ""ASSET"".""PURCHASEDATE"" <= :EndPurchasedate");
                }
                #endregion

                #region 折旧到期日期
                if (info.StartExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":StartExpireddate", info.StartExpireddate.Value.Date);
                    condition.Add(@"  ""ASSET"".""EXPIREDDATE"" >= :StartExpireddate");
                }
                if (info.EndExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":EndExpireddate", info.EndExpireddate.Value.Date.AddDays(1).AddSeconds(-1));
                    condition.Add(@" ""ASSET"".""EXPIREDDATE"" <= :EndExpireddate");
                }
                #endregion

                #region 设备规格
                if (!string.IsNullOrEmpty(info.Assetspecification))
                {
                    this.Database.AddInParameter(":Assetspecification", "%" + info.Assetspecification + "%");
                    condition.Add(@" ""ASSET"".""ASSETSPECIFICATION"" LIKE :Assetspecification");
                }
                #endregion

                #region 分公司
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany", DbType.AnsiString, info.Subcompany);
                    condition.Add(@" ""ASSET"".""SUBCOMPANY"" = :Subcompany");
                }
                #endregion 

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
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
    }
}