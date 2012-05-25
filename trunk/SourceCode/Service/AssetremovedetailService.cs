/********************************************************************
* File Name:AssetremovedetailManagement
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
    public partial class AssetremovedetailService:BaseService,IAssetremovedetailService
    {

        #region Management

        private AssetremovedetailManagement m_Management;

        protected AssetremovedetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetremovedetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetremovedetailsPaging
        public List<AssetremovedetailEx> RetrieveAssetremovedetailsPaging(AssetremovedetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetremovedetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetremovedetailByDetailid
        public Assetremovedetail RetrieveAssetremovedetailByDetailid(string detailid)
        {
            return Management.RetrieveAssetremovedetailByDetailid(detailid);
        }
        #endregion

        #region RetrieveAssetremovedetailByDetailid
        public List<Assetremovedetail> RetrieveAssetremovedetailByDetailid(List<string> detailids)
        {
            return Management.RetrieveAssetremovedetailByDetailid(detailids);
        }
        #endregion

        #region RetrieveAssetremovedetailListByAssetremoveid
        public List<Assetremovedetail> RetrieveAssetremovedetailListByAssetremoveid(string assetremoveid)
        {
            return Management.RetrieveAssetremovedetailListByAssetremoveid(assetremoveid);
        }
        #endregion

        #region RetrieveAssetremovedetailListByAssetremoveid
        public List<Assetremovedetail> RetrieveAssetremovedetailListByAssetremoveid(List<string> assetremoveids)
        {
            return Management.RetrieveAssetremovedetailListByAssetremoveid(assetremoveids);
        }
        #endregion

        #region CreateAssetremovedetail
        public Assetremovedetail CreateAssetremovedetail(Assetremovedetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetremovedetail(info);
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

        #region UpdateAssetremovedetailByDetailid
        public Assetremovedetail UpdateAssetremovedetailByDetailid(Assetremovedetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetremovedetailByDetailid(info);
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

        #region DeleteAssetremovedetailByDetailid
        public void DeleteAssetremovedetailByDetailid(string detailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetremovedetailByDetailid(detailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetremovedetailByDetailid
        public void DeleteAssetremovedetailByDetailid(List<string> detailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetremovedetailByDetailid(detailids);
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
