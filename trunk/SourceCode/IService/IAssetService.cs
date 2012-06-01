/********************************************************************
* File Name:AssetManagement
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
    public interface IAssetService
    {
        List<Vstorageaddress> RetrieveAllVstorageaddress();
        Vstorageaddress RetrieveVstorageaddressByStorageId(string Storagetitle, string StorageId);
        List<Asset> RetrieveAssetsPaging(AssetSearch info,int pageIndex, int pageSize,out int count);
        void SaveAssetInfo(Asset info);
        Asset RetrieveAssetByAssetno(string assetno);
        void DeleteAssetByAssetno(string assetno);
    }
}
