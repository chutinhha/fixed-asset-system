/********************************************************************
* File Name:Asset
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
    ///�豸��Ϣ
    /// <summary>
    [Serializable]
    public partial class Asset
    {
        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region �豸����
        ///<summary>
        ///ColumnName:�豸����;Size:200;
        ///</summary>
        public string Assetname{  get;set;}
        #endregion

        #region ��ŵص�
        ///<summary>
        ///ColumnName:��ŵص�;Size:80;
        ///</summary>
        public string Storage{  get;set;}
        #endregion

        #region �豸״̬
        ///<summary>
        ///ColumnName:�豸״̬;
        ///</summary>
        public decimal State{  get;set;}
        #endregion

        #region �۾�����
        ///<summary>
        ///ColumnName:�۾�����;
        ///</summary>
        public decimal Depreciationyear{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///ColumnName:����;
        ///</summary>
        public decimal Unitprice{  get;set;}
        #endregion

        #region Ʒ��
        ///<summary>
        ///ColumnName:Ʒ��;Size:200;
        ///</summary>
        public string Brand{  get;set;}
        #endregion

        #region ����ģʽ���й�:0�Թ�:1
        ///<summary>
        ///ColumnName:����ģʽ���й�:0�Թ�:1;
        ///</summary>
        public decimal Managemode{  get;set;}
        #endregion

        #region �������(A��:0B��:1)
        ///<summary>
        ///ColumnName:�������(A��:0B��:1);
        ///</summary>
        public decimal Financecategory{  get;set;}
        #endregion

        #region ��Ӧ��
        ///<summary>
        ///ColumnName:��Ӧ��;Size:80;
        ///</summary>
        public string Supplierid{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Purchasedate{  get;set;}
        #endregion

        #region �۾ɵ�������
        ///<summary>
        ///ColumnName:�۾ɵ�������;
        ///</summary>
        public DateTime? Expireddate{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:200;
        ///</summary>
        public string Assetspecification{  get;set;}
        #endregion

        #region ��ŵص��ʶ��Դ
        ///<summary>
        ///ColumnName:��ŵص��ʶ��Դ;Size:80;
        ///</summary>
        public string Storageflag{  get;set;}
        #endregion

    }


}
