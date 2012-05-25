/********************************************************************
* File Name:Procurementscheduledetail
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
    ///PROCUREMENTSCHEDULEDETAIL
    /// <summary>
    [Serializable]
    public partial class Procurementscheduledetail
    {
        #region ��ϸId
        ///<summary>
        ///ColumnName:��ϸId;Size:50;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
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

        #region �ƻ��ɹ�����
        ///<summary>
        ///ColumnName:�ƻ��ɹ�����;
        ///</summary>
        public decimal Plannumber{  get;set;}
        #endregion

        #region �ƻ��ɹ���Id
        ///<summary>
        ///ColumnName:�ƻ��ɹ���Id;Size:50;
        ///</summary>
        public string Psid{  get;set;}
        #endregion

    }


}
