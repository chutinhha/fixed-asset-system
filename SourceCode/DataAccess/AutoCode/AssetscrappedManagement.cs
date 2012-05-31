/********************************************************************
* File Name:AssetscrappedManagement
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
    public partial class AssetscrappedManagement : BaseManagement
    {
        #region Construct
        private const int ColumnCount = 10;
        public AssetscrappedManagement()
        { }
        public AssetscrappedManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion

        #region CreateAssetscrapped
        public Assetscrapped CreateAssetscrapped(Assetscrapped info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSET_SCRAPPED"" (""ASSET_SCRAPPED_ID"",""SCRAPPEDDATE"",""SCRAPPEDUSER"",""ASSETNO"",""APPROVEUSER"",""APPROVEDATE"",""REJECTREASON"",""CREATEDDATE"",""CREATOR"",""APPROVEDSTATE"") VALUES (:Assetscrappedid,:Scrappeddate,:Scrappeduser,:Assetno,:Approveuser,:Approvedate,:Rejectreason,:Createddate,:Creator,:Approvedstate)";
                this.Database.AddInParameter(":Assetscrappedid", info.Assetscrappedid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Scrappeddate", info.Scrappeddate);//DBType:DATE
                this.Database.AddInParameter(":Scrappeduser", info.Scrappeduser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedstate", info.Approvedstate);//DBType:NUMBER
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetscrappedByAssetscrappedid
        public Assetscrapped UpdateAssetscrappedByAssetscrappedid(Assetscrapped info)
        {
            try
            {
                this.Database.AddInParameter(":Assetscrappedid", info.Assetscrappedid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Scrappeddate", info.Scrappeddate);//DBType:DATE
                this.Database.AddInParameter(":Scrappeduser", info.Scrappeduser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedstate", info.Approvedstate);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""ASSET_SCRAPPED"" SET  ""SCRAPPEDDATE""=:Scrappeddate , ""SCRAPPEDUSER""=:Scrappeduser , ""ASSETNO""=:Assetno , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""REJECTREASON""=:Rejectreason , ""CREATEDDATE""=:Createddate , ""CREATOR""=:Creator , ""APPROVEDSTATE""=:Approvedstate WHERE  ""ASSET_SCRAPPED_ID""=:Assetscrappedid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetscrappedByAssetscrappedid
        public void DeleteAssetscrappedByAssetscrappedid(string Assetscrappedid)
        {
            try
            {
                this.Database.AddInParameter(":Assetscrappedid", Assetscrappedid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSET_SCRAPPED"" WHERE  ""ASSET_SCRAPPED_ID""=:Assetscrappedid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetscrappedByAssetscrappedid
        public void DeleteAssetscrappedByAssetscrappedid(List<string> Assetscrappedids)
        {
            try
            {
                if (Assetscrappedids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSET_SCRAPPED"" WHERE 1=1");
                if (Assetscrappedids.Count == 1)
                {
                    this.Database.AddInParameter(":Assetscrappedid" + 0.ToString(), Assetscrappedids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSET_SCRAPPED_ID""=:Assetscrappedid0");
                }
                else if (Assetscrappedids.Count > 1 && Assetscrappedids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Assetscrappedid" + 0.ToString(), Assetscrappedids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSET_SCRAPPED_ID""=:Assetscrappedid0");
                    for (int i = 1; i < Assetscrappedids.Count; i++)
                    {
                        this.Database.AddInParameter(":Assetscrappedid" + i.ToString(), Assetscrappedids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSET_SCRAPPED_ID""=:Assetscrappedid" + i.ToString());
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
