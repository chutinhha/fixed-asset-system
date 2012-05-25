/********************************************************************
* File Name:RolepermissionManagement
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
    public interface IRolepermissionService
    {
        List<Rolepermission> RetrieveRolepermissionsPaging(RolepermissionSearch info,int pageIndex, int pageSize,out int count);
        Rolepermission CreateRolepermission(Rolepermission info);
        Rolepermission UpdateRolepermissionByRoleidMenuid(Rolepermission info);
        Rolepermission RetrieveRolepermissionByRoleidMenuid(string roleid,string menuid);
        void DeleteRolepermissionByRoleidMenuid(string roleid,string menuid);
    }
}
