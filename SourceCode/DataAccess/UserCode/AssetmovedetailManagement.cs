/********************************************************************
* File Name:AssetmovedetailManagement
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
    public partial class AssetmovedetailManagement:BaseManagement
    {
        #region RetrieveAssetmovedetailByDetailid
        public Assetmovedetail RetrieveAssetmovedetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM ASSETMOVEDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Assetmovedetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmovedetailByDetailid
        public List<Assetmovedetail> RetrieveAssetmovedetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Assetmovedetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMOVEDETAIL"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetmovedetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveListInfoByForeignKeys RetrieveAssetmovedetailListByAssetmoveid
        public List<Assetmovedetail> RetrieveAssetmovedetailListByAssetmoveid(string Assetmoveid)
        {
            try
            {
                var sqlCommand = new StringBuilder();
                sqlCommand.Append(@"SELECT ASSETMOVEDETAIL.*
                                    ,ASSET.ASSETCATEGORYID,ASSET.ASSETNAME,ASSET.STATE,ASSET.PURCHASEDATE
                                    ,ASSET.UNITPRICE,ASSET.BRAND,ASSET.FINANCECATEGORY
                                    FROM ""ASSETMOVEDETAIL"" INNER JOIN ASSET 
                                    ON  ASSETMOVEDETAIL.ASSETNO=ASSET.ASSETNO WHERE ""ASSETMOVEID""=:Assetmoveid
                                 ORDER BY ""DETAILID"" DESC");
                this.Database.AddInParameter(":Assetmoveid", Assetmoveid);//DBType:VARCHAR2
                return this.Database.ExecuteToList<Assetmovedetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmovedetailListByAssetmoveid
        public List<Assetmovedetail> RetrieveAssetmovedetailListByAssetmoveid(List<string> Assetmoveids)
        {
            try
            {
                if(Assetmoveids.Count==0){ return new List<Assetmovedetail>();}
                var sqlCommand = new StringBuilder();
                sqlCommand.Append(@"SELECT ASSETMOVEDETAIL.*
                                    ,ASSET.ASSETCATEGORYID,ASSET.ASSETNAME,ASSET.STATE,ASSET.PURCHASEDATE
                                    ,ASSET.UNITPRICE,ASSET.BRAND,ASSET.FINANCECATEGORY
                                    FROM ""ASSETMOVEDETAIL""  INNER JOIN ASSET
                                    ON  ASSETMOVEDETAIL.ASSETNO=ASSET.ASSETNO WHERE 1=1");
                if(Assetmoveids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEID""=:Assetmoveid0");
                }
                else if(Assetmoveids.Count>1&&Assetmoveids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMOVEID""=:Assetmoveid0");
                    for (int i = 1; i < Assetmoveids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmoveid"+i.ToString(),Assetmoveids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMOVEID""=:Assetmoveid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Assetmovedetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCountOfAssetmovedetailByAssetmoveid
        public int RetrieveCountOfAssetmovedetailByAssetmoveid(List<string> Assetmoveids)
        {
            try
            {
                if(Assetmoveids.Count==0){ return 0;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT COUNT(*)  FROM  ""ASSETMOVEDETAIL"" WHERE 1=1");
                if(Assetmoveids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEID""=:Assetmoveid0");
                }
                else if(Assetmoveids.Count>1&&Assetmoveids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMOVEID""=:Assetmoveid0");
                    for (int i = 1; i < Assetmoveids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmoveid"+i.ToString(),Assetmoveids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMOVEID""=:Assetmoveid"+i.ToString());
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

        #region RetrieveAssetmovedetailsPaging
        public List<AssetmovedetailEx> RetrieveAssetmovedetailsPaging(AssetmovedetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVEDETAIL"".""DETAILID"",""ASSETMOVEDETAIL"".""ASSETMOVEID"",""ASSETMOVEDETAIL"".""ASSETNO"",""ASSETMOVEDETAIL"".""PLANMOVEDATE"",""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"",
                     ""ASSETMOVEDETAIL"".""MOVEDCONTENT""

                     FROM ""ASSETMOVEDETAIL"" 
                     INNER JOIN ""ASSETMOVE"" ON ""ASSETMOVEDETAIL"".""ASSETMOVEID""=""ASSETMOVE"".""ASSETMOVEID"" 
                     WHERE 1=1");

                #region 明细编号
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                #endregion

                #region 移机单号
                if (!string.IsNullOrEmpty(info.Assetmoveid))
                {
                    this.Database.AddInParameter(":Assetmoveid",DbType.AnsiString,"%"+info.Assetmoveid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ASSETMOVEID"" LIKE :Assetmoveid");
                }
                #endregion

                #region 设备编号
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno", DbType.AnsiString, info.Assetno);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ASSETNO"" = :Assetno");
                }
                #endregion

                #region 计划移机日期
                if (info.StartPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanmovedate",info.StartPlanmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""PLANMOVEDATE"" >= :StartPlanmovedate");
                }
                if (info.EndPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanmovedate",info.EndPlanmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""PLANMOVEDATE"" <= :EndPlanmovedate");
                }
                #endregion

                #region 实际移机日期
                if (info.StartActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualmovedate",info.StartActualmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"" >= :StartActualmovedate");
                }
                if (info.EndActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualmovedate",info.EndActualmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"" <= :EndActualmovedate");
                }
                #endregion

                #region 移机说明
                if (!string.IsNullOrEmpty(info.Movedcontent))
                {
                    this.Database.AddInParameter(":Movedcontent", "%"+info.Movedcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""MOVEDCONTENT"" LIKE :Movedcontent");
                }
                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVEDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<AssetmovedetailEx>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
