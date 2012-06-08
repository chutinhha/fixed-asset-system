/********************************************************************
* File Name:Assetmaintaindetail
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
    ///ά����ϸ��Ϣ
    ///</summary>
    [Serializable]
    public partial class Assetmaintaindetail
    {
        #region ��ϸ���
        ///<summary>
        ///ColumnName:��ϸ���;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region �豸ά�ޱ��
        ///<summary>
        ///ColumnName:�豸ά�ޱ��;Size:40;NOT NULL
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
        public DateTime? Plandate{  get;set;}
        #endregion

        #region ʵ��ά������
        ///<summary>
        ///ColumnName:ʵ��ά������;
        ///</summary>
        public DateTime? Actualdate{  get;set;}
        #endregion

        #region ά��˵��
        ///<summary>
        ///ColumnName:ά��˵��;Size:1000;
        ///</summary>
        public string Maintaincontent{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:40;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region �豸����
        ///<summary>
        ///ColumnName:�豸����;Size:200;
        ///</summary>
        public string Assetname { get; set; }
        #endregion

        #region �豸״̬
        ///<summary>
        ///ColumnName:�豸״̬;
        ///</summary>
        public AssetState State { get; set; }
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Purchasedate { get; set; }
        #endregion

        #region ����
        ///<summary>
        ///ColumnName:����;
        ///</summary>
        public decimal Unitprice { get; set; }
        #endregion

        #region Ʒ��
        ///<summary>
        ///ColumnName:Ʒ��;Size:200;
        ///</summary>
        public string Brand { get; set; }
        #endregion

        #region �������(A��:0B��:1)
        ///<summary>
        ///ColumnName:�������(A��:0B��:1);
        ///</summary>
        public FinanceCategory Financecategory { get; set; }
        #endregion
    }

    [Serializable]
    public partial class AssetmaintaindetailEx:Assetmaintaindetail
    {
    }

}
