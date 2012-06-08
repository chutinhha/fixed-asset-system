/********************************************************************
* File Name:AssetsetupdetailManagement
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
    public interface IAssetsetupdetailService
    {
        List<Assetsetupdetail> RetrieveAssetsetupdetailsPaging(AssetsetupdetailSearch info,int pageIndex, int pageSize,out int count);
        Assetsetupdetail CreateAssetsetupdetail(Assetsetupdetail info);
        Assetsetupdetail UpdateAssetsetupdetailByDetailid(Assetsetupdetail info);
        Assetsetupdetail RetrieveAssetsetupdetailByDetailid(string detailid);
        void DeleteAssetsetupdetailByDetailid(string detailid);
        List<Assetsetupdetail> RetrieveAssetsetupdetailListBySetupid(string setupid);
    }
}
