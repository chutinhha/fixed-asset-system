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
using FixedAsset.Domain;
namespace FixedAsset.IServices
{
    public interface IAssetremoveplanService
    {
        List<Assetremoveplan> RetrieveAssetremoveplansPaging(AssetremoveplanSearch info,int pageIndex, int pageSize,out int count);
        Assetremoveplan CreateAssetremoveplan(Assetremoveplan info);
        Assetremoveplan UpdateAssetremoveplanByPlanid(Assetremoveplan info);
        Assetremoveplan RetrieveAssetremoveplanByPlanid(int planid);
        List<Assetremoveplan> RetrieveAssetremoveplanByPlanid(List<int> planid);
        void DeleteAssetremoveplanByPlanid(int planid);
    }
}
