/********************************************************************
* File Name:BaccountManagement
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
    public interface IBaccountService
    {
        List<Baccount> RetrieveBaccountsPaging(BaccountSearch info,int pageIndex, int pageSize,out int count);
        Baccount CreateBaccount(Baccount info);
        Baccount UpdateBaccountByAssetno(Baccount info);
        Baccount RetrieveBaccountByAssetno(string assetno);
        List<Baccount> RetrieveBaccountByAssetno(List<string> assetnos);
        void DeleteBaccountByAssetno(string assetno);
    }
}
