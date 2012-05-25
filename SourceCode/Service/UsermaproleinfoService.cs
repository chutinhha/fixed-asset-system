/********************************************************************
* File Name:UsermaproleinfoManagement
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
    public partial class UsermaproleinfoService:BaseService,IUsermaproleinfoService
    {

        #region Management

        private UsermaproleinfoManagement m_Management;

        protected UsermaproleinfoManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new UsermaproleinfoManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveUsermaproleinfosPaging
        public List<Usermaproleinfo> RetrieveUsermaproleinfosPaging(UsermaproleinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveUsermaproleinfosPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveUsermaproleinfoByUseridRoleid
        public Usermaproleinfo RetrieveUsermaproleinfoByUseridRoleid(string userid,string roleid)
        {
            return Management.RetrieveUsermaproleinfoByUseridRoleid(userid,roleid);
        }
        #endregion

        #region RetrieveUsermaproleinfoByUseridRoleid
        public List<Usermaproleinfo> RetrieveUsermaproleinfoByUseridRoleid(List<string> userids,List<string> roleids)
        {
            return Management.RetrieveUsermaproleinfoByUseridRoleid(userids,roleids);
        }
        #endregion

        #region CreateUsermaproleinfo
        public Usermaproleinfo CreateUsermaproleinfo(Usermaproleinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateUsermaproleinfo(info);
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

        #region UpdateUsermaproleinfoByUseridRoleid
        public Usermaproleinfo UpdateUsermaproleinfoByUseridRoleid(Usermaproleinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateUsermaproleinfoByUseridRoleid(info);
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

        #region DeleteUsermaproleinfoByUseridRoleid
        public void DeleteUsermaproleinfoByUseridRoleid(string userid,string roleid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteUsermaproleinfoByUseridRoleid(userid,roleid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteUsermaproleinfoByUseridRoleid
        public void DeleteUsermaproleinfoByUseridRoleid(List<string> userids,List<string> roleids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteUsermaproleinfoByUseridRoleid(userids,roleids);
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
