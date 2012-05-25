/********************************************************************
* File Name:AssetsetupinfoManagement
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
    public partial class AssetsetupinfoManagement:BaseManagement
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
                if(Setupids.Count==0){ return new List<Assetsetupinfo>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETSETUPINFO"" WHERE 1=1");
                if(Setupids.Count==1)
                {
                    this.Database.AddInParameter(":Setupid"+0.ToString(),Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""SETUPID""=:Setupid0");
                }
                else if(Setupids.Count>1&&Setupids.Count<=2000)
                {
                    this.Database.AddInParameter(":Setupid"+0.ToString(),Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""SETUPID""=:Setupid0");
                    for (int i = 1; i < Setupids.Count; i++)
                    {
                    this.Database.AddInParameter(":Setupid"+i.ToString(),Setupids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""SETUPID""=:Setupid"+i.ToString());
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
        public List<Assetsetupinfo> RetrieveAssetsetupinfosPaging(AssetsetupinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETSETUPINFO"".""SETUPID"",""ASSETSETUPINFO"".""APPLYSETUPDATE"",""ASSETSETUPINFO"".""APPLYDATE"",""ASSETSETUPINFO"".""APPLYUSERID"",""ASSETSETUPINFO"".""CONTACTPHONE"",
                     ""ASSETSETUPINFO"".""PROJECTCONTACTORID"",""ASSETSETUPINFO"".""PROJECTCONTACTORPHONE"",""ASSETSETUPINFO"".""PLANSETUPDATE"",""ASSETSETUPINFO"".""ACTUALSETUPDATE"",""ASSETSETUPINFO"".""APPLYCONTENT"",
                     ""ASSETSETUPINFO"".""SUBCOMPANY"",""ASSETSETUPINFO"".""REJECTREASON"",""ASSETSETUPINFO"".""APPROVEUSER"",""ASSETSETUPINFO"".""APPROVEDATE"",""ASSETSETUPINFO"".""APPROVERESULT"",
                     ""ASSETSETUPINFO"".""CREATEDDATE"",""ASSETSETUPINFO"".""SUBCOMPANYCONTACTORID"",""ASSETSETUPINFO"".""CREATOR"",""ASSETSETUPINFO"".""ASSETCATEGORYID"",""ASSETSETUPINFO"".""SETUPCONTENT"",
                     ""ASSETSETUPINFO"".""CONFIRMDATE"",""ASSETSETUPINFO"".""CONFIRMUSER""
                     FROM ""ASSETSETUPINFO"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Setupid))
                {
                    this.Database.AddInParameter(":Setupid",DbType.AnsiString,"%"+info.Setupid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SETUPID"" LIKE :Setupid");
                }
                if (info.StartApplydate.HasValue)
                {
                    this.Database.AddInParameter(":StartApplydate",info.StartApplydate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYDATE"" >= :StartApplydate");
                }
                if (info.EndApplydate.HasValue)
                {
                    this.Database.AddInParameter(":EndApplydate",info.EndApplydate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYDATE"" <= :EndApplydate");
                }
                if (!string.IsNullOrEmpty(info.Applyuserid))
                {
                    this.Database.AddInParameter(":Applyuserid",DbType.AnsiString,"%"+info.Applyuserid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYUSERID"" LIKE :Applyuserid");
                }
                if (!string.IsNullOrEmpty(info.Contactphone))
                {
                    this.Database.AddInParameter(":Contactphone",DbType.AnsiString,"%"+info.Contactphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONTACTPHONE"" LIKE :Contactphone");
                }
                if (!string.IsNullOrEmpty(info.Projectcontactorid))
                {
                    this.Database.AddInParameter(":Projectcontactorid",DbType.AnsiString,"%"+info.Projectcontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""PROJECTCONTACTORID"" LIKE :Projectcontactorid");
                }
                if (!string.IsNullOrEmpty(info.Projectcontactorphone))
                {
                    this.Database.AddInParameter(":Projectcontactorphone",DbType.AnsiString,"%"+info.Projectcontactorphone+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""PROJECTCONTACTORPHONE"" LIKE :Projectcontactorphone");
                }
                if (!string.IsNullOrEmpty(info.Applycontent))
                {
                    this.Database.AddInParameter(":Applycontent", "%"+info.Applycontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPLYCONTENT"" LIKE :Applycontent");
                }
                if (!string.IsNullOrEmpty(info.Subcompany))
                {
                    this.Database.AddInParameter(":Subcompany", "%"+info.Subcompany+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SUBCOMPANY"" LIKE :Subcompany");
                }
                if (!string.IsNullOrEmpty(info.Rejectreason))
                {
                    this.Database.AddInParameter(":Rejectreason", "%"+info.Rejectreason+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""REJECTREASON"" LIKE :Rejectreason");
                }
                if (!string.IsNullOrEmpty(info.Approveuser))
                {
                    this.Database.AddInParameter(":Approveuser", "%"+info.Approveuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEUSER"" LIKE :Approveuser");
                }
                if (info.StartApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":StartApprovedate",info.StartApprovedate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEDATE"" >= :StartApprovedate");
                }
                if (info.EndApprovedate.HasValue)
                {
                    this.Database.AddInParameter(":EndApprovedate",info.EndApprovedate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""APPROVEDATE"" <= :EndApprovedate");
                }
                if (!string.IsNullOrEmpty(info.Subcompanycontactorid))
                {
                    this.Database.AddInParameter(":Subcompanycontactorid",DbType.AnsiString,"%"+info.Subcompanycontactorid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SUBCOMPANYCONTACTORID"" LIKE :Subcompanycontactorid");
                }
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator",DbType.AnsiString,"%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CREATOR"" LIKE :Creator");
                }
                if (!string.IsNullOrEmpty(info.Assetcategoryid))
                {
                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
                }
                if (!string.IsNullOrEmpty(info.Setupcontent))
                {
                    this.Database.AddInParameter(":Setupcontent", "%"+info.Setupcontent+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""SETUPCONTENT"" LIKE :Setupcontent");
                }
                if (info.StartConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":StartConfirmdate",info.StartConfirmdate.Value.Date);
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMDATE"" >= :StartConfirmdate");
                }
                if (info.EndConfirmdate.HasValue)
                {
                    this.Database.AddInParameter(":EndConfirmdate",info.EndConfirmdate.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMDATE"" <= :EndConfirmdate");
                }
                if (!string.IsNullOrEmpty(info.Confirmuser))
                {
                    this.Database.AddInParameter(":Confirmuser",DbType.AnsiString,"%"+info.Confirmuser+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSETUPINFO"".""CONFIRMUSER"" LIKE :Confirmuser");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETSETUPINFO"".""SETUPID"" DESC");
                return this.ExecuteReaderPaging<Assetsetupinfo>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
