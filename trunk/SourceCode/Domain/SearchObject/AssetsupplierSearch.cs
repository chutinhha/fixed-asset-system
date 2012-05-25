/********************************************************************
* File Name:Assetsupplier
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
    ///ASSETSUPPLIER
    /// </summary>
    [Serializable]
    public partial class AssetsupplierSearch
    {
        #region ��Ӧ�̱��
        public string Supplierid
        {
            get;set; 
        }
        #endregion

        #region ��Ӧ��
        public string Suppliername
        {
            get;set; 
        }
        #endregion

        #region ��ע
        public string Remark
        {
            get;set; 
        }
        #endregion

    }
}
