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
using System.Data;
using System.Data.Common;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class ProcurementcontractdetailService:BaseService,IProcurementcontractdetailService
    {

        #region Management

        private ProcurementcontractdetailManagement m_Management;

        protected ProcurementcontractdetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new ProcurementcontractdetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveProcurementcontractdetailsPaging
        public List<ProcurementcontractdetailEx> RetrieveProcurementcontractdetailsPaging(ProcurementcontractdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveProcurementcontractdetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveProcurementcontractdetailByContractdetailid
        public Procurementcontractdetail RetrieveProcurementcontractdetailByContractdetailid(string contractdetailid)
        {
            return Management.RetrieveProcurementcontractdetailByContractdetailid(contractdetailid);
        }
        #endregion

        #region RetrieveProcurementcontractdetailByContractdetailid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailByContractdetailid(List<string> contractdetailids)
        {
            return Management.RetrieveProcurementcontractdetailByContractdetailid(contractdetailids);
        }
        #endregion

        #region RetrieveProcurementcontractdetailListByContractid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailListByContractid(string contractid)
        {
            return Management.RetrieveProcurementcontractdetailListByContractid(contractid);
        }
        #endregion

        #region RetrieveProcurementcontractdetailListByContractid
        public List<Procurementcontractdetail> RetrieveProcurementcontractdetailListByContractid(List<string> contractids)
        {
            return Management.RetrieveProcurementcontractdetailListByContractid(contractids);
        }
        #endregion

        #region CreateProcurementcontractdetail
        public Procurementcontractdetail CreateProcurementcontractdetail(Procurementcontractdetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateProcurementcontractdetail(info);
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

        #region UpdateProcurementcontractdetailByContractdetailid
        public Procurementcontractdetail UpdateProcurementcontractdetailByContractdetailid(Procurementcontractdetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateProcurementcontractdetailByContractdetailid(info);
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

        #region DeleteProcurementcontractdetailByContractdetailid
        public void DeleteProcurementcontractdetailByContractdetailid(string contractdetailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementcontractdetailByContractdetailid(contractdetailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteProcurementcontractdetailByContractdetailid
        public void DeleteProcurementcontractdetailByContractdetailid(List<string> contractdetailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementcontractdetailByContractdetailid(contractdetailids);
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
