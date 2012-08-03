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
using FixedAsset.Domain;
namespace FixedAsset.IServices
{
    public interface IAssetmoveplanService
    {
        List<Assetmoveplan> RetrieveAssetmoveplansPaging(AssetmoveplanSearch info,int pageIndex, int pageSize,out int count);
        Assetmoveplan CreateAssetmoveplan(Assetmoveplan info);
        Assetmoveplan UpdateAssetmoveplanByPlanid(Assetmoveplan info);
        Assetmoveplan RetrieveAssetmoveplanByPlanid(int planid);
        List<Assetmoveplan> RetrieveAssetmoveplanByPlanid(List<int> planid);
        void DeleteAssetmoveplanByPlanid(int planid);
    }
}
