/********************************************************************
* File Name:AssetmaintainManagement
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
    public partial class AssetmaintainManagement:BaseManagement
    {
        #region RetrieveAssetmaintainByAssetmaintainid
        public Assetmaintain RetrieveAssetmaintainByAssetmaintainid(string assetmaintainid)
        {
            try
            {
                this.Database.AddInParameter(":ASSETMAINTAINID", assetmaintainid);
                string sqlCommand = @"SELECT * FROM ASSETMAINTAIN WHERE  ASSETMAINTAINID=:ASSETMAINTAINID";
                return this.Database.ExecuteToSingle<Assetmaintain>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmaintainByAssetmaintainid
        public List<Assetmaintain> RetrieveAssetmaintainByAssetmaintainid(List<string> Assetmaintainids)
        {
            try
            {
                if(Assetmaintainids.Count==0){ return new List<Assetmaintain>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETMAINTAIN"" WHERE 1=1");
                if(Assetmaintainids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINID""=:Assetmaintainid0");
                }
                else if(Assetmaintainids.Count>1&&Assetmaintainids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMAINTAINID""=:Assetmaintainid0");
                    for (int i = 1; i < Assetmaintainids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmaintainid"+i.ToString(),Assetmaintainids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMAINTAINID""=:Assetmaintainid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETMAINTAINID"" DESC");
                return this.Database.ExecuteToList<Assetmaintain>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetmaintainsPaging
        public List<Assetmaintain> RetrieveAssetmaintainsPaging(AssetmaintainSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETMAINTAIN"".""ASSETMAINTAINID"",""ASSETMAINTAIN"".""ASSETCATEGORYID"",""ASSETMAINTAIN"".""MAINTAINTYPE""
                                                                      ,""ASSETMAINTAIN"".""APPLYDATE"",""ASSETMAINTAIN"".""APPLYUSERID"",""ASSETMAINTAIN"".""APPLYCONTENT"",""ASSETMAINTAIN"".""APPROVEUSER""
                                                                      ,""ASSETMAINTAIN"".""APPROVEDATE"",""ASSETMAINTAIN"".""APPROVERESULT"",""ASSETMAINTAIN"".""REJECTREASON"",""ASSETMAINTAIN"".""PLANMAINTAINDATE""
                                                                      ,""ASSETMAINTAIN"".""ACTUALMAINTAINDATE"",""ASSETMAINTAIN"".""CONFIRMDATE"",""ASSETMAINTAIN"".""CONFIRMUSER"",""ASSETMAINTAIN"".""MAINTAINCONTENT""
                                                                      ,""ASSETMAINTAIN"".""STORAGETITLE"",""ASSETMAINTAIN"".""STORAGEID"",""ASSETMAINTAIN"".""SUBCOMPANY"",""ASSETMAINTAIN"".""SUBCOMPANYCONTACTORID""
                                                                      ,""ASSETMAINTAIN"".""CONTACTPHONE"", ""ASSETMAINTAIN"".""PROJECTCONTACTORID"",""ASSETMAINTAIN"".""PROJECTCONTACTORPHONE""
                                                                      ,""ASSETMAINTAIN"".""CREATOR"",""ASSETMAINTAIN"".""CREATEDDATE""
                                                                      ,SYSTEM,c.StorageName,c.subcompanyname
                     FROM ASSETMAINTAIN inner join assetsupplier ON ASSETMAINTAIN.ASSETCATEGORYID=assetsupplier.ASSETCATEGORYID
                     Inner join  v_storage_address c on c.StorageTitle=ASSETMAINTAIN.STORAGETITLE and c.StorageId=ASSETMAINTAIN.STORAGEID
                     WHERE 1=1");

                #region ά�޵����
                if (!string.IsNullOrEmpty(info.Assetmaintainid))
                {
                    this.Database.AddInParameter(":Assetmaintainid",DbType.AnsiString,"%"+info.Assetmaintainid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""ASSETMAINTAINID"" LIKE :Assetmaintainid");
                }
                #endregion

                #region (ϵͳ)�豸����
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region ������Դ��(��Ŀ�塢�Լ졢�¼죩�����ֵ�
                if (!string.IsNullOrEmpty(info.Maintaintype))
                {
                    this.Database.AddInParameter(":Maintaintype",DbType.AnsiString,"%"+info.Maintaintype+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""MAINTAINTYPE"" LIKE :Maintaintype");
                }
                #endregion

                #region ����ά������
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate",info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate",info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPLYDATE"" <= :EndApplydate");
                }
                #endregion

                #region ������
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid",DbType.AnsiString,"%"+info.Applyuserid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                #endregion

                #region ��������
                if (!string.IsNullOrEmpty(info.Applycontent))
                {
                    this.Database.AddInParameter(":Applycontent", "%" + info.Applycontent + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPLYCONTENT"" LIKE :Applycontent");
                }
                #endregion

                #region �����
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%"+info.Approveuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPROVEUSER"" LIKE :Approveuser");
                }
                #endregion

                #region �������
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate",info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate",info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""APPROVEDATE"" <= :EndApprovedate");
                }
                #endregion

                #region �ܾ�����
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%"+info.Rejectreason+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""REJECTREASON"" LIKE :Rejectreason");
                }
                #endregion

                #region �ƻ�ά������
                if (info.StartPlanmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":StartPlanmaintaindate",info.StartPlanmaintaindate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""PLANMAINTAINDATE"" >= :StartPlanmaintaindate");
                }
                if (info.EndPlanmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":EndPlanmaintaindate",info.EndPlanmaintaindate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""PLANMAINTAINDATE"" <= :EndPlanmaintaindate");
                }
                #endregion

                #region ʵ��ά������
                if (info.StartActualmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualmaintaindate",info.StartActualmaintaindate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""ACTUALMAINTAINDATE"" >= :StartActualmaintaindate");
                }
                if (info.EndActualmaintaindate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualmaintaindate",info.EndActualmaintaindate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""ACTUALMAINTAINDATE"" <= :EndActualmaintaindate");
                }
                #endregion

                #region ȷ������
                if (info.StartConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":StartConfirmdate",info.StartConfirmdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""CONFIRMDATE"" >= :StartConfirmdate");
                }
                if (info.EndConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":EndConfirmdate",info.EndConfirmdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""CONFIRMDATE"" <= :EndConfirmdate");
                }
                #endregion

                #region ȷ����
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser",DbType.AnsiString,"%"+info.Confirmuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""CONFIRMUSER"" LIKE :Confirmuser");
                }
                #endregion

                #region ��ά����ϸ
                if (!string.IsNullOrEmpty(info.Maintaincontent))
                {
                    this.Database.AddInParameter(":Maintaincontent", "%"+info.Maintaincontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""MAINTAINCONTENT"" LIKE :Maintaincontent");
                }
                #endregion  

                #region ��Ŀ��ID��ֹ�˾ID
                if (!string.IsNullOrEmpty(info.Storageid)&&!string.IsNullOrEmpty(info.Storagetitle))
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""STORAGETITLE"" = :Storagetitle");
                    this.Database.AddInParameter(":Storageid",DbType.AnsiString,info.Storageid);
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""STORAGEID"" = :Storageid");
                }
                #endregion

                #region �ֹ�˾
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany", "%"+info.Subcompany+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                #endregion

                #region �ֹ�˾��ϵ��
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid",DbType.AnsiString,"%"+info.Subcompanycontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                #endregion

                #region ��ϵ�绰
                if (!string.IsNullOrEmpty(info.Contactphone))
                {
                    this.Database.AddInParameter(":Contactphone",DbType.AnsiString,"%"+info.Contactphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""CONTACTPHONE"" LIKE :Contactphone");
                }
                #endregion

                #region ��Ŀ����ϵ��
                if (!string.IsNullOrEmpty(info.Projectcontactorid))
                {
                    this.Database.AddInParameter(":Projectcontactorid",DbType.AnsiString,"%"+info.Projectcontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""PROJECTCONTACTORID"" LIKE :Projectcontactorid");
                }
                #endregion

                #region ��Ŀ����ϵ�绰
                if (!string.IsNullOrEmpty(info.Projectcontactorphone))
                {
                    this.Database.AddInParameter(":Projectcontactorphone",DbType.AnsiString,"%"+info.Projectcontactorphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""PROJECTCONTACTORPHONE"" LIKE :Projectcontactorphone");
                }
                #endregion

                #region ������
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator",DbType.AnsiString,"%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAIN"".""CREATOR"" LIKE :Creator");
                }
                #endregion

                #region ά�޵�״̬
                if (info.AssetMaintainStates.Count > 0)
                {
                    this.Database.AddInParameter(":APPROVERESULT", info.AssetMaintainStates[0]);
                    sqlCommand.AppendLine(@" AND (""ASSETMAINTAIN"".""APPROVERESULT""=:APPROVERESULT");
                    for (int i = 1; i < info.AssetMaintainStates.Count; i++)
                    {
                        this.Database.AddInParameter(":APPROVERESULT" + i.ToString(), info.AssetMaintainStates[i]);
                        sqlCommand.AppendLine(@" OR ""ASSETMAINTAIN"".""APPROVERESULT""=:APPROVERESULT" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }

                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETMAINTAIN"".""ASSETMAINTAINID"" DESC");
                return this.ExecuteReaderPaging<Assetmaintain>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
