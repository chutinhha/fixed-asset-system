/********************************************************************
* File Name:Assetconfig
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    ///ASSET_CONFIG
    ///</summary>
    [Serializable]
    public partial class AssetconfigSearch
    {
        #region ����Id
        public string Configid
        {
            get;set; 
        }
        #endregion

        #region �����������
        public string Categoryid
        {
            get;set; 
        }
        #endregion

        #region �������������
        public string Categoryname
        {
            get;set; 
        }
        #endregion

        #region ��������
        public string Configname
        {
            get;set; 
        }
        #endregion

        #region ������ֵ
        public string Configvalue
        {
            get;set; 
        }
        #endregion

        #region ������
        public string Creator
        {
            get;set; 
        }
        #endregion

    }
}
