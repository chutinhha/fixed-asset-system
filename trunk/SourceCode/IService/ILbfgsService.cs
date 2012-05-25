/********************************************************************
* File Name:LbfgsManagement
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
    public interface ILbfgsService
    {
        List<Lbfgs> RetrieveLbfgssPaging(LbfgsSearch info,int pageIndex, int pageSize,out int count);
        Lbfgs CreateLbfgs(Lbfgs info);
        Lbfgs UpdateLbfgsByFgsid(Lbfgs info);
        Lbfgs RetrieveLbfgsByFgsid(decimal fgsid);
        void DeleteLbfgsByFgsid(decimal fgsid);
    }
}
