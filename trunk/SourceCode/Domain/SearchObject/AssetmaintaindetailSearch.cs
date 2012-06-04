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
    ///ά����ϸ��Ϣ
    ///</summary>
    [Serializable]
    public partial class AssetmaintaindetailSearch
    {
        #region ��ϸ���
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region �豸ά�ޱ��
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
        public DateTime? StartPlandate
        {
            get;set; 
        }
        public DateTime? EndPlandate
        {
            get;set; 
        }
        #endregion

        #region ʵ��ά������
        public DateTime? StartActualdate
        {
            get;set; 
        }
        public DateTime? EndActualdate
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
