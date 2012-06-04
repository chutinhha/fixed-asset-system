/********************************************************************
* File Name:Assetmovedetail
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-06-04
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    ///<summary>
    ///�ƻ���ϸ
    ///</summary>
    [Serializable]
    public partial class Assetmovedetail
    {
        #region ��ϸ���
        ///<summary>
        ///ColumnName:��ϸ���;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region �ƻ�����
        ///<summary>
        ///ColumnName:�ƻ�����;Size:40;NOT NULL
        ///</summary>
        public string Assetmoveid{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region �ƻ��ƻ�����
        ///<summary>
        ///ColumnName:�ƻ��ƻ�����;
        ///</summary>
        public DateTime? Planmovedate{  get;set;}
        #endregion

        #region ʵ���ƻ�����
        ///<summary>
        ///ColumnName:ʵ���ƻ�����;
        ///</summary>
        public DateTime? Actualmovedate{  get;set;}
        #endregion

        #region �ƻ�˵��
        ///<summary>
        ///ColumnName:�ƻ�˵��;Size:1000;
        ///</summary>
        public string Movedcontent{  get;set;}
        #endregion

    }

    [Serializable]
    public partial class AssetmovedetailEx:Assetmovedetail
    {
    }

}
