/********************************************************************
* File Name:HcontractManagement
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
    public interface IHcontractService
    {
        List<Hcontract> RetrieveHcontractsPaging(HcontractSearch info,int pageIndex, int pageSize,out int count);
        Hcontract CreateHcontract(Hcontract info);
    }
}
