/********************************************************************
* File Name:LbfgsxmtManagement
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
    public interface ILbfgsxmtService
    {
        List<Lbfgsxmt> RetrieveLbfgsxmtsPaging(LbfgsxmtSearch info,int pageIndex, int pageSize,out int count);
        Lbfgsxmt CreateLbfgsxmt(Lbfgsxmt info);
        Lbfgsxmt UpdateLbfgsxmtByXmtid(Lbfgsxmt info);
        Lbfgsxmt RetrieveLbfgsxmtByXmtid(decimal xmtid);
        void DeleteLbfgsxmtByXmtid(decimal xmtid);
        List<Lbfgsxmt> RetrieveAllLbfgsxmt();
    }
}
