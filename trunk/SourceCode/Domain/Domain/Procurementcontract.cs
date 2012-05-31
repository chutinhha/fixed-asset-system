/********************************************************************
* File Name:Procurementcontract
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
    ///PROCUREMENTCONTRACT
    /// <summary>
    [Serializable]
    public partial class Procurementcontract
    {
        public const string RuleCode = "PCONTRACT";

        #region ��ͬ���
        ///<summary>
        ///ColumnName:��ͬ���;Size:50;NOT NULL
        ///</summary>
        public string Contractid{  get;set;}
        #endregion

        #region ��Ҫ����
        ///<summary>
        ///ColumnName:��Ҫ����;Size:4000;
        ///</summary>
        public string Content{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ǩ������
        ///<summary>
        ///ColumnName:ǩ������;
        ///</summary>
        public DateTime? Contractdate{  get;set;}
        #endregion

        #region ��Ӧ��
        ///<summary>
        ///ColumnName:��Ӧ��;Size:100;
        ///</summary>
        public string Supplier{  get;set;}
        public string SUPPLIERNAME { get; set; }
        #endregion

        #region ��ͬ������
        ///<summary>
        ///ColumnName:��ͬ������;Size:100;
        ///</summary>
        public string Operator{  get;set;}
        #endregion

        #region �ֹ�˾
        ///<summary>
        ///ColumnName:�ֹ�˾;Size:50;
        ///</summary>
        public string Subcompany{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:100;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region �ƻ��ɹ�����
        ///<summary>
        ///ColumnName:�ƻ��ɹ�����
        ///</summary>
        public string Psid{  get;set;}
        #endregion
    }
}
