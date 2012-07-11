///********************************************************************
//* File Name:AssetsupplierManagement
//* Copyright (C) 2012 Bruce.huang 
//* Creater & Date:Bruce.huang - 2012-05-29
//* Create Explain:
//* Description:DataBase Access Class
//* Modify Explain:
//* Version:1.0.0
//* ********************************************************************/
//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.Common;
//using System.Text;
//using FixedAsset.Domain;

//namespace FixedAsset.DataAccess
//{
//    public partial class AssetsupplierManagement : BaseManagement
//    {
//        #region Construct
//        private const int ColumnCount = 5;
//        public AssetsupplierManagement()
//        { }
//        public AssetsupplierManagement(BaseManagement baseManagement)
//            : base(baseManagement)
//        { }
//        #endregion

//        #region CreateAssetsupplier
//        public Assetsupplier CreateAssetsupplier(Assetsupplier info)
//        {
//            try
//            {
//                string sqlCommand = @"INSERT INTO ""ASSETSUPPLIER"" (""SUPPLIERID"",""SUPPLIERNAME"",""REMARK"",""SYSTEM"",""ASSETCATEGORYID"") VALUES (:Supplierid,:Suppliername,:Remark,:System,:Assetcategoryid)";
//                this.Database.AddInParameter(":Supplierid", info.Supplierid);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Suppliername", info.Suppliername);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":System", info.System);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:NVARCHAR2
//                this.Database.ExecuteNonQuery(sqlCommand);

//            }
//            finally
//            {
//                this.Database.ClearParameter();
//            }
//            return info;
//        }
//        #endregion

//        #region UpdateAssetsupplierBySupplierid
//        public Assetsupplier UpdateAssetsupplierBySupplierid(Assetsupplier info)
//        {
//            try
//            {
//                this.Database.AddInParameter(":Supplierid", info.Supplierid);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Suppliername", info.Suppliername);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Remark", info.Remark);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":System", info.System);//DBType:NVARCHAR2
//                this.Database.AddInParameter(":Assetcategoryid", info.Assetcategoryid);//DBType:NVARCHAR2
//                string sqlCommand = @"UPDATE ""ASSETSUPPLIER"" SET  ""SUPPLIERNAME""=:Suppliername , ""REMARK""=:Remark , ""SYSTEM""=:System , ""ASSETCATEGORYID""=:Assetcategoryid WHERE  ""SUPPLIERID""=:Supplierid";
//                this.Database.ExecuteNonQuery(sqlCommand);
//            }
//            finally
//            {
//                this.Database.ClearParameter();
//            }
//            return info;
//        }
//        #endregion

//        #region DeleteAssetsupplierBySupplierid
//        public void DeleteAssetsupplierBySupplierid(string Supplierid)
//        {
//            try
//            {
//                this.Database.AddInParameter(":Supplierid", Supplierid);//DBType:NVARCHAR2
//                string sqlCommand = @"DELETE FROM  ""ASSETSUPPLIER"" WHERE  ""SUPPLIERID""=:Supplierid";
//                this.Database.ExecuteNonQuery(sqlCommand);
//            }
//            finally
//            {
//                this.Database.ClearParameter();
//            }
//        }
//        #endregion

//        #region DeleteAssetsupplierBySupplierid
//        public void DeleteAssetsupplierBySupplierid(List<string> Supplierids)
//        {
//            try
//            {
//                if (Supplierids.Count == 0) { return; }
//                StringBuilder sqlCommand = new StringBuilder();
//                sqlCommand.AppendLine(@"DELETE FROM  ""ASSETSUPPLIER"" WHERE 1=1");
//                if (Supplierids.Count == 1)
//                {
//                    this.Database.AddInParameter(":Supplierid" + 0.ToString(), Supplierids[0]);//DBType:NVARCHAR2
//                    sqlCommand.AppendLine(@" AND ""SUPPLIERID""=:Supplierid0");
//                }
//                else if (Supplierids.Count > 1 && Supplierids.Count <= 2000)
//                {
//                    this.Database.AddInParameter(":Supplierid" + 0.ToString(), Supplierids[0]);//DBType:NVARCHAR2
//                    sqlCommand.AppendLine(@" AND (""SUPPLIERID""=:Supplierid0");
//                    for (int i = 1; i < Supplierids.Count; i++)
//                    {
//                        this.Database.AddInParameter(":Supplierid" + i.ToString(), Supplierids[i]);//DBType:NVARCHAR2
//                        sqlCommand.AppendLine(@" OR ""SUPPLIERID""=:Supplierid" + i.ToString());
//                    }
//                    sqlCommand.AppendLine(" )");
//                }

//                this.Database.ExecuteNonQuery(sqlCommand.ToString());
//            }
//            finally
//            {
//                this.Database.ClearParameter();
//            }
//        }
//        #endregion

//    }
//}
