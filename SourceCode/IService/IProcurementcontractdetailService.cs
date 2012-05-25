/********************************************************************
* File Name:ProcurementcontractdetailManagement
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
    public interface IProcurementcontractdetailService
    {
        List<ProcurementcontractdetailEx> RetrieveProcurementcontractdetailsPaging(ProcurementcontractdetailSearch info,int pageIndex, int pageSize,out int count);
        Procurementcontractdetail CreateProcurementcontractdetail(Procurementcontractdetail info);
        Procurementcontractdetail UpdateProcurementcontractdetailByContractdetailid(Procurementcontractdetail info);
        Procurementcontractdetail RetrieveProcurementcontractdetailByContractdetailid(string contractdetailid);
        void DeleteProcurementcontractdetailByContractdetailid(string contractdetailid);
        List<Procurementcontractdetail> RetrieveProcurementcontractdetailListByContractid(string contractid);
    }
}
