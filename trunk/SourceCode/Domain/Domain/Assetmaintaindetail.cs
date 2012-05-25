/********************************************************************
* File Name:Assetmaintaindetail
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
    ///ASSETMAINTAINDETAIL
    /// <summary>
    [Serializable]
    public partial class Assetmaintaindetail
    {
        #region 明细Id
        ///<summary>
        ///ColumnName:明细Id;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region 设备维护ID
        ///<summary>
        ///ColumnName:设备维护ID;Size:40;NOT NULL
        ///</summary>
        public string Assetmaintainid{  get;set;}
        #endregion

        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
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

        #region 维修说明
        ///<summary>
        ///ColumnName:维修说明;Size:1000;
        ///</summary>
        public string Maintaincontent{  get;set;}
        #endregion

    }

    [Serializable]
    public partial class AssetmaintaindetailEx:Assetmaintaindetail
    {
    }

}
