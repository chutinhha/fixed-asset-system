/********************************************************************
* File Name:Procurementcontract
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///PROCUREMENTCONTRACT
    /// </summary>
    [Serializable]
    public partial class ProcurementcontractSearch
    {
        #region ��ͬ���
        public string Contractid
        {
            get;set; 
        }
        #endregion

        #region ��Ҫ����
        public string Content
        {
            get;set; 
        }
        #endregion

        #region ǩ������
        public DateTime? StartContractdate
        {
            get;set; 
        }
        public DateTime? EndContractdate
        {
            get;set; 
        }
        #endregion

        #region ��Ӧ��
        public string Supplier
        {
            get;set; 
        }
        #endregion

        #region ��ͬ������
        public string Operator
        {
            get;set; 
        }
        #endregion

        #region �ֹ�˾
        public string Subcompany
        {
            get;set; 
        }
        #endregion

        #region ������
        public string Creator
        {
            get;set; 
        }
        #endregion

        #region �ƻ��ɹ�����          
        public string Psid
        {
            get;set; 
        }
        #endregion

    }
}
