/********************************************************************
* File Name:AssetmoveManagement
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
    public partial class AssetmoveManagement:BaseManagement
    {
        #region RetrieveAssetmoveByAssetmoveid
        public Assetmove RetrieveAssetmoveByAssetmoveid(string assetmoveid)
        {
            try
            {
                this.Database.AddInParameter(":ASSETMOVEID", assetmoveid);
                string sqlCommand = @"SELECT * FROM ASSETMOVE WHERE  ASSETMOVEID=:ASSETMOVEID";
                return this.Database.ExecuteToSingle<Assetmove>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmoveByAssetmoveid
        public List<Assetmove> RetrieveAssetmoveByAssetmoveid(List<string> Assetmoveids)
        {
            try
            {
                if(Assetmoveids.Count==0){ return new List<Assetmove>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMOVE"" WHERE 1=1");
                if(Assetmoveids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEID""=:Assetmoveid0");
                }
                else if(Assetmoveids.Count>1&&Assetmoveids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMOVEID""=:Assetmoveid0");
                    for (int i = 1; i < Assetmoveids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmoveid"+i.ToString(),Assetmoveids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMOVEID""=:Assetmoveid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETMOVEID"" DESC");
                return this.Database.ExecuteToList<Assetmove>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmovesPaging
        public List<Assetmove> RetrieveAssetmovesPaging(AssetmoveSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVE"".""ASSETMOVEID"",""ASSETMOVE"".""APPLYDATE"",""ASSETMOVE"".""APPLYUSERID"",""ASSETMOVE"".""APPLYCONTENT"",""ASSETMOVE"".""SUBCOMPANY"",
                     ""ASSETMOVE"".""SUBCOMPANYCONTACTORID"",""ASSETMOVE"".""CREATOR"",""ASSETMOVE"".""CREATEDDATE"",""ASSETMOVE"".""PROJECTCONTACTORID"",""ASSETMOVE"".""PROJECTCONTACTORPHONE"",
                     ""ASSETMOVE"".""PLANMOVEDATE"",""ASSETMOVE"".""ACTUALMOVEDATE"",""ASSETMOVE"".""REJECTREASON"",""ASSETMOVE"".""APPROVEUSER"",""ASSETMOVE"".""APPROVEDATE"",
                     ""ASSETMOVE"".""APPROVERESULT"",""ASSETMOVE"".""ASSETCATEGORYID"",""ASSETMOVE"".""MOVEDCONTENT"",""ASSETMOVE"".""CONFIRMDATE"",""ASSETMOVE"".""CONFIRMUSER""
                     FROM ""ASSETMOVE"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Assetmoveid))
                {
                    this.Database.AddInParameter(":Assetmoveid",DbType.AnsiString,"%"+info.Assetmoveid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ASSETMOVEID"" LIKE :Assetmoveid");
                }
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate",info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate",info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPLYDATE"" <= :EndApplydate");
                }
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid",DbType.AnsiString,"%"+info.Applyuserid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                if (!string.IsNullOrEmpty(info.Applycontent))
                {
                    this.Database.AddInParameter(":Applycontent", "%"+info.Applycontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPLYCONTENT"" LIKE :Applycontent");
                }
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany", "%"+info.Subcompany+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid",DbType.AnsiString,"%"+info.Subcompanycontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator",DbType.AnsiString,"%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CREATOR"" LIKE :Creator");
                }
                if (!string.IsNullOrEmpty(info.Projectcontactorid))
                {
                    this.Database.AddInParameter(":Projectcontactorid",DbType.AnsiString,"%"+info.Projectcontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PROJECTCONTACTORID"" LIKE :Projectcontactorid");
                }
                if (!string.IsNullOrEmpty(info.Projectcontactorphone))
                {
                    this.Database.AddInParameter(":Projectcontactorphone",DbType.AnsiString,"%"+info.Projectcontactorphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PROJECTCONTACTORPHONE"" LIKE :Projectcontactorphone");
                }
                if (info.StartPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanmovedate",info.StartPlanmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PLANMOVEDATE"" >= :StartPlanmovedate");
                }
                if (info.EndPlanmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanmovedate",info.EndPlanmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PLANMOVEDATE"" <= :EndPlanmovedate");
                }
                if (info.StartActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualmovedate",info.StartActualmovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ACTUALMOVEDATE"" >= :StartActualmovedate");
                }
                if (info.EndActualmovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualmovedate",info.EndActualmovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ACTUALMOVEDATE"" <= :EndActualmovedate");
                }
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%"+info.Rejectreason+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""REJECTREASON"" LIKE :Rejectreason");
                }
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%"+info.Approveuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPROVEUSER"" LIKE :Approveuser");
                }
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate",info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate",info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPROVEDATE"" <= :EndApprovedate");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Movedcontent))
                {
                    this.Database.AddInParameter(":Movedcontent", "%"+info.Movedcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""MOVEDCONTENT"" LIKE :Movedcontent");
                }
                if (info.StartConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":StartConfirmdate",info.StartConfirmdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CONFIRMDATE"" >= :StartConfirmdate");
                }
                if (info.EndConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":EndConfirmdate",info.EndConfirmdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CONFIRMDATE"" <= :EndConfirmdate");
                }
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser",DbType.AnsiString,"%"+info.Confirmuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CONFIRMUSER"" LIKE :Confirmuser");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMOVE"".""ASSETMOVEID"" DESC");
                return this.ExecuteReaderPaging<Assetmove>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
