/********************************************************************
* File Name:Assetremovedetail
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
    ///ASSETREMOVEDETAIL
    /// </summary>
    [Serializable]
    public partial class AssetremovedetailSearch
    {
        #region 明细Id
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region 移机单号
        public string Assetremoveid
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

        #region 计划拆机日期
        public DateTime? StartPlanremovedate
        {
            get;set; 
        }
        public DateTime? EndPlanremovedate
        {
            get;set; 
        }
        #endregion

        #region 实际拆机日期
        public DateTime? StartActualremovedate
        {
            get;set; 
        }
        public DateTime? EndActualremovedate
        {
            get;set; 
        }
        #endregion

        #region 移机说明
        public string Removedcontent
        {
            get;set; 
        }
        #endregion

    }
}
