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
        void SaveAssetRunPlan(List<Assetrunplan> list);
        List<Assetrunplan> RetrieveAssetrunplanByCondition(string Plandatecycle, string Storageflag, string Storage);
        List<Assetrunplan> RetrieveAssetrunplanByCondition(AssetrunplanSearch info);
    }
}
