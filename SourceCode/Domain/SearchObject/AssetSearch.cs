/********************************************************************
* File Name:Asset
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///ASSET
    /// </summary>
    [Serializable]
    public partial class AssetSearch
    {
        #region 设备编号
        public string Assetno
        {
            get;set; 
        }
        #endregion

        #region 设备类别
        public string Assetcategoryid
        {
            get;set; 
        }
        #endregion

        #region 设备名称
        public string Assetname
        {
            get;set; 
        }
        #endregion

        #region 存放地点
        public string Storage
        {
            get;set; 
        }
        #endregion

        #region 品牌
        public string Brand
        {
            get;set; 
        }
        #endregion

        #region 供应商
        public string Supplierid
        {
            get;set; 
        }
        #endregion

        #region 购入日期
        public DateTime? StartPurchasedate
        {
            get;set; 
        }
        public DateTime? EndPurchasedate
        {
            get;set; 
        }
        #endregion

        #region 折旧到期日期
        public DateTime? StartExpireddate
        {
            get;set; 
        }
        public DateTime? EndExpireddate
        {
            get;set; 
        }
        #endregion

        #region 设备规格
        public string Assetspecification
        {
            get;set; 
        }
        #endregion

        #region 存放地点标识来源
        public string Storageflag
        {
            get;set; 
        }
        #endregion

    }
}
