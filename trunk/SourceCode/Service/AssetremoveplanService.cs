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
using System.Linq;
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

        #region RetrieveAssetremoveplanByCondition
        public List<Assetremoveplan> RetrieveAssetremoveplanByCondition(string Plandatecycle, string Storageflag, string Storage)
        {
            return Management.RetrieveAssetremoveplanByCondition(Plandatecycle, Storageflag, Storage);
        }
        public List<Assetremoveplan> RetrieveAssetremoveplanByCondition(AssetremoveplanSearch info)
        {
            return Management.RetrieveAssetremoveplanByCondition(info);
        }
        #endregion

        public void SaveAssetremoveplan(List<Assetremoveplan> list)
        {
            if (list.Count == 0)
            {
                return;
            }
            var existInfos = Management.RetrieveAssetremoveplanByCondition(list[0].Plandatecycle, list[0].Storageflag,
                                                                        list[0].Storage);
            if (existInfos.Count > 0)
            {
                try
                {
                    Management.BeginTransaction();
                    foreach (var info in list)
                    {
                        var existInfo = (from p in existInfos
                                         where p.Planid == info.Planid
                                         select p).FirstOrDefault();
                        if (existInfo != null)
                        {
                            existInfo.Assetcount = info.Assetcount;
                            Management.UpdateAssetremoveplanByPlanid(existInfo);
                        }
                    }
                    Management.Commit();
                }
                catch
                {
                    Management.Rollback();
                    throw;
                }
            }
            else
            {
                try
                {
                    Management.BeginTransaction();
                    foreach (var info in list)
                    {
                        Management.CreateAssetremoveplan(info);
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
}
