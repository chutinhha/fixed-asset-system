/********************************************************************
* File Name:AssetcategoryManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-11
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
    public partial class AssetcategoryManagement : BaseManagement
    {
        #region Construct
        private const int ColumnCount = 8;
        public AssetcategoryManagement()
        { }
        public AssetcategoryManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion

        #region CreateAssetcategory
        public Assetcategory CreateAssetcategory(Assetcategory info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETCATEGORY"" (""ASSETCATEGORYID"",""ASSETPARENTCATEGORYID"",""ASSETCATEGORYNAME"",""REMARK"",""CREATEDATE"",""CREATOR"",""CATEGORYVALUE"",""SYSTEM"") VALUES (:Assetcategoryid,:Assetparentcategoryid,:Assetcategoryname,:Remark,:Createdate,:Creator,:Categoryvalue,:System)";
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetparentcategoryid", info.Assetparentcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryname", info.Assetcategoryname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createdate", info.Createdate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryvalue", info.Categoryvalue);//DBType:VARCHAR2
                this.Database.AddInParameter(":System", info.System);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetcategoryByAssetcategoryid
        public Assetcategory UpdateAssetcategoryByAssetcategoryid(Assetcategory info)
        {
            try
            {
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetparentcategoryid", info.Assetparentcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryname", info.Assetcategoryname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createdate", info.Createdate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Categoryvalue", info.Categoryvalue);//DBType:VARCHAR2
                this.Database.AddInParameter(":System", info.System);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSETCATEGORY"" SET  ""ASSETPARENTCATEGORYID""=:Assetparentcategoryid , ""ASSETCATEGORYNAME""=:Assetcategoryname , ""REMARK""=:Remark , ""CREATEDATE""=:Createdate , ""CREATOR""=:Creator , ""CATEGORYVALUE""=:Categoryvalue , ""SYSTEM""=:System WHERE  ""ASSETCATEGORYID""=:Assetcategoryid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetcategoryByAssetcategoryid
        public void DeleteAssetcategoryByAssetcategoryid(string Assetcategoryid)
        {
            try
            {
                this.Database.AddInParameter(":Assetcategoryid", Assetcategoryid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETCATEGORY"" WHERE  ""ASSETCATEGORYID""=:Assetcategoryid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetcategoryByAssetcategoryid
        public void DeleteAssetcategoryByAssetcategoryid(List<string> Assetcategoryids)
        {
            try
            {
                if (Assetcategoryids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETCATEGORY"" WHERE 1=1");
                if (Assetcategoryids.Count == 1)
                {
                    this.Database.AddInParameter(":Assetcategoryid" + 0.ToString(), Assetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORYID""=:Assetcategoryid0");
                }
                else if (Assetcategoryids.Count > 1 && Assetcategoryids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Assetcategoryid" + 0.ToString(), Assetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETCATEGORYID""=:Assetcategoryid0");
                    for (int i = 1; i < Assetcategoryids.Count; i++)
                    {
                        this.Database.AddInParameter(":Assetcategoryid" + i.ToString(), Assetcategoryids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSETCATEGORYID""=:Assetcategoryid" + i.ToString());
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
