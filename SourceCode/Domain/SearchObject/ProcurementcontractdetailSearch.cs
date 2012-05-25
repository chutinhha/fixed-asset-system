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
        #region ��ϸId
        public string Contractdetailid
        {
            get;set; 
        }
        #endregion

        #region ��ͬ���
        public string Contractid
        {
            get;set; 
        }
        #endregion

        #region �豸���
        public string Assetcategoryid
        {
            get;set; 
        }
        #endregion

        #region �豸����
        public string Assetname
        {
            get;set; 
        }
        #endregion

        #region �豸���
        public string Assetspecification
        {
            get;set; 
        }
        #endregion

    }
}
