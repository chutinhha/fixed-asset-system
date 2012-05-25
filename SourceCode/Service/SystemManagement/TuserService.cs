/********************************************************************
* File Name:TuserManagement
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
    public partial class TuserService:BaseService,ITuserService
    {

        #region Management

        private TuserManagement m_Management;

        protected TuserManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new TuserManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveTusersPaging
        public List<Tuser> RetrieveTusersPaging(TuserSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveTusersPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveTuserById
        public Tuser RetrieveTuserById(string id)
        {
            return Management.RetrieveTuserById(id);
        }
        #endregion

        #region RetrieveTuserById
        public List<Tuser> RetrieveTuserById(List<string> ids)
        {
            return Management.RetrieveTuserById(ids);
        }
        #endregion

        #region CreateTuser
        public Tuser CreateTuser(Tuser info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateTuser(info);
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

        #region UpdateTuserById
        public Tuser UpdateTuserById(Tuser info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateTuserById(info);
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

        #region DeleteTuserById
        public void DeleteTuserById(string id)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteTuserById(id);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteTuserById
        public void DeleteTuserById(List<string> ids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteTuserById(ids);
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
