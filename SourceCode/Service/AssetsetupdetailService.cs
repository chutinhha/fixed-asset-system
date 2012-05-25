/********************************************************************
* File Name:AssetsetupdetailManagement
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
    public partial class AssetsetupdetailService:BaseService,IAssetsetupdetailService
    {

        #region Management

        private AssetsetupdetailManagement m_Management;

        protected AssetsetupdetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetsetupdetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsetupdetailsPaging
        public List<Assetsetupdetail> RetrieveAssetsetupdetailsPaging(AssetsetupdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetsetupdetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetsetupdetailByDetailid
        public Assetsetupdetail RetrieveAssetsetupdetailByDetailid(string detailid)
        {
            return Management.RetrieveAssetsetupdetailByDetailid(detailid);
        }
        #endregion

        #region RetrieveAssetsetupdetailByDetailid
        public List<Assetsetupdetail> RetrieveAssetsetupdetailByDetailid(List<string> detailids)
        {
            return Management.RetrieveAssetsetupdetailByDetailid(detailids);
        }
        #endregion

        #region CreateAssetsetupdetail
        public Assetsetupdetail CreateAssetsetupdetail(Assetsetupdetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAssetsetupdetail(info);
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

        #region UpdateAssetsetupdetailByDetailid
        public Assetsetupdetail UpdateAssetsetupdetailByDetailid(Assetsetupdetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetsetupdetailByDetailid(info);
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

        #region DeleteAssetsetupdetailByDetailid
        public void DeleteAssetsetupdetailByDetailid(string detailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetsetupdetailByDetailid(detailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetsetupdetailByDetailid
        public void DeleteAssetsetupdetailByDetailid(List<string> detailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetsetupdetailByDetailid(detailids);
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
