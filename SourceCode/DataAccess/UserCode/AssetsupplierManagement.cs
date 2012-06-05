/********************************************************************
* File Name:AssetsupplierManagement
* Copyright (C) 2012 Bruce.Huang 
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
    public partial class AssetsupplierManagement:BaseManagement
    {
        #region RetrieveAssetsupplierBySupplierid
        public Assetsupplier RetrieveAssetsupplierBySupplierid(string supplierid)
        {
            try
            {
                this.Database.AddInParameter(":SUPPLIERID", supplierid);
                string sqlCommand = @"SELECT * FROM ASSETSUPPLIER WHERE  SUPPLIERID=:SUPPLIERID";
                return this.Database.ExecuteToSingle<Assetsupplier>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsupplierBySupplierid
        public List<Assetsupplier> RetrieveAssetsupplierBySupplierid(List<string> Supplierids)
        {
            try
            {
                if(Supplierids.Count==0){ return new List<Assetsupplier>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETSUPPLIER"" WHERE 1=1");
                if(Supplierids.Count==1)
                {
                    this.Database.AddInParameter(":Supplierid"+0.ToString(),Supplierids[0]);//DBType:NVARCHAR2
                    sqlCommand.AppendLine(@" AND ""SUPPLIERID""=:Supplierid0");
                }
                else if(Supplierids.Count>1&&Supplierids.Count<=2000)
                {
                    this.Database.AddInParameter(":Supplierid"+0.ToString(),Supplierids[0]);//DBType:NVARCHAR2
                    sqlCommand.AppendLine(@" AND (""SUPPLIERID""=:Supplierid0");
                    for (int i = 1; i < Supplierids.Count; i++)
                    {
                    this.Database.AddInParameter(":Supplierid"+i.ToString(),Supplierids[i]);//DBType:NVARCHAR2
                    sqlCommand.AppendLine(@" OR ""SUPPLIERID""=:Supplierid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""SUPPLIERID"" DESC");
                return this.Database.ExecuteToList<Assetsupplier>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetsuppliersPaging
        public List<Assetsupplier> RetrieveAssetsuppliersPaging(AssetsupplierSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETSUPPLIER"".""SUPPLIERID"",""ASSETSUPPLIER"".""SUPPLIERNAME"",""ASSETSUPPLIER"".""REMARK""
                     FROM ""ASSETSUPPLIER"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Supplierid))
                {
                    this.Database.AddInParameter(":Supplierid", "%"+info.Supplierid+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSUPPLIER"".""SUPPLIERID"" LIKE :Supplierid");
                }
                if (!string.IsNullOrEmpty(info.Suppliername))
                {
                    this.Database.AddInParameter(":Suppliername", "%"+info.Suppliername+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSUPPLIER"".""SUPPLIERNAME"" LIKE :Suppliername");
                }
                if (!string.IsNullOrEmpty(info.Remark))
                {
                    this.Database.AddInParameter(":Remark", "%"+info.Remark+"%");
                    sqlCommand.AppendLine(@" AND ""ASSETSUPPLIER"".""REMARK"" LIKE :Remark");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""ASSETSUPPLIER"".""SUPPLIERID"" DESC");
                return this.ExecuteReaderPaging<Assetsupplier>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion 

        #region RetrieveAllAssetsupplier
        public List<Assetsupplier> RetrieveAllAssetsupplier()
        {
            try
            {
                string sqlCommand = @"SELECT * FROM ASSETSUPPLIER ";
                return this.Database.ExecuteToList<Assetsupplier>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

       
    }
}
