/********************************************************************
* File Name:AssetmovedetailManagement
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
    public partial class AssetmovedetailManagement:BaseManagement
    {
        #region RetrieveAssetmovedetailByDetailid
        public Assetmovedetail RetrieveAssetmovedetailByDetailid(string detailid)
        {
            try
            {
                this.Database.AddInParameter(":DETAILID", detailid);
                string sqlCommand = @"SELECT * FROM ASSETMOVEDETAIL WHERE  DETAILID=:DETAILID";
                return this.Database.ExecuteToSingle<Assetmovedetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmovedetailByDetailid
        public List<Assetmovedetail> RetrieveAssetmovedetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return new List<Assetmovedetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMOVEDETAIL"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Assetmovedetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmovedetailsPaging
        public List<Assetmovedetail> RetrieveAssetmovedetailsPaging(AssetmovedetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVEDETAIL"".""DETAILID"",""ASSETMOVEDETAIL"".""ASSETMOVEID"",""ASSETMOVEDETAIL"".""ASSETNO"",""ASSETMOVEDETAIL"".""PLANMOVEDATE"",""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"",
                     ""ASSETMOVEDETAIL"".""MOVEDCONTENT""
                     FROM ""ASSETMOVEDETAIL"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Detailid))
                {
                    this.Database.AddInParameter(":Detailid",DbType.AnsiString,"%"+info.Detailid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""DETAILID"" LIKE :Detailid");
                }
                if (!string.IsNullOrEmpty(info.Assetmoveid))
                {
                    this.Database.AddInParameter(":Assetmoveid",DbType.AnsiString,"%"+info.Assetmoveid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ASSETMOVEID"" LIKE :Assetmoveid");
                }
                if (!string.IsNullOrEmpty(info.Assetno))
                {
                    this.Database.AddInParameter(":Assetno",DbType.AnsiString,"%"+info.Assetno+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ASSETNO"" LIKE :Assetno");
                }
                if (info.StartPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanmovedate",info.StartPlanmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""PLANMOVEDATE"" >= :StartPlanmovedate");
                }
                if (info.EndPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanmovedate",info.EndPlanmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""PLANMOVEDATE"" <= :EndPlanmovedate");
                }
                if (info.StartActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualmovedate",info.StartActualmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"" >= :StartActualmovedate");
                }
                if (info.EndActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualmovedate",info.EndActualmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""ACTUALMOVEDATE"" <= :EndActualmovedate");
                }
                if (!string.IsNullOrEmpty(info.Movedcontent))
                {
                    this.Database.AddInParameter(":Movedcontent", "%"+info.Movedcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEDETAIL"".""MOVEDCONTENT"" LIKE :Movedcontent");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVEDETAIL"".""DETAILID"" DESC");
                return this.ExecuteReaderPaging<Assetmovedetail>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
