/********************************************************************
* File Name:HcontractdetailManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-04
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
    public interface IHcontractdetailService
    {
        List<Hcontractdetail> RetrieveHcontractdetailsPaging(HcontractdetailSearch info,int pageIndex, int pageSize,out int count);
        Hcontractdetail CreateHcontractdetail(Hcontractdetail info);
    }
}
