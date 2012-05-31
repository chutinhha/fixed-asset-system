/********************************************************************
* File Name:ProcurementcontractManagement
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
    public partial class ProcurementcontractManagement:BaseManagement
    {
        #region RetrieveProcurementcontractByContractid
        public Procurementcontract RetrieveProcurementcontractByContractid(string contractid)
        {
            try
            {
                this.Database.AddInParameter(":CONTRACTID", contractid);
                string sqlCommand = @"SELECT * FROM PROCUREMENTCONTRACT WHERE  CONTRACTID=:CONTRACTID";
                return this.Database.ExecuteToSingle<Procurementcontract>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementcontractByContractid
        public List<Procurementcontract> RetrieveProcurementcontractByContractid(List<string> Contractids)
        {
            try
            {
                if(Contractids.Count==0){ return new List<Procurementcontract>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTCONTRACT"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""CONTRACTID"" DESC");
                return this.Database.ExecuteToList<Procurementcontract>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementcontractsPaging
        public List<Procurementcontract> RetrieveProcurementcontractsPaging(ProcurementcontractSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""PROCUREMENTCONTRACT"".""CONTRACTID"",""PROCUREMENTCONTRACT"".""CONTENT"",""PROCUREMENTCONTRACT"".""CREATEDDATE"",
                 ""PROCUREMENTCONTRACT"".""CONTRACTDATE"",""PROCUREMENTCONTRACT"".""SUPPLIER"",""SUPPLIERNAME"",
                     ""PROCUREMENTCONTRACT"".""OPERATOR"",""PROCUREMENTCONTRACT"".""SUBCOMPANY"",""PROCUREMENTCONTRACT"".""CREATOR"",""PROCUREMENTCONTRACT"".""PSID""
                     FROM ""PROCUREMENTCONTRACT"" ,""ASSETSUPPLIER""
                     WHERE PROCUREMENTCONTRACT.SUPPLIER=ASSETSUPPLIER.SUPPLIERID");
                if (!string.IsNullOrEmpty(info.Contractid))
                {
                    this.Database.AddInParameter(":Contractid",DbType.AnsiString,"%"+info.Contractid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""CONTRACTID"" LIKE :Contractid");
                }
                if (!string.IsNullOrEmpty(info.Content))
                {
                    this.Database.AddInParameter(":Content", "%"+info.Content+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""CONTENT"" LIKE :Content");
                }
                if (info.StartContractdate.HasValue)
                {
                    this.Database.AddInParameter(":StartContractdate",info.StartContractdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""CONTRACTDATE"" >= :StartContractdate");
                }
                if (info.EndContractdate.HasValue)
                {
                    this.Database.AddInParameter(":EndContractdate",info.EndContractdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""CONTRACTDATE"" <= :EndContractdate");
                }
                if (!string.IsNullOrEmpty(info.Supplier))
                {
                    this.Database.AddInParameter(":Supplier", "%"+info.Supplier+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""SUPPLIER"" LIKE :Supplier");
                }
                if (!string.IsNullOrEmpty(info.Operator))
                {
                    this.Database.AddInParameter(":Operator", "%"+info.Operator+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""OPERATOR"" LIKE :Operator");
                }
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany",DbType.AnsiString,"%"+info.Subcompany+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator", "%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""CREATOR"" LIKE :Creator");
                }
                if (!string.IsNullOrEmpty(info.Psid))
                {
                    this.Database.AddInParameter(":Psid",DbType.AnsiString,"%"+info.Psid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTCONTRACT"".""PSID"" LIKE :Psid");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""PROCUREMENTCONTRACT"".""CONTRACTID"" DESC");
                return this.ExecuteReaderPaging<Procurementcontract>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
