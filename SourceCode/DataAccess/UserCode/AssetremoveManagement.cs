/********************************************************************
* File Name:AssetremoveManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-06-07
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
    public partial class AssetremoveManagement : BaseManagement
    {
        #region RetrieveAssetremoveByAssetremoveid
        public Assetremove RetrieveAssetremoveByAssetremoveid(string assetremoveid)
        {
            try
            {
                this.Database.AddInParameter(":ASSETREMOVEID", assetremoveid);
                string sqlCommand = @"SELECT * FROM ASSETREMOVE WHERE  ASSETREMOVEID=:ASSETREMOVEID";
                return this.Database.ExecuteToSingle<Assetremove>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremoveByAssetremoveid
        public List<Assetremove> RetrieveAssetremoveByAssetremoveid(List<string> Assetremoveids)
        {
            try
            {
                if (Assetremoveids.Count == 0) { return new List<Assetremove>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETREMOVE"" WHERE 1=1");
                if (Assetremoveids.Count == 1)
                {
                    this.Database.AddInParameter(":Assetremoveid" + 0.ToString(), Assetremoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEID""=:Assetremoveid0");
                }
                else if (Assetremoveids.Count > 1 && Assetremoveids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Assetremoveid" + 0.ToString(), Assetremoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETREMOVEID""=:Assetremoveid0");
                    for (int i = 1; i < Assetremoveids.Count; i++)
                    {
                        this.Database.AddInParameter(":Assetremoveid" + i.ToString(), Assetremoveids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSETREMOVEID""=:Assetremoveid" + i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETREMOVEID"" DESC");
                return this.Database.ExecuteToList<Assetremove>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetremovesPaging
        public List<Assetremove> RetrieveAssetremovesPaging(AssetremoveSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETREMOVE"".""ASSETREMOVEID"",""ASSETREMOVE"".""ASSETCATEGORYID"",""ASSETREMOVE"".""APPLYDATE"",""ASSETREMOVE"".""APPLYUSERID"",""ASSETREMOVE"".""APPLYCONTENT"",
                     ""ASSETREMOVE"".""APPROVEUSER"",""ASSETREMOVE"".""APPROVEDATE"",""ASSETREMOVE"".""APPROVERESULT"",""ASSETREMOVE"".""PLANREMOVEDATE"",""ASSETREMOVE"".""ACTUALREMOVEDATE"",
                     ""ASSETREMOVE"".""REJECTREASON"",""ASSETREMOVE"".""CONFIRMDATE"",""ASSETREMOVE"".""CONFIRMUSER"",""ASSETREMOVE"".""REMOVEDCONTENT"",""ASSETREMOVE"".""STORAGETITLE"",
                     ""ASSETREMOVE"".""STORAGEID"",""ASSETREMOVE"".""SUBCOMPANY"",""ASSETREMOVE"".""SUBCOMPANYCONTACTORID"",""ASSETREMOVE"".""CONTACTPHONE"",""ASSETREMOVE"".""PROJECTCONTACTORID"",
                     ""ASSETREMOVE"".""PROJECTCONTACTORPHONE"",""ASSETREMOVE"".""CREATOR"",""ASSETREMOVE"".""CREATEDDATE""
                     ,SYSTEM,c.StorageName,c.subcompanyname,TU.USERNAME AS Applyusername
                     FROM ""ASSETREMOVE"" inner join ASSETCATEGORY ON ASSETREMOVE.ASSETCATEGORYID=ASSETCATEGORY.ASSETCATEGORYID
                     Inner join  v_storage_address c on c.StorageTitle=ASSETREMOVE.STORAGETITLE and c.StorageId=ASSETREMOVE.STORAGEID
                     INNER JOIN T_USER TU ON TU.ID=ASSETREMOVE.APPLYUSERID
                     WHERE 1=1");
                #region 拆机单号
                if (!string.IsNullOrEmpty(info.Assetremoveid))
                {
                    this.Database.AddInParameter(":Assetremoveid", DbType.AnsiString, "%" + info.Assetremoveid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""ASSETREMOVEID"" LIKE :Assetremoveid");
                }
                #endregion

                #region 项目体ID或分公司ID
                if (!string.IsNullOrEmpty(info.Storageid) && !string.IsNullOrEmpty(info.Storagetitle))
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""STORAGETITLE"" = :Storagetitle");
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""STORAGEID"" = :Storageid");
                }
                #endregion

                #region (系统)设备大类
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, "%" + info.Assetcategoryid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 申请拆机日期
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate", info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate", info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPLYDATE"" <= :EndApplydate");
                }
                #endregion

                #region 申请人
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid", DbType.AnsiString, "%" + info.Applyuserid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                #endregion

                #region 申请内容
                if (!string.IsNullOrEmpty(info.Applycontent))
                {
                    this.Database.AddInParameter(":Applycontent", "%" + info.Applycontent + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPLYCONTENT"" LIKE :Applycontent");
                }
                #endregion

                #region 审核人
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%" + info.Approveuser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPROVEUSER"" LIKE :Approveuser");
                }
                #endregion

                #region 审核日期
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate", info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate", info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""APPROVEDATE"" <= :EndApprovedate");
                }
                #endregion

                #region 计划拆机日期
                if (info.StartPlanremovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanremovedate", info.StartPlanremovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""PLANREMOVEDATE"" >= :StartPlanremovedate");
                }
                if (info.EndPlanremovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanremovedate", info.EndPlanremovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""PLANREMOVEDATE"" <= :EndPlanremovedate");
                }
                #endregion

                #region 实际拆机日期
                if (info.StartActualremovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualremovedate", info.StartActualremovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""ACTUALREMOVEDATE"" >= :StartActualremovedate");
                }
                if (info.EndActualremovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualremovedate", info.EndActualremovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""ACTUALREMOVEDATE"" <= :EndActualremovedate");
                }
                #endregion

                #region 拒绝理由
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%" + info.Rejectreason + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""REJECTREASON"" LIKE :Rejectreason");
                }
                #endregion

                #region 确认日期
                if (info.StartConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":StartConfirmdate", info.StartConfirmdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""CONFIRMDATE"" >= :StartConfirmdate");
                }
                if (info.EndConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":EndConfirmdate", info.EndConfirmdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""CONFIRMDATE"" <= :EndConfirmdate");
                }
                #endregion

                #region 确认人
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser", DbType.AnsiString, "%" + info.Confirmuser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""CONFIRMUSER"" LIKE :Confirmuser");
                }
                #endregion  

                #region 分公司联系人
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid", DbType.AnsiString, "%" + info.Subcompanycontactorid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                #endregion

                #region 联系电话
                if (!string.IsNullOrEmpty(info.Contactphone))
                {
                    this.Database.AddInParameter(":Contactphone", DbType.AnsiString, "%" + info.Contactphone + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""CONTACTPHONE"" LIKE :Contactphone");
                }
                #endregion

                #region 项目体联系人
                if (!string.IsNullOrEmpty(info.Projectcontactorid))
                {
                    this.Database.AddInParameter(":Projectcontactorid", DbType.AnsiString, "%" + info.Projectcontactorid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""PROJECTCONTACTORID"" LIKE :Projectcontactorid");
                }
                #endregion

                #region 项目体联系电话
                if (!string.IsNullOrEmpty(info.Projectcontactorphone))
                {
                    this.Database.AddInParameter(":Projectcontactorphone", DbType.AnsiString, "%" + info.Projectcontactorphone + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""PROJECTCONTACTORPHONE"" LIKE :Projectcontactorphone");
                }
                #endregion

                #region 创建人
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator", DbType.AnsiString, "%" + info.Creator + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVE"".""CREATOR"" LIKE :Creator");
                }
                #endregion 

                #region 拆机单状态
                if (info.AssetRemoveStates.Count > 0)
                {
                    this.Database.AddInParameter(":APPROVERESULT", info.AssetRemoveStates[0]);
                    sqlCommand.AppendLine(@" AND (""ASSETREMOVE"".""APPROVERESULT""=:APPROVERESULT");
                    for (int i = 1; i < info.AssetRemoveStates.Count; i++)
                    {
                        this.Database.AddInParameter(":APPROVERESULT" + i.ToString(), info.AssetRemoveStates[i]);
                        sqlCommand.AppendLine(@" OR ""ASSETREMOVE"".""APPROVERESULT""=:APPROVERESULT" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETREMOVE"".""ASSETREMOVEID"" DESC");
                return this.ExecuteReaderPaging<Assetremove>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion 
    }
}
