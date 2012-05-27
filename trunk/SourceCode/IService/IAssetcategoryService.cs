/********************************************************************
* File Name:AssetcategoryManagement
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
    public interface IAssetcategoryService
    {
        List<Assetcategory> RetrieveAssetcategorysPaging(AssetcategorySearch info,int pageIndex, int pageSize,out int count);
        Assetcategory CreateAssetcategory(Assetcategory info);
        Assetcategory UpdateAssetcategoryByAssetcategoryid(Assetcategory info);
        Assetcategory RetrieveAssetcategoryByAssetcategoryid(string assetcategoryid);
        void DeleteAssetcategoryByAssetcategoryid(string assetcategoryid);
        List<Assetcategory> RetrieveAllAssetcategory();
        List<Assetcategory> RetrieveAssetcategoryByParentAssetcategoryid(List<string> parentAssetcategoryids);
    }
}
