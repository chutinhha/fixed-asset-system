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

        #region RetrieveAssetmoveplanByCondition
        public List<Assetmoveplan> RetrieveAssetmoveplanByCondition(string Plandatecycle, string Storageflag, string Storage)
        {
            try
            {
                if (string.IsNullOrEmpty(Plandatecycle) || string.IsNullOrEmpty(Storageflag) || string.IsNullOrEmpty(Storage))
                {
                    return new List<Assetmoveplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVEPLAN"".""PLANID"",""ASSETMOVEPLAN"".""ASSETPARENTCATEGORYID"",""ASSETMOVEPLAN"".""ASSETCATEGORYID""
                    ,""ASSETMOVEPLAN"".""STORAGEFLAG"",""ASSETMOVEPLAN"".""STORAGE""
                    ,""ASSETMOVEPLAN"".""PLANDATECYCLE"",""ASSETMOVEPLAN"".""CREATEDDATE"",""ASSETMOVEPLAN"".""STARTDATE""
                    ,""ASSETMOVEPLAN"".""ENDDATE"",""ASSETMOVEPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETMOVEPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=Assetmoveplan.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();
                #region 分公司、项目体标识
                this.Database.AddInParameter(":Storageflag", Storageflag);
                condition.Add(@" ""ASSETMOVEPLAN"".""STORAGEFLAG"" = :Storageflag");
                this.Database.AddInParameter(":Storage", Storage);
                condition.Add(@" ""ASSETMOVEPLAN"".""STORAGE"" = :Storage");
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", Plandatecycle);
                condition.Add(@" ""ASSETMOVEPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVEPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetmoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmoveplanByCondition
        public List<Assetmoveplan> RetrieveAssetmoveplanByCondition(AssetmoveplanSearch search)
        {
            try
            {
                if (string.IsNullOrEmpty(search.Plandatecycle) || string.IsNullOrEmpty(search.Storageflag) || string.IsNullOrEmpty(search.Storage))
                {
                    return new List<Assetmoveplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVEPLAN"".""PLANID"",""ASSETMOVEPLAN"".""ASSETPARENTCATEGORYID"",""ASSETMOVEPLAN"".""ASSETCATEGORYID""
                    ,""ASSETMOVEPLAN"".""STORAGEFLAG"",""ASSETMOVEPLAN"".""STORAGE""
                    ,""ASSETMOVEPLAN"".""PLANDATECYCLE"",""ASSETMOVEPLAN"".""CREATEDDATE"",""ASSETMOVEPLAN"".""STARTDATE""
                    ,""ASSETMOVEPLAN"".""ENDDATE"",""ASSETMOVEPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETMOVEPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=Assetmoveplan.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", search.Plandatecycle);
                condition.Add(@" ""ASSETMOVEPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                #region 项目体ID或分公司ID

                var subsqlcondition = new StringBuilder();
                if (search.Storageflag == Vstorageaddress.RootCompany)
                {
                    subsqlcondition.AppendLine(@"  ASSETMOVEPLAN.STORAGEFLAG = :STORAGEFLAG ");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                }
                else if (search.Storageflag == Vstorageaddress.Project)
                {
                    subsqlcondition.AppendLine(@"  ASSETMOVEPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETMOVEPLAN.STORAGE = :Storage");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Project);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                }
                else if (search.Storageflag == Vstorageaddress.Subcompany)
                {
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                    subsqlcondition.AppendLine(@" ((ASSETMOVEPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETMOVEPLAN.STORAGE = :Storage )");
                    if (search.ProjectIds.Count > 0)
                    {
                        this.Database.AddInParameter(":Storagetitle0", DbType.AnsiString, Vstorageaddress.Project);
                        this.Database.AddInParameter(":Storage0", DbType.AnsiString, search.ProjectIds[0]);
                        subsqlcondition.AppendLine(@" OR (ASSETMOVEPLAN.STORAGEFLAG = :Storagetitle0  AND (ASSETMOVEPLAN.STORAGE = :Storage0 ");
                        for (int i = 1; i < search.ProjectIds.Count; i++)
                        {
                            this.Database.AddInParameter(":Storage" + i.ToString(), search.ProjectIds[i]);
                            subsqlcondition.AppendLine(@" OR ASSETMOVEPLAN.STORAGE=:Storage" + i.ToString());
                        }
                        subsqlcondition.Append(")");
                        subsqlcondition.Append(")");
                    }
                    subsqlcondition.Append(")");
                }
                else
                {
                    return new List<Assetmoveplan>();
                }

                if (subsqlcondition.Length > 0)
                    condition.Add(subsqlcondition.ToString());
                #endregion

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVEPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetmoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
