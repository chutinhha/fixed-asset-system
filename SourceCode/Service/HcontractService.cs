/********************************************************************
* File Name:HcontractManagement
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
    public partial class HcontractService:BaseService,IHcontractService
    {
        #region Management

        private HcontractManagement m_Management;

        protected HcontractManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new HcontractManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveHcontractsPaging
        public List<Hcontract> RetrieveHcontractsPaging(HcontractSearch info,int pageIndex, int pageSize,out int count)
        {
            return Management.RetrieveHcontractsPaging(info,pageIndex,pageSize,out count);
        }
        #endregion  

        public Hcontract RetrieveHcontractByInstanceid(long Instanceid)
        {
            return Management.RetrieveHcontractByInstanceid(Instanceid);
        }
        public Hcontract UpdateHcontractByInstanceid(Hcontract info)
        {
            return Management.UpdateHcontractByInstanceid(info);
        }
    }
}
