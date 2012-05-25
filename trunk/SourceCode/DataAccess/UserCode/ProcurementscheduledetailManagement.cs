/********************************************************************
* File Name:ProcurementscheduledetailManagement
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
    public partial class ProcurementscheduledetailManagement:BaseManagement
    {
        #region RetrieveProcurementscheduledetailByDetailid
        public Procurementscheduledetail RetrieveProcurementscheduledetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM PROCUREMENTSCHEDULEDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Procurementscheduledetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementscheduledetailByDetailid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Procurementscheduledetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE 1=1");
                if(Detailids.Count==1)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""DETAILID""=:Detailid0");
                }
                else if(Detailids.Count>1&&Detailids.Count<=2000)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""DETAILID""=:Detailid0");
                    for (int i = 1; i < Detailids.Count; i++)
                    {
                    this.Database.AddInParameter(":Detailid"+i.ToString(),Detailids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""DETAILID""=:Detailid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Procurementscheduledetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveListInfoByForeignKeys RetrieveProcurementscheduledetailListByPsid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailListByPsid(string Psid)
        {
            try
            {
                this.Database.AddInParameter(":Psid", Psid);//DBType:VARCHAR2
                string sqlCommand = @"SELECT * FROM ""PROCUREMENTSCHEDULEDETAIL"" WHERE  ""PSID""=:Psid";
                sqlCommand += @" ORDER BY ""DETAILID"" DESC";
                return this.Database.ExecuteToList<Procurementscheduledetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementscheduledetailListByPsid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailListByPsid(List<string> Psids)
        {
            try
            {
                if(Psids.Count==0){ return new List<Procurementscheduledetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""DETAILID"" DESC");
                return this.Database.ExecuteToList<Procurementscheduledetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCountOfProcurementscheduledetailByPsid
        public int RetrieveCountOfProcurementscheduledetailByPsid(List<string> Psids)
        {
            try
            {
                if(Psids.Count==0){ return 0;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT COUNT(*)  FROM  ""PROCUREMENTSCHEDULEDETAIL"" WHERE 1=1");
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

                return int.Parse(this.Database.ExecuteScalar(sqlCommand.ToString()).ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveProcurementscheduledetailsPaging
        public List<ProcurementscheduledetailEx> RetrieveProcurementscheduledetailsPaging(ProcurementscheduledetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""PROCUREMENTSCHEDULEDETAIL"".""DETAILID"",""PROCUREMENTSCHEDULEDETAIL"".""ASSETCATEGORYID"",""PROCUREMENTSCHEDULEDETAIL"".""ASSETNAME"",""PROCUREMENTSCHEDULEDETAIL"".""ASSETSPECIFICATION"",""PROCUREMENTSCHEDULEDETAIL"".""UNITPRICE"",
                     ""PROCUREMENTSCHEDULEDETAIL"".""PLANNUMBER"",""PROCUREMENTSCHEDULEDETAIL"".""PSID""

                     FROM ""PROCUREMENTSCHEDULEDETAIL"" 
                     INNER JOIN ""PROCUREMENTSCHEDULEHEAD"" ON ""PROCUREMENTSCHEDULEDETAIL"".""PSID""=""PROCUREMENTSCHEDULEHEAD"".""PSID"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEDETAIL"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Assetname))
                {
                    this.Database.AddInParameter(":Assetname", "%"+info.Assetname+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEDETAIL"".""ASSETNAME"" LIKE :Assetname");
                }
                if (!string.IsNullOrEmpty(info.Assetspecification))
                {
                    this.Database.AddInParameter(":Assetspecification", "%"+info.Assetspecification+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEDETAIL"".""ASSETSPECIFICATION"" LIKE :Assetspecification");
                }
                if (!string.IsNullOrEmpty(info.Psid))
                {
                    this.Database.AddInParameter(":Psid",DbType.AnsiString,"%"+info.Psid+"%");
                    sqlCommand.AppendLine(@" AND ""PROCUREMENTSCHEDULEDETAIL"".""PSID"" LIKE :Psid");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""PROCUREMENTSCHEDULEDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<ProcurementscheduledetailEx>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
