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
using System.Linq;
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

        public bool ValidateUserLogin(string userName, string password, out string errorMsg)
        {
            errorMsg = string.Empty;
            Tuser loginUser = null;
            loginUser = Management.RetrieveTuserByLoginid(userName); 
            if (loginUser == null)
            {
                errorMsg = @"用户名或者密码不存在，请输入正确的用户名和密码！";
                return false;
            }
            else
            {
                if (loginUser.Userpassword.Equals(password))
                {
                    //添加处理
                    WebContext.Current.CurrentUser = loginUser; //更新登录用户信息到DB
                    return true;
                }
                else
                {
                    errorMsg = @"用户名或者密码不存在，请输入正确的用户名和密码！";
                    return false;
                }
            }
        }
        public List<Menuitem> RetrieveMenuItemsByUserId(string userId)
        {
            var menuItems = new List<Menuitem>();
            var usermaproleinfoManagement=new UsermaproleinfoManagement(Management);
            var roleInfos = usermaproleinfoManagement.RetrieveUsermaproleinfoByUseridRoleid(new List<string>() {userId},
                                                                                           new List<string>());
            if(roleInfos.Count>0)
            {
                if(WebContext.Current.CurrentUser!=null)
                {
                    var roleinfoManagement = new RoleinfoManagement(Management);
                    var currentRole = roleinfoManagement.RetrieveRoleinfoByRoleid(roleInfos[0].Roleid);
                    WebContext.Current.CurrentUser.Rolename =currentRole == null ? string.Empty : currentRole.Rolename;
                }
                var rolepermissionManagement=new RolepermissionManagement(Management);
                var list = rolepermissionManagement.RetrieveMenuItemsByRoleId(roleInfos[0].Roleid);
                list = (from p in list
                        orderby p.Parentmenuid
                        orderby p.Orderby
                        orderby p.Menuid 
                        select p).ToList();
                menuItems.AddRange(list);
            }
            return menuItems;
        }
    }
}
