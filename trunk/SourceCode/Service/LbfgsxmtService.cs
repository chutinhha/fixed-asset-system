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
using System.Data;
using System.Data.Common;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class LbfgsxmtService:BaseService,ILbfgsxmtService
    {

        #region Management

        private LbfgsxmtManagement m_Management;

        protected LbfgsxmtManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new LbfgsxmtManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveLbfgsxmtsPaging
        public List<Lbfgsxmt> RetrieveLbfgsxmtsPaging(LbfgsxmtSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveLbfgsxmtsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveLbfgsxmtByXmtid
        public Lbfgsxmt RetrieveLbfgsxmtByXmtid(decimal xmtid)
        {
            return Management.RetrieveLbfgsxmtByXmtid(xmtid);
        }
        #endregion

        #region RetrieveLbfgsxmtByXmtid
        public List<Lbfgsxmt> RetrieveLbfgsxmtByXmtid(List<decimal> xmtids)
        {
            return Management.RetrieveLbfgsxmtByXmtid(xmtids);
        }
        #endregion

        #region CreateLbfgsxmt
        public Lbfgsxmt CreateLbfgsxmt(Lbfgsxmt info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateLbfgsxmt(info);
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

        #region UpdateLbfgsxmtByXmtid
        public Lbfgsxmt UpdateLbfgsxmtByXmtid(Lbfgsxmt info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateLbfgsxmtByXmtid(info);
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

        #region DeleteLbfgsxmtByXmtid
        public void DeleteLbfgsxmtByXmtid(decimal xmtid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteLbfgsxmtByXmtid(xmtid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteLbfgsxmtByXmtid
        public void DeleteLbfgsxmtByXmtid(List<decimal> xmtids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteLbfgsxmtByXmtid(xmtids);
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
