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
using System.Linq;
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



        public Procurementcontract CreateProcurementcontract(Procurementcontract info, List<Procurementcontractdetail> detailInfos)
        {

            var coderuleManagement = new CoderuleManagement(Management);
            info.Contractid = coderuleManagement.GenerateCodeRule(Procurementcontract.RuleCode, true);
            foreach (var detailInfo in detailInfos)
            {
                detailInfo.Contractid = info.Contractid;
            }
            var detailManagement = new ProcurementcontractdetailManagement(Management);
            try
            {
                Management.BeginTransaction();
                Management.CreateProcurementcontract(info);
                foreach (var detailInfo in detailInfos)
                {
                    detailManagement.CreateProcurementcontractdetail(detailInfo);
                }
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }

        public Procurementcontract UpdateProcurementcontractByContractid(Procurementcontract info, List<Procurementcontractdetail> detailInfos)
        {
            foreach (var detailInfo in detailInfos)
            {
                detailInfo.Contractid = info.Contractid;
            }
            var detailManagement = new ProcurementcontractdetailManagement(Management);
        
            var dbContractDetails = detailManagement.RetrieveProcurementcontractdetailListByContractid(info.Contractid);
          
            try
            {
                Management.BeginTransaction();
                Management.UpdateProcurementcontractByContractid(info);
                
                foreach (var detail in detailInfos)
                {
                    var existInfo = dbContractDetails.Where(p => p.Contractdetailid == detail.Contractdetailid).FirstOrDefault();
                
                    if (existInfo == null)
                    {
                        detailManagement.CreateProcurementcontractdetail(detail);
                    }
                    else
                    {
                        detailManagement.UpdateProcurementcontractdetailByContractdetailid(detail);
                    }
                }
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
    }
}
