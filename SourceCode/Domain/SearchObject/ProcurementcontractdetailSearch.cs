/********************************************************************
* File Name:Procurementcontractdetail
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
    ///PROCUREMENTCONTRACTDETAIL
    /// </summary>
    [Serializable]
    public partial class ProcurementcontractdetailSearch
    {
        #region 明细Id
        public string Contractdetailid
        {
            get;set; 
        }
        #endregion

        #region 合同编号
        public string Contractid
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

        #region 设备规格
        public string Assetspecification
        {
            get;set; 
        }
        #endregion

    }
}
