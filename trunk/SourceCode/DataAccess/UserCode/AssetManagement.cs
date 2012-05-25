/********************************************************************
* File Name:AssetManagement
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
    public partial class AssetManagement:BaseManagement
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
                if(Assetnos.Count==0){ return new List<Asset>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSET"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Asset>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsPaging
        public List<Asset> RetrieveAssetsPaging(AssetSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET"".""ASSETNO"",""ASSET"".""ASSETCATEGORYID"",""ASSET"".""ASSETNAME"",""ASSET"".""STORAGE"",""ASSET"".""STATE"",
                     ""ASSET"".""DEPRECIATIONYEAR"",""ASSET"".""UNITPRICE"",""ASSET"".""BRAND"",""ASSET"".""MANAGEMODE"",""ASSET"".""FINANCECATEGORY"",
                     ""ASSET"".""SUPPLIERID"",""ASSET"".""PURCHASEDATE"",""ASSET"".""EXPIREDDATE"",""ASSET"".""ASSETSPECIFICATION"",""ASSET"".""STORAGEFLAG""
                     FROM ""ASSET"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNO"" LIKE :Assetno");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%"+info.Assetname+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETNAME"" LIKE :Assetname");
                }
                if (!string.IsNullOrEmpty(info.Storage))
                {
                    this.Database.AddInParameter(":Storage", "%"+info.Storage+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""STORAGE"" LIKE :Storage");
                }
                if (!string.IsNullOrEmpty(info.Brand))
                {
                    this.Database.AddInParameter(":Brand", "%"+info.Brand+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""BRAND"" LIKE :Brand");
                }
                if (!string.IsNullOrEmpty(info.Supplierid))
                {
                    this.Database.AddInParameter(":Supplierid", "%"+info.Supplierid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""SUPPLIERID"" LIKE :Supplierid");
                }
                if (info.StartPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPurchasedate",info.StartPurchasedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""PURCHASEDATE"" >= :StartPurchasedate");
                }
                if (info.EndPurchasedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPurchasedate",info.EndPurchasedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET"".""PURCHASEDATE"" <= :EndPurchasedate");
                }
                if (info.StartExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":StartExpireddate",info.StartExpireddate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSET"".""EXPIREDDATE"" >= :StartExpireddate");
                }
                if (info.EndExpireddate.HasValue)
                {
                    this.Database.AddInParameter(":EndExpireddate",info.EndExpireddate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSET"".""EXPIREDDATE"" <= :EndExpireddate");
                }
                if (!string.IsNullOrEmpty(info.Assetspecification))
                {
                    this.Database.AddInParameter(":Assetspecification", "%"+info.Assetspecification+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""ASSETSPECIFICATION"" LIKE :Assetspecification");
                }
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", "%"+info.Storageflag+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET"".""STORAGEFLAG"" LIKE :Storageflag");
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
