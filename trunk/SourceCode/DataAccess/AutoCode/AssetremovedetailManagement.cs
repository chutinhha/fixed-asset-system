/********************************************************************
* File Name:AssetremovedetailManagement
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
    public partial class AssetremovedetailManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 6;
        public AssetremovedetailManagement()
        { }
        public AssetremovedetailManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetremovedetail
        public Assetremovedetail CreateAssetremovedetail(Assetremovedetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETREMOVEDETAIL"" (""DETAILID"",""ASSETREMOVEID"",""ASSETNO"",""PLANREMOVEDATE"",""ACTUALREMOVEDATE"",""REMOVEDCONTENT"") VALUES (:Detailid,:Assetremoveid,:Assetno,:Planremovedate,:Actualremovedate,:Removedcontent)";
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetremoveid", info.Assetremoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planremovedate", info.Planremovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualremovedate", info.Actualremovedate);//DBType:DATE
                this.Database.AddInParameter(":Removedcontent", info.Removedcontent);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetremovedetailByDetailid
        public Assetremovedetail UpdateAssetremovedetailByDetailid(Assetremovedetail info)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetremoveid", info.Assetremoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planremovedate", info.Planremovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualremovedate", info.Actualremovedate);//DBType:DATE
                this.Database.AddInParameter(":Removedcontent", info.Removedcontent);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSETREMOVEDETAIL"" SET  ""ASSETREMOVEID""=:Assetremoveid , ""ASSETNO""=:Assetno , ""PLANREMOVEDATE""=:Planremovedate , ""ACTUALREMOVEDATE""=:Actualremovedate , ""REMOVEDCONTENT""=:Removedcontent WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetremovedetailByDetailid
        public void DeleteAssetremovedetailByDetailid(string Detailid)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", Detailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETREMOVEDETAIL"" WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetremovedetailByDetailid
        public void DeleteAssetremovedetailByDetailid(List<string> Detailids)
        {
            try
            {
                if(Detailids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETREMOVEDETAIL"" WHERE 1=1");
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
