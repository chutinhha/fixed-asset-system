/********************************************************************
* File Name:ProcurementscheduledetailManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-09
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
    public partial class ProcurementscheduledetailManagement : BaseManagement
    {
        #region Construct
        private const int ColumnCount = 7;
        public ProcurementscheduledetailManagement()
        { }
        public ProcurementscheduledetailManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion

        #region CreateProcurementscheduledetail
        public Procurementscheduledetail CreateProcurementscheduledetail(Procurementscheduledetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""PROCUREMENTSCHEDULEDETAIL"" (""DETAILID"",""ASSETCATEGORYID"",""ASSETNAME"",""ASSETSPECIFICATION"",""UNITPRICE"",""PLANNUMBER"",""PSID"") VALUES (:Detailid,:Assetcategoryid,:Assetname,:Assetspecification,:Unitprice,:Plannumber,:Psid)";
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Plannumber", info.Plannumber);//DBType:NUMBER
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

        #region UpdateProcurementscheduledetailByDetailid
        public Procurementscheduledetail UpdateProcurementscheduledetailByDetailid(Procurementscheduledetail info)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Plannumber", info.Plannumber);//DBType:NUMBER
                this.Database.AddInParameter(":Psid", info.Psid);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""PROCUREMENTSCHEDULEDETAIL"" SET  ""ASSETCATEGORYID""=:Assetcategoryid , ""ASSETNAME""=:Assetname , ""ASSETSPECIFICATION""=:Assetspecification , ""UNITPRICE""=:Unitprice , ""PLANNUMBER""=:Plannumber , ""PSID""=:Psid WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteProcurementscheduledetailByDetailid
        public void DeleteProcurementscheduledetailByDetailid(string Detailid)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", Detailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteProcurementscheduledetailByDetailid
        public void DeleteProcurementscheduledetailByDetailid(List<string> Detailids)
        {
            try
            {
                if (Detailids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE 1=1");
                if (Detailids.Count == 1)
                {
                    this.Database.AddInParameter(":Detailid" + 0.ToString(), Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""DETAILID""=:Detailid0");
                }
                else if (Detailids.Count > 1 && Detailids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Detailid" + 0.ToString(), Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""DETAILID""=:Detailid0");
                    for (int i = 1; i < Detailids.Count; i++)
                    {
                        this.Database.AddInParameter(":Detailid" + i.ToString(), Detailids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""DETAILID""=:Detailid" + i.ToString());
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

        #region DeleteProcurementscheduledetailsByPsid
        public void DeleteProcurementscheduledetailsByPsid(List<string> Psids)
        {
            try
            {
                if (Psids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE 1=1");
                if (Psids.Count == 1)
                {
                    this.Database.AddInParameter(":Psid" + 0.ToString(), Psids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""PSID""=:Psid0");
                }
                else if (Psids.Count > 1 && Psids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Psid" + 0.ToString(), Psids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""PSID""=:Psid0");
                    for (int i = 1; i < Psids.Count; i++)
                    {
                        this.Database.AddInParameter(":Psid" + i.ToString(), Psids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""PSID""=:Psid" + i.ToString());
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
