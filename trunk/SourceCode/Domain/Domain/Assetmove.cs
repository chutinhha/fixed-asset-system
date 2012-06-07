/********************************************************************
* File Name:Assetmove
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
    ///移机信息
    ///</summary>
    [Serializable]
    public partial class Assetmove
    {
        #region 移机单号
        ///<summary>
        ///ColumnName:移机单号;Size:40;NOT NULL
        ///</summary>
        public string Assetmoveid{  get;set;}
        #endregion

        #region (系统)设备大类
        ///<summary>
        ///ColumnName:(系统)设备大类;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #region 对应系统
        ///<summary>
        ///ColumnName:对应系统;Size:80;
        ///</summary>
        public string System { get; set; }
        #endregion
        #endregion

        #region 申请移机日期
        ///<summary>
        ///ColumnName:申请移机日期;
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

        #region 移动单状态
        ///<summary>
        ///移动单状态
        ///</summary>
        public AssetMoveState Approveresult { get; set; }
        #endregion

        #region 拒绝理由
        ///<summary>
        ///ColumnName:拒绝理由;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region 计划移机日期
        ///<summary>
        ///ColumnName:计划移机日期;
        ///</summary>
        public DateTime? Planmovedate{  get;set;}
        #endregion

        #region 实际移机日期
        ///<summary>
        ///ColumnName:实际移机日期;
        ///</summary>
        public DateTime? Actualmovedate{  get;set;}
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

        #region 已移机明细
        ///<summary>
        ///ColumnName:已移机明细;Size:1000;
        ///</summary>
        public string Movedcontent{  get;set;}
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

        #region 联系人电话
        ///<summary>
        ///ColumnName:联系人电话;Size:40;
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
