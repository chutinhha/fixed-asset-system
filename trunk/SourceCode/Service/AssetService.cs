/********************************************************************
* File Name:AssetManagement
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
using System.Text;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class AssetService:BaseService,IAssetService
    {
        #region Management

        private AssetManagement m_Management;

        protected AssetManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsPaging
        public List<Asset> RetrieveAssetsPaging(AssetSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public Asset RetrieveAssetByAssetno(string assetno)
        {
            return Management.RetrieveAssetByAssetno(assetno);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public List<Asset> RetrieveAssetByAssetno(List<string> assetnos)
        {
            return Management.RetrieveAssetByAssetno(assetnos);
        }
        #endregion

        #region CreateAsset
        public Asset CreateAsset(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAsset(info);
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

        #region UpdateAssetByAssetno
        public Asset UpdateAssetByAssetno(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetByAssetno(info);
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

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(string assetno)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetno);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(List<string> assetnos)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetnos);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        public void SaveAssetInfo(Asset info)
        {
            bool isEdited = !string.IsNullOrEmpty(info.Assetno);
            if (string.IsNullOrEmpty(info.Assetno))
            {
                //固定字符（2位）+分公司/公司（3位）+设备大类（2位）+设备小类（2位）+序号（4位）
                var codePrefix = new StringBuilder(Asset.RuleCode);
                codePrefix.Append(info.Subcompany);
                codePrefix.Append(info.Assetcategoryid);
                var ruleManagement = new CoderuleManagement(Management);
                info.Assetno = ruleManagement.GenerateCodeRule(codePrefix.ToString(),false);
            }
            try
            {
                Management.BeginTransaction();
                if (isEdited)
                {
                    Management.UpdateAssetByAssetno(info);
                }
                else
                {
                    Management.CreateAsset(info);
                }
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
    }
}
