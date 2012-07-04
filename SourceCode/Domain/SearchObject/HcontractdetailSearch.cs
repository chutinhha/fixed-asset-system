/********************************************************************
* File Name:Hcontractdetail
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-04
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
    ///合同明细
    ///</summary>
    [Serializable]
    public partial class HcontractdetailSearch
    {
        #region 设备名称
        public string Detailname
        {
            get;set; 
        }
        #endregion

        #region 设备型号
        public string Modal
        {
            get;set; 
        }
        #endregion

        #region 设备品牌
        public string Pp
        {
            get;set; 
        }
        #endregion

    }
}
