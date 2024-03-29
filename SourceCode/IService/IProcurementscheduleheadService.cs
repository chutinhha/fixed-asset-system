/********************************************************************
* File Name:ProcurementscheduleheadManagement
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
    public interface IProcurementscheduleheadService
    {
        List<Procurementschedulehead> RetrieveProcurementscheduleheadsPaging(ProcurementscheduleheadSearch info,int pageIndex, int pageSize,out int count);
        Procurementschedulehead CreateProcurementschedulehead(Procurementschedulehead info,List<Procurementscheduledetail> detailInfos);
        Procurementschedulehead UpdateProcurementscheduleheadByPsid(Procurementschedulehead info, List<Procurementscheduledetail> detailInfos);
        Procurementschedulehead RetrieveProcurementscheduleheadByPsid(string psid);
        void DeleteProcurementscheduleheadByPsid(string psid);
    }
}
