/********************************************************************
* File Name:Assetmaintaindetail
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
    ///维修明细信息
    ///</summary>
    [Serializable]
    public partial class Assetmaintaindetail
    {
        #region 明细编号
        ///<summary>
        ///ColumnName:明细编号;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region 设备维修编号
        ///<summary>
        ///ColumnName:设备维修编号;Size:40;NOT NULL
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
        public DateTime? Plandate{  get;set;}
        #endregion

        #region 实际维修日期
        ///<summary>
        ///ColumnName:实际维修日期;
        ///</summary>
        public DateTime? Actualdate{  get;set;}
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
