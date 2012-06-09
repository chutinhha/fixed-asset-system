/********************************************************************
* File Name:AssetconfigManagement
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
    public interface IAssetconfigService
    {
        List<Assetconfig> RetrieveAssetconfigsPaging(AssetconfigSearch info,int pageIndex, int pageSize,out int count);
        Assetconfig CreateAssetconfig(Assetconfig info);
        Assetconfig UpdateAssetconfigByConfigid(Assetconfig info);
        Assetconfig RetrieveAssetconfigByConfigid(string configid);
        void DeleteAssetconfigByConfigid(string configid);
        List<Assetconfig> RetrieveAssetconfigByCategoryId(string categoryId);
    }
}
