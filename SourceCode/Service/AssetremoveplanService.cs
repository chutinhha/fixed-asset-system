/********************************************************************
* File Name:AssetremoveplanManagement
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
    public partial class AssetremoveplanService:BaseService,IAssetremoveplanService
    {

        #region Management

        private AssetremoveplanManagement m_Management;

        protected AssetremoveplanManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetremoveplanManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetremoveplansPaging
        public List<Assetremoveplan> RetrieveAssetremoveplansPaging(AssetremoveplanSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetremoveplansPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetremoveplanByPlanid
        public Assetremoveplan RetrieveAssetremoveplanByPlanid(int planid)
        {
            return Management.RetrieveAssetremoveplanByPlanid(planid);
        }
        #endregion

        #region RetrieveAssetremoveplanByPlanid
        public List<Assetremoveplan> RetrieveAssetremoveplanByPlanid(List<int> planids)
        {
            return Management.RetrieveAssetremoveplanByPlanid(planids);
        }
        #endregion

        #region CreateAssetremoveplan
        public Assetremoveplan CreateAssetremoveplan(Assetremoveplan info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetremoveplan(info);
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

        #region UpdateAssetremoveplanByPlanid
        public Assetremoveplan UpdateAssetremoveplanByPlanid(Assetremoveplan info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetremoveplanByPlanid(info);
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

        #region DeleteAssetremoveplanByPlanid
        public void DeleteAssetremoveplanByPlanid(int planid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetremoveplanByPlanid(planid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetremoveplanByPlanid
        public void DeleteAssetremoveplanByPlanid(List<int> planids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetremoveplanByPlanid(planids);
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
