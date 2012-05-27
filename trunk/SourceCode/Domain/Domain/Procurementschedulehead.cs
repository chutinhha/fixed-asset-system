/********************************************************************
* File Name:Procurementschedulehead
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-23
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    ///<summary>
    ///采购计划单
    ///<summary>
    [Serializable]
    public partial class Procurementschedulehead
    {
        public const string RuleCode = "PS";

        #region 单号
        ///<summary>
        ///ColumnName:单号;Size:50;NOT NULL
        ///</summary>
        public string Psid{  get;set;}
        #endregion

        #region 计划采购日期
        ///<summary>
        ///ColumnName:计划采购日期;
        ///</summary>
        public DateTime? Procurementscheduledate{  get;set;}
        #endregion

        #region 事由
        ///<summary>
        ///ColumnName:事由;Size:1000;
        ///</summary>
        public string Reason{  get;set;}
        #endregion

        #region 分公司
        ///<summary>
        ///ColumnName:分公司;Size:50;
        ///</summary>
        public string Subcompany{  get;set;}
        #endregion

        #region 申请人
        ///<summary>
        ///ColumnName:申请人;Size:100;
        ///</summary>
        public string Applyuser{  get;set;}
        #endregion

        #region 申请日期
        ///<summary>
        ///ColumnName:申请日期;
        ///</summary>
        public DateTime? Applydate{  get;set;}
        #endregion

        #region 审核人
        ///<summary>
        ///ColumnName:审核人;Size:100;
        ///</summary>
        public string Approveuser{  get;set;}
        #endregion

        #region 审核日期
        ///<summary>
        ///ColumnName:审核日期;
        ///</summary>
        public DateTime? Approvedate{  get;set;}
        #endregion

        #region 审核结果（同意，拒绝）
        ///<summary>
        ///ColumnName:审核结果（同意，拒绝）;
        ///</summary>
        public ApproveResult Approveresult { get; set; }
        #endregion

        #region 拒绝理由
        ///<summary>
        ///ColumnName:拒绝理由;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region 采购单创建日期
        ///<summary>
        ///ColumnName:采购单创建日期;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion
    }
}
