/********************************************************************
* File Name:AssetrunplanManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-28
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
using System.Linq;
namespace FixedAsset.Services
{
    public partial class AssetrunplanService:BaseService,IAssetrunplanService
    {
        #region Management

        private AssetrunplanManagement m_Management;

        protected AssetrunplanManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetrunplanManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetrunplanByCondition
        public  List<Assetrunplan> RetrieveAssetrunplanByCondition(string Plandatecycle,string Storageflag,string Storage)
        {
            return Management.RetrieveAssetrunplanByCondition(Plandatecycle, Storageflag, Storage);
        }
        public List<Assetrunplan> RetrieveAssetrunplanByCondition(AssetrunplanSearch info)
        {
            return Management.RetrieveAssetrunplanByCondition(info);
        }
        #endregion 

        public void SaveAssetRunPlan(List<Assetrunplan> list)
        {
            if(list.Count==0)
            {
                return;
            }
            var existInfos = Management.RetrieveAssetrunplanByCondition(list[0].Plandatecycle, list[0].Storageflag,
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
                        if(existInfo!=null)
                        {
                            existInfo.Assetcount = info.Assetcount;
                            Management.UpdateAssetrunplanByPlanid(existInfo);
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
                        Management.CreateAssetrunplan(info);
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
