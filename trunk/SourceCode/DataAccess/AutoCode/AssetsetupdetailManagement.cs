/********************************************************************
* File Name:AssetsetupdetailManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-07
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
    public partial class AssetsetupdetailManagement : BaseManagement
    {
        #region Construct
        private const int ColumnCount = 6;
        public AssetsetupdetailManagement()
        { }
        public AssetsetupdetailManagement(BaseManagement baseManagement)
            : base(baseManagement)
        { }
        #endregion

        #region CreateAssetsetupdetail
        public Assetsetupdetail CreateAssetsetupdetail(Assetsetupdetail info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETSETUPDETAIL"" (""DETAILID"",""SETUPID"",""ASSETNO"",""PLANSETUPDATE"",""ACTUALSETUPDATE"",""SETUPCONTENT"") VALUES (:Detailid,:Setupid,:Assetno,:Plansetupdate,:Actualsetupdate,:Setupcontent)";
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Setupid", info.Setupid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Plansetupdate", info.Plansetupdate);//DBType:DATE
                this.Database.AddInParameter(":Actualsetupdate", info.Actualsetupdate);//DBType:DATE
                this.Database.AddInParameter(":Setupcontent", info.Setupcontent);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetsetupdetailByDetailid
        public Assetsetupdetail UpdateAssetsetupdetailByDetailid(Assetsetupdetail info)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", info.Detailid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Setupid", info.Setupid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Plansetupdate", info.Plansetupdate);//DBType:DATE
                this.Database.AddInParameter(":Actualsetupdate", info.Actualsetupdate);//DBType:DATE
                this.Database.AddInParameter(":Setupcontent", info.Setupcontent);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSETSETUPDETAIL"" SET  ""SETUPID""=:Setupid , ""ASSETNO""=:Assetno , ""PLANSETUPDATE""=:Plansetupdate , ""ACTUALSETUPDATE""=:Actualsetupdate , ""SETUPCONTENT""=:Setupcontent WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetsetupdetailByDetailid
        public void DeleteAssetsetupdetailByDetailid(string Detailid)
        {
            try
            {
                this.Database.AddInParameter(":Detailid", Detailid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETSETUPDETAIL"" WHERE  ""DETAILID""=:Detailid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetsetupdetailByDetailid
        public void DeleteAssetsetupdetailByDetailid(List<string> Detailids)
        {
            try
            {
                if (Detailids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETSETUPDETAIL"" WHERE 1=1");
                if (Detailids.Count == 1)
                {
                    this.Database.AddInParameter(":Detailid" + 0.ToString(), Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""DETAILID""=:Detailid0");
                }
                else if (Detailids.Count > 1 && Detailids.Count <= 2000)
                {
                    this.Database.AddInParameter(":Detailid" + 0.ToString(), Detailids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""DETAILID""=:Detailid0");
                    for (int i = 1; i < Detailids.Count; i++)
                    {
                        this.Database.AddInParameter(":Detailid" + i.ToString(), Detailids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""DETAILID""=:Detailid" + i.ToString());
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

        #region DeleteAssetsetupdetailsBySetupid
        public void DeleteAssetsetupdetailsBySetupid(List<string> Setupids)
        {
            try
            {
                if (Setupids.Count == 0) { return; }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETSETUPDETAIL"" WHERE 1=1");
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
