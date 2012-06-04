/********************************************************************
* File Name:Assetmaintain
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-06-04
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
    ///维修信息(报修)
    ///</summary>
    [Serializable]
    public partial class Assetmaintain
    {
        #region 维修单编号
        ///<summary>
        ///ColumnName:维修单编号;Size:40;NOT NULL
        ///</summary>
        public string Assetmaintainid{  get;set;}
        #endregion

        #region (系统)设备大类
        ///<summary>
        ///ColumnName:(系统)设备大类;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region 保修来源：(项目体、自检、月检）数据字典
        ///<summary>
        ///ColumnName:保修来源：(项目体、自检、月检）数据字典;Size:40;NOT NULL
        ///</summary>
        public string Maintaintype{  get;set;}
        #endregion

        #region 申请维修日期
        ///<summary>
        ///ColumnName:申请维修日期;
        ///</summary>
        public DateTime? Applydate{  get;set;}
        #endregion

        #region 申请人
        ///<summary>
        ///ColumnName:申请人;Size:40;
        ///</summary>
        public string Applyuserid{  get;set;}
        #endregion

        #region 申请内容
        ///<summary>
        ///ColumnName:申请内容;Size:4000;
        ///</summary>
        public string Applycontent{  get;set;}
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

        #region 审核结果(同意,拒绝)
        ///<summary>
        ///ColumnName:审核结果(同意,拒绝);
        ///</summary>
        public decimal Approveresult{  get;set;}
        #endregion

        #region 拒绝理由
        ///<summary>
        ///ColumnName:拒绝理由;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region 计划维修日期
        ///<summary>
        ///ColumnName:计划维修日期;
        ///</summary>
        public DateTime? Planmaintaindate{  get;set;}
        #endregion

        #region 实际维修日期
        ///<summary>
        ///ColumnName:实际维修日期;
        ///</summary>
        public DateTime? Actualmaintaindate{  get;set;}
        #endregion

        #region 确认日期
        ///<summary>
        ///ColumnName:确认日期;
        ///</summary>
        public DateTime? Confirmdate{  get;set;}
        #endregion

        #region 确认人
        ///<summary>
        ///ColumnName:确认人;Size:40;
        ///</summary>
        public string Confirmuser{  get;set;}
        #endregion

        #region 已维修明细
        ///<summary>
        ///ColumnName:已维修明细;Size:1000;
        ///</summary>
        public string Maintaincontent{  get;set;}
        #endregion

        #region 区分字段：分公司或项目体
        ///<summary>
        ///ColumnName:区分字段：分公司或项目体;Size:40;
        ///</summary>
        public string Storagetitle{  get;set;}
        #endregion

        #region 项目体ID或分公司ID
        ///<summary>
        ///ColumnName:项目体ID或分公司ID;Size:40;
        ///</summary>
        public string Storageid{  get;set;}
        #endregion

        #region 分公司
        ///<summary>
        ///ColumnName:分公司;Size:100;
        ///</summary>
        public string Subcompany{  get;set;}
        #endregion

        #region 分公司联系人
        ///<summary>
        ///ColumnName:分公司联系人;Size:40;
        ///</summary>
        public string Subcompanycontactorid{  get;set;}
        #endregion

        #region 联系电话
        ///<summary>
        ///ColumnName:联系电话;Size:40;
        ///</summary>
        public string Contactphone{  get;set;}
        #endregion

        #region 项目体联系人
        ///<summary>
        ///ColumnName:项目体联系人;Size:40;
        ///</summary>
        public string Projectcontactorid{  get;set;}
        #endregion

        #region 项目体联系电话
        ///<summary>
        ///ColumnName:项目体联系电话;Size:40;
        ///</summary>
        public string Projectcontactorphone{  get;set;}
        #endregion

        #region 创建人
        ///<summary>
        ///ColumnName:创建人;Size:40;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region 创建日期
        ///<summary>
        ///ColumnName:创建日期;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

    } 
}
