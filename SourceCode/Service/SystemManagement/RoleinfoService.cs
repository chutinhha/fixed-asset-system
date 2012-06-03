/********************************************************************
* File Name:RoleinfoManagement
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
    public partial class RoleinfoService:BaseService,IRoleinfoService
    {

        #region Management

        private RoleinfoManagement m_Management;

        protected RoleinfoManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new RoleinfoManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveRoleinfosPaging
        public List<Roleinfo> RetrieveRoleinfosPaging(RoleinfoSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveRoleinfosPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveRoleinfoByRoleid
        public Roleinfo RetrieveRoleinfoByRoleid(string roleid)
        {
            return Management.RetrieveRoleinfoByRoleid(roleid);
        }
        #endregion

        #region RetrieveRoleinfoByRoleid
        public List<Roleinfo> RetrieveRoleinfoByRoleid(List<string> roleids)
        {
            return Management.RetrieveRoleinfoByRoleid(roleids);
        }
        #endregion

        #region CreateRoleinfo
        public Roleinfo CreateRoleinfo(Roleinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateRoleinfo(info);
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

        #region UpdateRoleinfoByRoleid
        public Roleinfo UpdateRoleinfoByRoleid(Roleinfo info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateRoleinfoByRoleid(info);
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

        #region DeleteRoleinfoByRoleid
        public void DeleteRoleinfoByRoleid(string roleid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteRoleinfoByRoleid(roleid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteRoleinfoByRoleid
        public void DeleteRoleinfoByRoleid(List<string> roleids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteRoleinfoByRoleid(roleids);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        public Roleinfo RetrieveRoleinfoByRoleName(string roleName)
        {
            return Management.RetrieveRoleinfoByRoleName(roleName);
        }
    }
}
