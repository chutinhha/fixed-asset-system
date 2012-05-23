/********************************************************************
* File Name:ProcurementscheduleheadManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-23
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
    public partial class ProcurementscheduleheadManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 11;
        public ProcurementscheduleheadManagement()
        { }
        public ProcurementscheduleheadManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateProcurementschedulehead
        public Procurementschedulehead CreateProcurementschedulehead(Procurementschedulehead info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""PROCUREMENTSCHEDULEHEAD"" (""PSID"",""PROCUREMENTSCHEDULEDATE"",""REASON"",""SUBCOMPANY"",""APPLYUSER"",""APPLYDATE"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""REJECTREASON"",""CREATEDDATE"") VALUES (:Psid,:Procurementscheduledate,:Reason,:Subcompany,:Applyuser,:Applydate,:Approveuser,:Approvedate,:Approveresult,:Rejectreason,:Createddate)";
                this.Database.AddInParameter(":Psid", info.Psid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Procurementscheduledate", info.Procurementscheduledate);//DBType:DATE
                this.Database.AddInParameter(":Reason", info.Reason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applyuser", info.Applyuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:INTERVAL YEAR(2) TO MONTH
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateProcurementscheduleheadByPsid
        public Procurementschedulehead UpdateProcurementscheduleheadByPsid(Procurementschedulehead info)
        {
            try
            {
                this.Database.AddInParameter(":Psid", info.Psid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Procurementscheduledate", info.Procurementscheduledate);//DBType:DATE
                this.Database.AddInParameter(":Reason", info.Reason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applyuser", info.Applyuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:INTERVAL YEAR(2) TO MONTH
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                string sqlCommand = @"UPDATE ""PROCUREMENTSCHEDULEHEAD"" SET  ""PROCUREMENTSCHEDULEDATE""=:Procurementscheduledate , ""REASON""=:Reason , ""SUBCOMPANY""=:Subcompany , ""APPLYUSER""=:Applyuser , ""APPLYDATE""=:Applydate , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""REJECTREASON""=:Rejectreason , ""CREATEDDATE""=:Createddate WHERE  ""PSID""=:Psid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteProcurementscheduleheadByPsid
        public void DeleteProcurementscheduleheadByPsid(string Psid)
        {
            try
            {
                this.Database.AddInParameter(":Psid", Psid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""PROCUREMENTSCHEDULEHEAD"" WHERE  ""PSID""=:Psid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteProcurementscheduleheadByPsid
        public void DeleteProcurementscheduleheadByPsid(List<string> Psids)
        {
            try
            {
                if(Psids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""PROCUREMENTSCHEDULEHEAD"" WHERE 1=1");
                if(Psids.Count==1)
                {
                    this.Database.AddInParameter(":Psid"+0.ToString(),Psids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""PSID""=:Psid0");
                }
                else if(Psids.Count>1&&Psids.Count<=2000)
                {
                    this.Database.AddInParameter(":Psid"+0.ToString(),Psids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""PSID""=:Psid0");
                    for (int i = 1; i < Psids.Count; i++)
                    {
                    this.Database.AddInParameter(":Psid"+i.ToString(),Psids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""PSID""=:Psid"+i.ToString());
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
