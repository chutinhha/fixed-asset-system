/********************************************************************
* File Name:AssetremoveplanManagement
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
    public partial class AssetremoveplanManagement:BaseManagement
    {
        #region RetrieveAssetremoveplanByPlanid
        public Assetremoveplan RetrieveAssetremoveplanByPlanid(int Planid)
        {
            try
            {
                this.Database.AddInParameter(":Planid", Planid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""ASSETREMOVEPLAN"" WHERE  ""PLANID""=:Planid ";
                return this.Database.ExecuteToSingle<Assetremoveplan>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremoveplanByPlanid
        public List<Assetremoveplan> RetrieveAssetremoveplanByPlanid(List<int> Planids)
        {
            try
            {
                if(Planids.Count==0){ return new List<Assetremoveplan>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETREMOVEPLAN"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetremoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremoveplanByCondition
        public List<Assetremoveplan> RetrieveAssetremoveplanByCondition(string Plandatecycle, string Storageflag, string Storage)
        {
            try
            {
                if (string.IsNullOrEmpty(Plandatecycle) || string.IsNullOrEmpty(Storageflag) || string.IsNullOrEmpty(Storage))
                {
                    return new List<Assetremoveplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETREMOVEPLAN"".""PLANID"",""ASSETREMOVEPLAN"".""ASSETPARENTCATEGORYID"",""ASSETREMOVEPLAN"".""ASSETCATEGORYID""
                    ,""ASSETREMOVEPLAN"".""STORAGEFLAG"",""ASSETREMOVEPLAN"".""STORAGE""
                    ,""ASSETREMOVEPLAN"".""PLANDATECYCLE"",""ASSETREMOVEPLAN"".""CREATEDDATE"",""ASSETREMOVEPLAN"".""STARTDATE""
                    ,""ASSETREMOVEPLAN"".""ENDDATE"",""ASSETREMOVEPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETREMOVEPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=ASSETREMOVEPLAN.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();
                #region 分公司、项目体标识
                this.Database.AddInParameter(":Storageflag", Storageflag);
                condition.Add(@" ""ASSETREMOVEPLAN"".""STORAGEFLAG"" = :Storageflag");
                this.Database.AddInParameter(":Storage", Storage);
                condition.Add(@" ""ASSETREMOVEPLAN"".""STORAGE"" = :Storage");
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", Plandatecycle);
                condition.Add(@" ""ASSETREMOVEPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETREMOVEPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetremoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremoveplanByCondition
        public List<Assetremoveplan> RetrieveAssetremoveplanByCondition(AssetremoveplanSearch search)
        {
            try
            {
                if (string.IsNullOrEmpty(search.Plandatecycle) || string.IsNullOrEmpty(search.Storageflag) || string.IsNullOrEmpty(search.Storage))
                {
                    return new List<Assetremoveplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETREMOVEPLAN"".""PLANID"",""ASSETREMOVEPLAN"".""ASSETPARENTCATEGORYID"",""ASSETREMOVEPLAN"".""ASSETCATEGORYID""
                    ,""ASSETREMOVEPLAN"".""STORAGEFLAG"",""ASSETREMOVEPLAN"".""STORAGE""
                    ,""ASSETREMOVEPLAN"".""PLANDATECYCLE"",""ASSETREMOVEPLAN"".""CREATEDDATE"",""ASSETREMOVEPLAN"".""STARTDATE""
                    ,""ASSETREMOVEPLAN"".""ENDDATE"",""ASSETREMOVEPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETREMOVEPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=ASSETREMOVEPLAN.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", search.Plandatecycle);
                condition.Add(@" ""ASSETREMOVEPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                #region 项目体ID或分公司ID

                var subsqlcondition = new StringBuilder();
                if (search.Storageflag == Vstorageaddress.RootCompany)
                {
                    subsqlcondition.AppendLine(@"  ASSETREMOVEPLAN.STORAGEFLAG = :STORAGEFLAG ");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                }
                else if (search.Storageflag == Vstorageaddress.Project)
                {
                    subsqlcondition.AppendLine(@"  ASSETREMOVEPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETREMOVEPLAN.STORAGE = :Storage");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Project);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                }
                else if (search.Storageflag == Vstorageaddress.Subcompany)
                {
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                    subsqlcondition.AppendLine(@" ((ASSETREMOVEPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETREMOVEPLAN.STORAGE = :Storage )");
                    if (search.ProjectIds.Count > 0)
                    {
                        this.Database.AddInParameter(":Storagetitle0", DbType.AnsiString, Vstorageaddress.Project);
                        this.Database.AddInParameter(":Storage0", DbType.AnsiString, search.ProjectIds[0]);
                        subsqlcondition.AppendLine(@" OR (ASSETREMOVEPLAN.STORAGEFLAG = :Storagetitle0  AND (ASSETREMOVEPLAN.STORAGE = :Storage0 ");
                        for (int i = 1; i < search.ProjectIds.Count; i++)
                        {
                            this.Database.AddInParameter(":Storage" + i.ToString(), search.ProjectIds[i]);
                            subsqlcondition.AppendLine(@" OR ASSETREMOVEPLAN.STORAGE=:Storage" + i.ToString());
                        }
                        subsqlcondition.Append(")");
                        subsqlcondition.Append(")");
                    }
                    subsqlcondition.Append(")");
                }
                else
                {
                    return new List<Assetremoveplan>();
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
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETREMOVEPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetremoveplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion  
    }
}
