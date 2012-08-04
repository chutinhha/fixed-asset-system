/********************************************************************
* File Name:AssetmoveplanManagement
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
    public partial class AssetmoveplanService:BaseService,IAssetmoveplanService
    {

        #region Management

        private AssetmoveplanManagement m_Management;

        protected AssetmoveplanManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetmoveplanManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetmoveplanByCondition
        public List<Assetmoveplan> RetrieveAssetmoveplanByCondition(string Plandatecycle, string Storageflag, string Storage)
        {
            return Management.RetrieveAssetmoveplanByCondition(Plandatecycle, Storageflag, Storage);
        }
        public List<Assetmoveplan> RetrieveAssetmoveplanByCondition(AssetmoveplanSearch info)
        {
            return Management.RetrieveAssetmoveplanByCondition(info);
        }
        #endregion

        public void SaveAssetmoveplan(List<Assetmoveplan> list)
        {
            if (list.Count == 0)
            {
                return;
            }
            var existInfos = Management.RetrieveAssetmoveplanByCondition(list[0].Plandatecycle, list[0].Storageflag,
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
                            Management.UpdateAssetmoveplanByPlanid(existInfo);
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
                        Management.CreateAssetmoveplan(info);
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
