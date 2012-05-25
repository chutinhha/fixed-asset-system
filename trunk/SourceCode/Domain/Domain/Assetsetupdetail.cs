/********************************************************************
* File Name:Assetsetupdetail
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-25
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///ASSETSETUPDETAIL
    /// <summary>
    [Serializable]
    public partial class Assetsetupdetail
    {
        #region ��ϸId
        ///<summary>
        ///ColumnName:��ϸId;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region ��װ����
        ///<summary>
        ///ColumnName:��װ����;Size:40;NOT NULL
        ///</summary>
        public string Setupid{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region �ƻ���װ����
        ///<summary>
        ///ColumnName:�ƻ���װ����;
        ///</summary>
        public DateTime? Plansetupdate{  get;set;}
        #endregion

        #region ʵ�ʰ�װ����
        ///<summary>
        ///ColumnName:ʵ�ʰ�װ����;
        ///</summary>
        public DateTime? Actualsetupdate{  get;set;}
        #endregion

        #region �Ѱ�װ��ϸ
        ///<summary>
        ///ColumnName:�Ѱ�װ��ϸ;Size:1000;
        ///</summary>
        public string Setupcontent{  get;set;}
        #endregion

    }

    [Serializable]
    public partial class AssetsetupdetailEx:Assetsetupdetail
    {
    }

}
