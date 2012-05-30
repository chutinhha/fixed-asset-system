/********************************************************************
* File Name:Procurementschedulehead
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-23
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///PROCUREMENTSCHEDULEHEAD
    /// </summary>
    [Serializable]
    public partial class ProcurementscheduleheadSearch
    {
        #region 单号
        public string Psid
        {
            get;set; 
        }
        #endregion

        #region 计划采购日期
        public DateTime? StartProcurementscheduledate
        {
            get;set; 
        }
        public DateTime? EndProcurementscheduledate
        {
            get;set; 
        }
        #endregion

        #region 事由
        public string Reason
        {
            get;set; 
        }
        #endregion

        #region 分公司
        public string Subcompany
        {
            get;set; 
        }
        #endregion

        #region 申请人
        public string Applyuser
        {
            get;set; 
        }
        #endregion

        #region 申请日期
        public DateTime? StartApplydate
        {
            get;set; 
        }
        public DateTime? EndApplydate
        {
            get;set; 
        }
        #endregion

        #region 审核人
        public string Approveuser
        {
            get;set; 
        }
        #endregion

        #region 审核日期
        public DateTime? StartApprovedate
        {
            get;set; 
        }
        public DateTime? EndApprovedate
        {
            get;set; 
        }
        #endregion

        #region 拒绝理由
        public string Rejectreason
        {
            get;set; 
        }
        #endregion

        #region 审核结果
        private readonly List<ApproveResult> _approveResults = new List<ApproveResult>();
        public List<ApproveResult> ApproveResults
        {
            get
            {
                return _approveResults;
            }
        }
        #endregion
    }
}
