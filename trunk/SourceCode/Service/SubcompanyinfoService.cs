/********************************************************************
* File Name:SubcompanyinfoManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-27
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
    public partial class SubcompanyinfoService:BaseService,ISubcompanyinfoService
    {

        #region Management

        private SubcompanyinfoManagement m_Management;

        protected SubcompanyinfoManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new SubcompanyinfoManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveSubcompanyinfosPaging
        public List<Subcompanyinfo> RetrieveSubcompanyinfosPaging(SubcompanyinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveSubcompanyinfosPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveSubcompanyinfoBySubcompanyid
        public Subcompanyinfo RetrieveSubcompanyinfoBySubcompanyid(decimal subcompanyid)
        {
            return Management.RetrieveSubcompanyinfoBySubcompanyid(subcompanyid);
        }
        #endregion

        #region RetrieveSubcompanyinfoBySubcompanyid
        public List<Subcompanyinfo> RetrieveSubcompanyinfoBySubcompanyid(List<decimal> subcompanyids)
        {
            return Management.RetrieveSubcompanyinfoBySubcompanyid(subcompanyids);
        }
        #endregion

        #region CreateSubcompanyinfo
        public Subcompanyinfo CreateSubcompanyinfo(Subcompanyinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateSubcompanyinfo(info);
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

        #region UpdateSubcompanyinfoBySubcompanyid
        public Subcompanyinfo UpdateSubcompanyinfoBySubcompanyid(Subcompanyinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateSubcompanyinfoBySubcompanyid(info);
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

        #region DeleteSubcompanyinfoBySubcompanyid
        public void DeleteSubcompanyinfoBySubcompanyid(decimal subcompanyid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteSubcompanyinfoBySubcompanyid(subcompanyid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteSubcompanyinfoBySubcompanyid
        public void DeleteSubcompanyinfoBySubcompanyid(List<decimal> subcompanyids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteSubcompanyinfoBySubcompanyid(subcompanyids);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion


        #region RetrieveAllSubcompanyinfo
        public List<Subcompanyinfo> RetrieveAllSubCompanyinfo()
        {
            return Management.RetrieveAllSubCompanyinfo();
        }

        #endregion
    }
}
