/********************************************************************
* File Name:AssetmovedetailManagement
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
    public interface IAssetmovedetailService
    {
        List<Assetmovedetail> RetrieveAssetmovedetailsPaging(AssetmovedetailSearch info,int pageIndex, int pageSize,out int count);
        Assetmovedetail CreateAssetmovedetail(Assetmovedetail info);
        Assetmovedetail UpdateAssetmovedetailByDetailid(Assetmovedetail info);
        Assetmovedetail RetrieveAssetmovedetailByDetailid(string detailid);
        List<Assetmovedetail> RetrieveAssetmovedetailByDetailid(List<string> detailid);
        void DeleteAssetmovedetailByDetailid(string detailid);
        List<Assetmovedetail> RetrieveAssetmovedetailListByAssetmoveid(string assetmoveid);
    }
}
