/********************************************************************
* File Name:AssetremoveManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
    public partial class AssetremoveService:BaseService,IAssetremoveService
    {

        #region Management

        private AssetremoveManagement m_Management;

        protected AssetremoveManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetremoveManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetremovesPaging
        public List<Assetremove> RetrieveAssetremovesPaging(AssetremoveSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetremovesPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetremoveByAssetremoveid
        public Assetremove RetrieveAssetremoveByAssetremoveid(string assetremoveid)
        {
            return Management.RetrieveAssetremoveByAssetremoveid(assetremoveid);
        }
        #endregion

        #region RetrieveAssetremoveByAssetremoveid
        public List<Assetremove> RetrieveAssetremoveByAssetremoveid(List<string> assetremoveids)
        {
            return Management.RetrieveAssetremoveByAssetremoveid(assetremoveids);
        }
        #endregion

        #region CreateAssetremove
        public Assetremove CreateAssetremove(Assetremove info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetremove(info);
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

        #region UpdateAssetremoveByAssetremoveid
        public Assetremove UpdateAssetremoveByAssetremoveid(Assetremove info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetremoveByAssetremoveid(info);
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

        #region DeleteAssetremoveByAssetremoveid
        public void DeleteAssetremoveByAssetremoveid(string assetremoveid)
        {
            try
            {
                var detailManagement = new AssetremovedetailManagement(Management);
                Management.BeginTransaction();
                detailManagement.DeleteAssetremovedetailsByAssetremoveid(new List<string>(){assetremoveid});
                Management.DeleteAssetremoveByAssetremoveid(assetremoveid);
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
