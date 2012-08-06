/********************************************************************
* File Name:AssetmaintaindetailManagement
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
    public partial class AssetmaintaindetailService:BaseService,IAssetmaintaindetailService
    {

        #region Management

        private AssetmaintaindetailManagement m_Management;

        protected AssetmaintaindetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmaintaindetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmaintaindetailsPaging
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailsPaging(AssetmaintaindetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetmaintaindetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetmaintaindetailByDetailid
        public Assetmaintaindetail RetrieveAssetmaintaindetailByDetailid(string detailid)
        {
            return Management.RetrieveAssetmaintaindetailByDetailid(detailid);
        }
        #endregion

        #region RetrieveAssetmaintaindetailByDetailid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailByDetailid(List<string> detailids)
        {
            return Management.RetrieveAssetmaintaindetailByDetailid(detailids);
        }
        #endregion

        #region RetrieveAssetmaintaindetailListByAssetmaintainid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailListByAssetmaintainid(string assetmaintainid)
        {
            return Management.RetrieveAssetmaintaindetailListByAssetmaintainid(assetmaintainid);
        }
        #endregion

        #region RetrieveAssetmaintaindetailListByAssetmaintainid
        public List<Assetmaintaindetail> RetrieveAssetmaintaindetailListByAssetmaintainid(List<string> assetmaintainids)
        {
            return Management.RetrieveAssetmaintaindetailListByAssetmaintainid(assetmaintainids);
        }
        #endregion

        #region CreateAssetmaintaindetail
        public Assetmaintaindetail CreateAssetmaintaindetail(Assetmaintaindetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetmaintaindetail(info);
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

        #region UpdateAssetmaintaindetailByDetailid
        public Assetmaintaindetail UpdateAssetmaintaindetailByDetailid(Assetmaintaindetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetmaintaindetailByDetailid(info);
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

        #region DeleteAssetmaintaindetailByDetailid
        public void DeleteAssetmaintaindetailByDetailid(string detailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmaintaindetailByDetailid(detailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetmaintaindetailByDetailid
        public void DeleteAssetmaintaindetailByDetailid(List<string> detailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetmaintaindetailByDetailid(detailids);
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
