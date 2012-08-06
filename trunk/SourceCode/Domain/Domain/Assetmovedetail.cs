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

        #region �ֹ�˾����Ŀ��
        ///<summary>
        ///�ֹ�˾����Ŀ��
        ///</summary>
        public string Subcompanyname { get; set; }
        public string Storagename { get; set; }
        #endregion
    }
}
