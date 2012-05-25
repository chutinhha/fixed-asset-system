/********************************************************************
* File Name:Assetmaintaindetail
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
    ///ASSETMAINTAINDETAIL
    /// <summary>
    [Serializable]
    public partial class Assetmaintaindetail
    {
        #region ��ϸId
        ///<summary>
        ///ColumnName:��ϸId;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region �豸ά��ID
        ///<summary>
        ///ColumnName:�豸ά��ID;Size:40;NOT NULL
        ///</summary>
        public string Assetmaintainid{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region �ƻ�ά������
        ///<summary>
        ///ColumnName:�ƻ�ά������;
        ///</summary>
        public DateTime? Planmaintaindate{  get;set;}
        #endregion

        #region ʵ��ά������
        ///<summary>
        ///ColumnName:ʵ��ά������;
        ///</summary>
        public DateTime? Actualmaintaindate{  get;set;}
        #endregion

        #region ά��˵��
        ///<summary>
        ///ColumnName:ά��˵��;Size:1000;
        ///</summary>
        public string Maintaincontent{  get;set;}
        #endregion

    }

    [Serializable]
    public partial class AssetmaintaindetailEx:Assetmaintaindetail
    {
    }

}
