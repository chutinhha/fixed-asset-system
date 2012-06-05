/********************************************************************
* File Name:SubcompanyinfoManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-27
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
    public interface ISubcompanyinfoService
    {
        List<Subcompanyinfo> RetrieveSubcompanyinfosPaging(SubcompanyinfoSearch info,int pageIndex, int pageSize,out int count);
        Subcompanyinfo CreateSubcompanyinfo(Subcompanyinfo info);
        Subcompanyinfo UpdateSubcompanyinfoBySubcompanyid(Subcompanyinfo info);
        Subcompanyinfo RetrieveSubcompanyinfoBySubcompanyid(decimal subcompanyid);
        void DeleteSubcompanyinfoBySubcompanyid(decimal subcompanyid);
        List<Subcompanyinfo> RetrieveAllSubCompanyinfo();
    }
}
