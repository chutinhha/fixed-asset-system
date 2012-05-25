/********************************************************************
* File Name:Asset
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
    ///设备信息
    /// <summary>
    [Serializable]
    public partial class Asset
    {
        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region 设备类别
        ///<summary>
        ///ColumnName:设备类别;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region 设备名称
        ///<summary>
        ///ColumnName:设备名称;Size:200;
        ///</summary>
        public string Assetname{  get;set;}
        #endregion

        #region 存放地点
        ///<summary>
        ///ColumnName:存放地点;Size:80;
        ///</summary>
        public string Storage{  get;set;}
        #endregion

        #region 设备状态
        ///<summary>
        ///ColumnName:设备状态;
        ///</summary>
        public decimal State{  get;set;}
        #endregion

        #region 折旧年限
        ///<summary>
        ///ColumnName:折旧年限;
        ///</summary>
        public decimal Depreciationyear{  get;set;}
        #endregion

        #region 单价
        ///<summary>
        ///ColumnName:单价;
        ///</summary>
        public decimal Unitprice{  get;set;}
        #endregion

        #region 品牌
        ///<summary>
        ///ColumnName:品牌;Size:200;
        ///</summary>
        public string Brand{  get;set;}
        #endregion

        #region 管理模式，托管:0自管:1
        ///<summary>
        ///ColumnName:管理模式，托管:0自管:1;
        ///</summary>
        public decimal Managemode{  get;set;}
        #endregion

        #region 财务类别(A帐:0B帐:1)
        ///<summary>
        ///ColumnName:财务类别(A帐:0B帐:1);
        ///</summary>
        public decimal Financecategory{  get;set;}
        #endregion

        #region 供应商
        ///<summary>
        ///ColumnName:供应商;Size:80;
        ///</summary>
        public string Supplierid{  get;set;}
        #endregion

        #region 购入日期
        ///<summary>
        ///ColumnName:购入日期;
        ///</summary>
        public DateTime? Purchasedate{  get;set;}
        #endregion

        #region 折旧到期日期
        ///<summary>
        ///ColumnName:折旧到期日期;
        ///</summary>
        public DateTime? Expireddate{  get;set;}
        #endregion

        #region 设备规格
        ///<summary>
        ///ColumnName:设备规格;Size:200;
        ///</summary>
        public string Assetspecification{  get;set;}
        #endregion

        #region 存放地点标识来源
        ///<summary>
        ///ColumnName:存放地点标识来源;Size:80;
        ///</summary>
        public string Storageflag{  get;set;}
        #endregion

    }


}
