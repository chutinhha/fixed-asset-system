/********************************************************************
* File Name:AssetmaintaindetailManagement
* Copyright (C) 2012 Bruce.huang 
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
    public partial class AssetmaintaindetailManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 6;
        public AssetmaintaindetailManagement()
        { }
        public AssetmaintaindetailManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetmaintaindetail
        public Assetmaintaindetail CreateAssetmaintaindetail(Assetmaintaindetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETMAINTAINDETAIL"" (""DETAILID"",""ASSETMAINTAINID"",""ASSETNO"",""PLANMAINTAINDATE"",""ACTUALMAINTAINDATE"",""MAINTAINCONTENT"") VALUES (:Detailid,:Assetmaintainid,:Assetno,:Planmaintaindate,:Actualmaintaindate,:Maintaincontent)";
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetmaintaindetailByDetailid
        public Assetmaintaindetail UpdateAssetmaintaindetailByDetailid(Assetmaintaindetail info)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSETMAINTAINDETAIL"" SET  ""ASSETMAINTAINID""=:Assetmaintainid , ""ASSETNO""=:Assetno , ""PLANMAINTAINDATE""=:Planmaintaindate , ""ACTUALMAINTAINDATE""=:Actualmaintaindate , ""MAINTAINCONTENT""=:Maintaincontent WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetmaintaindetailByDetailid
        public void DeleteAssetmaintaindetailByDetailid(string Detailid)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", Detailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETMAINTAINDETAIL"" WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetmaintaindetailByDetailid
        public void DeleteAssetmaintaindetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETMAINTAINDETAIL"" WHERE 1=1");
                if(Detailids.Count==1)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""DETAILID""=:Detailid0");
                }
                else if(Detailids.Count>1&&Detailids.Count<=2000)
                {
                    this.Database.AddInParameter(":Detailid"+0.ToString(),Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""DETAILID""=:Detailid0");
                    for (int i = 1; i < Detailids.Count; i++)
                    {
                    this.Database.AddInParameter(":Detailid"+i.ToString(),Detailids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""DETAILID""=:Detailid"+i.ToString());
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
