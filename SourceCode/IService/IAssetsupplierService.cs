/********************************************************************
* File Name:AssetsupplierManagement
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
    public interface IAssetsupplierService
    {
        List<Assetsupplier> RetrieveAssetsuppliersPaging(AssetsupplierSearch info,int pageIndex, int pageSize,out int count);
        Assetsupplier CreateAssetsupplier(Assetsupplier info);
        Assetsupplier UpdateAssetsupplierBySupplierid(Assetsupplier info);
        Assetsupplier RetrieveAssetsupplierBySupplierid(string supplierid);
        void DeleteAssetsupplierBySupplierid(string supplierid);
    }
}
