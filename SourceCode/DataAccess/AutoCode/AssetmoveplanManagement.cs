/********************************************************************
* File Name:AssetmoveplanManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-08-03
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
    public partial class AssetmoveplanManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 11;
        public AssetmoveplanManagement()
        { }
        public AssetmoveplanManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetmoveplan
        public Assetmoveplan CreateAssetmoveplan(Assetmoveplan info)
        {
            try
            {
                info.Planid = RetrieveSequenceValueOfCurrentTable();
                this.Database.AddInParameter(":Planid", info.Planid);//DBType:NUMBER
                this.Database.AddInParameter(":Assetparentcategoryid", info.Assetparentcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Storageflag", info.Storageflag);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storage", info.Storage);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Plandatecycle", info.Plandatecycle);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Startdate", info.Startdate);//DBType:DATE
                this.Database.AddInParameter(":Enddate", info.Enddate);//DBType:DATE
                this.Database.AddInParameter(":Plancategory", info.Plancategory);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcount", info.Assetcount);//DBType:NUMBER
                string sqlCommand = @"INSERT INTO ""ASSETMOVEPLAN"" (""PLANID"",""ASSETPARENTCATEGORYID"",""ASSETCATEGORYID"",""STORAGEFLAG"",""STORAGE"",""PLANDATECYCLE"",""CREATEDDATE"",""STARTDATE"",""ENDDATE"",""PLANCATEGORY"",""ASSETCOUNT"") VALUES (:Planid,:Assetparentcategoryid,:Assetcategoryid,:Storageflag,:Storage,:Plandatecycle,:Createddate,:Startdate,:Enddate,:Plancategory,:Assetcount)";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
		public int RetrieveSequenceValueOfCurrentTable()
        {
            try
            {
                var sqlCommand = @"SELECT SEQ_ASSETMOVEPLAN_PLANID.Nextval FROM DUAL";
                return int.Parse(this.Database.ExecuteScalar(sqlCommand).ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }

        #endregion

        #region UpdateAssetmoveplanByPlanid
        public Assetmoveplan UpdateAssetmoveplanByPlanid(Assetmoveplan info)
        {
            try
            {
                this.Database.AddInParameter(":Planid", info.Planid);//DBType:NUMBER
                this.Database.AddInParameter(":Assetparentcategoryid", info.Assetparentcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Storageflag", info.Storageflag);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storage", info.Storage);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Plandatecycle", info.Plandatecycle);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Startdate", info.Startdate);//DBType:DATE
                this.Database.AddInParameter(":Enddate", info.Enddate);//DBType:DATE
                this.Database.AddInParameter(":Plancategory", info.Plancategory);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcount", info.Assetcount);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""ASSETMOVEPLAN"" SET  ""ASSETPARENTCATEGORYID""=:Assetparentcategoryid , ""ASSETCATEGORYID""=:Assetcategoryid , ""STORAGEFLAG""=:Storageflag , ""STORAGE""=:Storage , ""PLANDATECYCLE""=:Plandatecycle , ""CREATEDDATE""=:Createddate , ""STARTDATE""=:Startdate , ""ENDDATE""=:Enddate , ""PLANCATEGORY""=:Plancategory , ""ASSETCOUNT""=:Assetcount WHERE  ""PLANID""=:Planid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetmoveplanByPlanid
        public void DeleteAssetmoveplanByPlanid(int Planid)
        {
            try
            {
                this.Database.AddInParameter(":Planid", Planid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""ASSETMOVEPLAN"" WHERE  ""PLANID""=:Planid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetmoveplanByPlanid
        public void DeleteAssetmoveplanByPlanid(List<int> Planids)
        {
            try
            {
                if(Planids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETMOVEPLAN"" WHERE 1=1");
                if(Planids.Count==1)
                {
                    this.Database.AddInParameter(":Planid"+0.ToString(),Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""PLANID""=:Planid0");
                }
                else if(Planids.Count>1&&Planids.Count<=2000)
                {
                    this.Database.AddInParameter(":Planid"+0.ToString(),Planids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""PLANID""=:Planid0");
                    for (int i = 1; i < Planids.Count; i++)
                    {
                    this.Database.AddInParameter(":Planid"+i.ToString(),Planids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""PLANID""=:Planid"+i.ToString());
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
