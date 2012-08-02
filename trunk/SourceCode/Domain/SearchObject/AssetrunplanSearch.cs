/********************************************************************
* File Name:Assetrunplan
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-28
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
    ///�ù��ƻ���
    ///</summary>
    [Serializable]
    public partial class AssetrunplanSearch
    {
        #region �豸�����
        public string Assetparentcategoryid
        {
            get;
            set;
        }
        #endregion

        #region �豸�����
        public string Assetcategoryid
        {
            get;
            set;
        }
        #endregion

        #region �ֹ�˾����Ŀ���ʶID
        private List<string> projectIds = new List<string>();
        public List<string> ProjectIds { get { return projectIds; } }
        #endregion

        #region �ֹ�˾����Ŀ���ʶ
        public string Storageflag
        {
            get;
            set;
        }
        #endregion

        #region �ֹ�˾����Ŀ��ID
        public string Storage
        {
            get;
            set;
        }
        #endregion

        #region ʱ��Σ��磺�ܼƻ���20120723-20120729��
        public string Plandatecycle
        {
            get;
            set;
        }
        #endregion

    }
}
