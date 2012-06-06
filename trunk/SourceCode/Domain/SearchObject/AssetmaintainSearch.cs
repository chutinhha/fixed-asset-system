/********************************************************************
* File Name:Assetmaintain
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
* Modify Explain:
* Description:DataBase Entity Class
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
    public partial class AssetmaintainSearch
    {
        #region 维修单编号
        public string Assetmaintainid
        {
            get;set; 
        }
        #endregion

        #region (系统)设备大类
        public string Assetcategoryid
        {
            get;set; 
        }
        #endregion

        #region 保修来源：(项目体、自检、月检）数据字典
        public string Maintaintype
        {
            get;set; 
        }
        #endregion

        #region 申请维修日期
        public DateTime? StartApplydate
        {
            get;set; 
        }
        public DateTime? EndApplydate
        {
            get;set; 
        }
        #endregion

        #region 申请人
        public string Applyuserid
        {
            get;set; 
        }
        #endregion

        #region 申请内容
        public string Applycontent
        {
            get;
            set;
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

        #region 计划维修日期
        public DateTime? StartPlanmaintaindate
        {
            get;set; 
        }
        public DateTime? EndPlanmaintaindate
        {
            get;set; 
        }
        #endregion

        #region 实际维修日期
        public DateTime? StartActualmaintaindate
        {
            get;set; 
        }
        public DateTime? EndActualmaintaindate
        {
            get;set; 
        }
        #endregion

        #region 确认日期
        public DateTime? StartConfirmdate
        {
            get;set; 
        }
        public DateTime? EndConfirmdate
        {
            get;set; 
        }
        #endregion

        #region 确认人
        public string Confirmuser
        {
            get;set; 
        }
        #endregion

        #region 已维修明细
        public string Maintaincontent
        {
            get;
            set;
        }
        #endregion

        #region 区分字段：分公司或项目体
        public string Storagetitle
        {
            get;
            set;
        }
        #endregion

        #region 项目体ID或分公司ID
        public string Storageid
        {
            get;
            set;
        }
        #endregion

        #region 分公司
        public string Subcompany
        {
            get;
            set;
        }
        #endregion

        #region 分公司联系人
        public string Subcompanycontactorid
        {
            get;
            set;
        }
        #endregion

        #region 联系电话
        public string Contactphone
        {
            get;
            set;
        }
        #endregion

        #region 项目体联系人
        public string Projectcontactorid
        {
            get;
            set;
        }
        #endregion

        #region 项目体联系电话
        public string Projectcontactorphone
        {
            get;
            set;
        }
        #endregion

        #region 创建人
        public string Creator
        {
            get;
            set;
        }
        #endregion
    }
}
