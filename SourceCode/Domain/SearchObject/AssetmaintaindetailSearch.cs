/********************************************************************
* File Name:Assetmaintaindetail
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
    ///维修明细信息
    ///</summary>
    [Serializable]
    public partial class AssetmaintaindetailSearch
    {
        #region 明细编号
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region 设备维修编号
        public string Assetmaintainid
        {
            get;set; 
        }
        #endregion

        #region 设备编号
        public string Assetno
        {
            get;set; 
        }
        #endregion

        #region 计划维修日期
        public DateTime? StartPlandate
        {
            get;set; 
        }
        public DateTime? EndPlandate
        {
            get;set; 
        }
        #endregion

        #region 实际维修日期
        public DateTime? StartActualdate
        {
            get;set; 
        }
        public DateTime? EndActualdate
        {
            get;set; 
        }
        #endregion

        #region 维修说明
        public string Maintaincontent
        {
            get;set; 
        }
        #endregion

    }
}
