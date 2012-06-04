/********************************************************************
* File Name:AssetmoveManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
    public interface IAssetmoveService
    {
        List<Assetmove> RetrieveAssetmovesPaging(AssetmoveSearch info,int pageIndex, int pageSize,out int count);
        Assetmove CreateAssetmove(Assetmove info);
        Assetmove UpdateAssetmoveByAssetmoveid(Assetmove info);
        Assetmove RetrieveAssetmoveByAssetmoveid(string assetmoveid);
        List<Assetmove> RetrieveAssetmoveByAssetmoveid(List<string> assetmoveid);
        void DeleteAssetmoveByAssetmoveid(string assetmoveid);
    }
}
