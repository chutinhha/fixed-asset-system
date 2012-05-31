/********************************************************************
* File Name:AssetconfigManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 7;
        public AssetconfigManagement()
        { }
        public AssetconfigManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetconfig
        public Assetconfig CreateAssetconfig(Assetconfig info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSET_CONFIG"" (""CONFIGID"",""CATEGORYID"",""CATEGORYNAME"",""CONFIGNAME"",""CONFIGVALUE"",""CREATEDDATE"",""CREATOR"") VALUES (:Configid,:Categoryid,:Categoryname,:Configname,:Configvalue,:Createddate,:Creator)";
                this.Database.AddInParameter(":Configid", info.Configid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryid", info.Categoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryname", info.Categoryname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Configname", info.Configname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Configvalue", info.Configvalue);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetconfigByConfigid
        public Assetconfig UpdateAssetconfigByConfigid(Assetconfig info)
        {
            try
            {
                this.Database.AddInParameter(":Configid", info.Configid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryid", info.Categoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryname", info.Categoryname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Configname", info.Configname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Configvalue", info.Configvalue);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSET_CONFIG"" SET  ""CATEGORYID""=:Categoryid , ""CATEGORYNAME""=:Categoryname , ""CONFIGNAME""=:Configname , ""CONFIGVALUE""=:Configvalue , ""CREATEDDATE""=:Createddate , ""CREATOR""=:Creator WHERE  ""CONFIGID""=:Configid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetconfigByConfigid
        public void DeleteAssetconfigByConfigid(string Configid)
        {
            try
            {
                this.Database.AddInParameter(":Configid", Configid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSET_CONFIG"" WHERE  ""CONFIGID""=:Configid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetconfigByConfigid
        public void DeleteAssetconfigByConfigid(List<string> Configids)
        {
            try
            {
                if(Configids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSET_CONFIG"" WHERE 1=1");
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

                this.Database.ExecuteNonQuery(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
