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
    ///��ͬ��ϸ
    ///</summary>
    [Serializable]
    public partial class HcontractdetailSearch
    {
        #region �豸����
        public string Detailname
        {
            get;set; 
        }
        #endregion

        #region �豸�ͺ�
        public string Modal
        {
            get;set; 
        }
        #endregion

        #region �豸Ʒ��
        public string Pp
        {
            get;set; 
        }
        #endregion

    }
}
