/********************************************************************
* File Name:ProcurementcontractdetailManagement
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
    public partial class ProcurementcontractdetailManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 7;
        public ProcurementcontractdetailManagement()
        { }
        public ProcurementcontractdetailManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateProcurementcontractdetail
        public Procurementcontractdetail CreateProcurementcontractdetail(Procurementcontractdetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""PROCUREMENTCONTRACTDETAIL"" (""CONTRACTDETAILID"",""CONTRACTID"",""ASSETCATEGORYID"",""ASSETNAME"",""ASSETSPECIFICATION"",""UNITPRICE"",""PROCURENUMBER"") VALUES (:Contractdetailid,:Contractid,:Assetcategoryid,:Assetname,:Assetspecification,:Unitprice,:Procurenumber)";
                this.Database.AddInParameter(":Contractdetailid", info.Contractdetailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contractid", info.Contractid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Procurenumber", info.Procurenumber);//DBType:NUMBER
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateProcurementcontractdetailByContractdetailid
        public Procurementcontractdetail UpdateProcurementcontractdetailByContractdetailid(Procurementcontractdetail info)
        {
            try
            {
                this.Database.AddInParameter(":Contractdetailid", info.Contractdetailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contractid", info.Contractid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Procurenumber", info.Procurenumber);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""PROCUREMENTCONTRACTDETAIL"" SET  ""CONTRACTID""=:Contractid , ""ASSETCATEGORYID""=:Assetcategoryid , ""ASSETNAME""=:Assetname , ""ASSETSPECIFICATION""=:Assetspecification , ""UNITPRICE""=:Unitprice , ""PROCURENUMBER""=:Procurenumber WHERE  ""CONTRACTDETAILID""=:Contractdetailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteProcurementcontractdetailByContractdetailid
        public void DeleteProcurementcontractdetailByContractdetailid(string Contractdetailid)
        {
            try
            {
                this.Database.AddInParameter(":Contractdetailid", Contractdetailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""PROCUREMENTCONTRACTDETAIL"" WHERE  ""CONTRACTDETAILID""=:Contractdetailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteProcurementcontractdetailByContractdetailid
        public void DeleteProcurementcontractdetailByContractdetailid(List<string> Contractdetailids)
        {
            try
            {
                if(Contractdetailids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""PROCUREMENTCONTRACTDETAIL"" WHERE 1=1");
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
