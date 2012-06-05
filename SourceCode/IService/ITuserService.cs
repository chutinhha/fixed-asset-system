/********************************************************************
* File Name:TuserManagement
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
    public interface ITuserService
    {
        List<Tuser> RetrieveTusersPaging(TuserSearch info,int pageIndex, int pageSize,out int count);
        Tuser CreateTuser(Tuser info);
        Tuser UpdateTuserById(Tuser info);
        Tuser RetrieveTuserById(string id);
        void DeleteTuserById(string id);
        bool ValidateUserLogin(string userName, string password, out string errorMsg);
        List<Menuitem> RetrieveMenuItemsByUserId(string userId);
    }
}
