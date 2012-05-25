/********************************************************************
* File Name:AssetmaintainManagement
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
    public partial class AssetmaintainService:BaseService,IAssetmaintainService
    {

        #region Management

        private AssetmaintainManagement m_Management;

        protected AssetmaintainManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmaintainManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmaintainsPaging
        public List<Assetmaintain> RetrieveAssetmaintainsPaging(AssetmaintainSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetmaintainsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetmaintainByAssetmaintainid
        public Assetmaintain RetrieveAssetmaintainByAssetmaintainid(string assetmaintainid)
        {
            return Management.RetrieveAssetmaintainByAssetmaintainid(assetmaintainid);
        }
        #endregion

        #region RetrieveAssetmaintainByAssetmaintainid
        public List<Assetmaintain> RetrieveAssetmaintainByAssetmaintainid(List<string> assetmaintainids)
        {
            return Management.RetrieveAssetmaintainByAssetmaintainid(assetmaintainids);
        }
        #endregion

        #region CreateAssetmaintain
        public Assetmaintain CreateAssetmaintain(Assetmaintain info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetmaintain(info);
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

        #region UpdateAssetmaintainByAssetmaintainid
        public Assetmaintain UpdateAssetmaintainByAssetmaintainid(Assetmaintain info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetmaintainByAssetmaintainid(info);
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

        #region DeleteAssetmaintainByAssetmaintainid
        public void DeleteAssetmaintainByAssetmaintainid(string assetmaintainid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmaintainByAssetmaintainid(assetmaintainid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetmaintainByAssetmaintainid
        public void DeleteAssetmaintainByAssetmaintainid(List<string> assetmaintainids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmaintainByAssetmaintainid(assetmaintainids);
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
