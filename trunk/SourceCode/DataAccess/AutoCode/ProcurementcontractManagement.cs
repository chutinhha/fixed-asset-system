/********************************************************************
* File Name:ProcurementcontractManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 9;
        public ProcurementcontractManagement()
        { }
        public ProcurementcontractManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateProcurementcontract
        public Procurementcontract CreateProcurementcontract(Procurementcontract info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""PROCUREMENTCONTRACT"" (""CONTRACTID"",""CONTENT"",""CREATEDDATE"",""CONTRACTDATE"",""SUPPLIER"",""OPERATOR"",""SUBCOMPANY"",""CREATOR"",""PSID"") VALUES (:Contractid,:Content,:Createddate,:Contractdate,:Supplier,:Operator,:Subcompany,:Creator,:Psid)";
                this.Database.AddInParameter(":Contractid", info.Contractid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Content", info.Content);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Contractdate", info.Contractdate);//DBType:DATE
                this.Database.AddInParameter(":Supplier", info.Supplier);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Operator", info.Operator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Psid", info.Psid);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateProcurementcontractByContractid
        public Procurementcontract UpdateProcurementcontractByContractid(Procurementcontract info)
        {
            try
            {
                this.Database.AddInParameter(":Contractid", info.Contractid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Content", info.Content);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Contractdate", info.Contractdate);//DBType:DATE
                this.Database.AddInParameter(":Supplier", info.Supplier);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Operator", info.Operator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Psid", info.Psid);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""PROCUREMENTCONTRACT"" SET  ""CONTENT""=:Content , ""CREATEDDATE""=:Createddate , ""CONTRACTDATE""=:Contractdate , ""SUPPLIER""=:Supplier , ""OPERATOR""=:Operator , ""SUBCOMPANY""=:Subcompany , ""CREATOR""=:Creator , ""PSID""=:Psid WHERE  ""CONTRACTID""=:Contractid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteProcurementcontractByContractid
        public void DeleteProcurementcontractByContractid(string Contractid)
        {
            try
            {
                this.Database.AddInParameter(":Contractid", Contractid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""PROCUREMENTCONTRACT"" WHERE  ""CONTRACTID""=:Contractid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteProcurementcontractByContractid
        public void DeleteProcurementcontractByContractid(List<string> Contractids)
        {
            try
            {
                if(Contractids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""PROCUREMENTCONTRACT"" WHERE 1=1");
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

                this.Database.ExecuteNonQuery(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
