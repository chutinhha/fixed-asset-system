/********************************************************************
* File Name:AssetmovedetailManagement
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
    public partial class AssetmovedetailService:BaseService,IAssetmovedetailService
    {

        #region Management

        private AssetmovedetailManagement m_Management;

        protected AssetmovedetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmovedetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmovedetailsPaging
        public List<Assetmovedetail> RetrieveAssetmovedetailsPaging(AssetmovedetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetmovedetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetmovedetailByDetailid
        public Assetmovedetail RetrieveAssetmovedetailByDetailid(string detailid)
        {
            return Management.RetrieveAssetmovedetailByDetailid(detailid);
        }
        #endregion

        #region RetrieveAssetmovedetailByDetailid
        public List<Assetmovedetail> RetrieveAssetmovedetailByDetailid(List<string> detailids)
        {
            return Management.RetrieveAssetmovedetailByDetailid(detailids);
        }
        #endregion

        #region RetrieveAssetmovedetailListByAssetmoveid
        public List<Assetmovedetail> RetrieveAssetmovedetailListByAssetmoveid(string assetmoveid)
        {
            return Management.RetrieveAssetmovedetailListByAssetmoveid(assetmoveid);
        }
        #endregion

        #region RetrieveAssetmovedetailListByAssetmoveid
        public List<Assetmovedetail> RetrieveAssetmovedetailListByAssetmoveid(List<string> assetmoveids)
        {
            return Management.RetrieveAssetmovedetailListByAssetmoveid(assetmoveids);
        }
        #endregion

        #region CreateAssetmovedetail
        public Assetmovedetail CreateAssetmovedetail(Assetmovedetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetmovedetail(info);
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

        #region UpdateAssetmovedetailByDetailid
        public Assetmovedetail UpdateAssetmovedetailByDetailid(Assetmovedetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetmovedetailByDetailid(info);
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

        #region DeleteAssetmovedetailByDetailid
        public void DeleteAssetmovedetailByDetailid(string detailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmovedetailByDetailid(detailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetmovedetailByDetailid
        public void DeleteAssetmovedetailByDetailid(List<string> detailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmovedetailByDetailid(detailids);
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
