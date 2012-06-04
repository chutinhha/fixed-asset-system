/********************************************************************
* File Name:AssetmaintaindetailManagement
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
    public interface IAssetmaintaindetailService
    {
        List<AssetmaintaindetailEx> RetrieveAssetmaintaindetailsPaging(AssetmaintaindetailSearch info,int pageIndex, int pageSize,out int count);
        Assetmaintaindetail CreateAssetmaintaindetail(Assetmaintaindetail info);
        Assetmaintaindetail UpdateAssetmaintaindetailByDetailid(Assetmaintaindetail info);
        Assetmaintaindetail RetrieveAssetmaintaindetailByDetailid(string detailid);
        List<Assetmaintaindetail> RetrieveAssetmaintaindetailByDetailid(List<string> detailid);
        void DeleteAssetmaintaindetailByDetailid(string detailid);
        List<Assetmaintaindetail> RetrieveAssetmaintaindetailListByAssetmaintainid(string assetmaintainid);
    }
}
