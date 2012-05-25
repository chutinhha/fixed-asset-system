/********************************************************************
* File Name:Procurementscheduledetail
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
    ///PROCUREMENTSCHEDULEDETAIL
    /// </summary>
    [Serializable]
    public partial class ProcurementscheduledetailSearch
    {
        #region ��ϸId
        public string Detailid
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

        #region �ƻ��ɹ���Id
        public string Psid
        {
            get;set; 
        }
        #endregion

    }
}
