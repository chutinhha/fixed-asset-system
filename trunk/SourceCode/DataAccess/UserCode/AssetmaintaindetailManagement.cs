/********************************************************************
* File Name:AssetmaintaindetailManagement
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
                string sqlCommand = @"SELECT * FROM ""ASSETMAINTAINDETAIL"" WHERE  ""ASSETMAINTAINID""=:Assetmaintainid";
                sqlCommand += @" ORDER BY ""DETAILID"" DESC";
                return this.Database.ExecuteToList<Assetmaintaindetail>(sqlCommand);
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
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMAINTAINDETAIL"" WHERE 1=1");
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
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMAINTAINDETAIL"".""DETAILID"",""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID"",""ASSETMAINTAINDETAIL"".""ASSETNO"",""ASSETMAINTAINDETAIL"".""PLANMAINTAINDATE"",""ASSETMAINTAINDETAIL"".""ACTUALMAINTAINDATE"",
                     ""ASSETMAINTAINDETAIL"".""MAINTAINCONTENT""

                     FROM ""ASSETMAINTAINDETAIL"" 
                     INNER JOIN ""ASSETMAINTAIN"" ON ""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID""=""ASSETMAINTAIN"".""ASSETMAINTAINID"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                if (!string.IsNullOrEmpty(info.Assetmaintainid))
                {
                    this.Database.AddInParameter(":Assetmaintainid",DbType.AnsiString,"%"+info.Assetmaintainid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ASSETMAINTAINID"" LIKE :Assetmaintainid");
                }
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ASSETNO"" LIKE :Assetno");
                }
                if (info.StartPlanmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanmaintaindate",info.StartPlanmaintaindate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""PLANMAINTAINDATE"" >= :StartPlanmaintaindate");
                }
                if (info.EndPlanmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanmaintaindate",info.EndPlanmaintaindate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""PLANMAINTAINDATE"" <= :EndPlanmaintaindate");
                }
                if (info.StartActualmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualmaintaindate",info.StartActualmaintaindate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ACTUALMAINTAINDATE"" >= :StartActualmaintaindate");
                }
                if (info.EndActualmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualmaintaindate",info.EndActualmaintaindate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""ACTUALMAINTAINDATE"" <= :EndActualmaintaindate");
                }
                if (!string.IsNullOrEmpty(info.Maintaincontent))
                {
                    this.Database.AddInParameter(":Maintaincontent", "%"+info.Maintaincontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINDETAIL"".""MAINTAINCONTENT"" LIKE :Maintaincontent");
                }

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
