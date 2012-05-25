/********************************************************************
* File Name:ProcurementcontractManagement
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
    public interface IProcurementcontractService
    {
        List<Procurementcontract> RetrieveProcurementcontractsPaging(ProcurementcontractSearch info,int pageIndex, int pageSize,out int count);
        Procurementcontract CreateProcurementcontract(Procurementcontract info);
        Procurementcontract UpdateProcurementcontractByContractid(Procurementcontract info);
        Procurementcontract RetrieveProcurementcontractByContractid(string contractid);
        void DeleteProcurementcontractByContractid(string contractid);
    }
}
