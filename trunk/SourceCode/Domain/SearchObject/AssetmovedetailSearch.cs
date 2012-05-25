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
        #region ��ϸId
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region �ƻ�����
        public string Assetmoveid
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

        #region �ƻ��ƻ�����
        public DateTime? StartPlanmovedate
        {
            get;set; 
        }
        public DateTime? EndPlanmovedate
        {
            get;set; 
        }
        #endregion

        #region ʵ���ƻ�����
        public DateTime? StartActualmovedate
        {
            get;set; 
        }
        public DateTime? EndActualmovedate
        {
            get;set; 
        }
        #endregion

        #region �ƻ�˵��
        public string Movedcontent
        {
            get;set; 
        }
        #endregion

    }
}
