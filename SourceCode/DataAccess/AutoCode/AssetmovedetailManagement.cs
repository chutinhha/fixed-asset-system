/********************************************************************
* File Name:AssetmovedetailManagement
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
    public partial class AssetmovedetailManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 6;
        public AssetmovedetailManagement()
        { }
        public AssetmovedetailManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetmovedetail
        public Assetmovedetail CreateAssetmovedetail(Assetmovedetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETMOVEDETAIL"" (""DETAILID"",""ASSETMOVEID"",""ASSETNO"",""PLANMOVEDATE"",""ACTUALMOVEDATE"",""MOVEDCONTENT"") VALUES (:Detailid,:Assetmoveid,:Assetno,:Planmovedate,:Actualmovedate,:Movedcontent)";
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetmoveid", info.Assetmoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmovedate", info.Planmovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualmovedate", info.Actualmovedate);//DBType:DATE
                this.Database.AddInParameter(":Movedcontent", info.Movedcontent);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetmovedetailByDetailid
        public Assetmovedetail UpdateAssetmovedetailByDetailid(Assetmovedetail info)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetmoveid", info.Assetmoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmovedate", info.Planmovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualmovedate", info.Actualmovedate);//DBType:DATE
                this.Database.AddInParameter(":Movedcontent", info.Movedcontent);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSETMOVEDETAIL"" SET  ""ASSETMOVEID""=:Assetmoveid , ""ASSETNO""=:Assetno , ""PLANMOVEDATE""=:Planmovedate , ""ACTUALMOVEDATE""=:Actualmovedate , ""MOVEDCONTENT""=:Movedcontent WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetmovedetailByDetailid
        public void DeleteAssetmovedetailByDetailid(string Detailid)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", Detailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETMOVEDETAIL"" WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetmovedetailByDetailid
        public void DeleteAssetmovedetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETMOVEDETAIL"" WHERE 1=1");
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
