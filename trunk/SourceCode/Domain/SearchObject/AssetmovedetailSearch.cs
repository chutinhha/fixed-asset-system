/********************************************************************
* File Name:Assetmovedetail
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
    ///ASSETMOVEDETAIL
    /// </summary>
    [Serializable]
    public partial class AssetmovedetailSearch
    {
        #region 明细Id
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region 移机单号
        public string Assetmoveid
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

        #region 移机说明
        public string Movedcontent
        {
            get;set; 
        }
        #endregion

    }
}
