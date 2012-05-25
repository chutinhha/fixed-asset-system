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
using System.Data;
using System.Data.Common;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class ProcurementscheduledetailService:BaseService,IProcurementscheduledetailService
    {

        #region Management

        private ProcurementscheduledetailManagement m_Management;

        protected ProcurementscheduledetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new ProcurementscheduledetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveProcurementscheduledetailsPaging
        public List<ProcurementscheduledetailEx> RetrieveProcurementscheduledetailsPaging(ProcurementscheduledetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveProcurementscheduledetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveProcurementscheduledetailByDetailid
        public Procurementscheduledetail RetrieveProcurementscheduledetailByDetailid(string detailid)
        {
            return Management.RetrieveProcurementscheduledetailByDetailid(detailid);
        }
        #endregion

        #region RetrieveProcurementscheduledetailByDetailid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailByDetailid(List<string> detailids)
        {
            return Management.RetrieveProcurementscheduledetailByDetailid(detailids);
        }
        #endregion

        #region RetrieveProcurementscheduledetailListByPsid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailListByPsid(string psid)
        {
            return Management.RetrieveProcurementscheduledetailListByPsid(psid);
        }
        #endregion

        #region RetrieveProcurementscheduledetailListByPsid
        public List<Procurementscheduledetail> RetrieveProcurementscheduledetailListByPsid(List<string> psids)
        {
            return Management.RetrieveProcurementscheduledetailListByPsid(psids);
        }
        #endregion

        #region CreateProcurementscheduledetail
        public Procurementscheduledetail CreateProcurementscheduledetail(Procurementscheduledetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateProcurementscheduledetail(info);
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

        #region UpdateProcurementscheduledetailByDetailid
        public Procurementscheduledetail UpdateProcurementscheduledetailByDetailid(Procurementscheduledetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateProcurementscheduledetailByDetailid(info);
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

        #region DeleteProcurementscheduledetailByDetailid
        public void DeleteProcurementscheduledetailByDetailid(string detailid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementscheduledetailByDetailid(detailid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteProcurementscheduledetailByDetailid
        public void DeleteProcurementscheduledetailByDetailid(List<string> detailids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementscheduledetailByDetailid(detailids);
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
