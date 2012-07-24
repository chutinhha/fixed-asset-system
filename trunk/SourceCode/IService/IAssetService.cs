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
        List<Asset> RetrieveAssetsPaging(AssetSearch info, int pageIndex, int pageSize, out int count);
        List<Asset> RetrieveAssetsUsed(AssetSearch info, int pageIndex, int pageSize, out int count);
        List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count);
        void SaveAssetInfo(Asset info);
        Asset UpdateAssetByAssetno(Asset info);
        Asset UpdateFinancecategoryByAssetno(Asset info);
        Asset RetrieveAssetByAssetno(string assetno);
        List<Asset> RetrieveAssetByAssetno(List<string> assetnos);
        void DeleteAssetByAssetno(string assetno); 
        List<Asset> RetrieveAllAsset();

        /// <summary>
        /// 资产登记台账
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        List<AssetRegisterReport> RetrieveAssetRegisterReport(AssetRegisterSearch info);
    }
}
