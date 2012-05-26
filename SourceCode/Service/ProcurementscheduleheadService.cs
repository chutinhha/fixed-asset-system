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
using System.Data;
using System.Data.Common;
using System.Linq;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class ProcurementscheduleheadService:BaseService,IProcurementscheduleheadService
    {

        #region Management

        private ProcurementscheduleheadManagement m_Management;

        protected ProcurementscheduleheadManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new ProcurementscheduleheadManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveProcurementscheduleheadsPaging
        public List<Procurementschedulehead> RetrieveProcurementscheduleheadsPaging(ProcurementscheduleheadSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveProcurementscheduleheadsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveProcurementscheduleheadByPsid
        public Procurementschedulehead RetrieveProcurementscheduleheadByPsid(string psid)
        {
            return Management.RetrieveProcurementscheduleheadByPsid(psid);
        }
        #endregion

        #region RetrieveProcurementscheduleheadByPsid
        public List<Procurementschedulehead> RetrieveProcurementscheduleheadByPsid(List<string> psids)
        {
            return Management.RetrieveProcurementscheduleheadByPsid(psids);
        }
        #endregion

        #region CreateProcurementschedulehead
        public Procurementschedulehead CreateProcurementschedulehead(Procurementschedulehead info,List<Procurementscheduledetail> detailInfos)
        {
            
                var coderuleManagement=new CoderuleManagement(Management);
                info.Psid = coderuleManagement.GenerateCodeRule(Procurementschedulehead.RuleCode);
                foreach (var detailInfo in detailInfos)
                {
                    detailInfo.Psid = info.Psid;
                }
                var detailManagement = new ProcurementscheduledetailManagement(Management);
                try
                {
                    Management.BeginTransaction();
                    Management.CreateProcurementschedulehead(info);
                    foreach (var detailInfo in detailInfos)
                    {
                        detailManagement.CreateProcurementscheduledetail(detailInfo);
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
        #endregion

        #region UpdateProcurementscheduleheadByPsid
        public Procurementschedulehead UpdateProcurementscheduleheadByPsid(Procurementschedulehead info, List<Procurementscheduledetail> detailInfos)
        {
            
                foreach (var detailInfo in detailInfos)
                {
                    detailInfo.Psid = info.Psid;
                }
                var detailManagement = new ProcurementscheduledetailManagement(Management);
                var dbDetails = detailManagement.RetrieveProcurementscheduledetailListByPsid(info.Psid);
                try
                {
                    Management.BeginTransaction();
                    Management.UpdateProcurementscheduleheadByPsid(info);
                    foreach (var detail in detailInfos)
                    {
                        var existInfo = dbDetails.Where(p => p.Detailid == detail.Detailid).FirstOrDefault();
                        if (existInfo == null)
                        {
                            detailManagement.CreateProcurementscheduledetail(detail);
                        }
                        else
                        {
                            detailManagement.UpdateProcurementscheduledetailByDetailid(detail);
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
        #endregion

        #region DeleteProcurementscheduleheadByPsid
        public void DeleteProcurementscheduleheadByPsid(string psid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementscheduleheadByPsid(psid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteProcurementscheduleheadByPsid
        public void DeleteProcurementscheduleheadByPsid(List<string> psids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteProcurementscheduleheadByPsid(psids);
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
