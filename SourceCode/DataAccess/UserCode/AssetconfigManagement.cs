/********************************************************************
* File Name:AssetconfigManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    public partial class AssetconfigManagement:BaseManagement
    {
        #region RetrieveAssetconfigByConfigid
        public Assetconfig RetrieveAssetconfigByConfigid(string configid)
        {
            try
            {
                this.Database.AddInParameter(":CONFIGID", configid);
                string sqlCommand = @"SELECT * FROM ASSET_CONFIG WHERE  CONFIGID=:CONFIGID";
                return this.Database.ExecuteToSingle<Assetconfig>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetconfigByCategoryId
        public List<Assetconfig> RetrieveAssetconfigByCategoryId(string categoryId)
        {
            try
            {
                this.Database.AddInParameter(":CATEGORYID", categoryId);
                string sqlCommand = @"SELECT * FROM ASSET_CONFIG WHERE  CATEGORYID=:CATEGORYID";
                return this.Database.ExecuteToList<Assetconfig>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetconfigByConfigid
        public List<Assetconfig> RetrieveAssetconfigByConfigid(List<string> Configids)
        {
            try
            {
                if(Configids.Count==0){ return new List<Assetconfig>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSET_CONFIG"" WHERE 1=1");
                if(Configids.Count==1)
                {
                    this.Database.AddInParameter(":Configid"+0.ToString(),Configids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""CONFIGID""=:Configid0");
                }
                else if(Configids.Count>1&&Configids.Count<=2000)
                {
                    this.Database.AddInParameter(":Configid"+0.ToString(),Configids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""CONFIGID""=:Configid0");
                    for (int i = 1; i < Configids.Count; i++)
                    {
                    this.Database.AddInParameter(":Configid"+i.ToString(),Configids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""CONFIGID""=:Configid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""CONFIGID"" DESC");
                return this.Database.ExecuteToList<Assetconfig>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetconfigsPaging
        public List<Assetconfig> RetrieveAssetconfigsPaging(AssetconfigSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSET_CONFIG"".""CONFIGID"",""ASSET_CONFIG"".""CATEGORYID"",""ASSET_CONFIG"".""CATEGORYNAME"",""ASSET_CONFIG"".""CONFIGNAME"",""ASSET_CONFIG"".""CONFIGVALUE"",
                     ""ASSET_CONFIG"".""CREATEDDATE"",""ASSET_CONFIG"".""CREATOR""
                     FROM ""ASSET_CONFIG"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Configid))
                {
                    this.Database.AddInParameter(":Configid",DbType.AnsiString,"%"+info.Configid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CONFIGID"" LIKE :Configid");
                }
                if (!string.IsNullOrEmpty(info.Categoryid))
                {
                    this.Database.AddInParameter(":Categoryid",DbType.AnsiString,"%"+info.Categoryid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CATEGORYID"" LIKE :Categoryid");
                }
                if (!string.IsNullOrEmpty(info.Categoryname))
                {
                    this.Database.AddInParameter(":Categoryname",DbType.AnsiString,"%"+info.Categoryname+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CATEGORYNAME"" LIKE :Categoryname");
                }
                if (!string.IsNullOrEmpty(info.Configname))
                {
                    this.Database.AddInParameter(":Configname",DbType.AnsiString,"%"+info.Configname+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CONFIGNAME"" LIKE :Configname");
                }
                if (!string.IsNullOrEmpty(info.Configvalue))
                {
                    this.Database.AddInParameter(":Configvalue",DbType.AnsiString,"%"+info.Configvalue+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CONFIGVALUE"" LIKE :Configvalue");
                }
                if (!string.IsNullOrEmpty(info.Creator))
                {
                    this.Database.AddInParameter(":Creator", "%"+info.Creator+"%");
                    sqlCommand.AppendLine(@" AND ""ASSET_CONFIG"".""CREATOR"" LIKE :Creator");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSET_CONFIG"".""CONFIGID"" DESC");
                return this.ExecuteReaderPaging<Assetconfig>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
