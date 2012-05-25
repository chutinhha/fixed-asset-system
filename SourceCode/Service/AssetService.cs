/********************************************************************
* File Name:AssetManagement
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
    public partial class AssetService:BaseService,IAssetService
    {

        #region Management

        private AssetManagement m_Management;

        protected AssetManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsPaging
        public List<Asset> RetrieveAssetsPaging(AssetSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public Asset RetrieveAssetByAssetno(string assetno)
        {
            return Management.RetrieveAssetByAssetno(assetno);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public List<Asset> RetrieveAssetByAssetno(List<string> assetnos)
        {
            return Management.RetrieveAssetByAssetno(assetnos);
        }
        #endregion

        #region CreateAsset
        public Asset CreateAsset(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAsset(info);
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

        #region UpdateAssetByAssetno
        public Asset UpdateAssetByAssetno(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetByAssetno(info);
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

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(string assetno)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetno);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(List<string> assetnos)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetnos);
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
