/********************************************************************
* File Name:AssetmoveplanManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-08-03
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
    public partial class AssetmoveplanService:BaseService,IAssetmoveplanService
    {

        #region Management

        private AssetmoveplanManagement m_Management;

        protected AssetmoveplanManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmoveplanManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmoveplansPaging
        public List<Assetmoveplan> RetrieveAssetmoveplansPaging(AssetmoveplanSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetmoveplansPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetmoveplanByPlanid
        public Assetmoveplan RetrieveAssetmoveplanByPlanid(int planid)
        {
            return Management.RetrieveAssetmoveplanByPlanid(planid);
        }
        #endregion

        #region RetrieveAssetmoveplanByPlanid
        public List<Assetmoveplan> RetrieveAssetmoveplanByPlanid(List<int> planids)
        {
            return Management.RetrieveAssetmoveplanByPlanid(planids);
        }
        #endregion

        #region CreateAssetmoveplan
        public Assetmoveplan CreateAssetmoveplan(Assetmoveplan info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetmoveplan(info);
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

        #region UpdateAssetmoveplanByPlanid
        public Assetmoveplan UpdateAssetmoveplanByPlanid(Assetmoveplan info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetmoveplanByPlanid(info);
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

        #region DeleteAssetmoveplanByPlanid
        public void DeleteAssetmoveplanByPlanid(int planid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmoveplanByPlanid(planid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetmoveplanByPlanid
        public void DeleteAssetmoveplanByPlanid(List<int> planids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmoveplanByPlanid(planids);
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
