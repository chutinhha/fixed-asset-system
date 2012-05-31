/********************************************************************
* File Name:Procurementcontract
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-25
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///PROCUREMENTCONTRACT
    /// <summary>
    [Serializable]
    public partial class Procurementcontract
    {
        public const string RuleCode = "PCONTRACT";

        #region 合同编号
        ///<summary>
        ///ColumnName:合同编号;Size:50;NOT NULL
        ///</summary>
        public string Contractid{  get;set;}
        #endregion

        #region 主要内容
        ///<summary>
        ///ColumnName:主要内容;Size:4000;
        ///</summary>
        public string Content{  get;set;}
        #endregion

        #region 创建日期
        ///<summary>
        ///ColumnName:创建日期;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region 签订日期
        ///<summary>
        ///ColumnName:签订日期;
        ///</summary>
        public DateTime? Contractdate{  get;set;}
        #endregion

        #region 供应商
        ///<summary>
        ///ColumnName:供应商;Size:100;
        ///</summary>
        public string Supplier{  get;set;}
        public string SUPPLIERNAME { get; set; }
        #endregion

        #region 合同负责人
        ///<summary>
        ///ColumnName:合同负责人;Size:100;
        ///</summary>
        public string Operator{  get;set;}
        #endregion

        #region 分公司
        ///<summary>
        ///ColumnName:分公司;Size:50;
        ///</summary>
        public string Subcompany{  get;set;}
        #endregion

        #region 创建人
        ///<summary>
        ///ColumnName:创建人;Size:100;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region 计划采购单号
        ///<summary>
        ///ColumnName:计划采购单号
        ///</summary>
        public string Psid{  get;set;}
        #endregion
    }
}
