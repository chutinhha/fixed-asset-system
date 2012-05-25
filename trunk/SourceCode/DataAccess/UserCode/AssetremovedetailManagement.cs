/********************************************************************
* File Name:AssetremovedetailManagement
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
    public partial class AssetremovedetailManagement:BaseManagement
    {
        #region RetrieveAssetremovedetailByDetailid
        public Assetremovedetail RetrieveAssetremovedetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM ASSETREMOVEDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Assetremovedetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremovedetailByDetailid
        public List<Assetremovedetail> RetrieveAssetremovedetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Assetremovedetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETREMOVEDETAIL"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetremovedetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremovedetailsPaging
        public List<Assetremovedetail> RetrieveAssetremovedetailsPaging(AssetremovedetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETREMOVEDETAIL"".""DETAILID"",""ASSETREMOVEDETAIL"".""ASSETREMOVEID"",""ASSETREMOVEDETAIL"".""ASSETNO"",""ASSETREMOVEDETAIL"".""PLANREMOVEDATE"",""ASSETREMOVEDETAIL"".""ACTUALREMOVEDATE"",
                     ""ASSETREMOVEDETAIL"".""REMOVEDCONTENT""
                     FROM ""ASSETREMOVEDETAIL"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                if (!string.IsNullOrEmpty(info.Assetremoveid))
                {
                    this.Database.AddInParameter(":Assetremoveid",DbType.AnsiString,"%"+info.Assetremoveid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""ASSETREMOVEID"" LIKE :Assetremoveid");
                }
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""ASSETNO"" LIKE :Assetno");
                }
                if (info.StartPlanremovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanremovedate",info.StartPlanremovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""PLANREMOVEDATE"" >= :StartPlanremovedate");
                }
                if (info.EndPlanremovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanremovedate",info.EndPlanremovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""PLANREMOVEDATE"" <= :EndPlanremovedate");
                }
                if (info.StartActualremovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualremovedate",info.StartActualremovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""ACTUALREMOVEDATE"" >= :StartActualremovedate");
                }
                if (info.EndActualremovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualremovedate",info.EndActualremovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""ACTUALREMOVEDATE"" <= :EndActualremovedate");
                }
                if (!string.IsNullOrEmpty(info.Removedcontent))
                {
                    this.Database.AddInParameter(":Removedcontent", "%"+info.Removedcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEDETAIL"".""REMOVEDCONTENT"" LIKE :Removedcontent");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETREMOVEDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<Assetremovedetail>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
