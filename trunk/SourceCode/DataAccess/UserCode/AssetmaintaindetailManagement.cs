/********************************************************************
* File Name:AssetmaintaindetailManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
    public partial class AssetmaintaindetailManagement:BaseManagement
    {
        #region RetrieveAssetmaintaindetailByDetailid
        public Assetmaintaindetail RetrieveAssetmaintaindetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM ASSETMAINTAINDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Assetmaintaindetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmaintaindetailByDetailid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Assetmaintaindetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMAINTAINDETAIL"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetmaintaindetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveListInfoByForeignKeys RetrieveAssetmaintaindetailListByAssetmaintainid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailListByAssetmaintainid(string Assetmaintainid)
        {
            try
            {
                this.Database.AddInParameter(":Assetmaintainid", Assetmaintainid);//DBType:VARCHAR2
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.Append(@"SELECT ASSETMAINTAINDETAIL.*
                                    ,ASSET.ASSETCATEGORYID,ASSET.ASSETNAME,ASSET.STATE,ASSET.PURCHASEDATE
                                    ,ASSET.UNITPRICE,ASSET.BRAND,ASSET.FINANCECATEGORY
                                    FROM ""ASSETMAINTAINDETAIL"" ,ASSET
                                    WHERE  ASSETMAINTAINDETAIL.ASSETNO=ASSET.ASSETNO AND ""ASSETMAINTAINID""=:Assetmaintainid
                                 ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Assetmaintaindetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmaintaindetailListByAssetmaintainid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailListByAssetmaintainid(List<string> Assetmaintainids)
        {
            try
            {
                if(Assetmaintainids.Count==0){ return new List<Assetmaintaindetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.Append(@"SELECT ASSETMAINTAINDETAIL.*
                                    ,ASSET.ASSETCATEGORYID,ASSET.ASSETNAME,ASSET.STATE,ASSET.PURCHASEDATE
                                    ,ASSET.UNITPRICE,ASSET.BRAND,ASSET.FINANCECATEGORY
                                    FROM ""ASSETMAINTAINDETAIL"" ,ASSET
                                    WHERE  ASSETMAINTAINDETAIL.ASSETNO=ASSET.ASSETNO 
                                 ");
                if(Assetmaintainids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINID""=:Assetmaintainid0");
                }
                else if(Assetmaintainids.Count>1&&Assetmaintainids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMAINTAINID""=:Assetmaintainid0");
                    for (int i = 1; i < Assetmaintainids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmaintainid"+i.ToString(),Assetmaintainids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMAINTAINID""=:Assetmaintainid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Assetmaintaindetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCountOfAssetmaintaindetailByAssetmaintainid
        public int RetrieveCountOfAssetmaintaindetailByAssetmaintainid(List<string> Assetmaintainids)
        {
            try
            {
                if(Assetmaintainids.Count==0){ return 0;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT COUNT(*)  FROM  ""ASSETMAINTAINDETAIL"" WHERE 1=1");
                if(Assetmaintainids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINID""=:Assetmaintainid0");
                }
                else if(Assetmaintainids.Count>1&&Assetmaintainids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMAINTAINID""=:Assetmaintainid0");
                    for (int i = 1; i < Assetmaintainids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmaintainid"+i.ToString(),Assetmaintainids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMAINTAINID""=:Assetmaintainid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                return int.Parse(this.Database.ExecuteScalar(sqlCommand.ToString()).ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmaintaindetailsPaging
        public List<AssetmaintaindetailEx> RetrieveAssetmaintaindetailsPaging(AssetmaintaindetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMAINTAINDETAIL"".""DETAILID"",""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID"",""ASSETMAINTAINDETAIL"".""ASSETNO"",""ASSETMAINTAINDETAIL"".""PLANDATE"",""ASSETMAINTAINDETAIL"".""ACTUALDATE"",
                     ""ASSETMAINTAINDETAIL"".""MAINTAINCONTENT""
                     FROM ""ASSETMAINTAINDETAIL"" 
                     INNER JOIN ""ASSETMAINTAIN"" ON ""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID""=""ASSETMAINTAIN"".""ASSETMAINTAINID"" 
                     WHERE 1=1");

                #region 明细编号
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                #endregion

                #region 设备维修编号
                if (!string.IsNullOrEmpty(info.Assetmaintainid))
                {
                    this.Database.AddInParameter(":Assetmaintainid",DbType.AnsiString,"%"+info.Assetmaintainid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID"" LIKE :Assetmaintainid");
                }
                #endregion

                #region 设备编号
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, info.Assetno);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ASSETNO"" = :Assetno");
                }
                #endregion

                #region 计划维修日期
                if (info.StartPlandate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlandate",info.StartPlandate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""PLANDATE"" >= :StartPlandate");
                }
                if (info.EndPlandate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlandate",info.EndPlandate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""PLANDATE"" <= :EndPlandate");
                }
                #endregion

                #region 实际维修日期
                if (info.StartActualdate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualdate",info.StartActualdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ACTUALDATE"" >= :StartActualdate");
                }
                if (info.EndActualdate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualdate",info.EndActualdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ACTUALDATE"" <= :EndActualdate");
                }
                #endregion

                #region 维修说明
                if (!string.IsNullOrEmpty(info.Maintaincontent))
                {
                    this.Database.AddInParameter(":Maintaincontent", "%"+info.Maintaincontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""MAINTAINCONTENT"" LIKE :Maintaincontent");
                }
                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMAINTAINDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<AssetmaintaindetailEx>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
