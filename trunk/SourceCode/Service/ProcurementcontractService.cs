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
using System.Data;
using System.Data.Common;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class ProcurementcontractService:BaseService,IProcurementcontractService
    {

        #region Management

        private ProcurementcontractManagement m_Management;

        protected ProcurementcontractManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new ProcurementcontractManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveProcurementcontractsPaging
        public List<Procurementcontract> RetrieveProcurementcontractsPaging(ProcurementcontractSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveProcurementcontractsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveProcurementcontractByContractid
        public Procurementcontract RetrieveProcurementcontractByContractid(string contractid)
        {
            return Management.RetrieveProcurementcontractByContractid(contractid);
        }
        #endregion

        #region RetrieveProcurementcontractByContractid
        public List<Procurementcontract> RetrieveProcurementcontractByContractid(List<string> contractids)
        {
            return Management.RetrieveProcurementcontractByContractid(contractids);
        }
        #endregion

        #region CreateProcurementcontract
        public Procurementcontract CreateProcurementcontract(Procurementcontract info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateProcurementcontract(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region UpdateProcurementcontractByContractid
        public Procurementcontract UpdateProcurementcontractByContractid(Procurementcontract info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateProcurementcontractByContractid(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region DeleteProcurementcontractByContractid
        public void DeleteProcurementcontractByContractid(string contractid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementcontractByContractid(contractid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteProcurementcontractByContractid
        public void DeleteProcurementcontractByContractid(List<string> contractids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementcontractByContractid(contractids);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

    }
}
