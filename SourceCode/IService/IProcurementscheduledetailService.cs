/********************************************************************
* File Name:ProcurementscheduledetailManagement
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
    public interface IProcurementscheduledetailService
    {
        List<Procurementscheduledetail> RetrieveProcurementscheduledetailsPaging(ProcurementscheduledetailSearch info,int pageIndex, int pageSize,out int count);
        Procurementscheduledetail CreateProcurementscheduledetail(Procurementscheduledetail info);
        Procurementscheduledetail UpdateProcurementscheduledetailByDetailid(Procurementscheduledetail info);
        Procurementscheduledetail RetrieveProcurementscheduledetailByDetailid(string detailid);
        void DeleteProcurementscheduledetailByDetailid(string detailid);
    }
}
