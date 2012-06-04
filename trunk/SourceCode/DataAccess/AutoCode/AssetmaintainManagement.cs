/********************************************************************
* File Name:AssetmaintainManagement
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
    public partial class AssetmaintainManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 24;
        public AssetmaintainManagement()
        { }
        public AssetmaintainManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAssetmaintain
        public Assetmaintain CreateAssetmaintain(Assetmaintain info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSETMAINTAIN"" (""ASSETMAINTAINID"",""ASSETCATEGORYID"",""MAINTAINTYPE"",""APPLYDATE"",""APPLYUSERID"",""APPLYCONTENT"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""REJECTREASON"",""PLANMAINTAINDATE"",""ACTUALMAINTAINDATE"",""CONFIRMDATE"",""CONFIRMUSER"",""MAINTAINCONTENT"",""STORAGETITLE"",""STORAGEID"",""SUBCOMPANY"",""SUBCOMPANYCONTACTORID"",""CONTACTPHONE"",""PROJECTCONTACTORID"",""PROJECTCONTACTORPHONE"",""CREATOR"",""CREATEDDATE"") VALUES (:Assetmaintainid,:Assetcategoryid,:Maintaintype,:Applydate,:Applyuserid,:Applycontent,:Approveuser,:Approvedate,:Approveresult,:Rejectreason,:Planmaintaindate,:Actualmaintaindate,:Confirmdate,:Confirmuser,:Maintaincontent,:Storagetitle,:Storageid,:Subcompany,:Subcompanycontactorid,:Contactphone,:Projectcontactorid,:Projectcontactorphone,:Creator,:Createddate)";
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaintype", info.Maintaintype);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
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

        #region UpdateAssetmaintainByAssetmaintainid
        public Assetmaintain UpdateAssetmaintainByAssetmaintainid(Assetmaintain info)
        {
            try
            {
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaintype", info.Maintaintype);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storagetitle", info.Storagetitle);//DBType:VARCHAR2
                this.Database.AddInParameter(":Storageid", info.Storageid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Contactphone", info.Contactphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                string sqlCommand = @"UPDATE ""ASSETMAINTAIN"" SET  ""ASSETCATEGORYID""=:Assetcategoryid , ""MAINTAINTYPE""=:Maintaintype , ""APPLYDATE""=:Applydate , ""APPLYUSERID""=:Applyuserid , ""APPLYCONTENT""=:Applycontent , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""REJECTREASON""=:Rejectreason , ""PLANMAINTAINDATE""=:Planmaintaindate , ""ACTUALMAINTAINDATE""=:Actualmaintaindate , ""CONFIRMDATE""=:Confirmdate , ""CONFIRMUSER""=:Confirmuser , ""MAINTAINCONTENT""=:Maintaincontent , ""STORAGETITLE""=:Storagetitle , ""STORAGEID""=:Storageid , ""SUBCOMPANY""=:Subcompany , ""SUBCOMPANYCONTACTORID""=:Subcompanycontactorid , ""CONTACTPHONE""=:Contactphone , ""PROJECTCONTACTORID""=:Projectcontactorid , ""PROJECTCONTACTORPHONE""=:Projectcontactorphone , ""CREATOR""=:Creator , ""CREATEDDATE""=:Createddate WHERE  ""ASSETMAINTAINID""=:Assetmaintainid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetmaintainByAssetmaintainid
        public void DeleteAssetmaintainByAssetmaintainid(string Assetmaintainid)
        {
            try
            {
                this.Database.AddInParameter(":Assetmaintainid", Assetmaintainid);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSETMAINTAIN"" WHERE  ""ASSETMAINTAINID""=:Assetmaintainid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetmaintainByAssetmaintainid
        public void DeleteAssetmaintainByAssetmaintainid(List<string> Assetmaintainids)
        {
            try
            {
                if(Assetmaintainids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETMAINTAIN"" WHERE 1=1");
                if(Assetmaintainids.Count==1)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETMAINTAINID""=:Assetmaintainid0");
                }
                else if(Assetmaintainids.Count>1&&Assetmaintainids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetmaintainid"+0.ToString(),Assetmaintainids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETMAINTAINID""=:Assetmaintainid0");
                    for (int i = 1; i < Assetmaintainids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetmaintainid"+i.ToString(),Assetmaintainids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETMAINTAINID""=:Assetmaintainid"+i.ToString());
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
