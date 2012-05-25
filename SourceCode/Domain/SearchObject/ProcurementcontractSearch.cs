/********************************************************************
* File Name:Procurementcontract
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
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
    ///PROCUREMENTCONTRACT
    /// </summary>
    [Serializable]
    public partial class ProcurementcontractSearch
    {
        #region 合同编号
        public string Contractid
        {
            get;set; 
        }
        #endregion

        #region 主要内容
        public string Content
        {
            get;set; 
        }
        #endregion

        #region 签订日期
        public DateTime? StartContractdate
        {
            get;set; 
        }
        public DateTime? EndContractdate
        {
            get;set; 
        }
        #endregion

        #region 供应商
        public string Supplier
        {
            get;set; 
        }
        #endregion

        #region 合同负责人
        public string Operator
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

        #region 创建人
        public string Creator
        {
            get;set; 
        }
        #endregion

        #region 计划采购单号          
        public string Psid
        {
            get;set; 
        }
        #endregion

    }
}
