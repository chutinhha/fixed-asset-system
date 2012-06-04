/********************************************************************
* File Name:Assetmove
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
    ///移机信息
    ///</summary>
    [Serializable]
    public partial class AssetmoveSearch
    {
        #region 移机单号
        public string Assetmoveid
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

        #region 申请移机日期
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

        #region 计划移机日期
        public DateTime? StartPlanmovedate
        {
            get;set; 
        }
        public DateTime? EndPlanmovedate
        {
            get;set; 
        }
        #endregion

        #region 实际移机日期
        public DateTime? StartActualmovedate
        {
            get;set; 
        }
        public DateTime? EndActualmovedate
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

        #region 已移机明细
        public string Movedcontent
        {
            get;set; 
        }
        #endregion

        #region 区分字段：分公司或项目体
        public string Storagetitle
        {
            get;set; 
        }
        #endregion

        #region 项目体ID或分公司ID
        public string Storageid
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

        #region 分公司联系人
        public string Subcompanycontactorid
        {
            get;set; 
        }
        #endregion

        #region 联系人电话
        public string Contactphone
        {
            get;set; 
        }
        #endregion

        #region 项目体联系人
        public string Projectcontactorid
        {
            get;set; 
        }
        #endregion

        #region 项目体联系电话
        public string Projectcontactorphone
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

    }
}
