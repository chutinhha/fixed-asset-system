/********************************************************************
* File Name:AssetremovedetailManagement
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
    public interface IAssetremovedetailService
    {
        List<AssetremovedetailEx> RetrieveAssetremovedetailsPaging(AssetremovedetailSearch info,int pageIndex, int pageSize,out int count);
        Assetremovedetail CreateAssetremovedetail(Assetremovedetail info);
        Assetremovedetail UpdateAssetremovedetailByDetailid(Assetremovedetail info);
        Assetremovedetail RetrieveAssetremovedetailByDetailid(string detailid);
        List<Assetremovedetail> RetrieveAssetremovedetailByDetailid(List<string> detailid);
        void DeleteAssetremovedetailByDetailid(string detailid);
        List<Assetremovedetail> RetrieveAssetremovedetailListByAssetremoveid(string assetremoveid);
    }
}
