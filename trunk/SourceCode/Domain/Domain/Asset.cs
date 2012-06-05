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
    /// </summary>
    [Serializable]
    public partial class Asset
    {
        public const string RuleCode = "ZR";

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///�̶��ַ���2λ��+�ֹ�˾/��˾��3λ��+�豸���ࣨ2λ��+�豸С�ࣨ2λ��+��ţ�4λ��
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
        public AssetState State { get; set; }
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
        public ManageMode Managemode { get; set; }
        #endregion

        #region �������(A��:0B��:1)
        ///<summary>
        ///ColumnName:�������(A��:0B��:1);
        ///</summary>
        public FinanceCategory Financecategory { get; set; }
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

        #region �ֹ�˾
        ///<summary>
        ///ColumnName:�ֹ�˾;Size:50;
        ///</summary>
        public string Subcompany { get; set; }
        #endregion

        #region ��ͬ���
        ///<summary>
        ///ColumnName:��ͬ���;Size:50;
        ///</summary>
        public string Contractid { get; set; }
        #endregion

        #region ��ͬ��ϸ���
        ///<summary>
        ///ColumnName:��ͬ��ϸ���;Size:50;
        ///</summary>
        public string Contractdetailid { get; set; }
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Scrappeddate { get; set; }
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:80;
        ///</summary>
        public string Scrappeduser { get; set; }
        #endregion
    }
}
