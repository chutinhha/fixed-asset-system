/********************************************************************
* File Name:MenuitemManagement
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
    public partial class MenuitemService:BaseService,IMenuitemService
    {

        #region Management

        private MenuitemManagement m_Management;

        protected MenuitemManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new MenuitemManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveMenuitemsPaging
        public List<Menuitem> RetrieveMenuitemsPaging(MenuitemSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveMenuitemsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveMenuitemByMenuid
        public Menuitem RetrieveMenuitemByMenuid(string menuid)
        {
            return Management.RetrieveMenuitemByMenuid(menuid);
        }
        #endregion

        #region RetrieveMenuitemByMenuid
        public List<Menuitem> RetrieveMenuitemByMenuid(List<string> menuids)
        {
            return Management.RetrieveMenuitemByMenuid(menuids);
        }
        #endregion

        #region CreateMenuitem
        public Menuitem CreateMenuitem(Menuitem info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateMenuitem(info);
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

        #region UpdateMenuitemByMenuid
        public Menuitem UpdateMenuitemByMenuid(Menuitem info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateMenuitemByMenuid(info);
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

        #region DeleteMenuitemByMenuid
        public void DeleteMenuitemByMenuid(string menuid)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteMenuitemByMenuid(menuid);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteMenuitemByMenuid
        public void DeleteMenuitemByMenuid(List<string> menuids)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteMenuitemByMenuid(menuids);
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
