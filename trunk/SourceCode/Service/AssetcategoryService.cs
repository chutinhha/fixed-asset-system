/********************************************************************
* File Name:AssetcategoryManagement
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
    public partial class AssetcategoryService:BaseService,IAssetcategoryService
    {

        #region Management

        private AssetcategoryManagement m_Management;

        protected AssetcategoryManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetcategoryManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetcategorysPaging
        public List<Assetcategory> RetrieveAssetcategorysPaging(AssetcategorySearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetcategorysPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetcategoryByAssetcategoryid
        public Assetcategory RetrieveAssetcategoryByAssetcategoryid(string assetcategoryid)
        {
            return Management.RetrieveAssetcategoryByAssetcategoryid(assetcategoryid);
        }
        #endregion

        #region RetrieveAssetcategoryByAssetcategoryid
        public List<Assetcategory> RetrieveAssetcategoryByAssetcategoryid(List<string> assetcategoryids)
        {
            return Management.RetrieveAssetcategoryByAssetcategoryid(assetcategoryids);
        }
        #endregion

        #region CreateAssetcategory
        public Assetcategory CreateAssetcategory(Assetcategory info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetcategory(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region UpdateAssetcategoryByAssetcategoryid
        public Assetcategory UpdateAssetcategoryByAssetcategoryid(Assetcategory info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetcategoryByAssetcategoryid(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region DeleteAssetcategoryByAssetcategoryid
        public void DeleteAssetcategoryByAssetcategoryid(string assetcategoryid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetcategoryByAssetcategoryid(assetcategoryid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetcategoryByAssetcategoryid
        public void DeleteAssetcategoryByAssetcategoryid(List<string> assetcategoryids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetcategoryByAssetcategoryid(assetcategoryids);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

    }
}
