/********************************************************************
* File Name:AssetrunplanManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-07-28
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
    public partial class AssetrunplanManagement:BaseManagement
    {
        #region RetrieveAssetrunplanByPlanid
        public Assetrunplan RetrieveAssetrunplanByPlanid(int Planid)
        {
            try
            {
                this.Database.AddInParameter(":Planid", Planid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""ASSETRUNPLAN"" WHERE  ""PLANID""=:Planid ";
                return this.Database.ExecuteToSingle<Assetrunplan>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetrunplanByPlanid
        public List<Assetrunplan> RetrieveAssetrunplanByPlanid(List<int> Planids)
        {
            try
            {
                if(Planids.Count==0){ return new List<Assetrunplan>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETRUNPLAN"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetrunplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetrunplansPaging
        public List<Assetrunplan> RetrieveAssetrunplansPaging(AssetrunplanSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETRUNPLAN"".""PLANID"",""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"",""ASSETRUNPLAN"".""ASSETCATEGORYID"",""ASSETRUNPLAN"".""STORAGEFLAG"",""ASSETRUNPLAN"".""STORAGE"",
                     ""ASSETRUNPLAN"".""PLANDATECYCLE"",""ASSETRUNPLAN"".""CREATEDDATE""
                     FROM ""ASSETRUNPLAN"" 
                    ");
                var condition=new List<string>();
                #region 设备父类别
                if (!string.IsNullOrEmpty(info.Assetparentcategoryid))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid",DbType.AnsiString,"%"+info.Assetparentcategoryid+"%");
                    condition.Add(@" ""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"" LIKE :Assetparentcategoryid");
                }
                #endregion

                #region 设备子类别
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    condition.Add(@" ""ASSETRUNPLAN"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 分公司、项目体标识
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", "%"+info.Storageflag+"%");
                    condition.Add(@" ""ASSETRUNPLAN"".""STORAGEFLAG"" LIKE :Storageflag");
                }
                #endregion

                #region 分公司、项目体ID
                if (!string.IsNullOrEmpty(info.Storage))
                {
                    this.Database.AddInParameter(":Storage", "%"+info.Storage+"%");
                    condition.Add(@" ""ASSETRUNPLAN"".""STORAGE"" LIKE :Storage");
                }
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                if (!string.IsNullOrEmpty(info.Plandatecycle))
                {
                    this.Database.AddInParameter(":Plandatecycle",DbType.AnsiString,"%"+info.Plandatecycle+"%");
                    condition.Add(@" ""ASSETRUNPLAN"".""PLANDATECYCLE"" LIKE :Plandatecycle");
                }
                #endregion

                if(condition.Count>0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETRUNPLAN"".""PLANID"" DESC");
                return this.ExecuteReaderPaging<Assetrunplan>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
