/********************************************************************
* File Name:AssetmaintainManagement
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
    public partial class AssetmaintainManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 21;
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
                string sqlCommand = @"INSERT INTO ""ASSETMAINTAIN"" (""ASSETMAINTAINID"",""MAINTAINTYPE"",""APPLYDATE"",""APPLYUSERID"",""APPLYCONTENT"",""SUBCOMPANY"",""SUBCOMPANYCONTACTORID"",""CREATOR"",""CREATEDDATE"",""PROJECTCONTACTORID"",""PROJECTCONTACTORPHONE"",""PLANMAINTAINDATE"",""ACTUALMAINTAINDATE"",""REJECTREASON"",""APPROVEUSER"",""APPROVEDATE"",""APPROVERESULT"",""ASSETCATEGORYID"",""MAINTAINCONTENT"",""CONFIRMDATE"",""CONFIRMUSER"") VALUES (:Assetmaintainid,:Maintaintype,:Applydate,:Applyuserid,:Applycontent,:Subcompany,:Subcompanycontactorid,:Creator,:Createddate,:Projectcontactorid,:Projectcontactorphone,:Planmaintaindate,:Actualmaintaindate,:Rejectreason,:Approveuser,:Approvedate,:Approveresult,:Assetcategoryid,:Maintaincontent,:Confirmdate,:Confirmuser)";
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaintype", info.Maintaintype);//DBType:NUMBER
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
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

        #region UpdateAssetmaintainByAssetmaintainid
        public Assetmaintain UpdateAssetmaintainByAssetmaintainid(Assetmaintain info)
        {
            try
            {
                this.Database.AddInParameter(":Assetmaintainid", info.Assetmaintainid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaintype", info.Maintaintype);//DBType:NUMBER
                this.Database.AddInParameter(":Applydate", info.Applydate);//DBType:DATE
                this.Database.AddInParameter(":Applyuserid", info.Applyuserid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Applycontent", info.Applycontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompany", info.Subcompany);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Subcompanycontactorid", info.Subcompanycontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Creator", info.Creator);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Projectcontactorid", info.Projectcontactorid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Projectcontactorphone", info.Projectcontactorphone);//DBType:VARCHAR2
                this.Database.AddInParameter(":Planmaintaindate", info.Planmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Actualmaintaindate", info.Actualmaintaindate);//DBType:DATE
                this.Database.AddInParameter(":Rejectreason", info.Rejectreason);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approveuser", info.Approveuser);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Approvedate", info.Approvedate);//DBType:DATE
                this.Database.AddInParameter(":Approveresult", info.Approveresult);//DBType:NUMBER
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Maintaincontent", info.Maintaincontent);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Confirmdate", info.Confirmdate);//DBType:DATE
                this.Database.AddInParameter(":Confirmuser", info.Confirmuser);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""ASSETMAINTAIN"" SET  ""MAINTAINTYPE""=:Maintaintype , ""APPLYDATE""=:Applydate , ""APPLYUSERID""=:Applyuserid , ""APPLYCONTENT""=:Applycontent , ""SUBCOMPANY""=:Subcompany , ""SUBCOMPANYCONTACTORID""=:Subcompanycontactorid , ""CREATOR""=:Creator , ""CREATEDDATE""=:Createddate , ""PROJECTCONTACTORID""=:Projectcontactorid , ""PROJECTCONTACTORPHONE""=:Projectcontactorphone , ""PLANMAINTAINDATE""=:Planmaintaindate , ""ACTUALMAINTAINDATE""=:Actualmaintaindate , ""REJECTREASON""=:Rejectreason , ""APPROVEUSER""=:Approveuser , ""APPROVEDATE""=:Approvedate , ""APPROVERESULT""=:Approveresult , ""ASSETCATEGORYID""=:Assetcategoryid , ""MAINTAINCONTENT""=:Maintaincontent , ""CONFIRMDATE""=:Confirmdate , ""CONFIRMUSER""=:Confirmuser WHERE  ""ASSETMAINTAINID""=:Assetmaintainid";
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
