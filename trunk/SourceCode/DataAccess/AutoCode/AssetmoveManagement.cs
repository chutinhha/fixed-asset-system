/********************************************************************
* File Name:AssetmoveManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
    public partial class AssetmoveManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 23;
        public AssetmoveManagement()
        { }
        public AssetmoveManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetmove
        public Assetmove CreateAssetmove(Assetmove info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETMOVE"" (""ASSETMOVEID"",""ASSETCATEGORYID"",""APPLYDATE"",""APPLYUSERID"",""APPLYCONTENT"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""REJECTREASON"",""PLANMOVEDATE"",""ACTUALMOVEDATE"",""CONFIRMDATE"",""CONFIRMUSER"",""MOVEDCONTENT"",""STORAGETITLE"",""STORAGEID"",""SUBCOMPANY"",""SUBCOMPANYCONTACTORID"",""CONTACTPHONE"",""PROJECTCONTACTORID"",""PROJECTCONTACTORPHONE"",""CREATOR"",""CREATEDDATE"") VALUES (:Assetmoveid,:Assetcategoryid,:Applydate,:Applyuserid,:Applycontent,:Approveuser,:Approvedate,:Approveresult,:Rejectreason,:Planmovedate,:Actualmovedate,:Confirmdate,:Confirmuser,:Movedcontent,:Storagetitle,:Storageid,:Subcompany,:Subcompanycontactorid,:Contactphone,:Projectcontactorid,:Projectcontactorphone,:Creator,:Createddate)";
                this.Database.AddInParameter(":Assetmoveid", info.Assetmoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Planmovedate", info.Planmovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualmovedate", info.Actualmovedate);//DBType:DATE
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Movedcontent", info.Movedcontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storagetitle", info.Storagetitle);//DBType:VARCHAR2
                this.Database.AddInParameter(":Storageid", info.Storageid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contactphone", info.Contactphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetmoveByAssetmoveid
        public Assetmove UpdateAssetmoveByAssetmoveid(Assetmove info)
        {
            try
            {
                this.Database.AddInParameter(":Assetmoveid", info.Assetmoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Planmovedate", info.Planmovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualmovedate", info.Actualmovedate);//DBType:DATE
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Movedcontent", info.Movedcontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storagetitle", info.Storagetitle);//DBType:VARCHAR2
                this.Database.AddInParameter(":Storageid", info.Storageid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contactphone", info.Contactphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                string sqlCommand = @"UPDATE ""ASSETMOVE"" SET  ""ASSETCATEGORYID""=:Assetcategoryid , ""APPLYDATE""=:Applydate , ""APPLYUSERID""=:Applyuserid , ""APPLYCONTENT""=:Applycontent , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""REJECTREASON""=:Rejectreason , ""PLANMOVEDATE""=:Planmovedate , ""ACTUALMOVEDATE""=:Actualmovedate , ""CONFIRMDATE""=:Confirmdate , ""CONFIRMUSER""=:Confirmuser , ""MOVEDCONTENT""=:Movedcontent , ""STORAGETITLE""=:Storagetitle , ""STORAGEID""=:Storageid , ""SUBCOMPANY""=:Subcompany , ""SUBCOMPANYCONTACTORID""=:Subcompanycontactorid , ""CONTACTPHONE""=:Contactphone , ""PROJECTCONTACTORID""=:Projectcontactorid , ""PROJECTCONTACTORPHONE""=:Projectcontactorphone , ""CREATOR""=:Creator , ""CREATEDDATE""=:Createddate WHERE  ""ASSETMOVEID""=:Assetmoveid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetmoveByAssetmoveid
        public void DeleteAssetmoveByAssetmoveid(string Assetmoveid)
        {
            try
            {
                this.Database.AddInParameter(":Assetmoveid", Assetmoveid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETMOVE"" WHERE  ""ASSETMOVEID""=:Assetmoveid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetmoveByAssetmoveid
        public void DeleteAssetmoveByAssetmoveid(List<string> Assetmoveids)
        {
            try
            {
                if(Assetmoveids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETMOVE"" WHERE 1=1");
                if(Assetmoveids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMOVEID""=:Assetmoveid0");
                }
                else if(Assetmoveids.Count>1&&Assetmoveids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmoveid"+0.ToString(),Assetmoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMOVEID""=:Assetmoveid0");
                    for (int i = 1; i < Assetmoveids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmoveid"+i.ToString(),Assetmoveids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMOVEID""=:Assetmoveid"+i.ToString());
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
