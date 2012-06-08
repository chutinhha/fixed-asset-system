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
}
