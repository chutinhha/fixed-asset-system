/********************************************************************
* File Name:Assetsetupdetail
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
    ///ASSETSETUPDETAIL
    /// </summary>
    [Serializable]
    public partial class AssetsetupdetailSearch
    {
        #region 明细Id
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region 安装单号
        public string Setupid
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

        #region 已安装明细
        public string Setupcontent
        {
            get;set; 
        }
        #endregion

    }
}
