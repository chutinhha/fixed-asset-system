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
using FixedAsset.Domain;
namespace FixedAsset.IServices
{
    public interface IAssetrunplanService
    {
        List<Assetrunplan> RetrieveAssetrunplansPaging(AssetrunplanSearch info,int pageIndex, int pageSize,out int count);
        List<Assetrunplan> RetrieveAssetrunplanByCondition(string Plandatecycle, string Storageflag, string Storage);
        void SaveAssetRunPlan(List<Assetrunplan> list);
        //Assetrunplan CreateAssetrunplan(Assetrunplan info);
        //Assetrunplan UpdateAssetrunplanByPlanid(Assetrunplan info);
        //Assetrunplan RetrieveAssetrunplanByPlanid(int planid);
        //List<Assetrunplan> RetrieveAssetrunplanByPlanid(List<int> planid);
        void DeleteAssetrunplanByPlanid(int planid);
    }
}
