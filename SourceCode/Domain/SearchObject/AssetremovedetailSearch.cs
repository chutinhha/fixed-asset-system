/********************************************************************
* File Name:Assetremovedetail
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
    ///�����ϸ
    ///</summary>
    [Serializable]
    public partial class AssetremovedetailSearch
    {
        #region ��ϸ���
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region �ƻ�����
        public string Assetremoveid
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

        #region �ƻ��������
        public DateTime? StartPlanremovedate
        {
            get;set; 
        }
        public DateTime? EndPlanremovedate
        {
            get;set; 
        }
        #endregion

        #region ʵ�ʲ������
        public DateTime? StartActualremovedate
        {
            get;set; 
        }
        public DateTime? EndActualremovedate
        {
            get;set; 
        }
        #endregion

        #region �ƻ�˵��
        public string Removedcontent
        {
            get;set; 
        }
        #endregion

    }
}
