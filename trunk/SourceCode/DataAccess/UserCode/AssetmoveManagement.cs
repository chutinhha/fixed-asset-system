/********************************************************************
* File Name:AssetmoveManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMOVE"".""ASSETMOVEID"",""ASSETMOVE"".""ASSETCATEGORYID"",""ASSETMOVE"".""APPLYDATE"",""ASSETMOVE"".""APPLYUSERID"",""ASSETMOVE"".""APPLYCONTENT"",
                     ""ASSETMOVE"".""APPROVEUSER"",""ASSETMOVE"".""APPROVEDATE"",""ASSETMOVE"".""APPROVERESULT"",""ASSETMOVE"".""REJECTREASON"",""ASSETMOVE"".""PLANMOVEDATE"",
                     ""ASSETMOVE"".""ACTUALMOVEDATE"",""ASSETMOVE"".""CONFIRMDATE"",""ASSETMOVE"".""CONFIRMUSER"",""ASSETMOVE"".""MOVEDCONTENT"",""ASSETMOVE"".""STORAGETITLE"",
                     ""ASSETMOVE"".""STORAGEID"",""ASSETMOVE"".""SUBCOMPANY"",""ASSETMOVE"".""SUBCOMPANYCONTACTORID"",""ASSETMOVE"".""CONTACTPHONE"",""ASSETMOVE"".""PROJECTCONTACTORID"",
                     ""ASSETMOVE"".""PROJECTCONTACTORPHONE"",""ASSETMOVE"".""CREATOR"",""ASSETMOVE"".""CREATEDDATE""
                     ,SYSTEM,c.StorageName,c.subcompanyname,TU.USERNAME AS Applyusername
                     FROM ""ASSETMOVE"" inner join ASSETCATEGORY ON ASSETMOVE.ASSETCATEGORYID=ASSETCATEGORY.ASSETCATEGORYID
                     Inner join  v_storage_address c on c.StorageTitle=ASSETMOVE.STORAGETITLE and c.StorageId=ASSETMOVE.STORAGEID
                     INNER JOIN T_USER TU ON TU.ID=ASSETMOVE.APPLYUSERID
                     WHERE 1=1");
                #region 移机单号
                if (!string.IsNullOrEmpty(info.Assetmoveid))
                {
                    this.Database.AddInParameter(":Assetmoveid",DbType.AnsiString,"%"+info.Assetmoveid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ASSETMOVEID"" LIKE :Assetmoveid");
                }
                #endregion

                #region 项目体ID或分公司ID
                if (!string.IsNullOrEmpty(info.Storageid) && !string.IsNullOrEmpty(info.Storagetitle))
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""STORAGETITLE"" = :Storagetitle");
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""STORAGEID"" = :Storageid");
                }
                #endregion

                #region (系统)设备大类
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 申请移机日期
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
                #endregion

                #region 申请人
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid",DbType.AnsiString,"%"+info.Applyuserid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                #endregion

                #region 审核人
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%"+info.Approveuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""APPROVEUSER"" LIKE :Approveuser");
                }
                #endregion

                #region 审核日期
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
                #endregion

                #region 计划移机日期
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
                #endregion

                #region 实际移机日期
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
                #endregion

                #region 确认日期
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
                #endregion

                #region 确认人
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser",DbType.AnsiString,"%"+info.Confirmuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CONFIRMUSER"" LIKE :Confirmuser");
                }
                #endregion
               

                #region 分公司联系人
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid",DbType.AnsiString,"%"+info.Subcompanycontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                #endregion

                #region 联系人电话
                if (!string.IsNullOrEmpty(info.Contactphone))
                {
                    this.Database.AddInParameter(":Contactphone",DbType.AnsiString,"%"+info.Contactphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CONTACTPHONE"" LIKE :Contactphone");
                }
                #endregion

                #region 项目体联系人
                if (!string.IsNullOrEmpty(info.Projectcontactorid))
                {
                    this.Database.AddInParameter(":Projectcontactorid",DbType.AnsiString,"%"+info.Projectcontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PROJECTCONTACTORID"" LIKE :Projectcontactorid");
                }
                #endregion

                #region 项目体联系电话
                if (!string.IsNullOrEmpty(info.Projectcontactorphone))
                {
                    this.Database.AddInParameter(":Projectcontactorphone",DbType.AnsiString,"%"+info.Projectcontactorphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""PROJECTCONTACTORPHONE"" LIKE :Projectcontactorphone");
                }
                #endregion

                #region 创建人
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator",DbType.AnsiString,"%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMOVE"".""CREATOR"" LIKE :Creator");
                }
                #endregion

                #region 移机单状态
                if (info.AssetMoveStates.Count > 0)
                {
                    this.Database.AddInParameter(":APPROVERESULT", info.AssetMoveStates[0]);
                    sqlCommand.AppendLine(@" AND (""ASSETMOVE"".""APPROVERESULT""=:APPROVERESULT");
                    for (int i = 1; i < info.AssetMoveStates.Count; i++)
                    {
                        this.Database.AddInParameter(":APPROVERESULT" + i.ToString(), info.AssetMoveStates[i]);
                        sqlCommand.AppendLine(@" OR ""ASSETMOVE"".""APPROVERESULT""=:APPROVERESULT" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }

                #endregion

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
