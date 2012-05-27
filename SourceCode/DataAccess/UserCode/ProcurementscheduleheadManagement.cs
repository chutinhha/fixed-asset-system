/********************************************************************
* File Name:ProcurementscheduleheadManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Create Explain:
* Description:DataBase Access Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System.Collections.Generic;
using System.Data;
using System.Text;
using FixedAsset.Domain;

namespace FixedAsset.DataAccess
{
    public partial class ProcurementscheduleheadManagement:BaseManagement
    {
        #region RetrieveProcurementscheduleheadByPsid
        public Procurementschedulehead RetrieveProcurementscheduleheadByPsid(string psid)
        {
            try
            {
                this.Database.AddInParameter(":PSID", psid);
                string sqlCommand = @"SELECT * FROM PROCUREMENTSCHEDULEHEAD WHERE  PSID=:PSID";
                return this.Database.ExecuteToSingle<Procurementschedulehead>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementscheduleheadByPsid
        public List<Procurementschedulehead> RetrieveProcurementscheduleheadByPsid(List<string> Psids)
        {
            try
            {
                if(Psids.Count==0){ return new List<Procurementschedulehead>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTSCHEDULEHEAD"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""PSID"" DESC");
                return this.Database.ExecuteToList<Procurementschedulehead>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementscheduleheadsPaging
        public List<Procurementschedulehead> RetrieveProcurementscheduleheadsPaging(ProcurementscheduleheadSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""PROCUREMENTSCHEDULEHEAD"".""PSID"",""PROCUREMENTSCHEDULEHEAD"".""PROCUREMENTSCHEDULEDATE"",""PROCUREMENTSCHEDULEHEAD"".""REASON"",""SUBCOMPANYINFO"".""SUBCOMPANYNAME"" SUBCOMPANY,""PROCUREMENTSCHEDULEHEAD"".""APPLYUSER"",
                     ""PROCUREMENTSCHEDULEHEAD"".""APPLYDATE"",""PROCUREMENTSCHEDULEHEAD"".""APPROVEUSER"",""PROCUREMENTSCHEDULEHEAD"".""APPROVEDATE"",""PROCUREMENTSCHEDULEHEAD"".""APPROVERESULT"",""PROCUREMENTSCHEDULEHEAD"".""REJECTREASON"",
                     ""PROCUREMENTSCHEDULEHEAD"".""CREATEDDATE""
                     FROM ""PROCUREMENTSCHEDULEHEAD,SUBCOMPANYINFO"" 
                     WHERE PROCUREMENTSCHEDULEHEAD.SUBCOMPANY=SUBCOMPANYINFO.SUBCOMPANYID");
                if (!string.IsNullOrEmpty(info.Psid))
                {
                    this.Database.AddInParameter(":Psid",DbType.AnsiString,"%"+info.Psid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""PSID"" LIKE :Psid");
                }
                if (info.StartProcurementscheduledate.HasValue)
                {
                    this.Database.AddInParameter(":StartProcurementscheduledate",info.StartProcurementscheduledate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""PROCUREMENTSCHEDULEDATE"" >= :StartProcurementscheduledate");
                }
                if (info.EndProcurementscheduledate.HasValue)
                {
                    this.Database.AddInParameter(":EndProcurementscheduledate",info.EndProcurementscheduledate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""PROCUREMENTSCHEDULEDATE"" <= :EndProcurementscheduledate");
                }
                if (!string.IsNullOrEmpty(info.Reason))
                {
                    this.Database.AddInParameter(":Reason", "%"+info.Reason+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""REASON"" LIKE :Reason");
                }
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany",DbType.AnsiString,"%"+info.Subcompany+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                if (!string.IsNullOrEmpty(info.Applyuser))
                {
                    this.Database.AddInParameter(":Applyuser", "%"+info.Applyuser+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPLYUSER"" LIKE :Applyuser");
                }
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate",info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate",info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPLYDATE"" <= :EndApplydate");
                }
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%"+info.Approveuser+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPROVEUSER"" LIKE :Approveuser");
                }
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate",info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate",info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""APPROVEDATE"" <= :EndApprovedate");
                }
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%"+info.Rejectreason+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEHEAD"".""REJECTREASON"" LIKE :Rejectreason");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""PROCUREMENTSCHEDULEHEAD"".""PSID"" DESC");
                return this.ExecuteReaderPaging<Procurementschedulehead>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveTopProcurementscheduleheadPsId
        public string RetrieveTopProcurementscheduleheadPsId()
        {
            try
            {
                var sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT PSID  FROM  ""PROCUREMENTSCHEDULEHEAD"" WHERE ROWNUM<2");
                sqlCommand.AppendLine(@" ORDER BY ""PSID"" DESC");
                var  obj= this.Database.ExecuteScalar(sqlCommand.ToString());
                if (obj == null)
                {
                    return string.Empty;
                }
                else
                {
                    return obj.ToString();
                }
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion
    }
}
