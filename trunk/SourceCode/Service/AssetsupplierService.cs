/********************************************************************
* File Name:AssetsupplierManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Create Explain:
* Description:Service Layer Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class AssetsupplierService:BaseService,IAssetsupplierService
    {

        #region Management

        private AssetsupplierManagement m_Management;

        protected AssetsupplierManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetsupplierManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsuppliersPaging
        public List<Assetsupplier> RetrieveAssetsuppliersPaging(AssetsupplierSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetsuppliersPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetsupplierBySupplierid
        public Assetsupplier RetrieveAssetsupplierBySupplierid(string supplierid)
        {
            return Management.RetrieveAssetsupplierBySupplierid(supplierid);
        }
        #endregion

        #region RetrieveAssetsupplierBySupplierid
        public List<Assetsupplier> RetrieveAssetsupplierBySupplierid(List<string> supplierids)
        {
            return Management.RetrieveAssetsupplierBySupplierid(supplierids);
        }
        #endregion  

        #region RetrieveAllAssetsupplier
        public List<Assetsupplier> RetrieveAllAssetsupplier()
        {
            return Management.RetrieveAllAssetsupplier();
        }
        #endregion
    }
}
