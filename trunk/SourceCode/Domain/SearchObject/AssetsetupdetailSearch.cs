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
        #region ��ϸId
        public string Detailid
        {
            get;set; 
        }
        #endregion

        #region ��װ����
        public string Setupid
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

        #region �Ѱ�װ��ϸ
        public string Setupcontent
        {
            get;set; 
        }
        #endregion

    }
}
