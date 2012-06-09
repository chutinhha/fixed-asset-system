/********************************************************************
* File Name:AssetconfigManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    public partial class AssetconfigService:BaseService,IAssetconfigService
    {

        #region Management

        private AssetconfigManagement m_Management;

        protected AssetconfigManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetconfigManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetconfigsPaging
        public List<Assetconfig> RetrieveAssetconfigsPaging(AssetconfigSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetconfigsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetconfigByConfigid
        public Assetconfig RetrieveAssetconfigByConfigid(string configid)
        {
            return Management.RetrieveAssetconfigByConfigid(configid);
        }
        #endregion

        #region RetrieveAssetconfigByConfigid
        public List<Assetconfig> RetrieveAssetconfigByConfigid(List<string> configids)
        {
            return Management.RetrieveAssetconfigByConfigid(configids);
        }
        #endregion

        public List<Assetconfig> RetrieveAssetconfigByCategoryId(string categoryId)
        {
            return Management.RetrieveAssetconfigByCategoryId(categoryId);
        }

        #region CreateAssetconfig
        public Assetconfig CreateAssetconfig(Assetconfig info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetconfig(info);
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

        #region UpdateAssetconfigByConfigid
        public Assetconfig UpdateAssetconfigByConfigid(Assetconfig info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetconfigByConfigid(info);
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

        #region DeleteAssetconfigByConfigid
        public void DeleteAssetconfigByConfigid(string configid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetconfigByConfigid(configid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetconfigByConfigid
        public void DeleteAssetconfigByConfigid(List<string> configids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetconfigByConfigid(configids);
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
