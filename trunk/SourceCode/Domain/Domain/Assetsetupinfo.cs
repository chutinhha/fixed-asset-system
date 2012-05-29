/********************************************************************
* File Name:Assetsetupinfo
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-29
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
    ///安装信息
    ///</summary>
    [Serializable]
    public partial class Assetsetupinfo
    {
        #region 申请单号
        ///<summary>
        ///ColumnName:申请单号;Size:40;NOT NULL
        ///</summary>
        public string Setupid { get; set; }
        #endregion

        #region 申请安装日期
        ///<summary>
        ///ColumnName:申请安装日期;
        ///</summary>
        public DateTime? Applysetupdate { get; set; }
        #endregion

        #region 申请日期
        ///<summary>
        ///ColumnName:申请日期;
        ///</summary>
        public DateTime? Applydate { get; set; }
        #endregion

        #region 申请人
        ///<summary>
        ///ColumnName:申请人;Size:40;
        ///</summary>
        public string Applyuserid { get; set; }
        #endregion

        #region 联系电话
        ///<summary>
        ///ColumnName:联系电话;Size:40;
        ///</summary>
        public string Contactphone { get; set; }
        #endregion

        #region 项目体联系人
        ///<summary>
        ///ColumnName:项目体联系人;Size:40;
        ///</summary>
        public string Projectcontactorid { get; set; }
        #endregion

        #region 项目体联系电话
        ///<summary>
        ///ColumnName:项目体联系电话;Size:40;
        ///</summary>
        public string Projectcontactorphone { get; set; }
        #endregion

        #region 计划安装日期
        ///<summary>
        ///ColumnName:计划安装日期;
        ///</summary>
        public DateTime? Plansetupdate { get; set; }
        #endregion

        #region 实际安装日期
        ///<summary>
        ///ColumnName:实际安装日期;
        ///</summary>
        public DateTime? Actualsetupdate { get; set; }
        #endregion

        #region 申请内容
        ///<summary>
        ///ColumnName:申请内容;Size:4000;
        ///</summary>
        public string Applycontent { get; set; }
        #endregion

        #region 分公司
        ///<summary>
        ///ColumnName:分公司;Size:100;
        ///</summary>
        public string Subcompany { get; set; }
        #endregion

        #region 拒绝理由
        ///<summary>
        ///ColumnName:拒绝理由;Size:1000;
        ///</summary>
        public string Rejectreason { get; set; }
        #endregion

        #region 审核人
        ///<summary>
        ///ColumnName:审核人;Size:100;
        ///</summary>
        public string Approveuser { get; set; }
        #endregion

        #region 审核日期
        ///<summary>
        ///ColumnName:审核日期;
        ///</summary>
        public DateTime? Approvedate { get; set; }
        #endregion

        #region 审核结果(同意,拒绝)
        ///<summary>
        ///ColumnName:审核结果(同意,拒绝);
        ///</summary>
        public SetupState Approveresult { get; set; }
        #endregion

        #region 创建日期
        ///<summary>
        ///ColumnName:创建日期;
        ///</summary>
        public DateTime? Createddate { get; set; }
        #endregion

        #region 分公司联系人
        ///<summary>
        ///ColumnName:分公司联系人;Size:40;
        ///</summary>
        public string Subcompanycontactorid { get; set; }
        #endregion

        #region 创建人
        ///<summary>
        ///ColumnName:创建人;Size:40;
        ///</summary>
        public string Creator { get; set; }
        #endregion

        #region (系统)设备大类
        ///<summary>
        ///ColumnName:(系统)设备大类;Size:40;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region 已安装明细
        ///<summary>
        ///ColumnName:已安装明细;Size:1000;
        ///</summary>
        public string Setupcontent { get; set; }
        #endregion

        #region 确认日期
        ///<summary>
        ///ColumnName:确认日期;
        ///</summary>
        public DateTime? Confirmdate { get; set; }
        #endregion

        #region 确认人
        ///<summary>
        ///ColumnName:确认人;Size:40;
        ///</summary>
        public string Confirmuser { get; set; }
        #endregion

        #region 区分字段：分公司或项目体
        ///<summary>
        ///ColumnName:区分字段：分公司或项目体;Size:40;
        ///</summary>
        public string Storagetitle { get; set; }
        #endregion

        #region 项目体ID或分公司ID
        ///<summary>
        ///ColumnName:项目体ID或分公司ID;Size:40;
        ///</summary>
        public string Storageid { get; set; }
        #endregion 
    }
}
