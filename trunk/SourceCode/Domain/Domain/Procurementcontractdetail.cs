/********************************************************************
* File Name:Procurementcontractdetail
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
    ///<summary>
    ///�ɹ���ͬ��ϸ
    ///</summary>
    [Serializable]
    public partial class Procurementcontractdetail
    {
        #region ��ϸId
        ///<summary>
        ///ColumnName:��ϸId;Size:50;NOT NULL
        ///</summary>
        public string Contractdetailid{  get;set;}
        #endregion

        #region ��ͬ���
        ///<summary>
        ///ColumnName:��ͬ���;Size:50;
        ///</summary>
        public string Contractid{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:50;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region �豸����
        ///<summary>
        ///ColumnName:�豸����;Size:200;
        ///</summary>
        public string Assetname{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:200;
        ///</summary>
        public string Assetspecification{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///ColumnName:����;
        ///</summary>
        public decimal Unitprice{  get;set;}
        #endregion

        #region �ɹ�����
        ///<summary>
        ///ColumnName:�ɹ�����;
        ///</summary>
        public decimal Procurenumber{  get;set;}
        #endregion 

        #region �����յǼ�����
        ///<summary>
        ///ColumnName:�����յǼ�����;
        ///</summary>
        public decimal Inputnumber { get; set; }
        #endregion

        public string CategoryAllPathName { get; set; }

    }

    [Serializable]
    public partial class ProcurementcontractdetailEx:Procurementcontractdetail
    {
    }
}
