/********************************************************************
* File Name:AssetsetupinfoManagement
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
    public partial class AssetsetupinfoManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 22;
        public AssetsetupinfoManagement()
        { }
        public AssetsetupinfoManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetsetupinfo
        public Assetsetupinfo CreateAssetsetupinfo(Assetsetupinfo info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETSETUPINFO"" (""SETUPID"",""APPLYSETUPDATE"",""APPLYDATE"",""APPLYUSERID"",""CONTACTPHONE"",""PROJECTCONTACTORID"",""PROJECTCONTACTORPHONE"",""PLANSETUPDATE"",""ACTUALSETUPDATE"",""APPLYCONTENT"",""SUBCOMPANY"",""REJECTREASON"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""CREATEDDATE"",""SUBCOMPANYCONTACTORID"",""CREATOR"",""ASSETCATEGORYID"",""SETUPCONTENT"",""CONFIRMDATE"",""CONFIRMUSER"") VALUES (:Setupid,:Applysetupdate,:Applydate,:Applyuserid,:Contactphone,:Projectcontactorid,:Projectcontactorphone,:Plansetupdate,:Actualsetupdate,:Applycontent,:Subcompany,:Rejectreason,:Approveuser,:Approvedate,:Approveresult,:Createddate,:Subcompanycontactorid,:Creator,:Assetcategoryid,:Setupcontent,:Confirmdate,:Confirmuser)";
                this.Database.AddInParameter(":Setupid", info.Setupid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applysetupdate", info.Applysetupdate);//DBType:DATE
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contactphone", info.Contactphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Plansetupdate", info.Plansetupdate);//DBType:DATE
                this.Database.AddInParameter(":Actualsetupdate", info.Actualsetupdate);//DBType:DATE
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Setupcontent", info.Setupcontent);//DBType:NVARCHAR2
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

        #region UpdateAssetsetupinfoBySetupid
        public Assetsetupinfo UpdateAssetsetupinfoBySetupid(Assetsetupinfo info)
        {
            try
            {
                this.Database.AddInParameter(":Setupid", info.Setupid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applysetupdate", info.Applysetupdate);//DBType:DATE
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contactphone", info.Contactphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Plansetupdate", info.Plansetupdate);//DBType:DATE
                this.Database.AddInParameter(":Actualsetupdate", info.Actualsetupdate);//DBType:DATE
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Setupcontent", info.Setupcontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""ASSETSETUPINFO"" SET  ""APPLYSETUPDATE""=:Applysetupdate , ""APPLYDATE""=:Applydate , ""APPLYUSERID""=:Applyuserid , ""CONTACTPHONE""=:Contactphone , ""PROJECTCONTACTORID""=:Projectcontactorid , ""PROJECTCONTACTORPHONE""=:Projectcontactorphone , ""PLANSETUPDATE""=:Plansetupdate , ""ACTUALSETUPDATE""=:Actualsetupdate , ""APPLYCONTENT""=:Applycontent , ""SUBCOMPANY""=:Subcompany , ""REJECTREASON""=:Rejectreason , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""CREATEDDATE""=:Createddate , ""SUBCOMPANYCONTACTORID""=:Subcompanycontactorid , ""CREATOR""=:Creator , ""ASSETCATEGORYID""=:Assetcategoryid , ""SETUPCONTENT""=:Setupcontent , ""CONFIRMDATE""=:Confirmdate , ""CONFIRMUSER""=:Confirmuser WHERE  ""SETUPID""=:Setupid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetsetupinfoBySetupid
        public void DeleteAssetsetupinfoBySetupid(string Setupid)
        {
            try
            {
                this.Database.AddInParameter(":Setupid", Setupid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETSETUPINFO"" WHERE  ""SETUPID""=:Setupid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetsetupinfoBySetupid
        public void DeleteAssetsetupinfoBySetupid(List<string> Setupids)
        {
            try
            {
                if(Setupids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETSETUPINFO"" WHERE 1=1");
                if(Setupids.Count==1)
                {
                    this.Database.AddInParameter(":Setupid"+0.ToString(),Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""SETUPID""=:Setupid0");
                }
                else if(Setupids.Count>1&&Setupids.Count<=2000)
                {
                    this.Database.AddInParameter(":Setupid"+0.ToString(),Setupids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""SETUPID""=:Setupid0");
                    for (int i = 1; i < Setupids.Count; i++)
                    {
                    this.Database.AddInParameter(":Setupid"+i.ToString(),Setupids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""SETUPID""=:Setupid"+i.ToString());
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
