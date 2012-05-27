/********************************************************************
* File Name:Procurementschedulehead
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-23
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
    ///�ɹ��ƻ���
    ///<summary>
    [Serializable]
    public partial class Procurementschedulehead
    {
        public const string RuleCode = "PS";

        #region ����
        ///<summary>
        ///ColumnName:����;Size:50;NOT NULL
        ///</summary>
        public string Psid{  get;set;}
        #endregion

        #region �ƻ��ɹ�����
        ///<summary>
        ///ColumnName:�ƻ��ɹ�����;
        ///</summary>
        public DateTime? Procurementscheduledate{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///ColumnName:����;Size:1000;
        ///</summary>
        public string Reason{  get;set;}
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
        public string Applyuser{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Applydate{  get;set;}
        #endregion

        #region �����
        ///<summary>
        ///ColumnName:�����;Size:100;
        ///</summary>
        public string Approveuser{  get;set;}
        #endregion

        #region �������
        ///<summary>
        ///ColumnName:�������;
        ///</summary>
        public DateTime? Approvedate{  get;set;}
        #endregion

        #region ��˽����ͬ�⣬�ܾ���
        ///<summary>
        ///ColumnName:��˽����ͬ�⣬�ܾ���;
        ///</summary>
        public ApproveResult Approveresult { get; set; }
        #endregion

        #region �ܾ�����
        ///<summary>
        ///ColumnName:�ܾ�����;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region �ɹ�����������
        ///<summary>
        ///ColumnName:�ɹ�����������;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion
    }
}
