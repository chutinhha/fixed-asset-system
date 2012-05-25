/********************************************************************
* File Name:Asset
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
    ///ASSET
    /// </summary>
    [Serializable]
    public partial class AssetSearch
    {
        #region �豸���
        public string Assetno
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

        #region ��ŵص�
        public string Storage
        {
            get;set; 
        }
        #endregion

        #region Ʒ��
        public string Brand
        {
            get;set; 
        }
        #endregion

        #region ��Ӧ��
        public string Supplierid
        {
            get;set; 
        }
        #endregion

        #region ��������
        public DateTime? StartPurchasedate
        {
            get;set; 
        }
        public DateTime? EndPurchasedate
        {
            get;set; 
        }
        #endregion

        #region �۾ɵ�������
        public DateTime? StartExpireddate
        {
            get;set; 
        }
        public DateTime? EndExpireddate
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

        #region ��ŵص��ʶ��Դ
        public string Storageflag
        {
            get;set; 
        }
        #endregion

    }
}
