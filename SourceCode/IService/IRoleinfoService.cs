/********************************************************************
* File Name:RoleinfoManagement
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
    public interface IRoleinfoService
    {
        List<Roleinfo> RetrieveRoleinfosPaging(RoleinfoSearch info,int pageIndex, int pageSize,out int count);
        Roleinfo CreateRoleinfo(Roleinfo info);
        Roleinfo UpdateRoleinfoByRoleid(Roleinfo info);
        Roleinfo RetrieveRoleinfoByRoleid(string roleid);
        void DeleteRoleinfoByRoleid(string roleid);
    }
}
