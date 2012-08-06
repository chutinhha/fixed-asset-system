/********************************************************************
* File Name:Assetmovedetail
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
    ///移机明细
    ///</summary>
    [Serializable]
    public partial class Assetmovedetail
    {
        #region 明细编号
        ///<summary>
        ///ColumnName:明细编号;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region 移机单号
        ///<summary>
        ///ColumnName:移机单号;Size:40;NOT NULL
        ///</summary>
        public string Assetmoveid{  get;set;}
        #endregion

        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
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

        #region 移机说明
        ///<summary>
        ///ColumnName:移机说明;Size:1000;
        ///</summary>
        public string Movedcontent{  get;set;}
        #endregion

        #region 设备类别
        ///<summary>
        ///ColumnName:设备类别;Size:40;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region 设备名称
        ///<summary>
        ///ColumnName:设备名称;Size:200;
        ///</summary>
        public string Assetname { get; set; }
        #endregion

        #region 设备状态
        ///<summary>
        ///ColumnName:设备状态;
        ///</summary>
        public AssetState State { get; set; }
        #endregion

        #region 购入日期
        ///<summary>
        ///ColumnName:购入日期;
        ///</summary>
        public DateTime? Purchasedate { get; set; }
        #endregion

        #region 单价
        ///<summary>
        ///ColumnName:单价;
        ///</summary>
        public decimal Unitprice { get; set; }
        #endregion

        #region 品牌
        ///<summary>
        ///ColumnName:品牌;Size:200;
        ///</summary>
        public string Brand { get; set; }
        #endregion

        #region 财务类别(A帐:0B帐:1)
        ///<summary>
        ///ColumnName:财务类别(A帐:0B帐:1);
        ///</summary>
        public FinanceCategory Financecategory { get; set; }
        #endregion

        #region 分公司或项目体
        ///<summary>
        ///分公司或项目体
        ///</summary>
        public string Subcompanyname { get; set; }
        public string Storagename { get; set; }
        #endregion
    }
}
