/********************************************************************
* File Name:Assetscrapped
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-31
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
    ///报废信息表
    ///</summary>
    [Serializable]
    public partial class Assetscrapped
    {
        #region 编号
        ///<summary>
        ///ColumnName:编号;Size:40;NOT NULL
        ///</summary>
        public string Assetscrappedid{  get;set;}
        #endregion

        #region 报废日期
        ///<summary>
        ///ColumnName:报废日期;
        ///</summary>
        public DateTime? Scrappeddate{  get;set;}
        #endregion

        #region 报废人
        ///<summary>
        ///ColumnName:报废人;Size:80;
        ///</summary>
        public string Scrappeduser{  get;set;}
        #endregion

        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
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

        #region 拒绝理由
        ///<summary>
        ///ColumnName:拒绝理由;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region 创建日期
        ///<summary>
        ///ColumnName:创建日期;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region 创建人
        ///<summary>
        ///ColumnName:创建人;Size:100;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region 审核状态
        ///<summary>
        ///ColumnName:审核状态;
        ///</summary>
        public APPROVEDSTATE Approvedstate { get; set; }
        #endregion
    }
}
