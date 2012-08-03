/********************************************************************
* File Name:AssetmoveplanManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-08-03
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
    public partial class AssetmoveplanManagement:BaseManagement
    {
        #region RetrieveAssetmoveplanByPlanid
        public Assetmoveplan RetrieveAssetmoveplanByPlanid(int Planid)
        {
            try
            {
                this.Database.AddInParameter(":Planid", Planid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""ASSETMOVEPLAN"" WHERE  ""PLANID""=:Planid ";
                return this.Database.ExecuteToSingle<Assetmoveplan>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmoveplanByPlanid
        public List<Assetmoveplan> RetrieveAssetmoveplanByPlanid(List<int> Planids)
        {
            try
            {
                if(Planids.Count==0){ return new List<Assetmoveplan>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMOVEPLAN"" WHERE 1=1");
                if(Planids.Count==1)
                {
                    this.Database.AddInParameter(":Planid"+0.ToString(),Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""PLANID""=:Planid0");
                }
                else if(Planids.Count>1&&Planids.Count<=2000)
                {
                    this.Database.AddInParameter(":Planid"+0.ToString(),Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""PLANID""=:Planid0");
                    for (int i = 1; i < Planids.Count; i++)
                    {
                    this.Database.AddInParameter(":Planid"+i.ToString(),Planids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""PLANID""=:Planid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetmoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmoveplansPaging
        public List<Assetmoveplan> RetrieveAssetmoveplansPaging(AssetmoveplanSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVEPLAN"".""PLANID"",""ASSETMOVEPLAN"".""ASSETPARENTCATEGORYID"",""ASSETMOVEPLAN"".""ASSETCATEGORYID"",""ASSETMOVEPLAN"".""STORAGEFLAG"",""ASSETMOVEPLAN"".""STORAGE"",
                     ""ASSETMOVEPLAN"".""PLANDATECYCLE"",""ASSETMOVEPLAN"".""CREATEDDATE"",""ASSETMOVEPLAN"".""STARTDATE"",""ASSETMOVEPLAN"".""ENDDATE"",""ASSETMOVEPLAN"".""PLANCATEGORY"",
                     ""ASSETMOVEPLAN"".""ASSETCOUNT""
                     FROM ""ASSETMOVEPLAN"" 
                    ");
                var condition=new List<string>();
                #region 设备父类别
                if (!string.IsNullOrEmpty(info.Assetparentcategoryid))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid",DbType.AnsiString,"%"+info.Assetparentcategoryid+"%");
                    condition.Add(@" ""ASSETMOVEPLAN"".""ASSETPARENTCATEGORYID"" LIKE :Assetparentcategoryid");
                }
                #endregion

                #region 设备子类别
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    condition.Add(@" ""ASSETMOVEPLAN"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 分公司、项目体标识
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", "%"+info.Storageflag+"%");
                    condition.Add(@" ""ASSETMOVEPLAN"".""STORAGEFLAG"" LIKE :Storageflag");
                }
                #endregion

                #region 分公司、项目体ID
                if (!string.IsNullOrEmpty(info.Storage))
                {
                    this.Database.AddInParameter(":Storage", "%"+info.Storage+"%");
                    condition.Add(@" ""ASSETMOVEPLAN"".""STORAGE"" LIKE :Storage");
                }
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                if (!string.IsNullOrEmpty(info.Plandatecycle))
                {
                    this.Database.AddInParameter(":Plandatecycle",DbType.AnsiString,"%"+info.Plandatecycle+"%");
                    condition.Add(@" ""ASSETMOVEPLAN"".""PLANDATECYCLE"" LIKE :Plandatecycle");
                }
                #endregion

                //#region 开始日期
                //if (info.StartStartdate.HasValue)
                //{
                //    this.Database.AddInParameter(":StartStartdate",info.StartStartdate.Value.Date);
                //    condition.Add(@"  ""ASSETMOVEPLAN"".""STARTDATE"" >= :StartStartdate");
                //}
                //if (info.EndStartdate.HasValue)
                //{
                //    this.Database.AddInParameter(":EndStartdate",info.EndStartdate.Value.Date.AddDays(1).AddSeconds(-1));
                //    condition.Add(@" ""ASSETMOVEPLAN"".""STARTDATE"" <= :EndStartdate");
                //}
                //#endregion

                //#region 结束日期
                //if (info.StartEnddate.HasValue)
                //{
                //    this.Database.AddInParameter(":StartEnddate",info.StartEnddate.Value.Date);
                //    condition.Add(@"  ""ASSETMOVEPLAN"".""ENDDATE"" >= :StartEnddate");
                //}
                //if (info.EndEnddate.HasValue)
                //{
                //    this.Database.AddInParameter(":EndEnddate",info.EndEnddate.Value.Date.AddDays(1).AddSeconds(-1));
                //    condition.Add(@" ""ASSETMOVEPLAN"".""ENDDATE"" <= :EndEnddate");
                //}
                //#endregion

                if(condition.Count>0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVEPLAN"".""PLANID"" DESC");
                return this.ExecuteReaderPaging<Assetmoveplan>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
