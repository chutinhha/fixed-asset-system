/********************************************************************
* File Name:AssetmaintainManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
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
    public interface IAssetmaintainService
    {
        List<Assetmaintain> RetrieveAssetmaintainsPaging(AssetmaintainSearch info,int pageIndex, int pageSize,out int count);
        Assetmaintain CreateAssetmaintain(Assetmaintain info);
        Assetmaintain UpdateAssetmaintainByAssetmaintainid(Assetmaintain info);
        Assetmaintain RetrieveAssetmaintainByAssetmaintainid(string assetmaintainid);
        void DeleteAssetmaintainByAssetmaintainid(string assetmaintainid);
    }
}
