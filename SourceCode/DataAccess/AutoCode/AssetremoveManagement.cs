/********************************************************************
* File Name:AssetremoveManagement
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
    public partial class AssetremoveManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 20;
        public AssetremoveManagement()
        { }
        public AssetremoveManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetremove
        public Assetremove CreateAssetremove(Assetremove info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETREMOVE"" (""ASSETREMOVEID"",""APPLYDATE"",""APPLYUSERID"",""APPLYCONTENT"",""SUBCOMPANY"",""SUBCOMPANYCONTACTORID"",""CREATOR"",""CREATEDDATE"",""PROJECTCONTACTORID"",""PROJECTCONTACTORPHONE"",""PLANREMOVEDATE"",""ACTUALREMOVEDATE"",""REJECTREASON"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""ASSETCATEGORYID"",""REMOVEDCONTENT"",""CONFIRMDATE"",""CONFIRMUSER"") VALUES (:Assetremoveid,:Applydate,:Applyuserid,:Applycontent,:Subcompany,:Subcompanycontactorid,:Creator,:Createddate,:Projectcontactorid,:Projectcontactorphone,:Planremovedate,:Actualremovedate,:Rejectreason,:Approveuser,:Approvedate,:Approveresult,:Assetcategoryid,:Removedcontent,:Confirmdate,:Confirmuser)";
                this.Database.AddInParameter(":Assetremoveid", info.Assetremoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planremovedate", info.Planremovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualremovedate", info.Actualremovedate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Removedcontent", info.Removedcontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetremoveByAssetremoveid
        public Assetremove UpdateAssetremoveByAssetremoveid(Assetremove info)
        {
            try
            {
                this.Database.AddInParameter(":Assetremoveid", info.Assetremoveid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planremovedate", info.Planremovedate);//DBType:DATE
                this.Database.AddInParameter(":Actualremovedate", info.Actualremovedate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Removedcontent", info.Removedcontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""ASSETREMOVE"" SET  ""APPLYDATE""=:Applydate , ""APPLYUSERID""=:Applyuserid , ""APPLYCONTENT""=:Applycontent , ""SUBCOMPANY""=:Subcompany , ""SUBCOMPANYCONTACTORID""=:Subcompanycontactorid , ""CREATOR""=:Creator , ""CREATEDDATE""=:Createddate , ""PROJECTCONTACTORID""=:Projectcontactorid , ""PROJECTCONTACTORPHONE""=:Projectcontactorphone , ""PLANREMOVEDATE""=:Planremovedate , ""ACTUALREMOVEDATE""=:Actualremovedate , ""REJECTREASON""=:Rejectreason , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""ASSETCATEGORYID""=:Assetcategoryid , ""REMOVEDCONTENT""=:Removedcontent , ""CONFIRMDATE""=:Confirmdate , ""CONFIRMUSER""=:Confirmuser WHERE  ""ASSETREMOVEID""=:Assetremoveid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetremoveByAssetremoveid
        public void DeleteAssetremoveByAssetremoveid(string Assetremoveid)
        {
            try
            {
                this.Database.AddInParameter(":Assetremoveid", Assetremoveid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETREMOVE"" WHERE  ""ASSETREMOVEID""=:Assetremoveid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetremoveByAssetremoveid
        public void DeleteAssetremoveByAssetremoveid(List<string> Assetremoveids)
        {
            try
            {
                if(Assetremoveids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETREMOVE"" WHERE 1=1");
                if(Assetremoveids.Count==1)
                {
                    this.Database.AddInParameter(":Assetremoveid"+0.ToString(),Assetremoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETREMOVEID""=:Assetremoveid0");
                }
                else if(Assetremoveids.Count>1&&Assetremoveids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetremoveid"+0.ToString(),Assetremoveids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETREMOVEID""=:Assetremoveid0");
                    for (int i = 1; i < Assetremoveids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetremoveid"+i.ToString(),Assetremoveids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETREMOVEID""=:Assetremoveid"+i.ToString());
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
