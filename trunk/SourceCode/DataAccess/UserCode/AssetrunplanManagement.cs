/********************************************************************
* File Name:AssetrunplanManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-07-30
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
    public partial class AssetrunplanManagement : BaseManagement
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
                if (Planids.Count == 0) { return new List<Assetrunplan>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETRUNPLAN"" WHERE 1=1");
                if (Planids.Count == 1)
                {
                    this.Database.AddInParameter(":Planid" + 0.ToString(), Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""PLANID""=:Planid0");
                }
                else if (Planids.Count > 1 && Planids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Planid" + 0.ToString(), Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""PLANID""=:Planid0");
                    for (int i = 1; i < Planids.Count; i++)
                    {
                        this.Database.AddInParameter(":Planid" + i.ToString(), Planids[i]);//DBType:NUMBER
                        sqlCommand.AppendLine(@" OR ""PLANID""=:Planid" + i.ToString());
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

        #region RetrieveAssetrunplanByCondition
        public  List<Assetrunplan> RetrieveAssetrunplanByCondition(string Plandatecycle,string Storageflag,string Storage)
        {
            try
            {    
                if(string.IsNullOrEmpty(Plandatecycle)||string.IsNullOrEmpty(Storageflag)||string.IsNullOrEmpty(Storage))
                {
                    return new List<Assetrunplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETRUNPLAN"".""PLANID"",""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"",""ASSETRUNPLAN"".""ASSETCATEGORYID""
                    ,""ASSETRUNPLAN"".""STORAGEFLAG"",""ASSETRUNPLAN"".""STORAGE""
                    ,""ASSETRUNPLAN"".""PLANDATECYCLE"",""ASSETRUNPLAN"".""CREATEDDATE"",""ASSETRUNPLAN"".""STARTDATE""
                    ,""ASSETRUNPLAN"".""ENDDATE"",""ASSETRUNPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETRUNPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=ASSETRUNPLAN.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();
                #region 分公司、项目体标识
                this.Database.AddInParameter(":Storageflag", Storageflag);
                condition.Add(@" ""ASSETRUNPLAN"".""STORAGEFLAG"" = :Storageflag");
                this.Database.AddInParameter(":Storage", Storage);
                condition.Add(@" ""ASSETRUNPLAN"".""STORAGE"" = :Storage");
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", Plandatecycle);
                condition.Add(@" ""ASSETRUNPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETRUNPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetrunplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetrunplanByCondition
        public List<Assetrunplan> RetrieveAssetrunplanByCondition(AssetrunplanSearch search)
        {
            try
            {
                if (string.IsNullOrEmpty(search.Plandatecycle) || string.IsNullOrEmpty(search.Storageflag) || string.IsNullOrEmpty(search.Storage))
                {
                    return new List<Assetrunplan>();
                }
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETRUNPLAN"".""PLANID"",""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"",""ASSETRUNPLAN"".""ASSETCATEGORYID""
                    ,""ASSETRUNPLAN"".""STORAGEFLAG"",""ASSETRUNPLAN"".""STORAGE""
                    ,""ASSETRUNPLAN"".""PLANDATECYCLE"",""ASSETRUNPLAN"".""CREATEDDATE"",""ASSETRUNPLAN"".""STARTDATE""
                    ,""ASSETRUNPLAN"".""ENDDATE"",""ASSETRUNPLAN"".""PLANCATEGORY"",ASSETCOUNT
                    ,f.ASSETCATEGORYNAME AS Assetparentcategoryname,e.ASSETCATEGORYNAME AS Assetsubcategoryname
                      FROM ""ASSETRUNPLAN""
                      INNER JOIN ASSETCATEGORY e on e.ASSETCATEGORYID=ASSETRUNPLAN.ASSETCATEGORYID 
                      INNER JOIN ASSETCATEGORY f on f.ASSETCATEGORYID=e.ASSETPARENTCATEGORYID
                    ");

                var condition = new List<string>();
                //#region 分公司、项目体标识
                //this.Database.AddInParameter(":Storageflag", search.Storageflag);
                //condition.Add(@" ""ASSETRUNPLAN"".""STORAGEFLAG"" = :Storageflag");
                //this.Database.AddInParameter(":Storage", search.Storage);
                //condition.Add(@" ""ASSETRUNPLAN"".""STORAGE"" = :Storage");
                //#endregion

                #region 时间段（如：周计划，20120723-20120729）
                this.Database.AddInParameter(":Plandatecycle", search.Plandatecycle);
                condition.Add(@" ""ASSETRUNPLAN"".""PLANDATECYCLE"" = :Plandatecycle");
                #endregion

                #region 项目体ID或分公司ID

                var subsqlcondition = new StringBuilder();
                if (search.Storageflag == Vstorageaddress.RootCompany)
                {
                    subsqlcondition.AppendLine(@"  ASSETRUNPLAN.STORAGEFLAG = :STORAGEFLAG ");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                }
                else if (search.Storageflag == Vstorageaddress.Project)
                {
                    subsqlcondition.AppendLine(@"  ASSETRUNPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETRUNPLAN.STORAGE = :Storage");
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Project);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                }
                else if (search.Storageflag == Vstorageaddress.Subcompany)
                {
                    this.Database.AddInParameter(":STORAGEFLAG", DbType.AnsiString, Vstorageaddress.Subcompany);
                    this.Database.AddInParameter(":Storage", DbType.AnsiString, search.Storage);
                    subsqlcondition.AppendLine(@" ((ASSETRUNPLAN.STORAGEFLAG = :STORAGEFLAG AND ASSETRUNPLAN.STORAGE = :Storage )");
                    if (search.ProjectIds.Count > 0)
                    {
                        this.Database.AddInParameter(":Storagetitle0", DbType.AnsiString, Vstorageaddress.Project);
                        this.Database.AddInParameter(":Storage0", DbType.AnsiString, search.ProjectIds[0]);
                        subsqlcondition.AppendLine(@" OR (ASSETRUNPLAN.STORAGEFLAG = :Storagetitle0  AND (ASSETRUNPLAN.STORAGE = :Storage0 ");
                        for (int i = 1; i < search.ProjectIds.Count; i++)
                        {
                            this.Database.AddInParameter(":Storage" + i.ToString(), search.ProjectIds[i]);
                            subsqlcondition.AppendLine(@" OR ASSETRUNPLAN.STORAGE=:Storage" + i.ToString());
                        }
                        subsqlcondition.Append(")");
                        subsqlcondition.Append(")");
                    }
                    subsqlcondition.Append(")");
                }
                else
                {
                    return new List<Assetrunplan>();
                }

                if(subsqlcondition.Length > 0)
                    condition.Add(subsqlcondition.ToString());
                #endregion

                if (condition.Count > 0)
                {
                    for (int i = 0; i < condition.Count; i++)
                    {
                        sqlCommand.Append(i == 0 ? " WHERE " : " AND ").Append(condition[i]);
                    }
                }
                sqlCommand.AppendLine(@"  ORDER BY ""ASSETRUNPLAN"".""PLANID"" DESC");
                return this.Database.ExecuteToList<Assetrunplan>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetrunplansPaging
        public List<Assetrunplan> RetrieveAssetrunplansPaging(AssetrunplanSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETRUNPLAN"".""PLANID"",""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"",""ASSETRUNPLAN"".""ASSETCATEGORYID"",""ASSETRUNPLAN"".""STORAGEFLAG"",""ASSETRUNPLAN"".""STORAGE"",
                     ""ASSETRUNPLAN"".""PLANDATECYCLE"",""ASSETRUNPLAN"".""CREATEDDATE"",""ASSETRUNPLAN"".""STARTDATE"",""ASSETRUNPLAN"".""ENDDATE"",ASSETCOUNT,""ASSETRUNPLAN"".""PLANCATEGORY""
                     FROM ""ASSETRUNPLAN"" 
                    ");
                var condition = new List<string>();
                #region 设备父类别
                if (!string.IsNullOrEmpty(info.Assetparentcategoryid))
                {
                    this.Database.AddInParameter(":Assetparentcategoryid", DbType.AnsiString, "%" + info.Assetparentcategoryid + "%");
                    condition.Add(@" ""ASSETRUNPLAN"".""ASSETPARENTCATEGORYID"" LIKE :Assetparentcategoryid");
                }
                #endregion

                #region 设备子类别
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, "%" + info.Assetcategoryid + "%");
                    condition.Add(@" ""ASSETRUNPLAN"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 分公司、项目体标识
                if (!string.IsNullOrEmpty(info.Storageflag))
                {
                    this.Database.AddInParameter(":Storageflag", "%" + info.Storageflag + "%");
                    condition.Add(@" ""ASSETRUNPLAN"".""STORAGEFLAG"" LIKE :Storageflag");
                }
                #endregion

                #region 分公司、项目体ID
                if (!string.IsNullOrEmpty(info.Storage))
                {
                    this.Database.AddInParameter(":Storage", "%" + info.Storage + "%");
                    condition.Add(@" ""ASSETRUNPLAN"".""STORAGE"" LIKE :Storage");
                }
                #endregion

                #region 时间段（如：周计划，20120723-20120729）
                if (!string.IsNullOrEmpty(info.Plandatecycle))
                {
                    this.Database.AddInParameter(":Plandatecycle", DbType.AnsiString, "%" + info.Plandatecycle + "%");
                    condition.Add(@" ""ASSETRUNPLAN"".""PLANDATECYCLE"" LIKE :Plandatecycle");
                }
                #endregion  

                if (condition.Count > 0)
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
