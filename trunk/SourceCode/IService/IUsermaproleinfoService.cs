/********************************************************************
* File Name:UsermaproleinfoManagement
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
    public interface IUsermaproleinfoService
    {
        List<Usermaproleinfo> RetrieveUsermaproleinfosPaging(UsermaproleinfoSearch info,int pageIndex, int pageSize,out int count);
        Usermaproleinfo CreateUsermaproleinfo(Usermaproleinfo info);
        Usermaproleinfo UpdateUsermaproleinfoByUseridRoleid(Usermaproleinfo info);
        Usermaproleinfo RetrieveUsermaproleinfoByUseridRoleid(string userid,string roleid);
        void DeleteUsermaproleinfoByUseridRoleid(string userid,string roleid);
    }
}
