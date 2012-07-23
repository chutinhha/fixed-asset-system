/********************************************************************
* File Name:AssetsetupinfoManagement
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
    public partial class AssetsetupinfoService:BaseService,IAssetsetupinfoService
    {

        #region Management

        private AssetsetupinfoManagement m_Management;

        protected AssetsetupinfoManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetsetupinfoManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsetupinfosPaging
        public List<Assetsetupinfo> RetrieveAssetsetupinfosPaging(AssetsetupinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveAssetsetupinfosPaging(info,pageIndex,pageSize,out count);
        }
        public List<AssetRunTimeReport> RetrieveAssetRunTimeReport(AssetRunTimeSearch info)
        {
            return Management.RetrieveAssetRunTimeReport(info);
        }
        #endregion

        #region RetrieveAssetsetupinfoBySetupid
        public Assetsetupinfo RetrieveAssetsetupinfoBySetupid(string setupid)
        {
            return Management.RetrieveAssetsetupinfoBySetupid(setupid);
        }
        #endregion

        #region RetrieveAssetsetupinfoBySetupid
        public List<Assetsetupinfo> RetrieveAssetsetupinfoBySetupid(List<string> setupids)
        {
            return Management.RetrieveAssetsetupinfoBySetupid(setupids);
        }
        #endregion

        #region CreateAssetsetupinfo
        public Assetsetupinfo CreateAssetsetupinfo(Assetsetupinfo info)
        {
            try
            {
                info.Setupid = new CoderuleManagement().GenerateCodeRule(Assetsetupinfo.RuleCode + DateTime.Today.ToString("yyyyMM"), false);
                Management.BeginTransaction();
                Management.CreateAssetsetupinfo(info);
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

        #region UpdateAssetsetupinfoBySetupid
        public Assetsetupinfo UpdateAssetsetupinfoBySetupid(Assetsetupinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetsetupinfoBySetupid(info);
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

        #region DeleteAssetsetupinfoBySetupid
        public void DeleteAssetsetupinfoBySetupid(string setupid)
        {
            try
            {
                var detaiManagement = new AssetsetupdetailManagement(Management);
                Management.BeginTransaction();
                detaiManagement.DeleteAssetsetupdetailsBySetupid(new List<string>(){setupid});
                Management.DeleteAssetsetupinfoBySetupid(setupid);
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
