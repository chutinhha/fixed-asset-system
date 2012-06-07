/********************************************************************
* File Name:AssetmoveManagement
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
    public partial class AssetmoveService:BaseService,IAssetmoveService
    {

        #region Management

        private AssetmoveManagement m_Management;

        protected AssetmoveManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmoveManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmovesPaging
        public List<Assetmove> RetrieveAssetmovesPaging(AssetmoveSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetmovesPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetmoveByAssetmoveid
        public Assetmove RetrieveAssetmoveByAssetmoveid(string assetmoveid)
        {
            return Management.RetrieveAssetmoveByAssetmoveid(assetmoveid);
        }
        #endregion

        #region RetrieveAssetmoveByAssetmoveid
        public List<Assetmove> RetrieveAssetmoveByAssetmoveid(List<string> assetmoveids)
        {
            return Management.RetrieveAssetmoveByAssetmoveid(assetmoveids);
        }
        #endregion

        #region CreateAssetmove
        public Assetmove CreateAssetmove(Assetmove info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetmove(info);
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

        #region UpdateAssetmoveByAssetmoveid
        public Assetmove UpdateAssetmoveByAssetmoveid(Assetmove info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetmoveByAssetmoveid(info);
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

        #region DeleteAssetmoveByAssetmoveid
        public void DeleteAssetmoveByAssetmoveid(string assetmoveid)
        {
            try
            {
                var detailManagement = new AssetmovedetailManagement(Management);
                Management.BeginTransaction();
                detailManagement.DeleteAssetmovedetailsByAssetmoveid(new List<string>() { assetmoveid });
                Management.DeleteAssetmoveByAssetmoveid(assetmoveid);
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
