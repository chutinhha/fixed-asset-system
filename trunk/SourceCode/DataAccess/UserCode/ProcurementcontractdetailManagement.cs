/********************************************************************
* File Name:ProcurementcontractdetailManagement
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
    public partial class ProcurementcontractdetailManagement:BaseManagement
    {
        #region RetrieveProcurementcontractdetailByContractdetailid
        public Procurementcontractdetail RetrieveProcurementcontractdetailByContractdetailid(string contractdetailid)
        {
            try
            {
                this.Database.AddInParameter(":CONTRACTDETAILID", contractdetailid);
                string sqlCommand = @"SELECT * FROM PROCUREMENTCONTRACTDETAIL WHERE  CONTRACTDETAILID=:CONTRACTDETAILID";
                return this.Database.ExecuteToSingle<Procurementcontractdetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementcontractdetailByContractdetailid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailByContractdetailid(List<string> Contractdetailids)
        {
            try
            {
                if(Contractdetailids.Count==0){ return new List<Procurementcontractdetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTCONTRACTDETAIL"" WHERE 1=1");
                if(Contractdetailids.Count==1)
                {
                    this.Database.AddInParameter(":Contractdetailid"+0.ToString(),Contractdetailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""CONTRACTDETAILID""=:Contractdetailid0");
                }
                else if(Contractdetailids.Count>1&&Contractdetailids.Count<=2000)
                {
                    this.Database.AddInParameter(":Contractdetailid"+0.ToString(),Contractdetailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""CONTRACTDETAILID""=:Contractdetailid0");
                    for (int i = 1; i < Contractdetailids.Count; i++)
                    {
                    this.Database.AddInParameter(":Contractdetailid"+i.ToString(),Contractdetailids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""CONTRACTDETAILID""=:Contractdetailid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""CONTRACTDETAILID"" DESC");
                return this.Database.ExecuteToList<Procurementcontractdetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveListInfoByForeignKeys RetrieveProcurementcontractdetailListByContractid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailListByContractid(string Contractid)
        {
            try
            {
                this.Database.AddInParameter(":Contractid", Contractid);//DBType:VARCHAR2
                string sqlCommand = @"SELECT * FROM ""PROCUREMENTCONTRACTDETAIL"" WHERE  ""CONTRACTID""=:Contractid";
                sqlCommand += @" ORDER BY ""CONTRACTDETAILID"" DESC";
                return this.Database.ExecuteToList<Procurementcontractdetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementcontractdetailListByContractid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailListByContractid(List<string> Contractids)
        {
            try
            {
                if(Contractids.Count==0){ return new List<Procurementcontractdetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTCONTRACTDETAIL"" WHERE 1=1");
                if(Contractids.Count==1)
                {
                    this.Database.AddInParameter(":Contractid"+0.ToString(),Contractids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""CONTRACTID""=:Contractid0");
                }
                else if(Contractids.Count>1&&Contractids.Count<=2000)
                {
                    this.Database.AddInParameter(":Contractid"+0.ToString(),Contractids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""CONTRACTID""=:Contractid0");
                    for (int i = 1; i < Contractids.Count; i++)
                    {
                    this.Database.AddInParameter(":Contractid"+i.ToString(),Contractids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""CONTRACTID""=:Contractid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""CONTRACTDETAILID"" DESC");
                return this.Database.ExecuteToList<Procurementcontractdetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCountOfProcurementcontractdetailByContractid
        public int RetrieveCountOfProcurementcontractdetailByContractid(List<string> Contractids)
        {
            try
            {
                if(Contractids.Count==0){ return 0;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT COUNT(*)  FROM  ""PROCUREMENTCONTRACTDETAIL"" WHERE 1=1");
                if(Contractids.Count==1)
                {
                    this.Database.AddInParameter(":Contractid"+0.ToString(),Contractids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""CONTRACTID""=:Contractid0");
                }
                else if(Contractids.Count>1&&Contractids.Count<=2000)
                {
                    this.Database.AddInParameter(":Contractid"+0.ToString(),Contractids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""CONTRACTID""=:Contractid0");
                    for (int i = 1; i < Contractids.Count; i++)
                    {
                    this.Database.AddInParameter(":Contractid"+i.ToString(),Contractids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""CONTRACTID""=:Contractid"+i.ToString());
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

        #region RetrieveProcurementcontractdetailsPaging
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailsPaging(ProcurementcontractdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""PROCUREMENTCONTRACTDETAIL"".""CONTRACTDETAILID"",""PROCUREMENTCONTRACTDETAIL"".""CONTRACTID"",""PROCUREMENTCONTRACTDETAIL"".""ASSETCATEGORYID"",""PROCUREMENTCONTRACTDETAIL"".""ASSETNAME"",""PROCUREMENTCONTRACTDETAIL"".""ASSETSPECIFICATION"",
                     ""PROCUREMENTCONTRACTDETAIL"".""UNITPRICE"",""PROCUREMENTCONTRACTDETAIL"".""PROCURENUMBER""
                     ,""PROCUREMENTCONTRACTDETAIL"".""PSDETAILID"",""PROCUREMENTCONTRACTDETAIL"".""PSID""
                     FROM ""PROCUREMENTCONTRACTDETAIL"" 
                     INNER JOIN ""PROCUREMENTCONTRACT"" ON ""PROCUREMENTCONTRACTDETAIL"".""CONTRACTID""=""PROCUREMENTCONTRACT"".""CONTRACTID"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Contractdetailid))
                {
                    this.Database.AddInParameter(":Contractdetailid",DbType.AnsiString,"%"+info.Contractdetailid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACTDETAIL"".""CONTRACTDETAILID"" LIKE :Contractdetailid");
                }
                if (!string.IsNullOrEmpty(info.Contractid))
                {
                    this.Database.AddInParameter(":Contractid",DbType.AnsiString,"%"+info.Contractid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACTDETAIL"".""CONTRACTID"" LIKE :Contractid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACTDETAIL"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%"+info.Assetname+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACTDETAIL"".""ASSETNAME"" LIKE :Assetname");
                }
                if (!string.IsNullOrEmpty(info.Assetspecification))
                {
                    this.Database.AddInParameter(":Assetspecification", "%"+info.Assetspecification+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACTDETAIL"".""ASSETSPECIFICATION"" LIKE :Assetspecification");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""PROCUREMENTCONTRACTDETAIL"".""CONTRACTDETAILID"" DESC");
                return this.ExecuteReaderPaging<Procurementcontractdetail>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
