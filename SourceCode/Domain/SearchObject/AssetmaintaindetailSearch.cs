/********************************************************************
* File Name:Assetmaintaindetail
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
    ///ASSETMAINTAINDETAIL
    /// </summary>
    [Serializable]
    public partial class AssetmaintaindetailSearch
    {
        #region ��ϸId
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region �豸ά��ID
        public string Assetmaintainid
        {
            get;set; 
        }
        #endregion

        #region �豸���
        public string Assetno
        {
            get;set; 
        }
        #endregion

        #region �ƻ�ά������
        public DateTime? StartPlanmaintaindate
        {
            get;set; 
        }
        public DateTime? EndPlanmaintaindate
        {
            get;set; 
        }
        #endregion

        #region ʵ��ά������
        public DateTime? StartActualmaintaindate
        {
            get;set; 
        }
        public DateTime? EndActualmaintaindate
        {
            get;set; 
        }
        #endregion

        #region ά��˵��
        public string Maintaincontent
        {
            get;set; 
        }
        #endregion

    }
}
