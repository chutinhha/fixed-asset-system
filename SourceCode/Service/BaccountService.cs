/********************************************************************
* File Name:BaccountManagement
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
    public partial class BaccountService:BaseService,IBaccountService
    {

        #region Management

        private BaccountManagement m_Management;

        protected BaccountManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new BaccountManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveBaccountsPaging
        public List<Baccount> RetrieveBaccountsPaging(BaccountSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveBaccountsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region RetrieveBaccountByAssetno
        public Baccount RetrieveBaccountByAssetno(string assetno)
        {
            return Management.RetrieveBaccountByAssetno(assetno);
        }
        #endregion

        #region RetrieveBaccountByAssetno
        public List<Baccount> RetrieveBaccountByAssetno(List<string> assetnos)
        {
            return Management.RetrieveBaccountByAssetno(assetnos);
        }
        #endregion

        #region CreateBaccount
        public Baccount CreateBaccount(Baccount info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateBaccount(info);
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

        #region UpdateBaccountByAssetno
        public Baccount UpdateBaccountByAssetno(Baccount info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateBaccountByAssetno(info);
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

        #region DeleteBaccountByAssetno
        public void DeleteBaccountByAssetno(string assetno)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteBaccountByAssetno(assetno);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteBaccountByAssetno
        public void DeleteBaccountByAssetno(List<string> assetnos)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteBaccountByAssetno(assetnos);
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
