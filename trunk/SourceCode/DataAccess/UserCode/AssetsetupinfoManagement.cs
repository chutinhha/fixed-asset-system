/********************************************************************
* File Name:AssetsetupinfoManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-29
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
    public partial class AssetsetupinfoManagement : BaseManagement
    {
        #region RetrieveAssetsetupinfoBySetupid
        public Assetsetupinfo RetrieveAssetsetupinfoBySetupid(string setupid)
        {
            try
            {
                this.Database.AddInParameter(":SETUPID", setupid);
                string sqlCommand = @"SELECT * FROM ASSETSETUPINFO WHERE  SETUPID=:SETUPID";
                return this.Database.ExecuteToSingle<Assetsetupinfo>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsetupinfoBySetupid
        public List<Assetsetupinfo> RetrieveAssetsetupinfoBySetupid(List<string> Setupids)
        {
            try
            {
                if (Setupids.Count == 0) { return new List<Assetsetupinfo>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETSETUPINFO"" WHERE 1=1");
                if (Setupids.Count == 1)
                {
                    this.Database.AddInParameter(":Setupid" + 0.ToString(), Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""SETUPID""=:Setupid0");
                }
                else if (Setupids.Count > 1 && Setupids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Setupid" + 0.ToString(), Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""SETUPID""=:Setupid0");
                    for (int i = 1; i < Setupids.Count; i++)
                    {
                        this.Database.AddInParameter(":Setupid" + i.ToString(), Setupids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""SETUPID""=:Setupid" + i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""SETUPID"" DESC");
                return this.Database.ExecuteToList<Assetsetupinfo>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsetupinfosPaging
        public List<Assetsetupinfo> RetrieveAssetsetupinfosPaging(AssetsetupinfoSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" SELECT ""ASSETSETUPINFO"".""SETUPID"",""ASSETSETUPINFO"".""APPLYSETUPDATE"",""ASSETSETUPINFO"".""APPLYDATE"",""ASSETSETUPINFO"".""APPLYUSERID"",""ASSETSETUPINFO"".""CONTACTPHONE"",
                     ""ASSETSETUPINFO"".""PROJECTCONTACTORID"",""ASSETSETUPINFO"".""PROJECTCONTACTORPHONE"",""ASSETSETUPINFO"".""PLANSETUPDATE"",""ASSETSETUPINFO"".""ACTUALSETUPDATE"",""ASSETSETUPINFO"".""APPLYCONTENT"",
                     ""ASSETSETUPINFO"".""SUBCOMPANY"",""ASSETSETUPINFO"".""REJECTREASON"",""ASSETSETUPINFO"".""APPROVEUSER"",""ASSETSETUPINFO"".""APPROVEDATE"",""ASSETSETUPINFO"".""APPROVERESULT"",
                     ""ASSETSETUPINFO"".""CREATEDDATE"",""ASSETSETUPINFO"".""SUBCOMPANYCONTACTORID"",""ASSETSETUPINFO"".""CREATOR"",""ASSETSETUPINFO"".""ASSETCATEGORYID"",""ASSETSETUPINFO"".""SETUPCONTENT"",
                     ""ASSETSETUPINFO"".""CONFIRMDATE"",""ASSETSETUPINFO"".""CONFIRMUSER"",""ASSETSETUPINFO"".""STORAGETITLE"",""ASSETSETUPINFO"".""STORAGEID""
                     ,SYSTEM,c.StorageName,c.subcompanyname,TU.USERNAME AS Applyusername
                     FROM ""ASSETSETUPINFO"" inner join ASSETCATEGORY ON ASSETSETUPINFO.ASSETCATEGORYID=ASSETCATEGORY.ASSETCATEGORYID
                     INNER JOIN  v_storage_address c on c.StorageTitle=ASSETSETUPINFO.STORAGETITLE and c.StorageId=ASSETSETUPINFO.STORAGEID
                     INNER JOIN T_USER TU ON TU.ID=ASSETSETUPINFO.APPLYUSERID
                     WHERE 1=1");

                #region 申请单号
                if (!string.IsNullOrEmpty(info.Setupid))
                {
                    this.Database.AddInParameter(":Setupid", DbType.AnsiString, "%" + info.Setupid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SETUPID"" LIKE :Setupid");
                }
                #endregion 

                #region 项目体ID或分公司ID
                if (!string.IsNullOrEmpty(info.Storageid) && !string.IsNullOrEmpty(info.Storagetitle))
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""STORAGETITLE"" = :Storagetitle");
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""STORAGEID"" = :Storageid");
                }
                #endregion

                #region (系统)设备大类
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, "%" + info.Assetcategoryid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                #endregion

                #region 申请日期
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate", info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate", info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYDATE"" <= :EndApplydate");
                }
                #endregion

                #region 申请人
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid", DbType.AnsiString, "%" + info.Applyuserid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                #endregion

                #region 审核人
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%" + info.Approveuser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEUSER"" LIKE :Approveuser");
                }
                #endregion

                #region 审核日期
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate", info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate", info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEDATE"" <= :EndApprovedate");
                }
                #endregion 

                #region 确认日期
                if (info.StartConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":StartConfirmdate", info.StartConfirmdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMDATE"" >= :StartConfirmdate");
                }
                if (info.EndConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":EndConfirmdate", info.EndConfirmdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMDATE"" <= :EndConfirmdate");
                }
                #endregion

                #region 确认人
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser", DbType.AnsiString, "%" + info.Confirmuser + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMUSER"" LIKE :Confirmuser");
                }
                #endregion  

                #region 分公司联系人
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid", DbType.AnsiString, "%" + info.Subcompanycontactorid + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                #endregion 

                #region 创建人
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator", DbType.AnsiString, "%" + info.Creator + "%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CREATOR"" LIKE :Creator");
                }
                #endregion

                #region 装机单状态
                if (info.SetupStates.Count > 0)
                {
                    this.Database.AddInParameter(":APPROVERESULT", info.SetupStates[0]);
                    sqlCommand.AppendLine(@" AND (""ASSETSETUPINFO"".""APPROVERESULT""=:APPROVERESULT");
                    for (int i = 1; i < info.SetupStates.Count; i++)
                    {
                        this.Database.AddInParameter(":APPROVERESULT" + i.ToString(), info.SetupStates[i]);
                        sqlCommand.AppendLine(@" OR ""ASSETSETUPINFO"".""APPROVERESULT""=:APPROVERESULT" + i.ToString());
                    }
                    sqlCommand.AppendLine(@" )");
                }
                #endregion

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETSETUPINFO"".""SETUPID"" DESC");
                return this.ExecuteReaderPaging<Assetsetupinfo>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetRunTimeReport
        public List<AssetRunTimeReport> RetrieveAssetRunTimeReport(AssetRunTimeSearch info)
        {
            try
            {
                var sqlCommand = new StringBuilder(@" select b.storagetitle,b.storageid, c.assetcategoryid,count(c.assetno) as Currentcount
                                                        from assetsetupdetail a
                                                        inner join assetsetupinfo b on a.setupid=b.setupid
                                                        inner join asset c on a.assetno=c.assetno");
                
                #region 项目体ID或分公司ID
                if (info.Storagetitle == Vstorageaddress.RootCompany)
                {
                    sqlCommand.AppendLine(@" where b.storagetitle = :Storagetitle ");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Subcompany);
                }
                else if (info.Storagetitle==Vstorageaddress.Project)
                {
                    sqlCommand.AppendLine(@" where b.storagetitle = :Storagetitle AND b.storageid = :Storageid");
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Project);
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                }
                else if(info.Storagetitle==Vstorageaddress.Subcompany)
                {
                    this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, Vstorageaddress.Subcompany); 
                    this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                    sqlCommand.AppendLine(@" where ((b.storagetitle = :Storagetitle AND b.storageid = :Storageid )");
                    if(info.ProjectIds.Count>0)
                    {
                        this.Database.AddInParameter(":Storagetitle0", DbType.AnsiString, Vstorageaddress.Project);
                        this.Database.AddInParameter(":Storageid0", DbType.AnsiString, info.ProjectIds[0]);
                        sqlCommand.AppendLine(@" OR (b.storagetitle = :Storagetitle0  AND (b.storageid = :Storageid0 ");
                        for (int i = 1; i < info.ProjectIds.Count; i++)
                        {
                            this.Database.AddInParameter(":Storageid" + i.ToString(), info.ProjectIds[i]);
                            sqlCommand.AppendLine(@" OR b.storageid=:Storageid" + i.ToString());
                        }
                        sqlCommand.Append(")");
                        sqlCommand.Append(")");
                    }
                    sqlCommand.Append(")");
                }
                else
                {
                    return new List<AssetRunTimeReport>();
                }
                #endregion  

                #region 实际完成日期
                if (info.StartActualDate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualDate", info.StartActualDate.Value.Date);
                    sqlCommand.AppendLine(@" AND b.ACTUALSETUPDATE >= :StartActualDate");
                }
                if (info.EndActualDate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualDate", info.EndActualDate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND b.ACTUALSETUPDATE <= :EndActualDate");
                }
                #endregion 

                sqlCommand.AppendLine(@"  group by b.storagetitle,b.storageid, c.assetcategoryid");
                return this.Database.ExecuteToList<AssetRunTimeReport>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetReportDetailInfoPaging
        public List<AssetReportDetailInfo> RetrieveAssetReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex, int pageSize, out int count)
        {
            try
            {
                var sqlCommand = new StringBuilder(@"   select a.setupid AS Billid,a.assetno
                                                        from assetsetupdetail a
                                                        inner join assetsetupinfo b on a.setupid=b.setupid
                                                        inner join asset c on a.assetno=c.assetno");
                #region (系统)设备大类
                count = 0;
                if(string.IsNullOrEmpty(info.Assetcategoryid)){return new List<AssetReportDetailInfo>();}
                sqlCommand.AppendLine(@" where c.ASSETCATEGORYID = :Assetcategoryid ");
                this.Database.AddInParameter(":Assetcategoryid", DbType.AnsiString, info.Assetcategoryid);
                //if(!string.IsNullOrEmpty(info.Storagetitle))
                //{
                sqlCommand.AppendLine(" and b.storagetitle = :Storagetitle AND b.storageid = :Storageid");
                this.Database.AddInParameter(":Storagetitle", DbType.AnsiString, info.Storagetitle);
                this.Database.AddInParameter(":Storageid", DbType.AnsiString, info.Storageid);
                //} 
                #endregion

                #region 实际完成日期
                if (info.StartActualDate.HasValue)
                {
                    this.Database.AddInParameter(":StartActualDate", info.StartActualDate.Value.Date);
                    sqlCommand.AppendLine(@" AND b.ACTUALSETUPDATE >= :StartActualDate");
                }
                if (info.EndActualDate.HasValue)
                {
                    this.Database.AddInParameter(":EndActualDate", info.EndActualDate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND b.ACTUALSETUPDATE <= :EndActualDate");
                }
                #endregion
                sqlCommand.AppendLine(@"  ORDER BY Billid DESC");
                return this.ExecuteReaderPaging<AssetReportDetailInfo>(sqlCommand.ToString(), pageIndex, pageSize, out count); 
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion
    }
}
