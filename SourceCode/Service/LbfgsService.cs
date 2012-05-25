/********************************************************************
* File Name:LbfgsManagement
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
    public partial class LbfgsService:BaseService,ILbfgsService
    {

        #region Management

        private LbfgsManagement m_Management;

        protected LbfgsManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new LbfgsManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveLbfgssPaging
        public List<Lbfgs> RetrieveLbfgssPaging(LbfgsSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveLbfgssPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveLbfgsByFgsid
        public Lbfgs RetrieveLbfgsByFgsid(decimal fgsid)
        {
            return Management.RetrieveLbfgsByFgsid(fgsid);
        }
        #endregion

        #region RetrieveLbfgsByFgsid
        public List<Lbfgs> RetrieveLbfgsByFgsid(List<decimal> fgsids)
        {
            return Management.RetrieveLbfgsByFgsid(fgsids);
        }
        #endregion

        #region CreateLbfgs
        public Lbfgs CreateLbfgs(Lbfgs info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateLbfgs(info);
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

        #region UpdateLbfgsByFgsid
        public Lbfgs UpdateLbfgsByFgsid(Lbfgs info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateLbfgsByFgsid(info);
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

        #region DeleteLbfgsByFgsid
        public void DeleteLbfgsByFgsid(decimal fgsid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteLbfgsByFgsid(fgsid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteLbfgsByFgsid
        public void DeleteLbfgsByFgsid(List<decimal> fgsids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteLbfgsByFgsid(fgsids);
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
