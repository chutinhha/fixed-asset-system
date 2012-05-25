/********************************************************************
* File Name:AssetManagement
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
    public partial class AssetManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 15;
        public AssetManagement()
        { }
        public AssetManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateAsset
        public Asset CreateAsset(Asset info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""ASSET"" (""ASSETNO"",""ASSETCATEGORYID"",""ASSETNAME"",""STORAGE"",""STATE"",""DEPRECIATIONYEAR"",""UNITPRICE"",""BRAND"",""MANAGEMODE"",""FINANCECATEGORY"",""SUPPLIERID"",""PURCHASEDATE"",""EXPIREDDATE"",""ASSETSPECIFICATION"",""STORAGEFLAG"") VALUES (:Assetno,:Assetcategoryid,:Assetname,:Storage,:State,:Depreciationyear,:Unitprice,:Brand,:Managemode,:Financecategory,:Supplierid,:Purchasedate,:Expireddate,:Assetspecification,:Storageflag)";
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storage", info.Storage);//DBType:NVARCHAR2
                this.Database.AddInParameter(":State", info.State);//DBType:NUMBER
                this.Database.AddInParameter(":Depreciationyear", info.Depreciationyear);//DBType:NUMBER
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Brand", info.Brand);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Managemode", info.Managemode);//DBType:NUMBER
                this.Database.AddInParameter(":Financecategory", info.Financecategory);//DBType:NUMBER
                this.Database.AddInParameter(":Supplierid", info.Supplierid);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Purchasedate", info.Purchasedate);//DBType:DATE
                this.Database.AddInParameter(":Expireddate", info.Expireddate);//DBType:DATE
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storageflag", info.Storageflag);//DBType:NVARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateAssetByAssetno
        public Asset UpdateAssetByAssetno(Asset info)
        {
            try
            {
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storage", info.Storage);//DBType:NVARCHAR2
                this.Database.AddInParameter(":State", info.State);//DBType:NUMBER
                this.Database.AddInParameter(":Depreciationyear", info.Depreciationyear);//DBType:NUMBER
                this.Database.AddInParameter(":Unitprice", info.Unitprice);//DBType:NUMBER
                this.Database.AddInParameter(":Brand", info.Brand);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Managemode", info.Managemode);//DBType:NUMBER
                this.Database.AddInParameter(":Financecategory", info.Financecategory);//DBType:NUMBER
                this.Database.AddInParameter(":Supplierid", info.Supplierid);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Purchasedate", info.Purchasedate);//DBType:DATE
                this.Database.AddInParameter(":Expireddate", info.Expireddate);//DBType:DATE
                this.Database.AddInParameter(":Assetspecification", info.Assetspecification);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Storageflag", info.Storageflag);//DBType:NVARCHAR2
                string sqlCommand = @"UPDATE ""ASSET"" SET  ""ASSETCATEGORYID""=:Assetcategoryid , ""ASSETNAME""=:Assetname , ""STORAGE""=:Storage , ""STATE""=:State , ""DEPRECIATIONYEAR""=:Depreciationyear , ""UNITPRICE""=:Unitprice , ""BRAND""=:Brand , ""MANAGEMODE""=:Managemode , ""FINANCECATEGORY""=:Financecategory , ""SUPPLIERID""=:Supplierid , ""PURCHASEDATE""=:Purchasedate , ""EXPIREDDATE""=:Expireddate , ""ASSETSPECIFICATION""=:Assetspecification , ""STORAGEFLAG""=:Storageflag WHERE  ""ASSETNO""=:Assetno";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(string Assetno)
        {
            try
            {
                this.Database.AddInParameter(":Assetno", Assetno);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""ASSET"" WHERE  ""ASSETNO""=:Assetno";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(List<string> Assetnos)
        {
            try
            {
                if(Assetnos.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""ASSET"" WHERE 1=1");
                if(Assetnos.Count==1)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETNO""=:Assetno0");
                }
                else if(Assetnos.Count>1&&Assetnos.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETNO""=:Assetno0");
                    for (int i = 1; i < Assetnos.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetno"+i.ToString(),Assetnos[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETNO""=:Assetno"+i.ToString());
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
