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
        void SaveAssetremoveplan(List<Assetremoveplan> list);
        List<Assetremoveplan> RetrieveAssetremoveplanByCondition(string Plandatecycle, string Storageflag, string Storage);
        List<Assetremoveplan> RetrieveAssetremoveplanByCondition(AssetremoveplanSearch info); 
    }
}
