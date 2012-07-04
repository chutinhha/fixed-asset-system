/********************************************************************
* File Name:HcontractdetailManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-04
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
    public partial class HcontractdetailService:BaseService,IHcontractdetailService
    {

        #region Management

        private HcontractdetailManagement m_Management;

        protected HcontractdetailManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new HcontractdetailManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveHcontractdetailsPaging
        public List<Hcontractdetail> RetrieveHcontractdetailsPaging(HcontractdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveHcontractdetailsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion

        #region CreateHcontractdetail
        public Hcontractdetail CreateHcontractdetail(Hcontractdetail info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateHcontractdetail(info);
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

    }
}
