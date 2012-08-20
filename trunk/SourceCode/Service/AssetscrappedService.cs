/********************************************************************
* File Name:AssetscrappedManagement
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
    public partial class AssetscrappedService:BaseService,IAssetscrappedService
    {

        #region Management

        private AssetscrappedManagement m_Management;

        protected AssetscrappedManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetscrappedManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetscrappedsPaging
        public List<Assetscrapped> RetrieveAssetscrappedsPaging(AssetscrappedSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetscrappedsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetscrappedsRecord
        public List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetscrappedsRecord(info,pageIndex,pageSize,out count);
        }
        #endregion
        
        #region RetrieveAssetscrappedByAssetscrappedid
        public Assetscrapped RetrieveAssetscrappedByAssetscrappedid(string assetscrappedid)
        {
            return Management.RetrieveAssetscrappedByAssetscrappedid(assetscrappedid);
        }
        #endregion

        #region RetrieveAssetscrappedByAssetscrappedid
        public List<Assetscrapped> RetrieveAssetscrappedByAssetscrappedid(List<string> assetscrappedids)
        {
            return Management.RetrieveAssetscrappedByAssetscrappedid(assetscrappedids);
        }
        #endregion

        #region CreateAssetscrapped
        public Assetscrapped CreateAssetscrapped(Assetscrapped info)
        {
            try
            {
                var coderuleManagement = new CoderuleManagement(Management);
                info.Assetscrappedid = coderuleManagement.GenerateCodeRule(Assetscrapped.ScrappedRuleCode + DateTime.Today.ToString("yyyyMM"), false);
                Management.BeginTransaction();
                Management.CreateAssetscrapped(info);
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

        #region UpdateAssetscrappedByAssetscrappedid
        public Assetscrapped UpdateAssetscrappedByAssetscrappedid(Assetscrapped info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetscrappedByAssetscrappedid(info);
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

        #region DeleteAssetscrappedByAssetscrappedid
        public void DeleteAssetscrappedByAssetscrappedid(string assetscrappedid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetscrappedByAssetscrappedid(assetscrappedid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetscrappedByAssetscrappedid
        public void DeleteAssetscrappedByAssetscrappedid(List<string> assetscrappedids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetscrappedByAssetscrappedid(assetscrappedids);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        public List<Assetscrapped> RetrieveAssetscrappedByAssetNo(List<string> AssetNos)
        {
            return Management.RetrieveAssetscrappedByAssetNo(AssetNos);
        }
    }
}
