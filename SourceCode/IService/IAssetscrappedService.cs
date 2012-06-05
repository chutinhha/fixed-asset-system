/********************************************************************
* File Name:AssetscrappedManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    public interface IAssetscrappedService
    {
        List<Assetscrapped> RetrieveAssetscrappedsPaging(AssetscrappedSearch info,int pageIndex, int pageSize,out int count);
        List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count);
        Assetscrapped CreateAssetscrapped(Assetscrapped info);
        Assetscrapped UpdateAssetscrappedByAssetscrappedid(Assetscrapped info);
        Assetscrapped RetrieveAssetscrappedByAssetscrappedid(string assetscrappedid);      
        void DeleteAssetscrappedByAssetscrappedid(string assetscrappedid);
    }
}
