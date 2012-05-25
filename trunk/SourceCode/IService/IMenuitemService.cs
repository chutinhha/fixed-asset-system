/********************************************************************
* File Name:MenuitemManagement
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
    public interface IMenuitemService
    {
        List<Menuitem> RetrieveMenuitemsPaging(MenuitemSearch info,int pageIndex, int pageSize,out int count);
        Menuitem CreateMenuitem(Menuitem info);
        Menuitem UpdateMenuitemByMenuid(Menuitem info);
        Menuitem RetrieveMenuitemByMenuid(string menuid);
        void DeleteMenuitemByMenuid(string menuid);
    }
}
