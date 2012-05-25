/********************************************************************
* File Name:RolepermissionManagement
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
    public partial class RolepermissionService:BaseService,IRolepermissionService
    {

        #region Management

        private RolepermissionManagement m_Management;

        protected RolepermissionManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new RolepermissionManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveRolepermissionsPaging
        public List<Rolepermission> RetrieveRolepermissionsPaging(RolepermissionSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveRolepermissionsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveRolepermissionByRoleidMenuid
        public Rolepermission RetrieveRolepermissionByRoleidMenuid(string roleid,string menuid)
        {
            return Management.RetrieveRolepermissionByRoleidMenuid(roleid,menuid);
        }
        #endregion

        #region RetrieveRolepermissionByRoleidMenuid
        public List<Rolepermission> RetrieveRolepermissionByRoleidMenuid(List<string> roleids,List<string> menuids)
        {
            return Management.RetrieveRolepermissionByRoleidMenuid(roleids,menuids);
        }
        #endregion

        #region CreateRolepermission
        public Rolepermission CreateRolepermission(Rolepermission info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateRolepermission(info);
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

        #region UpdateRolepermissionByRoleidMenuid
        public Rolepermission UpdateRolepermissionByRoleidMenuid(Rolepermission info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateRolepermissionByRoleidMenuid(info);
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

        #region DeleteRolepermissionByRoleidMenuid
        public void DeleteRolepermissionByRoleidMenuid(string roleid,string menuid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteRolepermissionByRoleidMenuid(roleid,menuid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteRolepermissionByRoleidMenuid
        public void DeleteRolepermissionByRoleidMenuid(List<string> roleids,List<string> menuids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteRolepermissionByRoleidMenuid(roleids,menuids);
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
